Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13E6A2D05
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 03:01:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW6L8-0006iN-7p; Sat, 25 Feb 2023 21:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pW6L5-0006i8-8b; Sat, 25 Feb 2023 21:00:35 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pW6L2-0003U2-J2; Sat, 25 Feb 2023 21:00:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9F363746335;
 Sun, 26 Feb 2023 03:00:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A811874635C; Sun, 26 Feb 2023 03:00:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A63AF74634B;
 Sun, 26 Feb 2023 03:00:28 +0100 (CET)
Date: Sun, 26 Feb 2023 03:00:28 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 0/3] VT82xx PCI IRQ routing fixes
In-Reply-To: <20230225170857.15774-1-shentey@gmail.com>
Message-ID: <4f450d71-ab29-3afe-eb02-f46c303a0acb@eik.bme.hu>
References: <20230225170857.15774-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Sat, 25 Feb 2023, Bernhard Beschow wrote:
> This series makes PCI interrupt routing in the VIA south bridges more compliant
> to the PCI specification. It aims to help bringing audio output support to the
> ppc/pegasos2 machine [1].
>
> v2:
> * Remove audio patches which were included for proof of concept

I've merged this with my other patches and made a series with all patches 
needed for AmigaOS on pegasos2 and MorphOS sound support here on branch 
pegasos2-alt:

https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2-alt/

I hope to get it tested before Monday so we can finalise it early next 
week.

> Testing done with via-ac97 audio patches on top:
> * `make check`
> * `qemu-system-ppc -M pegasos2 -rtc base=localtime -device
>  ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -kernel
>  morphos-3.17/boot.img`
>  -> There is a nice sound when the Desktop becomes visible.
> * `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc base=localtime -device
>  ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso`
>  -> There is a nice sound when the Desktop becomes visible.
> * `qemu-system-ppc -M pegasos2 -bios pegasos2.rom -rtc base=localtime -device
>  ati-vga,guest_hwcursor=true,romfile="" -cdrom morphos-3.17.iso -device
>  usb-mouse -device usb-kbd`
>  -> The machine hangs when audio is supposed to play while the mouse is moved.
>     This behavior can also be reproduced in v1.

Please come up with a similar workaround for this issue that I've done in 
my series on which this works now without hanging. My series is on 
pegasos2 branch:

https://osdn.net/projects/qmiga/scm/git/qemu/tree/pegasos2/

but I don't understand your irq mapping function and don't know how could 
I add similar workaround to that.

Regards,
BALATON Zoltan

> [1] https://patchew.org/QEMU/cover.1677004414.git.balaton@eik.bme.hu/
>
> Bernhard Beschow (3):
>  hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router
>  hw/isa/vt82c686: Implement PCI IRQ routing
>  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
>
> hw/isa/vt82c686.c          | 44 ++++++++++++++++++++++++++++++++++++++
> hw/ppc/pegasos2.c          |  6 ++++++
> hw/usb/vt82c686-uhci-pci.c | 12 -----------
> 3 files changed, 50 insertions(+), 12 deletions(-)
>
> --
> 2.39.2
>
>
>

