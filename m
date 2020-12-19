Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433502DEEA3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 13:14:44 +0100 (CET)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqb8F-0000L6-An
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 07:14:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kqb79-0008Lp-Df
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:13:35 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kqb76-0007qW-6v
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 07:13:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6CF747470E8;
 Sat, 19 Dec 2020 13:13:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3C9167470E5; Sat, 19 Dec 2020 13:13:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3B0717470E4;
 Sat, 19 Dec 2020 13:13:27 +0100 (CET)
Date: Sat, 19 Dec 2020 13:13:27 +0100 (CET)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 0/8] hm/mips/fuloong2e fixes
In-Reply-To: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
Message-ID: <516bc88e-d49-94f9-b4a2-a9d31e9026@eik.bme.hu>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: crosa@redhat.com, chenhuacai@kernel.org, qemu-devel@nongnu.org,
 wainersm@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sat, 19 Dec 2020, Jiaxun Yang wrote:
> It can now boot Debian installer[1] as well as a custom PMON bootloader
> distribution[2].
>
> Note that it can't boot PMON shipped with actual machine as our ATI vgabios
> is using some x86 hack that can't be handled by x86emu in original PMON.

This may be similar problem that I've seen with similar PPC firmwares:

https://osdn.net/projects/qmiga/wiki/SubprojectAti
https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2#h3-Known.20issues

TLDR; vgabios-ati.bin is compiled for i386 real mode (bacause that's what 
gcc can do, real x86 real mode would need something like bcc I think) that 
some x86emu can't handle. You can either use Bochs vga bios via romfile 
property of the vga emulation or try the option for x86emu when compiling 
vgabios-ati.bin (which did not help the firmwares I've tried).

Regards,
BALATON Zoltan

>
> Tree avilable at: https://gitlab.com/FlyGoat/qemu/-/tree/fuloong_fixes_v2
>
> v2:
> - Collect review tags.
> - Get CPU clock via elegant method. (philmd)
> - Add boot_linux_console scceptance test
>
> [1]: http://archive.debian.org/debian/dists/jessie/main/installer-mipsel/current/images/loongson-2e/netboot/
> [2]: https://github.com/loongson-community/pmon/releases/download/20201219/pmon-2edev.bin
>
> Thanks.
>
> - Jiaxun
>
> Jiaxun Yang (8):
>  hw/mips/fuloong2e: Remove define DEBUG_FULOONG2E_INIT
>  hw/mips/fuloong2e: Relpace fault links
>  hw/pci-host/bonito: Fixup IRQ mapping
>  hw/pci-host/bonito: Fixup pci.lomem mapping
>  hw/mips/fuloong2e: Remove unused env entry
>  hw/mips/fuloong2e: Correct cpuclock env
>  hw/mips/fuloong2e: Add highmem support
>  tests/acceptance: Test boot_linux_console for fuloong2e
>
> hw/mips/fuloong2e.c                    | 84 +++++++++++++++++---------
> hw/pci-host/bonito.c                   | 45 ++++----------
> tests/acceptance/boot_linux_console.py | 21 +++++++
> 3 files changed, 87 insertions(+), 63 deletions(-)
>
>

