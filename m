Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C2683031
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 16:00:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMroy-0001YA-GH; Tue, 31 Jan 2023 09:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMrod-0001X9-2D
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:40:55 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pMroa-0003Db-KL
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 09:40:54 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4C4D57462DB;
 Tue, 31 Jan 2023 15:38:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 103E0745712; Tue, 31 Jan 2023 15:38:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0E81B745706;
 Tue, 31 Jan 2023 15:38:23 +0100 (CET)
Date: Tue, 31 Jan 2023 15:38:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH 0/3] VIA PM Improvements
In-Reply-To: <20230129213418.87978-1-shentey@gmail.com>
Message-ID: <751a5e54-09aa-6f6a-b18c-948967aa5bef@eik.bme.hu>
References: <20230129213418.87978-1-shentey@gmail.com>
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

On Sun, 29 Jan 2023, Bernhard Beschow wrote:
> This series is part of my work to bring the VIA south bridges to the PC machine
> [1]. First it resolves a fixme in the device model by using the dedicated ACPI
> interrupt register for SCI routing. It then enables the device model to switch
> to ACPI. Finally, ACPI shutdown is implemented which guests can take advantage
> of after switching to ACPI mode.
>
> Testing done:
> - `make check`
> - `qemu-system-ppc -M pegasos2 \
>                   -rtc base=localtime \
>                   -device ati-vga,guest_hwcursor=true,romfile="" \
>                   -cdrom morphos-3.17.iso \
>                   -kernel morphos-3.17/boot.img`
> - `qemu-system-ppc -M pegasos2 \
>                   -device ati-vga,romfile="" \
>                   -cdrom morphos-3.17.iso \
>                   -bios pegasos2.rom`

I can't review this in detail so I can only give some cosmetic comments, 
do with it what you like. For testing I think shutdown from MorphOS worked 
with the pegasos2.rom after this patch:

https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg01871.html

but that was not accepted as it was deemed to be an error in memory layer 
but then that wasn't fixed so probably this workaround is still needed to 
get it to work with big endian guest on little endian host. Does poweroff 
work from Linux?

Regards,
BALATON Zoltan

> - `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
>   manjaro-kde-21.3.2-220704-linux515.iso` on my pc-via branch seems to work
>   without any noticable differences to piix3 except that hotplugging isn't
>   implemented.
>
> [1] https://github.com/shentok/qemu/tree/pc-via
>
> Bernhard Beschow (3):
>  hw/isa/vt82c686: Fix SCI routing
>  hw/isa/vt82c686: Allow PM controller to switch to ACPI mode
>  hw/isa/vt82c686: Implement ACPI powerdown
>
> hw/isa/vt82c686.c | 75 +++++++++++++++++++++++++++++++++++++++--------
> 1 file changed, 62 insertions(+), 13 deletions(-)
>
> --
> 2.39.1
>
>
>

