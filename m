Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039FA410835
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 20:54:44 +0200 (CEST)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRfU3-0002Ng-2D
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 14:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLE-0004ya-Md
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:37 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRfLA-0006gR-14
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 14:45:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n2so5777154plk.12
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 11:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCwJ4StV/vjrIqSbmT6zKMEbhuGjZvcTa3PBblM+h44=;
 b=WwNUUIpTpHzPi4D0XKVOSbNjWnb05FfDl6BnPG49IdtgE7aQxaAoJdD0YGBpjvo6Tr
 JhIOwPoerTmwHmWtpyHSpDENFPm7fN9HNrDit1PN8oYkwzShqI2F0qdYDz5hL2W7djMy
 uqkWhrdq3CFGxHXZ8aX4BnpU3eGrswptyYz9g4RYTOE8GzvZqXzxSNJG6kN+ynZKyFOc
 XV4rXiKrTIc0UF4W8JHfipA423LCwf8f/Do50SGVoyCV4jDPCjKvEuqb/gvQjX4ML6T+
 F42lbRt+E3RsjSfHNHLUjelUnerToREwRvNiI4IMUalDEm/UQ3nI0YEe4W5MtNm0/sAi
 5E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uCwJ4StV/vjrIqSbmT6zKMEbhuGjZvcTa3PBblM+h44=;
 b=ss8q6YD8CrZFu+pNb3WWTGCYQouK8KHBso6Mi8Ui7IaxCvuOfmseeqGAYnMr1xgLgx
 VwkbwXC1XGgzyshnoPu8ZiU3Em6HdFSx760/wFE69qXAXTMqGaWjPAKV/DdfUMacpRtE
 HRF7dlxJQjWA9OJfyFI+NXQixRywxlg+8IB3zRrQaBzU90A7lHNzKX6VcgbEIV2f7a5F
 zUPgDx3gX2vyLHTBLMNa9M/6IyDGEtLEi6irvp3AZdzuVm/5gs6Z7b9s1bWx5tb+un11
 4dC0VqG8BMuuHWCXd08Muo03Rzz2x8Lvk6NckavUdda1nr35nupSKb8WesO4pWfD1gov
 VikQ==
X-Gm-Message-State: AOAM530GSirEik8NtPp9eqjb+ZFNinZ/wMeMVuKNpenZQnhxTirOtQfG
 Ivr6eXmrhtKU6y/k8qf/feOabpRTP8U=
X-Google-Smtp-Source: ABdhPJw/4ptpgOS9SZEM1KHr5xLnNxb79eWS36O8PBWRcJEvB3EPWeXRKi0JDlIb3qZu95+WlyA10w==
X-Received: by 2002:a17:902:a40c:b029:12c:17cf:ab6f with SMTP id
 p12-20020a170902a40cb029012c17cfab6fmr15497588plq.71.1631990729317; 
 Sat, 18 Sep 2021 11:45:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y26sm9555858pfe.69.2021.09.18.11.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 11:45:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/41] linux-user: Streamline handling of SIGSEGV
Date: Sat, 18 Sep 2021 11:44:46 -0700
Message-Id: <20210918184527.408540-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210915174951.1852266-1-richard.henderson@linaro.org
("linux-user/nios2: trap and kuser fixes")

... which itself is

Based-on: 20210813131809.28655-1-peter.maydell@linaro.org
("linux-user: Clean up siginfo_t handling for arm, aarch64")
... for force_sig_fault().

and in turn based on my current tcg-next pull, for has_work changes.

For avoidance of doubt:
https://gitlab.com/rth7680/qemu/-/commits/lu-hostsig-2

Only 4 of 20 targets need any special code for correctly
signalling SIGSEGV, and the host-level code is reduced as well.

Dropped the rfc, but still seeking feedback the factorization.


r~


Richard Henderson (41):
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
  linux-user: Add raise_sigsegv
  target/alpha: Make alpha_cpu_tlb_fill sysemu only
  target/arm: Use raise_sigsegv for mte tag lookup
  target/arm: Implement arm_cpu_record_sigsegv
  target/cris: Make cris_cpu_tlb_fill sysemu only
  target/hexagon: Remove hexagon_cpu_tlb_fill
  target/hppa: Make hppa_cpu_tlb_fill sysemu only
  target/i386: Implement x86_cpu_record_sigsegv
  target/m68k: Make m68k_cpu_tlb_fill sysemu only
  target/microblaze: Make mb_cpu_tlb_fill sysemu only
  target/mips: Make mips_cpu_tlb_fill sysemu only
  target/nios2: Make nios2_cpu_tlb_fill sysemu only
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

 configure                                     |   8 +-
 meson.build                                   |   4 +-
 include/exec/exec-all.h                       |  41 +-
 include/hw/core/tcg-cpu-ops.h                 |  48 +-
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
 target/alpha/cpu.h                            |   7 +-
 target/arm/internals.h                        |   6 +
 target/cris/cpu.h                             |   8 +-
 target/hppa/cpu.h                             |   2 +-
 target/i386/tcg/helper-tcg.h                  |   6 +
 target/microblaze/cpu.h                       |   8 +-
 target/mips/tcg/tcg-internal.h                |   7 +-
 target/openrisc/cpu.h                         |   7 +-
 target/ppc/cpu.h                              |   3 -
 target/ppc/internal.h                         |   9 +
 target/s390x/s390x-internal.h                 |  13 +-
 target/sh4/cpu.h                              |   6 +-
 target/xtensa/cpu.h                           |   2 +-
 accel/tcg/cpu-exec.c                          |   3 +-
 accel/tcg/user-exec.c                         | 832 ++----------------
 linux-user/alpha/cpu_loop.c                   |   8 -
 linux-user/cris/cpu_loop.c                    |  10 -
 linux-user/hexagon/cpu_loop.c                 |  24 +-
 linux-user/hppa/cpu_loop.c                    |  16 -
 linux-user/m68k/cpu_loop.c                    |  10 -
 linux-user/microblaze/cpu_loop.c              |  10 -
 linux-user/mips/cpu_loop.c                    |  11 -
 linux-user/nios2/cpu_loop.c                   |  10 -
 linux-user/openrisc/cpu_loop.c                |  18 +-
 linux-user/riscv/cpu_loop.c                   |   7 -
 linux-user/s390x/cpu_loop.c                   |  14 +-
 linux-user/sh4/cpu_loop.c                     |   8 -
 linux-user/signal.c                           | 117 ++-
 linux-user/sparc/cpu_loop.c                   |  25 -
 linux-user/xtensa/cpu_loop.c                  |   9 -
 target/alpha/cpu.c                            |   2 +-
 target/alpha/helper.c                         |  13 +-
 target/arm/cpu.c                              |   6 +-
 target/arm/cpu_tcg.c                          |   6 +-
 target/arm/mte_helper.c                       |   6 +-
 target/arm/sve_helper.c                       |   2 +-
 target/arm/tlb_helper.c                       |  36 +-
 target/cris/cpu.c                             |   4 +-
 target/cris/helper.c                          |  18 -
 target/hexagon/cpu.c                          |  23 -
 target/hppa/cpu.c                             |   2 +-
 target/hppa/mem_helper.c                      |  15 -
 target/i386/tcg/tcg-cpu.c                     |   3 +-
 target/i386/tcg/user/excp_helper.c            |  23 +-
 target/m68k/cpu.c                             |   2 +-
 target/m68k/helper.c                          |   6 +-
 target/microblaze/cpu.c                       |   2 +-
 target/microblaze/helper.c                    |  13 +-
 target/mips/cpu.c                             |   2 +-
 target/mips/tcg/user/tlb_helper.c             |  59 --
 target/nios2/cpu.c                            |   2 +-
 target/nios2/helper.c                         |   8 -
 target/openrisc/cpu.c                         |   2 +-
 target/openrisc/mmu.c                         |   8 -
 target/ppc/cpu_init.c                         |   6 +-
 target/ppc/user_only_helper.c                 |  15 +-
 target/riscv/cpu.c                            |   2 +-
 target/riscv/cpu_helper.c                     |  21 +-
 target/s390x/cpu.c                            |   6 +-
 target/s390x/tcg/excp_helper.c                |  18 +-
 target/s390x/tcg/mem_helper.c                 |  18 +-
 target/sh4/cpu.c                              |   2 +-
 target/sh4/helper.c                           |   9 +-
 target/sparc/cpu.c                            |   2 +-
 target/sparc/mmu_helper.c                     |  25 -
 target/xtensa/cpu.c                           |   2 +-
 target/xtensa/helper.c                        |  22 +-
 .../{riscv64 => riscv}/safe-syscall.inc.S     |   0
 target/cris/meson.build                       |   7 +-
 target/hppa/meson.build                       |   6 +-
 target/mips/tcg/meson.build                   |   3 -
 target/mips/tcg/user/meson.build              |   3 -
 target/openrisc/meson.build                   |   2 +-
 target/sparc/meson.build                      |   2 +-
 94 files changed, 910 insertions(+), 1338 deletions(-)
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
 delete mode 100644 target/mips/tcg/user/tlb_helper.c
 rename linux-user/host/{riscv64 => riscv}/safe-syscall.inc.S (100%)
 delete mode 100644 target/mips/tcg/user/meson.build

-- 
2.25.1


