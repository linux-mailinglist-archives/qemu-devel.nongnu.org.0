Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BE16A6E47
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNLK-00080V-UX; Wed, 01 Mar 2023 09:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXNLH-0007z0-Ig; Wed, 01 Mar 2023 09:22:03 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXNLF-0000lo-Tm; Wed, 01 Mar 2023 09:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P2QnA42HG03TYG2DhQ+RiXXF5trXwqVe18y4hHo1508=; b=It2bPV++aAJuHRI9oSnEzw+6vQ
 2vAKfmjiftfrbbY0xjTidDhO3SdspdOAyyJf4R2ohrj9mUP9g913egqjAVtNHF9sFk3rHxCWcI+5j
 lcvvG7Nx4hXtpzy9sx5w3QX703wVBXi862DTKJCoLz+/mQQw8SQfNhb7q/cyk75NqiBeGct0jVMtp
 zlaYqOznxNozNoCS9VtmNhPil1IK/kATh1J0Mr2Z/aj+cY0aazADxdGcArsTPXipmRXdhP7ulb/Rf
 VKiG9BU1Cofx9wn3qb3KKlxBPVqu5c1Iq9WvUTdn5fvx1wbg1QTkxQeRt3iO3PYQSEeR0v4GJizv8
 ehMQXwrwBl7VSN7HwkszSZMAyhqrkGXmRHEfoLGMWg/wk/Gd5Ft7MAm9GOo5/7ehSKm0auC2rMs8s
 sWNPSNmDIQW8s8CM3eNkBQ8cKPLpN/tTwNXzh+6IIwI/QLV39yM2aLAdzyT/0M2damIzVm0ZzEW3D
 H7vzHPYKIvBjoeP89yni0drxv4Ra2lLiopWdzPEK2PZk5YOQctI685KPfFY0LVN22Ya+Gahs36ywV
 m/gJ+zqnYQliu4OYBJMnjc2rS/NFp18MpjowBy3jy9B9TfSm5zFFVdLFG5XTjjMjblQYyXDmKCSu/
 6an4AmuCO4i1dPQkbkTvxnTJFmgXfGZuZf2Dm58Gw=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pXNKZ-0001Ud-J8; Wed, 01 Mar 2023 14:21:23 +0000
Message-ID: <69ca8f8f-7b6c-f746-c414-1f121a31eaef@ilande.co.uk>
Date: Wed, 1 Mar 2023 14:21:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-4-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230223202053.117050-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 3/5] hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/02/2023 20:20, Bernhard Beschow wrote:

> According to the PCI specification, PCI_INTERRUPT_LINE shall have no
> effect on hardware operations. Now that the VIA south bridges implement
> the internal PCI interrupt router let's be more conformant to the PCI
> specification.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/usb/vt82c686-uhci-pci.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
> index 46a901f56f..b4884c9011 100644
> --- a/hw/usb/vt82c686-uhci-pci.c
> +++ b/hw/usb/vt82c686-uhci-pci.c
> @@ -1,17 +1,7 @@
>   #include "qemu/osdep.h"
> -#include "hw/irq.h"
>   #include "hw/isa/vt82c686.h"
>   #include "hcd-uhci.h"
>   
> -static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
> -{
> -    UHCIState *s = opaque;
> -    uint8_t irq = pci_get_byte(s->dev.config + PCI_INTERRUPT_LINE);
> -    if (irq > 0 && irq < 15) {
> -        via_isa_set_irq(pci_get_function_0(&s->dev), irq, level);
> -    }
> -}
> -
>   static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>   {
>       UHCIState *s = UHCI(dev);
> @@ -25,8 +15,6 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>       pci_set_long(pci_conf + 0xc0, 0x00002000);
>   
>       usb_uhci_common_realize(dev, errp);
> -    object_unref(s->irq);
> -    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
>   }
>   
>   static UHCIInfo uhci_info[] = {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

