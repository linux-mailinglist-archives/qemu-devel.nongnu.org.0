Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7341F42E78D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:13:16 +0200 (CEST)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEap-0001Br-Gh
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYe-0006fQ-U4
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:00 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYb-0008Vu-7i
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:00 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so6357076pjb.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MV5vL8f3dXPFordtmYqIb3aFIfOVP5uqypHbvBeX4Fc=;
 b=wck/uhu6GHSQO1alyA3Nwm2LyKccLrEOEcCyz6v12FUcPNzf1PTa07NqlHNSxwsJW5
 l1IvNWSLHv8/PPWWLNPFVFfu9CPLMuALL3g+H+rncyil46V1L0/am6kkvxVt0eCvyXHA
 6ArvF3khMV/RxvYe2KhKpHJBG0j7fOLZOn7HKPCZfYxGgQX2VKhjxJFSxIDssOHtTdCh
 ZGGp1oJ4iiEzM8EB5nqA/jJpAZWKFMG7i7WRq7lRut+HxfPpWoHOYfWQOwHLCleVLUpW
 JJNFq4aHCL8f1erZyidFl8KmuQvPinEPmJ/QivtTA1V/iThQcDtCEj1xTPjTzRm9l5dp
 0nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MV5vL8f3dXPFordtmYqIb3aFIfOVP5uqypHbvBeX4Fc=;
 b=Khi7X5B/0aDj0Q5WX4COCMiF7VTqK+QVUHD46eDx4rNnIECmpibPkWEgiBzNt+Bx55
 C63Uhbmeu+S4jSYkbUa9XKu+2ORXcFkyTO7GOJtZtLynpT9xR0eB7U5RWqqOz1cYsCsw
 hWizwDdvd7rOSNB8gElu6n0ncMl40FNnQog766TNu+YUDadsGHm/a/l5lnkD0c/zRaEF
 8jaj2QgBABQhJtZ+0V8Z3S0TA7+3WCTc7OpvO7/Qc4ey1pa9HQT3V9oSR8NO3dKqCrs2
 YGjIN9sQMgmf3J1F4a3Pqq4WoKzOMco+pv24PzPWh2TXapgKFjlwiBkRFMG/7MzQSx/C
 lcKA==
X-Gm-Message-State: AOAM5318DVuQ/4qD7wlMSHFJxR3+irg5XidbzH43UnO5c+SFnQfpNDoo
 8zvXpsD+NmR564YPhfAdfLJpYDSOjwgQEQ==
X-Google-Smtp-Source: ABdhPJzXn5+t4IoCkgeUDUEqvqsAjMx98MU0T2EXWY86ebk2lp+RoS2TCxIYO+ZIjmcOUW7CZTP61A==
X-Received: by 2002:a17:90a:1fcf:: with SMTP id
 z15mr25147299pjz.31.1634271055040; 
 Thu, 14 Oct 2021 21:10:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:10:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/67] user-only: Cleanup SIGSEGV and SIGBUS handling
Date: Thu, 14 Oct 2021 21:09:46 -0700
Message-Id: <20211015041053.2769193-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For v5, I've combined the sigsegv and sigbus patch sets, because
they're so very closely modelled.  We've got user-only hooks named

  record_sigsegv
  record_sigbus

While the tlb_fill hook becomes sysemu only, the corresponding
do_unaligned_access hook was always sysemu only and stays that way.

The actual tcg backend patches to enable proper delivery of the
unaligned accesses have been delayed until another patch set, as
this is quite large enough -- I'm mostly restricting this to the
user-only interface (though there are some extra patches that are
included to make sure things build properly).

It has been a bit of a mess revising this, in that v4 of the
unaligned access patch set went out with an empty subject line.

Patches lacking review, some of which are new:
   04-accel-tcg-Fold-cpu_exit_tb_from_sighandler-into-c.patch
   07-linux-user-host-x86-Populate-host_signal.h.patch
   10-linux-user-host-sparc-Populate-host_signal.h.patch
   12-linux-user-host-aarch64-Populate-host_signal.h.patch
   16-target-arm-Fixup-comment-re-handle_cpu_signal.patch
   21-target-alpha-Implement-alpha_cpu_record_sigsegv.patch
   23-target-arm-Implement-arm_cpu_record_sigsegv.patch
   26-target-hppa-Make-hppa_cpu_tlb_fill-sysemu-only.patch
   29-target-microblaze-Make-mb_cpu_tlb_fill-sysemu-onl.patch
   36-target-s390x-Use-probe_access_flags-in-s390_probe.patch
   38-target-sh4-Make-sh4_cpu_tlb_fill-sysemu-only.patch
   42-Revert-cpu-Move-cpu_common_props-to-hw-core-cpu.c.patch
   43-hw-core-Add-TCGCPUOps.record_sigbus.patch
   44-linux-user-Add-cpu_loop_exit_sigbus.patch
   45-target-alpha-Implement-alpha_cpu_record_sigbus.patch
   46-target-arm-Implement-arm_cpu_record_sigbus.patch
   47-linux-user-hppa-Remove-EXCP_UNALIGN-handling.patch
   51-target-ppc-Restrict-ppc_cpu_do_unaligned_access-t.patch
   52-target-s390x-Implement-s390x_cpu_record_sigbus.patch
   53-linux-user-hppa-Remove-POWERPC_EXCP_ALIGN-handlin.patch
   61-linux-user-Handle-BUS_ADRALN-in-host_signal_handl.patch
   62-linux-user-Split-out-do_prctl-and-subroutines.patch
   63-linux-user-Disable-more-prctl-subcodes.patch
   64-linux-user-Add-code-for-PR_GET-SET_UNALIGN.patch
   65-target-alpha-Implement-prctl_unalign_sigbus.patch
   66-target-hppa-Implement-prctl_unalign_sigbus.patch
   67-target-sh4-Implement-prctl_unalign_sigbus.patch


r~


Richard Henderson (67):
  accel/tcg: Split out adjust_signal_pc
  accel/tcg: Move clear_helper_retaddr to cpu loop
  accel/tcg: Split out handle_sigsegv_accerr_write
  accel/tcg: Fold cpu_exit_tb_from_sighandler into caller
  configure: Merge riscv32 and riscv64 host architectures
  linux-user: Reorg handling for SIGSEGV
  linux-user/host/x86: Populate host_signal.h
  linux-user/host/ppc: Populate host_signal.h
  linux-user/host/alpha: Populate host_signal.h
  linux-user/host/sparc: Populate host_signal.h
  linux-user/host/arm: Populate host_signal.h
  linux-user/host/aarch64: Populate host_signal.h
  linux-user/host/s390: Populate host_signal.h
  linux-user/host/mips: Populate host_signal.h
  linux-user/host/riscv: Populate host_signal.h
  target/arm: Fixup comment re handle_cpu_signal
  linux-user/host/riscv: Improve host_signal_write
  linux-user/signal: Drop HOST_SIGNAL_PLACEHOLDER
  hw/core: Add TCGCPUOps.record_sigsegv
  linux-user: Add cpu_loop_exit_sigsegv
  target/alpha: Implement alpha_cpu_record_sigsegv
  target/arm: Use cpu_loop_exit_sigsegv for mte tag lookup
  target/arm: Implement arm_cpu_record_sigsegv
  target/cris: Make cris_cpu_tlb_fill sysemu only
  target/hexagon: Remove hexagon_cpu_tlb_fill
  target/hppa: Make hppa_cpu_tlb_fill sysemu only
  target/i386: Implement x86_cpu_record_sigsegv
  target/m68k: Make m68k_cpu_tlb_fill sysemu only
  target/microblaze: Make mb_cpu_tlb_fill sysemu only
  target/mips: Make mips_cpu_tlb_fill sysemu only
  target/nios2: Implement nios2_cpu_record_sigsegv
  linux-user/openrisc: Adjust signal for EXCP_RANGE, EXCP_FPE
  target/openrisc: Make openrisc_cpu_tlb_fill sysemu only
  target/ppc: Implement ppc_cpu_record_sigsegv
  target/riscv: Make riscv_cpu_tlb_fill sysemu only
  target/s390x: Use probe_access_flags in s390_probe_access
  target/s390x: Implement s390_cpu_record_sigsegv
  target/sh4: Make sh4_cpu_tlb_fill sysemu only
  target/sparc: Make sparc_cpu_tlb_fill sysemu only
  target/xtensa: Make xtensa_cpu_tlb_fill sysemu only
  accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
  Revert "cpu: Move cpu_common_props to hw/core/cpu.c"
  hw/core: Add TCGCPUOps.record_sigbus
  linux-user: Add cpu_loop_exit_sigbus
  target/alpha: Implement alpha_cpu_record_sigbus
  target/arm: Implement arm_cpu_record_sigbus
  linux-user/hppa: Remove EXCP_UNALIGN handling
  target/microblaze: Do not set MO_ALIGN for user-only
  target/ppc: Move SPR_DSISR setting to powerpc_excp
  target/ppc: Set fault address in ppc_cpu_do_unaligned_access
  target/ppc: Restrict ppc_cpu_do_unaligned_access to sysemu
  target/s390x: Implement s390x_cpu_record_sigbus
  linux-user/hppa: Remove POWERPC_EXCP_ALIGN handling
  target/sh4: Set fault address in superh_cpu_do_unaligned_access
  target/sparc: Remove DEBUG_UNALIGNED
  target/sparc: Split out build_sfsr
  target/sparc: Set fault address in sparc_cpu_do_unaligned_access
  accel/tcg: Report unaligned atomics for user-only
  accel/tcg: Report unaligned load/store for user-only
  tcg: Add helper_unaligned_{ld,st} for user-only sigbus
  linux-user: Handle BUS_ADRALN in host_signal_handler
  linux-user: Split out do_prctl and subroutines
  linux-user: Disable more prctl subcodes
  linux-user: Add code for PR_GET/SET_UNALIGN
  target/alpha: Implement prctl_unalign_sigbus
  target/hppa: Implement prctl_unalign_sigbus
  target/sh4: Implement prctl_unalign_sigbus

 configure                                     |   8 +-
 meson.build                                   |   4 +-
 include/exec/exec-all.h                       |  55 +-
 include/hw/core/cpu.h                         |   4 +
 include/hw/core/tcg-cpu-ops.h                 |  71 +-
 include/tcg/tcg-ldst.h                        |   5 +
 linux-user/aarch64/target_prctl.h             | 160 ++++
 linux-user/aarch64/target_syscall.h           |  23 -
 linux-user/alpha/target_prctl.h               |   1 +
 linux-user/arm/target_prctl.h                 |   1 +
 linux-user/cris/target_prctl.h                |   1 +
 linux-user/generic/target_prctl_unalign.h     |  27 +
 linux-user/hexagon/target_prctl.h             |   1 +
 linux-user/host/aarch64/host-signal.h         |  73 ++
 linux-user/host/alpha/host-signal.h           |  41 +
 linux-user/host/arm/host-signal.h             |  29 +
 linux-user/host/i386/host-signal.h            |  24 +
 linux-user/host/mips/host-signal.h            |  61 ++
 linux-user/host/ppc/host-signal.h             |  24 +
 linux-user/host/ppc64/host-signal.h           |   1 +
 linux-user/host/riscv/host-signal.h           |  57 ++
 linux-user/host/{riscv64 => riscv}/hostdep.h  |   4 +-
 linux-user/host/riscv32/hostdep.h             |  11 -
 linux-user/host/s390/host-signal.h            |  92 ++
 linux-user/host/s390x/host-signal.h           |   1 +
 linux-user/host/sparc/host-signal.h           |  53 ++
 linux-user/host/sparc64/host-signal.h         |   1 +
 linux-user/host/x32/host-signal.h             |   1 +
 linux-user/host/x86_64/host-signal.h          |  24 +
 linux-user/hppa/target_prctl.h                |   1 +
 linux-user/i386/target_prctl.h                |   1 +
 linux-user/m68k/target_prctl.h                |   1 +
 linux-user/microblaze/target_prctl.h          |   1 +
 linux-user/mips/target_prctl.h                |  88 ++
 linux-user/mips/target_syscall.h              |   6 -
 linux-user/mips64/target_prctl.h              |   1 +
 linux-user/mips64/target_syscall.h            |   6 -
 linux-user/nios2/target_prctl.h               |   1 +
 linux-user/openrisc/target_prctl.h            |   1 +
 linux-user/ppc/target_prctl.h                 |   1 +
 linux-user/riscv/target_prctl.h               |   1 +
 linux-user/s390x/target_prctl.h               |   1 +
 linux-user/sh4/target_prctl.h                 |   1 +
 linux-user/sparc/target_prctl.h               |   1 +
 linux-user/x86_64/target_prctl.h              |   1 +
 linux-user/xtensa/target_prctl.h              |   1 +
 target/alpha/cpu.h                            |  26 +-
 target/arm/internals.h                        |   8 +
 target/cris/cpu.h                             |   8 +-
 target/hppa/cpu.h                             |   7 +-
 target/i386/tcg/helper-tcg.h                  |   6 +
 target/microblaze/cpu.h                       |   8 +-
 target/mips/tcg/tcg-internal.h                |   7 +-
 target/nios2/cpu.h                            |   6 +
 target/openrisc/cpu.h                         |   7 +-
 target/ppc/cpu.h                              |   3 -
 target/ppc/internal.h                         |  17 +-
 target/s390x/s390x-internal.h                 |   9 +
 target/sh4/cpu.h                              |  10 +-
 target/xtensa/cpu.h                           |   2 +-
 accel/tcg/cpu-exec.c                          |   3 +-
 accel/tcg/user-exec.c                         | 863 +++---------------
 cpu.c                                         |  31 +
 hw/core/cpu-common.c                          |  17 +-
 linux-user/aarch64/cpu_loop.c                 |  12 +-
 linux-user/alpha/cpu_loop.c                   |  15 -
 linux-user/arm/cpu_loop.c                     |  30 +-
 linux-user/cris/cpu_loop.c                    |  10 -
 linux-user/hexagon/cpu_loop.c                 |  24 +-
 linux-user/hppa/cpu_loop.c                    |  23 -
 linux-user/m68k/cpu_loop.c                    |  10 -
 linux-user/microblaze/cpu_loop.c              |  10 -
 linux-user/mips/cpu_loop.c                    |  11 -
 linux-user/openrisc/cpu_loop.c                |  17 +-
 linux-user/ppc/cpu_loop.c                     |   8 -
 linux-user/riscv/cpu_loop.c                   |   7 -
 linux-user/s390x/cpu_loop.c                   |  13 +-
 linux-user/sh4/cpu_loop.c                     |   8 -
 linux-user/signal.c                           | 133 ++-
 linux-user/sparc/cpu_loop.c                   |  25 -
 linux-user/syscall.c                          | 490 +++++-----
 linux-user/xtensa/cpu_loop.c                  |   9 -
 target/alpha/cpu.c                            |   7 +-
 target/alpha/helper.c                         |  39 +-
 target/alpha/mem_helper.c                     |  30 +-
 target/alpha/translate.c                      |  31 +-
 target/arm/cpu.c                              |   7 +-
 target/arm/cpu_tcg.c                          |   7 +-
 target/arm/mte_helper.c                       |   6 +-
 target/arm/sve_helper.c                       |   2 +-
 target/arm/tlb_helper.c                       |  42 +-
 target/cris/cpu.c                             |   4 +-
 target/cris/helper.c                          |  18 -
 target/hexagon/cpu.c                          |  23 -
 target/hppa/cpu.c                             |   2 +-
 target/hppa/mem_helper.c                      |  15 -
 target/hppa/translate.c                       |  19 +-
 target/i386/tcg/tcg-cpu.c                     |   3 +-
 target/i386/tcg/user/excp_helper.c            |  23 +-
 target/m68k/cpu.c                             |   2 +-
 target/m68k/helper.c                          |   6 +-
 target/microblaze/cpu.c                       |   2 +-
 target/microblaze/helper.c                    |  13 +-
 target/microblaze/translate.c                 |  16 +
 target/mips/cpu.c                             |   2 +-
 target/mips/tcg/user/tlb_helper.c             |  59 --
 target/nios2/cpu.c                            |   6 +-
 target/nios2/helper.c                         |   7 +-
 target/openrisc/cpu.c                         |   2 +-
 target/openrisc/mmu.c                         |   9 -
 target/ppc/cpu_init.c                         |   6 +-
 target/ppc/excp_helper.c                      |  41 +-
 target/ppc/user_only_helper.c                 |  15 +-
 target/riscv/cpu.c                            |   2 +-
 target/riscv/cpu_helper.c                     |  21 +-
 target/s390x/cpu.c                            |   7 +-
 target/s390x/tcg/excp_helper.c                |  45 +-
 target/s390x/tcg/mem_helper.c                 |  18 +-
 target/sh4/cpu.c                              |   2 +-
 target/sh4/helper.c                           |   9 +-
 target/sh4/op_helper.c                        |   5 +
 target/sh4/translate.c                        |  50 +-
 target/sparc/cpu.c                            |   2 +-
 target/sparc/ldst_helper.c                    |  22 -
 target/sparc/mmu_helper.c                     | 115 ++-
 target/xtensa/cpu.c                           |   2 +-
 target/xtensa/helper.c                        |  22 +-
 .../{riscv64 => riscv}/safe-syscall.inc.S     |   0
 target/cris/meson.build                       |   7 +-
 target/hppa/meson.build                       |   6 +-
 target/mips/tcg/meson.build                   |   3 -
 target/mips/tcg/user/meson.build              |   3 -
 target/openrisc/meson.build                   |   2 +-
 target/sparc/meson.build                      |   2 +-
 134 files changed, 1874 insertions(+), 1800 deletions(-)
 create mode 100644 linux-user/aarch64/target_prctl.h
 create mode 100644 linux-user/alpha/target_prctl.h
 create mode 100644 linux-user/arm/target_prctl.h
 create mode 100644 linux-user/cris/target_prctl.h
 create mode 100644 linux-user/generic/target_prctl_unalign.h
 create mode 100644 linux-user/hexagon/target_prctl.h
 create mode 100644 linux-user/host/aarch64/host-signal.h
 create mode 100644 linux-user/host/alpha/host-signal.h
 create mode 100644 linux-user/host/arm/host-signal.h
 create mode 100644 linux-user/host/i386/host-signal.h
 create mode 100644 linux-user/host/mips/host-signal.h
 create mode 100644 linux-user/host/ppc/host-signal.h
 create mode 100644 linux-user/host/ppc64/host-signal.h
 create mode 100644 linux-user/host/riscv/host-signal.h
 rename linux-user/host/{riscv64 => riscv}/hostdep.h (94%)
 delete mode 100644 linux-user/host/riscv32/hostdep.h
 create mode 100644 linux-user/host/s390/host-signal.h
 create mode 100644 linux-user/host/s390x/host-signal.h
 create mode 100644 linux-user/host/sparc/host-signal.h
 create mode 100644 linux-user/host/sparc64/host-signal.h
 create mode 100644 linux-user/host/x32/host-signal.h
 create mode 100644 linux-user/host/x86_64/host-signal.h
 create mode 100644 linux-user/hppa/target_prctl.h
 create mode 100644 linux-user/i386/target_prctl.h
 create mode 100644 linux-user/m68k/target_prctl.h
 create mode 100644 linux-user/microblaze/target_prctl.h
 create mode 100644 linux-user/mips/target_prctl.h
 create mode 100644 linux-user/mips64/target_prctl.h
 create mode 100644 linux-user/nios2/target_prctl.h
 create mode 100644 linux-user/openrisc/target_prctl.h
 create mode 100644 linux-user/ppc/target_prctl.h
 create mode 100644 linux-user/riscv/target_prctl.h
 create mode 100644 linux-user/s390x/target_prctl.h
 create mode 100644 linux-user/sh4/target_prctl.h
 create mode 100644 linux-user/sparc/target_prctl.h
 create mode 100644 linux-user/x86_64/target_prctl.h
 create mode 100644 linux-user/xtensa/target_prctl.h
 delete mode 100644 target/mips/tcg/user/tlb_helper.c
 rename linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S (100%)
 delete mode 100644 target/mips/tcg/user/meson.build

-- 
2.25.1


