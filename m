Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7459CD2B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:23:19 +0200 (CEST)
Received: from localhost ([::1]:59664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHhO-0006Ti-Ox
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQHen-0003nP-Kd; Mon, 22 Aug 2022 20:20:37 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:60137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oQHel-0006jY-2g; Mon, 22 Aug 2022 20:20:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8E1AB74637F;
 Tue, 23 Aug 2022 02:20:29 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5A79A7461AE; Tue, 23 Aug 2022 02:20:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 596F9745702;
 Tue, 23 Aug 2022 02:20:29 +0200 (CEST)
Date: Tue, 23 Aug 2022 02:20:29 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 8/9] hw/isa/vt82c686: QOM'ify RTC creation
In-Reply-To: <20220822224355.11753-9-shentey@gmail.com>
Message-ID: <96f054aa-41b5-b3c0-accc-46678485b87d@eik.bme.hu>
References: <20220822224355.11753-1-shentey@gmail.com>
 <20220822224355.11753-9-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Aug 2022, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c | 12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 47f2fd2669..ee745d5d49 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -546,6 +546,7 @@ struct ViaISAState {
>     qemu_irq cpu_intr;
>     qemu_irq *isa_irqs;
>     ViaSuperIOState via_sio;
> +    RTCState rtc;
>     PCIIDEState ide;
>     UHCIState uhci[2];
>     ViaPMState pm;
> @@ -567,6 +568,7 @@ static void via_isa_init(Object *obj)
> {
>     ViaISAState *s = VIA_ISA(obj);
>
> +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>     object_initialize_child(obj, "ide", &s->ide, "via-ide");
>     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
>     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
> @@ -615,7 +617,15 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     isa_bus_irqs(isa_bus, s->isa_irqs);
>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>     i8257_dma_init(isa_bus, 0);
> -    mc146818_rtc_init(isa_bus, 2000, NULL);
> +
> +    /* RTC */
> +    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
> +    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
> +        return;
> +    }
> +    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
> +                              "date");
> +    isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
>
>     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
>         if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
>

This actually introduces code duplication as all other places except piix4 
seem to still use the init function (probably to ensure that the rtc-rime 
alias on the machine is properly set) so I'd keep this the same as 
everything else and drop this patch until this init function is removed 
from all other places as well.

Regards,
BALATON Zoltan

