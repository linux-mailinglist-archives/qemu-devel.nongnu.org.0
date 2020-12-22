Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D32E0E02
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 18:56:49 +0100 (CET)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krltw-0007M3-Le
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 12:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1krlsf-0006Pj-0I; Tue, 22 Dec 2020 12:55:29 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:53531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1krlsb-0004ST-U6; Tue, 22 Dec 2020 12:55:28 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 545557470DF;
 Tue, 22 Dec 2020 18:55:19 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 23ED87470DC; Tue, 22 Dec 2020 18:55:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2205D746383;
 Tue, 22 Dec 2020 18:55:19 +0100 (CET)
Date: Tue, 22 Dec 2020 18:55:19 +0100 (CET)
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Problems with irq mapping in qemu v5.2
In-Reply-To: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
Message-ID: <93a88d8e-89d0-96d4-15bc-47edfc68b5d8@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Hello,

On Tue, 22 Dec 2020, Guenter Roeck wrote:
> Hi,
>
> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
> is indexed and sized by the number of interrupts.
>
> However, as it turns out, the interrupt number passed to this function
> is the _mapped_ interrupt number. The result in assertion failures for various
> emulations.
>
> Examples (I don't know if there are others):
>
> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>  that isn't a good thing to do for slot 0, and indeed results in an
>  assertion as soon as slot 0 is initialized (presumably that is the root
>  bridge). Changing the mapping to "slot" doesn't help because valid slots
>  are 0..4, and only four interrupts are allocated.

Is that with sam460ex? This ppc4xx_pci_map_irq appears in 
ppc4xx-host-bridge and hw/ppc/ppc440_pcix.c (which is used by sam460ex) 
has a ppc4xx-host-bridge. Other user of it may be the bamboo 440 board 
where this host bridge appears too. I did not see asserts with sam460ex 
but I've only tested it with AmigaOS which may use it in an odd way not 
tripping the check.

> - pci_bonito_map_irq() changes the mapping all over the place. Whatever
>  it does, it returns numbers starting with 32 for slots 5..12. With
>  a total number of 32 interrupts, this again results in an assertion
>  failure.
>
> ppc4xx_pci_map_irq() is definitely buggy. I just don't know what the
> correct mapping should be. slot  & 3, maybe ?

The current irq mapping may not match real hardware but unfortunately I 
don't know what real hardware does, neither for sam460ex nor for bamboo. 
I've implemented ppc440_pcix mostly by guessing and doing what made 
clients happy because I could not get docs for that PCI implementation so 
it's possible there are some bugs left. Since these are IBM parts (PCI 
parts of 440 SoCs) maybe there's some info available from them (but this 
is likely board specific) or someone may have some info here. I'm adding 
the qemu-ppc list in any case, hoping someone knowing PPC440 SoC might 
read that list. Also the u-boot source of the sam460ex firmware may have 
some info if somebody knows where to look for it in there.

> I don't really have a good solution for pci_bonito_map_irq(). It may not
> matter much - I have not been able to boot fuloong_2e since qemu v4.0,
> and afaics that is the only platform using it. Maybe it is just completely
> broken ?

There were some patches in the past few days on the list improving 
fuloong2e emulation so that the board's firmware can be used, but I don't 
know if any of those are relevant. Philippe may know more about that.

Regards,
BALATON Zoltan

