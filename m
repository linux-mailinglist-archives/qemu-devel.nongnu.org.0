Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922163BDFDE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 01:51:40 +0200 (CEST)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0uqp-0003Sq-Iu
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 19:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uos-0000iB-TZ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:38 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0uop-0006aq-7S
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:38 -0400
Received: by mail-pf1-x436.google.com with SMTP id 145so583053pfv.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/z5vZfJtdxcIfY7kwN4wEll30P9yfPdrm2rcsjhrUE=;
 b=XUUSm6NP4Dc+10hzx/+Mso6urll/5SV2aCKKVre+vHhf2wf3yGltC51nZfBXGcUvSk
 V6b/T+Lmw4LJo9SNeDH9aEcOjr5LyaR8orG4D3J47ipjf+tZt39D0iKNVNfxrSUwqZJU
 JpqMMr0pKAfNE+bT7HF9xzFcyi/Nby75VdBKpktX0jrvyleC6ow8YzKJDdYfttwDstgv
 jzqI+rEdsbi8oOKPdZ1Xq9q4BrHc0ZIVeGUcXV7EN9sU7lYgDMSVeltAJ4RGST8t9vss
 qtE6Bmd4fAhKSyr7MF4j6NrHqZ1ROWsCz7Yr/1sJQ6vRrYeGCWjVYkrdIuQTM0aDkLVH
 8LHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M/z5vZfJtdxcIfY7kwN4wEll30P9yfPdrm2rcsjhrUE=;
 b=by3ibHDWO9UY+NbYo7Mu5WxuovJgGB7jJ5btpy064rzb5OyAegAsSihqghZvVTGVZh
 RAEbUdF5LcNFnuf1niGhD6X1fyOUomTiuB9EoQ6nwSNOGLlo8a7Of9iNRLTNAY6913B2
 hi23djhL1LSnPAs5WXxvkObdq++HXRXcD0DcvQ0i8Xu4nAJBPBw+/9AXzXZ5A83N59CF
 foQy0RRMXK2nrsN4YMyufMob2FuizyJ5VX0LWZ/+MypVOyoDPO2ecUYS/+DAGVbLtHNj
 J07KEKuLXTsMR+vC/8UHLlWgoDkoQRAzhVfWMA5nC7feFk62ROPSODhh+xGKUaAGMAxV
 S64Q==
X-Gm-Message-State: AOAM532PchY0Qh8DMkRvw3G2ZKzfVENU9i6CQQfp3vbtww1cDMDb5trP
 OpvLZdO750YBY16ZAUK0YqfzqMzNZlkbIg==
X-Google-Smtp-Source: ABdhPJw2qTQthrEpCwFDgp5E+gY/QNdDHeGXG+MTQMnCzYwTxn86DrbhiW43CZQJ519DcWfEycXp1w==
X-Received: by 2002:a63:4a18:: with SMTP id x24mr23047560pga.303.1625615373495; 
 Tue, 06 Jul 2021 16:49:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/36] linux-user: Signal trampolines and vdsos
Date: Tue,  6 Jul 2021 16:48:56 -0700
Message-Id: <20210706234932.356913-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: <20210619034329.532318-1-richard.henderson@linaro.org>
("[PATCH 00/12] linux-user: Load a vdso for x86_64 and hppa")

Supercedes: <20210618192951.125651-1-richard.henderson@linaro.org>
("[PATCH v2 00/23] linux-user: Move signal trampolines to new page")

Changes for v2:
  * Add vdsos for aarch64, arm, i386, riscv.
  * Drop setup_sigtramp for any target with a vdso.
  * Drop arm v1 signal support.
  * Simplify ppc encode_trampoline.

The remaining linux kernel targets that support vdsos are:

MIPS is particularly troublesome because of a multitude of ISAs.
The kernel doesn't even support them all, disabling the vdso for
micromips (and probably ignores nanomips entirely).  Though I'll
note that linux-user/mips does not handle any of the modern
ISAs -- install_sigtramp is strictly MIPS I.  In addition there
are 3 ELF ABIs, so there's some combinatorial explosion in the
set of vdsos that would need to be pre-built.  Perhaps put this
off until we can build these on demand.

PPC is troublesome because of __kernel_get_syscall_map.
In addition to needing to collect the set of syscalls that qemu
supports, we'd need to update the vdso every time we add support
for a new syscall.  And then there are the 3 ELF ABIs.  So again
put this off until we can build these on demand.

S390x shouldn't be troublesome, I just didn't finish them all.


r~


Richard Henderson (36):
  linux-user: Add infrastructure for a signal trampoline page
  linux-user: Fix style problems in linuxload.c
  linux-user: Introduce imgsrc_read, imgsrc_read_alloc
  linux-user: Tidy loader_exec
  linux-user: Do not clobber bprm_buf swapping ehdr
  linux-user: Use ImageSource in load_elf_image
  linux-user: Use ImageSource in load_symbols
  linux-user: Replace bprm->fd with bprm->src.fd
  linux-user: Introduce imgsrc_mmap
  linux-user: Load vdso image if available
  linux-user: Add gen-vdso tool
  linux-user/aarch64: Add vdso and use it for rt_sigreturn
  linux-user/arm: Drop v1 signal frames
  linux-user/arm: Drop "_v2" from symbols in signal.c
  target/arm: Add isar_feature_aa32_a32
  linux-user/arm: Add vdso and use it for rt_sigreturn
  linux-user/alpha: Implement setup_sigtramp
  linux-user/cris: Implement setup_sigtramp
  linux-user/hexagon: Implement setup_sigtramp
  linux-user/hppa: Add vdso and use it for rt_sigreturn
  linux-user/x86_64: Raise SIGSEGV if SA_RESTORER not set
  linux-user/i386: Add vdso and use it for sigreturn
  linux-user/x86_64: Add vdso
  linux-user/m68k: Implement setup_sigtramp
  linux-user/microblaze: Implement setup_sigtramp
  linux-user/mips: Tidy install_sigtramp
  linux-user/mips: Implement setup_sigtramp
  linux-user/nios2: Document non-use of setup_sigtramp
  linux-user/openrisc: Implement setup_sigtramp
  target/ppc: Simplify encode_trampoline
  linux-user/ppc: Implement setup_sigtramp
  linux-user/riscv: Add vdso and use it for sigreturn
  linux-user/s390x: Implement setup_sigtramp
  linux-user/sh4: Implement setup_sigtramp
  linux-user/sparc: Implement setup_sigtramp
  linux-user/xtensa: Implement setup_sigtramp

 linux-user/alpha/target_signal.h      |   1 +
 linux-user/cris/target_signal.h       |   2 +
 linux-user/hexagon/target_signal.h    |   2 +
 linux-user/m68k/target_signal.h       |   2 +
 linux-user/microblaze/target_signal.h |   2 +
 linux-user/mips/target_signal.h       |   1 +
 linux-user/mips64/target_signal.h     |   2 +
 linux-user/nios2/target_signal.h      |   3 +
 linux-user/openrisc/target_signal.h   |   2 +
 linux-user/ppc/target_signal.h        |   2 +
 linux-user/qemu.h                     |  67 +++-
 linux-user/s390x/target_signal.h      |   2 +
 linux-user/sh4/target_signal.h        |   2 +
 linux-user/sparc/target_signal.h      |   4 +
 linux-user/xtensa/target_signal.h     |   2 +
 target/arm/cpu.h                      |   5 +
 linux-user/aarch64/signal.c           |  17 +-
 linux-user/alpha/signal.c             |  34 +-
 linux-user/arm/signal.c               | 500 ++++++--------------------
 linux-user/cris/signal.c              |  29 +-
 linux-user/elfload.c                  | 367 ++++++++++++-------
 linux-user/flatload.c                 |   8 +-
 linux-user/gen-vdso.c                 | 223 ++++++++++++
 linux-user/hexagon/signal.c           |  19 +-
 linux-user/hppa/signal.c              |   8 +-
 linux-user/i386/signal.c              |  50 +--
 linux-user/linuxload.c                | 171 ++++++---
 linux-user/m68k/signal.c              |  47 ++-
 linux-user/microblaze/signal.c        |  24 +-
 linux-user/mips/signal.c              |  39 +-
 linux-user/openrisc/signal.c          |  24 +-
 linux-user/ppc/signal.c               |  40 +--
 linux-user/riscv/signal.c             |  10 +-
 linux-user/s390x/signal.c             |  24 +-
 linux-user/sh4/signal.c               |  40 ++-
 linux-user/signal.c                   |   3 +
 linux-user/sparc/signal.c             |  32 +-
 linux-user/xtensa/signal.c            |  50 +--
 target/arm/cpu_tcg.c                  |   7 +
 linux-user/gen-vdso-elfn.c.inc        | 306 ++++++++++++++++
 linux-user/aarch64/Makefile.vdso      |  11 +
 linux-user/aarch64/meson.build        |  11 +
 linux-user/aarch64/vdso-be.so         | Bin 0 -> 6000 bytes
 linux-user/aarch64/vdso-le.so         | Bin 0 -> 6000 bytes
 linux-user/aarch64/vdso.S             |  77 ++++
 linux-user/aarch64/vdso.ld            |  74 ++++
 linux-user/arm/Makefile.vdso          |  17 +
 linux-user/arm/meson.build            |  18 +
 linux-user/arm/vdso-arm-be.so         | Bin 0 -> 5648 bytes
 linux-user/arm/vdso-arm-le.so         | Bin 0 -> 5648 bytes
 linux-user/arm/vdso-thm-be.so         | Bin 0 -> 5620 bytes
 linux-user/arm/vdso-thm-le.so         | Bin 0 -> 5620 bytes
 linux-user/arm/vdso.S                 | 209 +++++++++++
 linux-user/arm/vdso.ld                |  74 ++++
 linux-user/hppa/Makefile.vdso         |   6 +
 linux-user/hppa/meson.build           |   6 +
 linux-user/hppa/vdso.S                | 149 ++++++++
 linux-user/hppa/vdso.ld               |  75 ++++
 linux-user/hppa/vdso.so               | Bin 0 -> 5196 bytes
 linux-user/i386/Makefile.vdso         |   5 +
 linux-user/i386/meson.build           |   7 +
 linux-user/i386/vdso.S                | 149 ++++++++
 linux-user/i386/vdso.ld               |  76 ++++
 linux-user/i386/vdso.so               | Bin 0 -> 5528 bytes
 linux-user/meson.build                |   8 +-
 linux-user/riscv/Makefile.vdso        |  11 +
 linux-user/riscv/meson.build          |   9 +
 linux-user/riscv/vdso-32.so           | Bin 0 -> 5624 bytes
 linux-user/riscv/vdso-64.so           | Bin 0 -> 6120 bytes
 linux-user/riscv/vdso.S               | 207 +++++++++++
 linux-user/riscv/vdso.ld              |  76 ++++
 linux-user/x86_64/Makefile.vdso       |   5 +
 linux-user/x86_64/meson.build         |   6 +
 linux-user/x86_64/vdso.S              | 122 +++++++
 linux-user/x86_64/vdso.ld             |  74 ++++
 linux-user/x86_64/vdso.so             | Bin 0 -> 6008 bytes
 76 files changed, 2866 insertions(+), 789 deletions(-)
 create mode 100644 linux-user/gen-vdso.c
 create mode 100644 linux-user/gen-vdso-elfn.c.inc
 create mode 100644 linux-user/aarch64/Makefile.vdso
 create mode 100644 linux-user/aarch64/meson.build
 create mode 100755 linux-user/aarch64/vdso-be.so
 create mode 100755 linux-user/aarch64/vdso-le.so
 create mode 100644 linux-user/aarch64/vdso.S
 create mode 100644 linux-user/aarch64/vdso.ld
 create mode 100644 linux-user/arm/Makefile.vdso
 create mode 100755 linux-user/arm/vdso-arm-be.so
 create mode 100755 linux-user/arm/vdso-arm-le.so
 create mode 100755 linux-user/arm/vdso-thm-be.so
 create mode 100755 linux-user/arm/vdso-thm-le.so
 create mode 100644 linux-user/arm/vdso.S
 create mode 100644 linux-user/arm/vdso.ld
 create mode 100644 linux-user/hppa/Makefile.vdso
 create mode 100644 linux-user/hppa/vdso.S
 create mode 100644 linux-user/hppa/vdso.ld
 create mode 100755 linux-user/hppa/vdso.so
 create mode 100644 linux-user/i386/Makefile.vdso
 create mode 100644 linux-user/i386/vdso.S
 create mode 100644 linux-user/i386/vdso.ld
 create mode 100755 linux-user/i386/vdso.so
 create mode 100644 linux-user/riscv/Makefile.vdso
 create mode 100644 linux-user/riscv/meson.build
 create mode 100755 linux-user/riscv/vdso-32.so
 create mode 100755 linux-user/riscv/vdso-64.so
 create mode 100644 linux-user/riscv/vdso.S
 create mode 100644 linux-user/riscv/vdso.ld
 create mode 100644 linux-user/x86_64/Makefile.vdso
 create mode 100644 linux-user/x86_64/vdso.S
 create mode 100644 linux-user/x86_64/vdso.ld
 create mode 100755 linux-user/x86_64/vdso.so

-- 
2.25.1


