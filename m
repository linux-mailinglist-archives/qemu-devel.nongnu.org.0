Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44F682FCA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:53:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMrso-0006yf-Ai; Tue, 31 Jan 2023 09:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMrse-0006px-RN
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:45:06 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMrsb-0004k7-OE
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:45:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 08A617462DB;
 Tue, 31 Jan 2023 15:42:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C09D2745712; Tue, 31 Jan 2023 15:42:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BED6A745706;
 Tue, 31 Jan 2023 15:42:29 +0100 (CET)
Date: Tue, 31 Jan 2023 15:42:29 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 1/3] hw/isa/vt82c686: Fix SCI routing
In-Reply-To: <20230129213418.87978-2-shentey@gmail.com>
Message-ID: <e8254e7c-aeb5-2709-a52e-ba0bb38eed88@eik.bme.hu>
References: <20230129213418.87978-1-shentey@gmail.com>
 <20230129213418.87978-2-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 29 Jan 2023, Bernhard Beschow wrote:
> According to the PCI specification, the hardware is not supposed to use
> PCI_INTERRUPT_PIN for interrupt routing. Use the dedicated ACPI
> Interrupt Select register for SCI routing instead.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/vt82c686.c | 42 ++++++++++++++++++++++++++++++------------
> 1 file changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 3f9bd0c04d..2189be6f20 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -46,6 +46,8 @@ struct ViaPMState {
>     ACPIREGS ar;
>     APMState apm;
>     PMSMBus smb;
> +
> +    qemu_irq irq;
> };
>
> static void pm_io_space_update(ViaPMState *s)
> @@ -148,18 +150,7 @@ static void pm_update_sci(ViaPMState *s)
>                    ACPI_BITMASK_POWER_BUTTON_ENABLE |
>                    ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
>                    ACPI_BITMASK_TIMER_ENABLE)) != 0);
> -    if (pci_get_byte(s->dev.config + PCI_INTERRUPT_PIN)) {
> -        /*
> -         * FIXME:
> -         * Fix device model that realizes this PM device and remove
> -         * this work around.
> -         * The device model should wire SCI and setup
> -         * PCI_INTERRUPT_PIN properly.
> -         * If PIN# = 0(interrupt pin isn't used), don't raise SCI as
> -         * work around.
> -         */
> -        pci_set_irq(&s->dev, sci_level);
> -    }
> +    qemu_set_irq(s->irq, sci_level);
>     /* schedule a timer interruption if needed */
>     acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
>                        !(pmsts & ACPI_BITMASK_TIMER_STATUS));
> @@ -213,6 +204,13 @@ static void via_pm_realize(PCIDevice *dev, Error **errp)
>     acpi_pm1_cnt_init(&s->ar, &s->io, false, false, 2, false);
> }
>
> +static void via_pm_init(Object *obj)
> +{
> +    ViaPMState *s = VIA_PM(obj);
> +
> +    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
> +}
> +
> typedef struct via_pm_init_info {
>     uint16_t device_id;
> } ViaPMInitInfo;
> @@ -238,6 +236,7 @@ static void via_pm_class_init(ObjectClass *klass, void *data)
> static const TypeInfo via_pm_info = {
>     .name          = TYPE_VIA_PM,
>     .parent        = TYPE_PCI_DEVICE,
> +    .instance_init = via_pm_init,
>     .instance_size = sizeof(ViaPMState),
>     .abstract      = true,
>     .interfaces = (InterfaceInfo[]) {
> @@ -568,6 +567,21 @@ static const VMStateDescription vmstate_via = {
>     }
> };
>
> +static void via_isa_set_pm_irq(void *opaque, int n, int level)
> +{
> +    ViaISAState *s = opaque;
> +    uint8_t irq = pci_get_byte(s->pm.dev.config + 0x42) & 0xf;
> +
> +    if (irq == 2) {

unlikely(irq == 2) but do we really need to log this? It really should not 
happen but if it does the guest is really broken and this will just flood 
the log so I think you can just test for it in the if below and drop the log.

Regards,
BALATON Zoltan

> +        qemu_log_mask(LOG_GUEST_ERROR, "IRQ 2 for PM controller is reserved");
> +        return;
> +    }
> +
> +    if (irq != 0) {
> +        qemu_set_irq(s->isa_irqs[irq], level);
> +    }
> +}
> +
> static void via_isa_init(Object *obj)
> {
>     ViaISAState *s = VIA_ISA(obj);
> @@ -578,6 +592,8 @@ static void via_isa_init(Object *obj)
>     object_initialize_child(obj, "uhci2", &s->uhci[1], TYPE_VT82C686B_USB_UHCI);
>     object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
>     object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
> +
> +    qdev_init_gpio_in_named(DEVICE(obj), via_isa_set_pm_irq, "sci", 1);
> }
>
> static const TypeInfo via_isa_info = {
> @@ -664,6 +680,8 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
>     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
>         return;
>     }
> +    qdev_connect_gpio_out(DEVICE(&s->pm), 0,
> +                          qdev_get_gpio_in_named(DEVICE(d), "sci", 0));
>
>     /* Function 5: AC97 Audio */
>     qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
>

