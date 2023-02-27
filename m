Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AA6A41D6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:41:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcnz-0004rA-1C; Mon, 27 Feb 2023 07:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWcns-0004WG-6A; Mon, 27 Feb 2023 07:40:28 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWcnp-0001Y7-Ao; Mon, 27 Feb 2023 07:40:27 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A59DE746377;
 Mon, 27 Feb 2023 13:40:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6D1DE74633D; Mon, 27 Feb 2023 13:40:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6BB26746369;
 Mon, 27 Feb 2023 13:40:18 +0100 (CET)
Date: Mon, 27 Feb 2023 13:40:18 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-ppc@nongnu.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/3] VT82xx PCI IRQ routing fixes
In-Reply-To: <20230227123316.18719-1-shentey@gmail.com>
Message-ID: <9013b523-9376-9bc7-0e77-7d00da08ef8f@eik.bme.hu>
References: <20230227123316.18719-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

On Mon, 27 Feb 2023, Bernhard Beschow wrote:
> This series makes PCI interrupt routing in the VIA south bridges more compliant
> to the PCI specification. It aims to help bringing audio output support to the
> ppc/pegasos2 machine [1].
>
> v3:
> * Remove superfluous if statement in patch 2 (Phil)

Thanks but to help my work could you please do this in patch 4 in my 
series and send a v4 to that one patch also not reverting my changes just 
changing what the review asked for, so I don't have to manually apply 
changes from this series to mine which is what supposed to be committed as 
it has all needed patches as aked by the PPC maintainer to make it easy to 
follow its status? Also replace the assert with a comment as I've asked. 
If you don't want to do that way I'll fold this in in the next version 
after waiting for some more review comments so I can do a respin with all 
needed chaages but doing it this way is not very helpful of you.

Regards,
BALATON Zoltan

> v2:
> * Remove audio patches which were included for proof of concept
>
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
>
> [1] https://patchew.org/QEMU/cover.1677004414.git.balaton@eik.bme.hu/
>
> Bernhard Beschow (3):
>  hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router
>  hw/isa/vt82c686: Implement PCI IRQ routing
>  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing
>
> hw/isa/vt82c686.c          | 41 ++++++++++++++++++++++++++++++++++++++
> hw/ppc/pegasos2.c          |  6 ++++++
> hw/usb/vt82c686-uhci-pci.c | 12 -----------
> 3 files changed, 47 insertions(+), 12 deletions(-)
>
> --
> 2.39.2
>
>
>

