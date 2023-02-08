Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A129468F5FB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:46:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoWS-0007HT-Kn; Wed, 08 Feb 2023 12:46:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pPoWJ-0007CP-6k
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:46:11 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>) id 1pPoWE-0002cy-AO
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:46:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AFDF61777;
 Wed,  8 Feb 2023 17:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37DA8C433EF;
 Wed,  8 Feb 2023 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675878357;
 bh=gogWXBxQ/Xj8rp0vi+mwWK5HExxZssEICbV9WWmXlyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bbro9Ri/QDvApTyXlIn0yGbB1ESDPlxtMSX6yQDa+lp2y6E6Ar1EbEZgmhZt9FhnD
 ArB7wnNphTEFkTrQ1PJ5bHl6INKRmhDQ11tTZWExT85w05RtxSZwgbksDHZuoXpjqo
 E+b0iwfzNMLOrjT+/FTLkfIyPDs9finIzp8hZRuyj2OH75HyeR/bcqY4lGftxMA+Ki
 HORgi1Uz7QMtY0hAHHMBTYY89UEeIvxUkZ78d75wphZHNIG6bafX0k0vNmuo4qFhKz
 r2/wIMJ/u0++BGNuu2Ly/vs0dXzGRsXcW2YpZlc0UjOn1ifcBZHpTB+nLbyjY8nsgu
 02+5/uKEaiLlw==
Date: Wed, 8 Feb 2023 10:45:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
 ardb@kernel.org, kraxel@redhat.com, hpa@zytor.com, bp@alien8.de,
 philmd@linaro.org
Subject: Re: [PATCH qemu v3] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y+Pf0q6LmQKN+FHo@dev-arch.thelio-3990X>
References: <Y69fUstLKNv/RLd7@zx2c4.com>
 <20221230220725.618763-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221230220725.618763-1-Jason@zx2c4.com>
Received-SPF: pass client-ip=139.178.84.217; envelope-from=nathan@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

Hi Jason,

On Fri, Dec 30, 2022 at 11:07:25PM +0100, Jason A. Donenfeld wrote:
> The setup_data links are appended to the compressed kernel image. Since
> the kernel image is typically loaded at 0x100000, setup_data lives at
> `0x100000 + compressed_size`, which does not get relocated during the
> kernel's boot process.
> 
> The kernel typically decompresses the image starting at address
> 0x1000000 (note: there's one more zero there than the compressed image
> above). This usually is fine for most kernels.
> 
> However, if the compressed image is actually quite large, then
> setup_data will live at a `0x100000 + compressed_size` that extends into
> the decompressed zone at 0x1000000. In other words, if compressed_size
> is larger than `0x1000000 - 0x100000`, then the decompression step will
> clobber setup_data, resulting in crashes.
> 
> Visually, what happens now is that QEMU appends setup_data to the kernel
> image:
> 
>           kernel image            setup_data
>    |--------------------------||----------------|
> 0x100000                  0x100000+l1     0x100000+l1+l2
> 
> The problem is that this decompresses to 0x1000000 (one more zero). So
> if l1 is > (0x1000000-0x100000), then this winds up looking like:
> 
>           kernel image            setup_data
>    |--------------------------||----------------|
> 0x100000                  0x100000+l1     0x100000+l1+l2
> 
>                                  d e c o m p r e s s e d   k e r n e l
>                      |-------------------------------------------------------------|
>                 0x1000000                                                     0x1000000+l3
> 
> The decompressed kernel seemingly overwriting the compressed kernel
> image isn't a problem, because that gets relocated to a higher address
> early on in the boot process, at the end of startup_64. setup_data,
> however, stays in the same place, since those links are self referential
> and nothing fixes them up.  So the decompressed kernel clobbers it.
> 
> Fix this by appending setup_data to the cmdline blob rather than the
> kernel image blob, which remains at a lower address that won't get
> clobbered.
> 
> This could have been done by overwriting the initrd blob instead, but
> that poses big difficulties, such as no longer being able to use memory
> mapped files for initrd, hurting performance, and, more importantly, the
> initrd address calculation is hard coded in qboot, and it always grows
> down rather than up, which means lots of brittle semantics would have to
> be changed around, incurring more complexity. In contrast, using cmdline
> is simple and doesn't interfere with anything.
> 
> The microvm machine has a gross hack where it fiddles with fw_cfg data
> after the fact. So this hack is updated to account for this appending,
> by reserving some bytes.
> 
> Cc: x86@kernel.org
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

I apologize if this has already been reported/fixed already (I did a
brief search on lore.kernel.org) or if my terminology is not as precise
as it could be, I am a little out of my element here :)

After this change as commit eac7a7791b ("x86: don't let decompressed
kernel image clobber setup_data") in QEMU master, I am no longer able to
boot a kernel directly through OVMF using '-append' + '-initrd' +
'-kernel'. Instead, systemd-boot tries to start the distribution's
kernel, which fails with:

  Error registering initrd: Already started

This can be reproduced with just a defconfig Linux kernel (I used
6.2-rc7), the simple buildroot images that ClangBuiltLinux uses for
boot testing [1], and OVMF. Prior to this change, the kernel would start
up but after, I am dumped into the UEFI shell (as there is no
bootloader).

The QEMU command I used was:

$ qemu-system-x86_64 \
    -kernel arch/x86_64/boot/bzImage \
    -append "console=ttyS0 earlycon=uart8250,io,0x3f8" \
    -drive if=pflash,format=raw,file=/usr/share/edk2/x64/OVMF_CODE.fd,readonly=on
    -drive if=pflash,format=raw,file=../boot-utils/images/x86_64/OVMF_VARS.fd \
    -object rng-random,filename=/dev/urandom,id=rng0 \
    -device virtio-rng-pci \
    -cpu host \
    -enable-kvm \
    -smp 8 \
    -display none \
    -initrd .../boot-utils/images/x86_64/rootfs.cpio \
    -m 512m \
    -nodefaults \
    -no-reboot \
    -serial mon:stdio

Not sure if the OVMF version will matter but just in case:

$ pacman -Q edk2-ovmf
edk2-ovmf 202211-3

I did see a few fixes on qemu-devel for this patch such as [2] but none
I found fixed the issue for me.

If there is any additional information I can provide or patches I can
test, please let me know.

[1]: https://github.com/ClangBuiltLinux/boot-utils/blob/fec03ef13519e26ac1f226e404e1620a142d0e40/images/x86_64/rootfs.cpio.zst
[2]: https://lore.kernel.org/20230207224847.94429-1-Jason@zx2c4.com/

Cheers,
Nathan

# bad: [969d09c3a6186c0a4bc8a41db0c1aba1c76081fc] Merge tag 'pull-aspeed-20230207' of https://github.com/legoater/qemu into staging
# good: [b67b00e6b4c7831a3f5bc684bc0df7a9bfd1bd56] Update VERSION for v7.2.0
git bisect start '969d09c3a6186c0a4bc8a41db0c1aba1c76081fc' 'b67b00e6b4c7831a3f5bc684bc0df7a9bfd1bd56'
# good: [38cb336fe9d47507da5177c3d349532d0af6885e] hw/arm/gumstix: Use the IEC binary prefix definitions
git bisect good 38cb336fe9d47507da5177c3d349532d0af6885e
# bad: [864a3fa439276148b6d7abcf2d43ee8dbe4c4062] monitor: Rename misc.c to hmp-target.c
git bisect bad 864a3fa439276148b6d7abcf2d43ee8dbe4c4062
# good: [e471a8c9850f1af0c1bc5768ca28285348cdd6c5] target/riscv: Trap on writes to stimecmp from VS when hvictl.VTI=1
git bisect good e471a8c9850f1af0c1bc5768ca28285348cdd6c5
# bad: [c1a9ac9bdeea213162a76f7b9e2f876c89a50a94] tests: acpi: cleanup use_uefi argument usage
git bisect bad c1a9ac9bdeea213162a76f7b9e2f876c89a50a94
# good: [dc575b5e0300a7a375b4e4501a17ada21e9a6d10] hw/i2c/bitbang_i2c: Change state calling bitbang_i2c_set_state() helper
git bisect good dc575b5e0300a7a375b4e4501a17ada21e9a6d10
# good: [3b07a936d3bfe97b07ddffcfbb532985a88033dd] target/arm: Look up ARMCPRegInfo at runtime
git bisect good 3b07a936d3bfe97b07ddffcfbb532985a88033dd
# good: [d395b18dce82855d03d934e30a515caf5a10a885] hw/acpi/acpi_dev_interface: Remove unused parameter from AcpiDeviceIfClass::madt_cpu
git bisect good d395b18dce82855d03d934e30a515caf5a10a885
# bad: [eac7a7791bb6d719233deed750034042318ffd56] x86: don't let decompressed kernel image clobber setup_data
git bisect bad eac7a7791bb6d719233deed750034042318ffd56
# good: [8a8c9c3a747f77e664fa2288735b45a9d750be75] hw/pci-host: Use register definitions from PCI standard
git bisect good 8a8c9c3a747f77e664fa2288735b45a9d750be75
# good: [8a7c606016d283a1716290c657f6f45bc7c4d817] intel-iommu: Document iova_tree
git bisect good 8a7c606016d283a1716290c657f6f45bc7c4d817
# first bad commit: [eac7a7791bb6d719233deed750034042318ffd56] x86: don't let decompressed kernel image clobber setup_data

