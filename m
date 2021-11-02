Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24858443932
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 23:58:55 +0100 (CET)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2k2-0000zb-7x
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 18:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ei-0006FD-CN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:24 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ef-0002ku-JZ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:24 -0400
Received: by mail-io1-xd31.google.com with SMTP id h81so581221iof.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=15ogyUvqhVbhuTz0UVwGNAYoE4VdOlH1XIgsQEaFYI8=;
 b=ASyX6enCr1N3gHjKrJB5/1N7WRrK+LjpXZIjVtrxRShR7NdKHSvisWz/EyCrhn+td2
 lYzyNemT6RmZM9ead1enPKGm60VieBfpMIO8MXeXmywo0fQUF+2o080TICVZFPcg895b
 hFVqcqtwMXBn3FaLAuIinNOyuloHGY8Mt64fkJ9yR3E09cNvSjx19c39SxLAgVgke9n0
 wx4Ss5oHeH3K9DpLoADCE0XiNjKX4O/wo8N8dCDVEtbAH/wMiiqbOLsYw8/3aBKej7WB
 NoLis8zi+RZvdKTFUyCBJEGIXyNRonKwWWPVmvOYsz2wt5ByflnAzkOHWsNqFMpQRdxn
 5jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=15ogyUvqhVbhuTz0UVwGNAYoE4VdOlH1XIgsQEaFYI8=;
 b=4vuWcSLuG41mdRpVreAEq9rqwozpnlQN55J/sbuShovDYOizBdZ4HM2B47XOjtAJSC
 5+hSzK/UOyDUCUJS0qZUJiGSYf26flhN+dlBfiMrOc1UnX2bliEVKIRrttoIh1wztE+m
 68KQkxGcTFMV5HsnELvbOYlCbnO3zMwQ1L9RYeoKCmKu3BUWWKSWdyVuLjVD0g7cHEFx
 p9nx4eMLqTm2RXg403oqW5hEJD3Citw/+Lyx7m+/0gJBlaTmQo5iBTKF6GPpxLrQ3gLk
 tlkUra+mBft9MedZ+uV3Czxot/EfCyubP2pqx47KALZiYL5T8KPPNFKSQsCxE5bBdNIT
 0RIQ==
X-Gm-Message-State: AOAM5326oF1e9yzU1AUxGBEifvAG7nja27EdUK6k/R4vWPjPrtqEqnTd
 etneUUuEkRrz4mDXgZ2zsDPnZ7cl21cciA==
X-Google-Smtp-Source: ABdhPJwYyXWTRUwf8mqgFB+WEka85pLQwQ/3s8Q/Z8NzJCPz81YX1v+73xeUVMRYExDO+B6SHnKH4w==
X-Received: by 2002:a02:6666:: with SMTP id l38mr28977754jaf.146.1635893599468; 
 Tue, 02 Nov 2021 15:53:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/30] bsd-user: arm (32-bit) support
Date: Tue,  2 Nov 2021 16:52:18 -0600
Message-Id: <20211102225248.52999-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches brings in 32-bit arm support for bsd-user.  It implements
all the bits needed to do image activation, signal handling, stack management
and threading. This allows us to get to the "Hello World" level and also to
satisfy all linking requirements. I've sliced up the current bsd-user fork
versions of all this code into what I hope are right-sized reviewable chunks.

make checkpatch has a couple of complaints about the comments for the signal
trampoline:
WARNING: Block comments use a leading /* on a separate line
+    /* 8 */ sys_sigreturn,

WARNING: Block comments use a leading /* on a separate line
+    /* 9 */ sys_exit

that I think should be ignored.

This also adds stubs necessary for building.

V2 improves target_arch_signal.h in a number of ways
   o match mcontext to FreeBSD/arm kernel (we'd used mips mcontext
     which was originally copied from arm so things mostly worked)
   o support thumb execution better (in the fork A32 -> T32 and
     vice versa, even with signals, not works, here hello T32 and
     A32 programs now work).
   o common ucontext now implemented.
   o patches with substantial changes have had the reviewed by
     removed.
   o Also remove target_sigcontext (FreeBSD's old way of doing
     signals) that was discovered as it appeared unused in arm
     upstream.
   o update x86 to use target_os_ucontext.h, though signals aren't
     yet completely supported in x86.
   o add cpu_loop_exit_sigsegv and cpu_loop_exit_sigbus stubs that
     just abort: bsd-user hadn't been updated so this is the first
     patch in the series.

The following still need review:
       bsd-user/freebsd: Create common target_os_ucontext.h file
       bsd-user/arm/target_arch_signal.h: arm machine context for signals
       bsd-user/arm/target_arch_signal.h: arm user context and trapframe for signals
       bsd-user/arm/target_arch_signal.h: arm set_sigtramp_args
       bsd-user/arm/target_arch_signal.h: arm get_mcontext
       bsd-user/arm/target_arch_signal.h: arm set_mcontext
       bsd-user/i386/target_arch_signal.h: Remove target_sigcontext
       bsd-user/x86_64/target_arch_signal.h: Remove target_sigcontext
       bsd-user/i386/target_arch_signal.h: use new target_os_ucontext.h
       bsd-user/x86_64/target_arch_signal.h: use new target_os_ucontext.h

Warner Losh (30):
  bsd-user: Add stubs for new signal routines
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
  bsd-user/freebsd: Create common target_os_ucontext.h file
  bsd-user/arm/target_arch_signal.h: arm specific signal registers and
    stack
  bsd-user/arm/target_arch_signal.h: arm machine context for signals
  bsd-user/arm/target_arch_signal.h: arm user context and trapframe for
    signals
  bsd-user/arm/target_arch_signal.h: arm set_sigtramp_args
  bsd-user/arm/target_arch_signal.h: arm get_mcontext
  bsd-user/arm/target_arch_signal.h: arm set_mcontext
  bsd-user/arm/target_arch_signal.h: arm get_ucontext_sigreturn
  bsd-user: add arm target build
  bsd-user/i386/target_arch_signal.h: Remove target_sigcontext
  bsd-user/x86_64/target_arch_signal.h: Remove target_sigcontext
  bsd-user/i386/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/x86_64/target_arch_signal.h: use new target_os_ucontext.h

 bsd-user/arm/target_arch.h            |  28 +++
 bsd-user/arm/target_arch_cpu.c        |  39 ++++
 bsd-user/arm/target_arch_cpu.h        | 236 +++++++++++++++++++++++
 bsd-user/arm/target_arch_elf.h        | 128 +++++++++++++
 bsd-user/arm/target_arch_reg.h        |  60 ++++++
 bsd-user/arm/target_arch_signal.h     | 266 ++++++++++++++++++++++++++
 bsd-user/arm/target_arch_sigtramp.h   |  49 +++++
 bsd-user/arm/target_arch_sysarch.h    |   6 +-
 bsd-user/arm/target_arch_thread.h     |  80 ++++++++
 bsd-user/arm/target_arch_vmparam.h    |  48 +++++
 bsd-user/arm/target_syscall.h         |  27 ++-
 bsd-user/freebsd/target_os_signal.h   |   3 -
 bsd-user/freebsd/target_os_ucontext.h |  26 +++
 bsd-user/i386/target_arch_signal.h    |  13 +-
 bsd-user/signal.c                     |  21 ++
 bsd-user/x86_64/target_arch_signal.h  |  13 +-
 configs/targets/arm-bsd-user.mak      |   2 +
 17 files changed, 1011 insertions(+), 34 deletions(-)
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
 create mode 100644 configs/targets/arm-bsd-user.mak

-- 
2.33.0


