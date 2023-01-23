Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75E2678A03
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 22:54:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK4k3-0003hk-9J; Mon, 23 Jan 2023 16:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pK4k0-0003ha-Tw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:52:37 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pK4jy-0005ae-N6
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 16:52:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 452AFB80DDD;
 Mon, 23 Jan 2023 21:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70BAC433EF;
 Mon, 23 Jan 2023 21:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674510750;
 bh=P/Q7W9StX969uGl/N32Nhtz9pgvH+oC1EJejjoJNOsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vM2IkGpHG/4mSUNARzkdcR6aeaK0oFadcM9b9tez9lDg+w+T28puDVcEasl0S1sKM
 CExMp6BiR00o7aOwuIMoPhRdJAsALnF2xZL3n/x0edDO+P7XGKG9YMHlmRmnwcs2Mc
 cO8MT2XwiA31xdCt5km8Ac9ps0MxTyk1VnHY62lLAMKrLwxdRBDrBUAmugGshgrYmZ
 lUO6Uee5txqQCAXFALdpUGLCosfWAjLVcqJYI3b2Gwd2OALMrlnEhLBfXqdbQfdfEL
 VsOZVxVzVgF7Gl2lPaO1vUlaGxtAfpbBGrLsDPpsdF1vPv5pKU8uH3RdDqFfbqQ5T8
 OoOaNZ6Ys5uzQ==
Date: Mon, 23 Jan 2023 14:52:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 5/6] hw/mips/gt64xxx_pci: Endian-swap using
 PCI_HOST_BRIDGE MemoryRegionOps
Message-ID: <Y88BmxzRqtnpAsWG@dev-arch.thelio-3990X>
References: <20230104133935.4639-1-philmd@linaro.org>
 <20230104133935.4639-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104133935.4639-6-philmd@linaro.org>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=nathan@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

Hi Philippe,

On Wed, Jan 04, 2023 at 02:39:34PM +0100, Philippe Mathieu-Daudé wrote:
> GT64120's PCI endianness swapping works on little-endian hosts,
> but doesn't on big-endian ones. Instead of complicating how
> CFGADDR/CFGDATA registers deal with endianness, use the existing
> MemoryRegionOps from hw/pci/pci_host.c. Doing so also reduce the
> access to internal PCI_HOST_BRIDGE fields.
> 
> Map the PCI_HOST_BRIDGE MemoryRegionOps into the corresponding
> CFGADDR/CFGDATA regions in the ISD MMIO and remove the unused
> code in the current ISD read/write handlers.
> 
> Update the mapping when PCI0_CMD register is accessed (in case
> the endianness is changed).
> 
> This allows using the GT64120 on a big-endian host (and boot
> the MIPS Malta machine in little-endian).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

This change as commit 145e2198d7 ("hw/mips/gt64xxx_pci: Endian-swap
using PCI_HOST_BRIDGE MemoryRegionOps") in QEMU master causes a hang
when trying to poweroff a malta_defconfig + CONFIG_CPU_BIG_ENDIAN=y
kernel on an x86_64 host. The kernel has been built from latest mainline
using the kernel.org toolchains [1], just in case it matters.

$ timeout --foreground 30s qemu-system-mips \
-cpu 24Kf \
-machine malta \
-kernel vmlinux \
-display none \
-initrd rootfs.cpio \
-m 512m \
-nodefaults \
-no-reboot \
-serial mon:stdio
...
Run /init as init process
process '/bin/busybox' started with executable stack
Starting syslogd: OK
Starting klogd: OK
Running sysctl: OK
Saving random seed: OK
Starting network: OK
Linux version 6.2.0-rc5-00013-g2475bf0250de (tuxmake@tuxmake) (mips-linux-gcc (GCC) 12.2.0, GNU ld (GNU Binutils) 2.39) #1 SMP @1674418498
Stopping network: OK
Saving random seed: OK
Stopping klogd: OK
Stopping syslogd: OK
umount: devtmpfs busy - remounted read-only
umount: can't unmount /: Invalid argument
The system is going down NOW!
Sent SIGTERM to all processes
Sent SIGKILL to all processes
Requesting system poweroff
reboot: System halted
qemu-system-mips: terminating on signal 15 from pid 2213875 (timeout)

The rootfs is available at [2], if it is necessary. It is a simple
buildroot initramfs that just prints the version string and shutsdown
the machine

If there is any additional information that I can provide or patches I
can test, please let me know.

[1]: https://mirrors.edge.kernel.org/pub/tools/crosstool/
[2]: https://github.com/ClangBuiltLinux/boot-utils/tree/1b837f3b0fca441e0cc694c9b587120e81299554/images/mips

Cheers,
Nathan

# bad: [00b1faea41d283e931256aa78aa975a369ec3ae6] Merge tag 'pull-target-arm-20230123' of https://git.linaro.org/people/pmaydell/qemu-arm into staging
# good: [886fb67020e32ce6a2cf7049c6f017acf1f0d69a] Merge tag 'pull-target-arm-20230113' of https://git.linaro.org/people/pmaydell/qemu-arm into staging
git bisect start '00b1faea41d283e931256aa78aa975a369ec3ae6' '886fb67020e32ce6a2cf7049c6f017acf1f0d69a'
# bad: [239b8b0699a222fd21da1c5fdeba0a2456085a47] Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging
git bisect bad 239b8b0699a222fd21da1c5fdeba0a2456085a47
# bad: [a48f692929828212f75eb6e8d11bbb6cdffad153] hw/usb: Mark the XLNX_VERSAL-related files as target-independent
git bisect bad a48f692929828212f75eb6e8d11bbb6cdffad153
# bad: [a844873512400fae6bed9e87694dc96ff2f15f39] mips: Remove support for trap and emulate KVM
git bisect bad a844873512400fae6bed9e87694dc96ff2f15f39
# bad: [cd5066f8618bc6c80ec9088923c58f4a42ab0e7a] hw/mips/bootloader: Handle buffers as opaque arrays
git bisect bad cd5066f8618bc6c80ec9088923c58f4a42ab0e7a
# bad: [37e506b69a6791bede30677f05081296f3b77f77] hw/mips/gt64xxx_pci: Let the GT64120 manage the lower 512MiB hole
git bisect bad 37e506b69a6791bede30677f05081296f3b77f77
# good: [65423e6efeac1ee1057870361337c572c941140c] hw/mips/gt64xxx_pci: Accumulate address space changes
git bisect good 65423e6efeac1ee1057870361337c572c941140c
# bad: [7c032bfbe838c24dcbdc8f9c452553b24f20daad] hw/mips/Kconfig: Introduce CONFIG_GT64120 to select gt64xxx_pci.c
git bisect bad 7c032bfbe838c24dcbdc8f9c452553b24f20daad
# bad: [145e2198d749ec09a405f1607a9932499b76f1eb] hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps
git bisect bad 145e2198d749ec09a405f1607a9932499b76f1eb
# first bad commit: [145e2198d749ec09a405f1607a9932499b76f1eb] hw/mips/gt64xxx_pci: Endian-swap using PCI_HOST_BRIDGE MemoryRegionOps

