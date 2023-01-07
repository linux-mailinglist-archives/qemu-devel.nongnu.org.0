Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A352C6612A2
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 00:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEIvx-0003Sx-1e; Sat, 07 Jan 2023 18:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIvr-0003SG-Ln; Sat, 07 Jan 2023 18:48:59 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIvp-00067r-BE; Sat, 07 Jan 2023 18:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5F/IWowa2E/XCykoCWJN5ZM/ypjRarMljCQUm7DmHuM=; b=GjzZ8oN5nbZgYTc+EeHn3D1/4H
 IMfyzocdDNhSfP7vKB8RicBBjN+Qepd1zqHRXgmxagwaVgP/BAjQr388HMjB3qWx9Oo90JobDutQo
 Ke57C36fw2ABopm2Fi9oW3755bQjInezn3W3rV3tl5T3VP/L3Sszgo4IeSo/MEpcmGBtTL40YWbg3
 8hqMyVVPwW+RQzewIorefi0BW7kr8cY+AOComgbCoZs0B+yYSa+pAVo5V9ofwTDhdd4M459H0dHQZ
 Z0KNq1n93xL5s1Ka9oKXN3R2bLPCkchfbC2Rpm3pbvYf5KSGTuHDJk1ySr4B4HwizesrZIhQ/zi4Z
 Xf5Mwtnlt/XU0BtsC3/io+S9iUfMJxfYbQu+IDqU2EkrXPLpsJyhPj2NY5XphfODEy+xM0SPb0brr
 wrlqlrvC9E+HkA9GvVtvtUR+M10DTT/dbXQoMqrjbC3X1Osgs7PJkzCLji3+UZCz0l+2c0pPQMDF6
 oMhmvrJSvHkqJR0Y43IJXmCnNCnePHi39CGxhWTeGloqMLliRzcijlRDocvwfKxC59jG0EapqDnNj
 1U5DnB9oBGaJJ7Xi51Rd9crRq+zKeEUDIPSIdO8NLYTbLm0or81J0eufKhZo/H/PgFh0QV8o1jX4D
 9z1JxRw7mmuese6n3XLbi8vOIsx5TA3hQR1G2NFZg=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEIvS-000BKT-01; Sat, 07 Jan 2023 23:48:34 +0000
Message-ID: <29745460-a3c2-b895-80ac-26fded5f7819@ilande.co.uk>
Date: Sat, 7 Jan 2023 23:48:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20230105143228.244965-1-shentey@gmail.com>
 <20230105143228.244965-25-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230105143228.244965-25-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 24/31] hw/isa/piix4: Reuse struct PIIXState from PIIX3
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
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

On 05/01/2023 14:32, Bernhard Beschow wrote:

> Now that PIIX4 also uses the "proxy-pic", both implementations

Should "proxy-pic" be replaced with "isa-pic" (or even TYPE_ISA_PIC) here?

> can share the same struct.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-34-shentey@gmail.com>
> ---
>   hw/isa/piix4.c | 51 +++++++++++++++-----------------------------------
>   1 file changed, 15 insertions(+), 36 deletions(-)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index eae4db0182..ce88377630 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -42,32 +42,10 @@
>   #include "sysemu/runstate.h"
>   #include "qom/object.h"
>   
> -struct PIIX4State {
> -    PCIDevice dev;
> -
> -    ISAPICState pic;
> -    RTCState rtc;
> -    PCIIDEState ide;
> -    UHCIState uhci;
> -    PIIX4PMState pm;
> -
> -    uint32_t smb_io_base;
> -
> -    /* Reset Control Register */
> -    MemoryRegion rcr_mem;
> -    uint8_t rcr;
> -
> -    bool has_acpi;
> -    bool has_usb;
> -    bool smm_enabled;
> -};
> -
> -OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
> -
>   static void piix4_set_irq(void *opaque, int irq_num, int level)
>   {
>       int i, pic_irq, pic_level;
> -    PIIX4State *s = opaque;
> +    PIIXState *s = opaque;
>       PCIBus *bus = pci_get_bus(&s->dev);
>   
>       /* now we change the pic irq level according to the piix irq mappings */
> @@ -87,7 +65,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
>   
>   static void piix4_isa_reset(DeviceState *dev)
>   {
> -    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
> +    PIIXState *d = PIIX_PCI_DEVICE(dev);
>       uint8_t *pci_conf = d->dev.config;
>   
>       pci_conf[0x04] = 0x07; // master, memory and I/O
> @@ -122,12 +100,13 @@ static void piix4_isa_reset(DeviceState *dev)
>       pci_conf[0xac] = 0x00;
>       pci_conf[0xae] = 0x00;
>   
> +    d->pic_levels = 0; /* not used in PIIX4 */
>       d->rcr = 0;
>   }
>   
>   static int piix4_post_load(void *opaque, int version_id)
>   {
> -    PIIX4State *s = opaque;
> +    PIIXState *s = opaque;
>   
>       if (version_id == 2) {
>           s->rcr = 0;
> @@ -142,8 +121,8 @@ static const VMStateDescription vmstate_piix4 = {
>       .minimum_version_id = 2,
>       .post_load = piix4_post_load,
>       .fields = (VMStateField[]) {
> -        VMSTATE_PCI_DEVICE(dev, PIIX4State),
> -        VMSTATE_UINT8_V(rcr, PIIX4State, 3),
> +        VMSTATE_PCI_DEVICE(dev, PIIXState),
> +        VMSTATE_UINT8_V(rcr, PIIXState, 3),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> @@ -151,7 +130,7 @@ static const VMStateDescription vmstate_piix4 = {
>   static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
>                               unsigned int len)
>   {
> -    PIIX4State *s = opaque;
> +    PIIXState *s = opaque;
>   
>       if (val & 4) {
>           qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> @@ -163,7 +142,7 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
>   
>   static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
>   {
> -    PIIX4State *s = opaque;
> +    PIIXState *s = opaque;
>   
>       return s->rcr;
>   }
> @@ -180,7 +159,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
>   
>   static void piix4_realize(PCIDevice *dev, Error **errp)
>   {
> -    PIIX4State *s = PIIX4_PCI_DEVICE(dev);
> +    PIIXState *s = PIIX_PCI_DEVICE(dev);
>       PCIBus *pci_bus = pci_get_bus(dev);
>       ISABus *isa_bus;
>   
> @@ -250,7 +229,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>   
>   static void piix4_init(Object *obj)
>   {
> -    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
> +    PIIXState *s = PIIX_PCI_DEVICE(obj);
>   
>       object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
>       object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
> @@ -258,10 +237,10 @@ static void piix4_init(Object *obj)
>   }
>   
>   static Property piix4_props[] = {
> -    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
> -    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
> -    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
> -    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
> +    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
> +    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
> +    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
> +    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -289,7 +268,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
>   static const TypeInfo piix4_info = {
>       .name          = TYPE_PIIX4_PCI_DEVICE,
>       .parent        = TYPE_PCI_DEVICE,
> -    .instance_size = sizeof(PIIX4State),
> +    .instance_size = sizeof(PIIXState),
>       .instance_init = piix4_init,
>       .class_init    = piix4_class_init,
>       .interfaces = (InterfaceInfo[]) {


ATB,

Mark.

