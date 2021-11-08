Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6764478F9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 04:54:16 +0100 (CET)
Received: from [::1] (port=37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvja-0000HL-Us
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 22:54:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhd-0005z9-GD
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:13 -0500
Received: from [2607:f8b0:4864:20::12b] (port=39456
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhb-0002nR-5m
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:13 -0500
Received: by mail-il1-x12b.google.com with SMTP id x9so15558748ilu.6
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/P7DHk7irNoDbJzBM2HTDtprkCQhwO55Gk/PezxZmbc=;
 b=0AEGLFpobfPvvhPbEN99QaodFOSoCbNhFKOQpf+oFIFCrPMAlFhF52k1w+xRmQRbQz
 Vu3TD4Xr0WGR3MuXUA1/Wywh2ngolj7OwLj+v/iHRCfnzmV4Zewacr64EyAOgZK9pOaB
 4BHZjvACnAdqYxCByurwQ49KyAnEN+p+HR5FRgxhvRfiQ7w2HRYeDCtDfzsorQdyYbon
 mK04mf2dsQKOgUtrTUAzPI2h+gBgvYJ8vuc3RiUGBf4NUuFWUVk8ZeOZjkYKOLdad5RF
 16RWuiQhFM+TAz25Z+YaIrrbabI6W6NlMzywVkumAsBFnE1LwXpE3PnKW7jZoyMc4mik
 qupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/P7DHk7irNoDbJzBM2HTDtprkCQhwO55Gk/PezxZmbc=;
 b=trUM2XRwY00qoLwG8NXxDvsvr0iO41NhhhdFZ1zY/uh40+BbWMtkoHpJ43XPqMMLgQ
 cxxLXT/egDtisT2oavN6Lj0O7/FvHkevX2lYp1QJw6jhrBKkwptJ3xfosZZAJJsCYaqt
 C/kkuyDEU6xFYMIDyj6Vg76x/o5y47W+1LxwoYKYC/1rRq6XvtJh39XbdyYjBXYiJYdw
 mIEGa18xs0kGeke72w3YqV01hMWiHbCOT+nq/MjzgpunwcxnOX3Pplpi/qAWJF+kY5rQ
 g8wHqGw03EHSeXBQH7hDUL5izRbqOrVAKNgn/zCDD3F1ihJQc2I1Tdf5N1VxGKucm3fE
 7dvQ==
X-Gm-Message-State: AOAM531l0mSi4Sr7MhCxdxe+voQ0t4WEWpTf1XB+IpMsAfG1hpaBW9xU
 98SaEjXhaEIBCMjpE0f0osWkVsHYe+BBag==
X-Google-Smtp-Source: ABdhPJxw7MXOpQWqb9B5eoB7S3cmwIHEZhNwjJ/Wy8GUuNDXaAhNrWVSnuBmeL+KWgTPtOjFAbBJCg==
X-Received: by 2002:a92:c8c6:: with SMTP id c6mr42752655ilq.54.1636343529704; 
 Sun, 07 Nov 2021 19:52:09 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/37] bsd-user: arm (32-bit) support
Date: Sun,  7 Nov 2021 20:50:59 -0700
Message-Id: <20211108035136.43687-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches brings in 32-bit arm support for bsd-user.  It implements
all the bits needed to do image activation, signal handling, stack management
and threading. This allows us to get to the "Hello World" level. The arm and x86
code are now the same as in the bsd-user fork. For full context, the fork is at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz (though the the recent
sig{bus,segv} needed updates are incomplete).

v5 changes:
   o Moved to using the CPUArchState typedef and move
     set_sigtramp_args, get_mcontext, set_mcontext, and
     get_ucontext_sigreturn prototypes to
     bsd-user/freebsd/target_os_ucontext.h
   o Fix issues with arm's set_mcontext related to masking
     and remove an unnecessary check.

We're down to only one hunk needing review:
    bsd-user/arm/target_arch_signal.c: arm set_mcontext

Warnings that should be ignored:
   o make checkpatch has a couple of complaints about the comments for the
     signal trampoline, since it's a false positive IMHO.
WARNING: Block comments use a leading /* on a separate line
+    /* 8 */ sys_sigreturn,
WARNING: Block comments use a leading /* on a separate line
+    /* 9 */ sys_exit

Warner Losh (37):
  bsd-user/mips*: Remove mips support
  bsd-user/freebsd: Create common target_os_ucontext.h file
  bsd-user: create a per-arch signal.c file
  bsd-user/i386/target_arch_signal.h: Remove target_sigcontext
  bsd-user/i386/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/i386/target_arch_signal.h: Update mcontext_t to match FreeBSD
  bsd-user/i386: Move the inlines into signal.c
  bsd-user/x86_64/target_arch_signal.h: Remove target_sigcontext
  bsd-user/x86_64/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/x86_64/target_arch_signal.h: Fill in mcontext_t
  bsd-user/x86_64: Move functions into signal.c
  bsd-user/target_os_signal.h: Move signal prototypes to
    target_os_ucontext.h
  bsd-user/arm/target_arch_sysarch.h: Use consistent include guards
  bsd-user/arm/target_syscall.h: Add copyright and update name
  bsd-user/arm/target_arch_cpu.c: Target specific TLS routines
  bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
  bsd-user/arm/target_arch_cpu.h: Implement target_cpu_clone_regs
  bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop implementation
  bsd-user/arm/target_arch_cpu.h: Implement trivial EXCP exceptions
  bsd-user/arm/target_arch_cpu.h: Implement data abort exceptions
  bsd-user/arm/target_arch_cpu.h: Implement system call dispatch
  bsd-user/arm/target_arch_reg.h: Implement core dump register copying
  bsd-user/arm/target_arch_vmparam.h: Parameters for arm address space
  bsd-user/arm/target_arch_sigtramp.h: Signal Trampoline for arm
  bsd-user/arm/target_arch_thread.h: Routines to create and switch to a
    thread
  bsd-user/arm/target_arch_elf.h: arm defines for ELF
  bsd-user/arm/target_arch_elf.h: arm get hwcap
  bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
  bsd-user/arm/target_arch_signal.h: arm specific signal registers and
    stack
  bsd-user/arm/target_arch_signal.h: arm machine context and trapframe
    for signals
  bsd-user/arm/target_arch_signal.h: Define size of *context_t
  bsd-user/arm/signal.c: arm set_sigtramp_args
  bsd-user/arm/signal.c: arm get_mcontext
  bsd-user/arm/signal.c: arm set_mcontext
  bsd-user/arm/signal.c: arm get_ucontext_sigreturn
  bsd-user/freebsd/target_os_ucontext.h: Require TARGET_*CONTEXT_SIZE
  bsd-user: add arm target build

 bsd-user/arm/signal.c                 | 196 ++++++++++++++++++++++++
 bsd-user/arm/target_arch.h            |  28 ++++
 bsd-user/arm/target_arch_cpu.c        |  39 +++++
 bsd-user/arm/target_arch_cpu.h        | 211 ++++++++++++++++++++++++++
 bsd-user/arm/target_arch_elf.h        | 128 ++++++++++++++++
 bsd-user/arm/target_arch_reg.h        |  60 ++++++++
 bsd-user/arm/target_arch_signal.h     |  88 +++++++++++
 bsd-user/arm/target_arch_sigtramp.h   |  49 ++++++
 bsd-user/arm/target_arch_sysarch.h    |   6 +-
 bsd-user/arm/target_arch_thread.h     |  82 ++++++++++
 bsd-user/arm/target_arch_vmparam.h    |  48 ++++++
 bsd-user/arm/target_syscall.h         |  27 +++-
 bsd-user/freebsd/target_os_signal.h   |   3 -
 bsd-user/freebsd/target_os_ucontext.h |  44 ++++++
 bsd-user/i386/signal.c                |  55 +++++++
 bsd-user/i386/target_arch_signal.h    |  95 ++++++------
 bsd-user/mips/target_arch_sysarch.h   |  69 ---------
 bsd-user/mips/target_syscall.h        |  52 -------
 bsd-user/mips64/target_arch_sysarch.h |  69 ---------
 bsd-user/mips64/target_syscall.h      |  53 -------
 bsd-user/x86_64/signal.c              |  55 +++++++
 bsd-user/x86_64/target_arch_signal.h  | 103 +++++++------
 configs/targets/arm-bsd-user.mak      |   2 +
 meson.build                           |   2 +-
 24 files changed, 1214 insertions(+), 350 deletions(-)
 create mode 100644 bsd-user/arm/signal.c
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/arm/target_arch_elf.h
 create mode 100644 bsd-user/arm/target_arch_reg.h
 create mode 100644 bsd-user/arm/target_arch_signal.h
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h
 create mode 100644 bsd-user/arm/target_arch_thread.h
 create mode 100644 bsd-user/arm/target_arch_vmparam.h
 create mode 100644 bsd-user/freebsd/target_os_ucontext.h
 create mode 100644 bsd-user/i386/signal.c
 delete mode 100644 bsd-user/mips/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips/target_syscall.h
 delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips64/target_syscall.h
 create mode 100644 bsd-user/x86_64/signal.c
 create mode 100644 configs/targets/arm-bsd-user.mak

-- 
2.33.0


