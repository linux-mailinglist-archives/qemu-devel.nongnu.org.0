Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492A33301B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:41:01 +0100 (CET)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJj9z-0007XW-BU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJijC-0001cQ-Jl
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:13:20 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJij8-0002Rm-27
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:13:14 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1A6877456B7;
 Tue,  9 Mar 2021 21:13:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DFEF07456B4; Tue,  9 Mar 2021 21:13:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DE4B07456E3;
 Tue,  9 Mar 2021 21:13:06 +0100 (CET)
Date: Tue, 9 Mar 2021 21:13:06 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/3] hw/usb: Extract VT82C686 UHCI PCI function into a
 new unit
In-Reply-To: <20210309190802.830969-4-f4bug@amsat.org>
Message-ID: <4ffa2641-2b53-467-337d-38926c02b4b@eik.bme.hu>
References: <20210309190802.830969-1-f4bug@amsat.org>
 <20210309190802.830969-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2086724762-1615320786=:45902"
X-Spam-Probability: 9%
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2086724762-1615320786=:45902
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> Extract the VT82C686 PCI UHCI function into a new unit so
> it is only build when the VT82C686 south bridge is selected.

I'm not sure it's worth separating just this one device from the other 
similar usb devices when the others that are also part of south bridge 
chips are left there. Maybe you could just set user_creatable = false so 
it can only be created as part of the chips that contain it or just don't 
bother and leave it as it is which is the least likely to break anything 
that may rely on it as removing it from the device list may need to go 
through deprecation.

But I don't really mind, so if others like this approach I don't want to 
block the patch. I think it's unlikely anybody would use this device other 
than part of fuloong2e or pegasos2 so probably it's unlikely to break 
anything if it suddenly goes away from a new build.

Regards,
BALATON Zoltan

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/usb/hcd-uhci.c          | 23 --------------------
> hw/usb/vt82c686-uhci-pci.c | 43 ++++++++++++++++++++++++++++++++++++++
> MAINTAINERS                |  1 +
> hw/usb/meson.build         |  1 +
> 4 files changed, 45 insertions(+), 23 deletions(-)
> create mode 100644 hw/usb/vt82c686-uhci-pci.c
>
> diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
> index d6338c33d86..0cb02a64321 100644
> --- a/hw/usb/hcd-uhci.c
> +++ b/hw/usb/hcd-uhci.c
> @@ -1207,21 +1207,6 @@ void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
>     pci_register_bar(&s->dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &s->io_bar);
> }
>
> -static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
> -{
> -    UHCIState *s = UHCI(dev);
> -    uint8_t *pci_conf = s->dev.config;
> -
> -    /* USB misc control 1/2 */
> -    pci_set_long(pci_conf + 0x40,0x00001000);
> -    /* PM capability */
> -    pci_set_long(pci_conf + 0x80,0x00020001);
> -    /* USB legacy support  */
> -    pci_set_long(pci_conf + 0xc0,0x00002000);
> -
> -    usb_uhci_common_realize(dev, errp);
> -}
> -
> static void usb_uhci_exit(PCIDevice *dev)
> {
>     UHCIState *s = UHCI(dev);
> @@ -1318,14 +1303,6 @@ static UHCIInfo uhci_info[] = {
>         .revision  = 0x01,
>         .irq_pin   = 3,
>         .unplug    = true,
> -    },{
> -        .name      = "vt82c686b-usb-uhci",
> -        .vendor_id = PCI_VENDOR_ID_VIA,
> -        .device_id = PCI_DEVICE_ID_VIA_UHCI,
> -        .revision  = 0x01,
> -        .irq_pin   = 3,
> -        .realize   = usb_uhci_vt82c686b_realize,
> -        .unplug    = true,
>     },{
>         .name      = "ich9-usb-uhci1", /* 00:1d.0 */
>         .vendor_id = PCI_VENDOR_ID_INTEL,
> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
> new file mode 100644
> index 00000000000..b109c216033
> --- /dev/null
> +++ b/hw/usb/vt82c686-uhci-pci.c
> @@ -0,0 +1,43 @@
> +#include "qemu/osdep.h"
> +#include "hcd-uhci.h"
> +
> +static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
> +{
> +    UHCIState *s = UHCI(dev);
> +    uint8_t *pci_conf = s->dev.config;
> +
> +    /* USB misc control 1/2 */
> +    pci_set_long(pci_conf + 0x40, 0x00001000);
> +    /* PM capability */
> +    pci_set_long(pci_conf + 0x80, 0x00020001);
> +    /* USB legacy support  */
> +    pci_set_long(pci_conf + 0xc0, 0x00002000);
> +
> +    usb_uhci_common_realize(dev, errp);
> +}
> +
> +static UHCIInfo uhci_info[] = {
> +    {
> +        .name      = "vt82c686b-usb-uhci",
> +        .vendor_id = PCI_VENDOR_ID_VIA,
> +        .device_id = PCI_DEVICE_ID_VIA_UHCI,
> +        .revision  = 0x01,
> +        .irq_pin   = 3,
> +        .realize   = usb_uhci_vt82c686b_realize,
> +        .unplug    = true,
> +    }
> +};
> +
> +static const TypeInfo vt82c686b_usb_uhci_type_info = {
> +    .parent         = TYPE_UHCI,
> +    .name           = "vt82c686b-usb-uhci",
> +    .class_init     = uhci_data_class_init,
> +    .class_data     = uhci_info,
> +};
> +
> +static void vt82c686b_usb_uhci_register_types(void)
> +{
> +    type_register_static(&vt82c686b_usb_uhci_type_info);
> +}
> +
> +type_init(vt82c686b_usb_uhci_register_types)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f22d83c1782..6fd55c0a40c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1173,6 +1173,7 @@ S: Odd Fixes
> F: hw/mips/fuloong2e.c
> F: hw/isa/vt82c686.c
> F: hw/pci-host/bonito.c
> +F: hw/usb/vt82c686-uhci-pci.c
> F: include/hw/isa/vt82c686.h
>
> Loongson-3 virtual platforms
> diff --git a/hw/usb/meson.build b/hw/usb/meson.build
> index 653192cff6f..6e3159798e9 100644
> --- a/hw/usb/meson.build
> +++ b/hw/usb/meson.build
> @@ -32,6 +32,7 @@
> softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
> softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
> softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
> +softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci.c'))
> specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
> specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
>
>
--3866299591-2086724762-1615320786=:45902--

