Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB892E6A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 20:34:11 +0100 (CET)
Received: from localhost ([::1]:52052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktyHR-0000Vi-WB
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 14:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ktyEW-0008O4-FW
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 14:31:10 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49018
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ktyEU-0006VN-Kt
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 14:31:08 -0500
Received: from host86-148-34-1.range86-148.btcentralplus.com ([86.148.34.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ktyEO-0001SN-CU; Mon, 28 Dec 2020 19:31:02 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <19d68b4da7fc8dbffe3308c661143584ac830f29.1609107222.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <080a04e0-e162-e80a-db6a-53bf4b43c9cb@ilande.co.uk>
Date: Mon, 28 Dec 2020 19:30:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <19d68b4da7fc8dbffe3308c661143584ac830f29.1609107222.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.34.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 1/2] ide: Make room for flags in PCIIDEState and add
 one for legacy mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.698,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/12/2020 22:13, BALATON Zoltan wrote:

> We'll need a flag for implementing some device specific behaviour in
> via-ide but we already have a currently CMD646 specific field that can
> be repurposed for this and leave room for further flags if needed in
> the future. This patch changes the "secondary" field to "flags" and
> change CMD646 and its users accordingly and define a new flag for
> forcing legacy mode that will be used by via-ide for now.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Fixed typo in commit message
> 
>   hw/ide/cmd646.c      | 4 ++--
>   hw/sparc64/sun4u.c   | 2 +-
>   include/hw/ide/pci.h | 7 ++++++-
>   3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index c254631485..7a96016116 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -256,7 +256,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
>       pci_conf[PCI_CLASS_PROG] = 0x8f;
>   
>       pci_conf[CNTRL] = CNTRL_EN_CH0; // enable IDE0

Doesn't the existing comment above cause checkpatch to fail?

> -    if (d->secondary) {
> +    if (d->flags & BIT(PCI_IDE_SECONDARY)) {
>           /* XXX: if not enabled, really disable the seconday IDE controller */
>           pci_conf[CNTRL] |= CNTRL_EN_CH1; /* enable IDE1 */
>       }
> @@ -314,7 +314,7 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
>   }
>   
>   static Property cmd646_ide_properties[] = {
> -    DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
> +    DEFINE_PROP_BIT("secondary", PCIIDEState, flags, PCI_IDE_SECONDARY, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index 0fa13a7330..c46baa9f48 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -674,7 +674,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
>       }
>   
>       pci_dev = pci_new(PCI_DEVFN(3, 0), "cmd646-ide");
> -    qdev_prop_set_uint32(&pci_dev->qdev, "secondary", 1);
> +    qdev_prop_set_bit(&pci_dev->qdev, "secondary", true);
>       pci_realize_and_unref(pci_dev, pci_busA, &error_fatal);
>       pci_ide_create_devs(pci_dev);
>   
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..75d1a32f6d 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -42,6 +42,11 @@ typedef struct BMDMAState {
>   #define TYPE_PCI_IDE "pci-ide"
>   OBJECT_DECLARE_SIMPLE_TYPE(PCIIDEState, PCI_IDE)
>   
> +enum {
> +    PCI_IDE_SECONDARY, /* used only for cmd646 */
> +    PCI_IDE_LEGACY_MODE
> +};
> +
>   struct PCIIDEState {
>       /*< private >*/
>       PCIDevice parent_obj;
> @@ -49,7 +54,7 @@ struct PCIIDEState {
>   
>       IDEBus bus[2];
>       BMDMAState bmdma[2];
> -    uint32_t secondary; /* used only for cmd646 */
> +    uint32_t flags;
>       MemoryRegion bmdma_bar;
>       MemoryRegion cmd_bar[2];
>       MemoryRegion data_bar[2];

Other than that I think this looks okay.


ATB,

Mark.

