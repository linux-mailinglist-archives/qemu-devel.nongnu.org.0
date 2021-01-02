Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955362E86DF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 10:59:55 +0100 (CET)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvdhS-0004bA-3x
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 04:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvdgU-0003rl-Gc
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 04:58:54 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kvdgP-0003T9-Hn
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 04:58:52 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B9D907470FB;
 Sat,  2 Jan 2021 10:58:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8D8FE7470E2; Sat,  2 Jan 2021 10:58:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8BF337470FA;
 Sat,  2 Jan 2021 10:58:44 +0100 (CET)
Date: Sat, 2 Jan 2021 10:58:44 +0100 (CET)
To: qemu-devel@nongnu.org
Subject: qemu isa irq gpio question
Message-ID: <7a65c948-b778-e829-5b22-452092fa9819@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Hello,

While cleaning up my VIA south bridge patches I've found that with the 
finished version I did not get interrupts. At the end I've found a 
solution in a similar device (piix4) but I don't understand why that's 
needed. Could someone please explain?

Here's what I had originally in board code (this is from pegasos2 but 
fuloong2e has the same with vt82c686b instead if vt8231):

dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true, "vt8231");
isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
// "vt8231" just created an empty isa_bus with isa_bus_new()
qemu_irq *i8259 = i8259_init(isa_bus, qdev_get_gpio_in_named(DEVICE(mv), "gpp", 31));
isa_bus_irqs(isa_bus, i8259);

which worked but after completely moving isa_bus, PIC and other ISA 
devices into the vt82c686b/vt8231 model I ended up with:

dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true, "vt8231-isa");
qdev_connect_gpio_out(DEVICE(dev), 0, qdev_get_gpio_in_named(DEVICE(mv), "gpp", 31));

where "vt8231-isa" having this:

struct ViaISAState {
     PCIDevice dev;
     qemu_irq cpu_intr;
};

static void vt8231_realize(PCIDevice *d, Error **errp)
{
      qdev_init_gpio_out(dev, &s->cpu_intr, 1);
      isa_bus = isa_bus_new(...);
      isa_bus_irqs(isa_bus, i8259_init(isa_bus, s->cpu_intr));
}

this compiled without warnings but irqs were not getting to the connected 
end. After looking for similar code I ended up with this from piix4 which 
works again:

static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
{
     ViaISAState *s = opaque;
     qemu_set_irq(s->cpu_intr, level);
}

static void vt8231_realize(PCIDevice *d, Error **errp)
{
      qdev_init_gpio_out(dev, &s->cpu_intr, 1);
      qemu_irq *isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
      isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
}

I'm not sure if this will leak the allocated irq and why is this 
additional function needed inbetween these in this case but this is what 
works so I'll go with this one for now but still curious what did I miss.

Regards,
BALATON Zoltan

