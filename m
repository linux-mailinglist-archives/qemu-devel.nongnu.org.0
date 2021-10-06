Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B428F424412
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:26:21 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAgO-0001Wv-7U
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdN-00075i-4A
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:13 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdK-0007s9-P2
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:12 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so4974249pjw.0
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C0i6tjY5ZCnSyrTyRtJbBwpdt/yvEVt2DiqlNlGOt1s=;
 b=dkblmpwi83/48Tf7B0YwrICEA1dPMJedn5PzyK5U5lJptHuccsrd5EyItJ+5tjDcpN
 i0pUjTcXiZ7X/WY7n8XkmqkqbqxI5gbENEkcdrHsHNOojB6nsFzDiwKQI/TTi7RtgQuy
 P65pN4KfowXeYHpnr3z9yi8u3kFcpH4HnzCcvtwRUDY5zXtgGvDYdP/ZKEm6bGyf9Ljv
 Dm76Yd1eSVQL7ZNE2k/3d3wipmRrRJfyAC9xfo1lf/xIi47gVK6gujwCyvLbK7NbcYrc
 PoWbMPMdgethhqLknkNJX0W7mjQNlNCaztWm4TzX463wlOQHvQcIIcq3I0BSC7sIyoDq
 0dSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C0i6tjY5ZCnSyrTyRtJbBwpdt/yvEVt2DiqlNlGOt1s=;
 b=3KrJjSjPkGBbC5JrcBhPaxIMxWcqnheEWXd9V9wabf8n5wH0RwM/c/X5g2kmpTIz3y
 yE+HSg16eMwGwvrGBuTak/HrGRvqARkfcJor5Gy+k0BiFI33qIlpbb3e0EnxzVtpD9am
 jhUrf0ex4bo8Y9shY6dJMQxampszLGLDn1dkmPwmBlUX+7nAU67ag1/Lcs2c1rtczkLU
 KuaSsIPfBvKh6G/lQv8HGJitwVOu4qbzh1wgzMNuopdVPhIF21ROApCZue2Upw1N40+l
 pm4LJ3s5zFD3ZPILU0JylUg2zzHL3z9C2ALFPiXCpf7l1Dr3jckh//nRyzgsrzDB/god
 tAfA==
X-Gm-Message-State: AOAM5337lppC8gNrDt1/gdFAWnWYq5H6m90zWPcvAI05F8ytt75Kh/yE
 YNb1vMZPvD1w/eUqdeCByBG0exFwHvg2Hg==
X-Google-Smtp-Source: ABdhPJxGqJfJ2mT0kzNpxT5qFPGjI4m4VLS8qdsoWeU4vDraH7zb1+wTrk3BDUu0GgNKZodk0zMJfg==
X-Received: by 2002:a17:903:1112:b0:13d:ce49:e275 with SMTP id
 n18-20020a170903111200b0013dce49e275mr12384983plh.5.1633540988815; 
 Wed, 06 Oct 2021 10:23:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/41] linux-user: Streamline handling of SIGSEGV
Date: Wed,  6 Oct 2021 10:22:26 -0700
Message-Id: <20211006172307.780893-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Changes for v4:
  * Renamed cpu_loop_exit_segv to cpu_loop_exit_sigsegv.
    The follow-on, for unaligned raising SIGBUS, looked
    weird with cpu_loop_exit_bus.
  * Implement record_sigsegv for target/alpha/.
    This also fixes an existing bug wrt the trap_a[12]
    fields in the signal frame.

Changes for v3:
  * Rebased on master, as force_sig_fault is now upstream.
  * Minimized nios2 changes; there's another patch set that cleans
    up nios2, but I don't want to force that as a dependency.
  * Renamed raise_sigsegv to cpu_loop_exit_segv (f4bug).

Patches lacking review:
  04-accel-tcg-Fold-cpu_exit_tb_from_sighandler-into-c.patch
  07-linux-user-host-x86-Populate-host_signal.h.patch
  10-linux-user-host-sparc-Populate-host_signal.h.patch
  12-linux-user-host-aarch64-Populate-host_signal.h.patch
  15-linux-user-host-riscv-Populate-host_signal.h.patch
  16-target-arm-Fixup-comment-re-handle_cpu_signal.patch
  17-linux-user-host-riscv-Improve-host_signal_write.patch
  21-target-alpha-Implement-alpha_cpu_record_sigsegv.patch
  23-target-arm-Implement-arm_cpu_record_sigsegv.patch
  26-target-hppa-Make-hppa_cpu_tlb_fill-sysemu-only.patch
  29-target-microblaze-Make-mb_cpu_tlb_fill-sysemu-onl.patch
  32-linux-user-openrisc-Adjust-signal-for-EXCP_RANGE-.patch
  36-target-s390x-Use-probe_access_flags-in-s390_probe.patch
  38-target-sh4-Make-sh4_cpu_tlb_fill-sysemu-only.patch


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
 target/alpha/cpu.h                            |  13 +-
 target/arm/internals.h                        |   6 +
 target/cris/cpu.h                             |   8 +-
 target/hppa/cpu.h                             |   2 +-
 target/i386/tcg/helper-tcg.h                  |   6 +
 target/microblaze/cpu.h                       |   8 +-
 target/mips/tcg/tcg-internal.h                |   7 +-
 target/nios2/cpu.h                            |   6 +
 target/openrisc/cpu.h                         |   7 +-
 target/ppc/cpu.h                              |   3 -
 target/ppc/internal.h                         |   9 +
 target/s390x/s390x-internal.h                 |  13 +-
 target/sh4/cpu.h                              |   6 +-
 target/xtensa/cpu.h                           |   2 +-
 accel/tcg/cpu-exec.c                          |   3 +-
 accel/tcg/user-exec.c                         | 832 ++----------------
 linux-user/cris/cpu_loop.c                    |  10 -
 linux-user/hexagon/cpu_loop.c                 |  24 +-
 linux-user/hppa/cpu_loop.c                    |  16 -
 linux-user/m68k/cpu_loop.c                    |  10 -
 linux-user/microblaze/cpu_loop.c              |  10 -
 linux-user/mips/cpu_loop.c                    |  11 -
 linux-user/openrisc/cpu_loop.c                |  17 +-
 linux-user/riscv/cpu_loop.c                   |   7 -
 linux-user/s390x/cpu_loop.c                   |  13 +-
 linux-user/sh4/cpu_loop.c                     |   8 -
 linux-user/signal.c                           | 116 ++-
 linux-user/sparc/cpu_loop.c                   |  25 -
 linux-user/xtensa/cpu_loop.c                  |   9 -
 target/alpha/cpu.c                            |   6 +-
 target/alpha/helper.c                         |  39 +-
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
 target/nios2/cpu.c                            |   6 +-
 target/nios2/helper.c                         |   7 +-
 target/openrisc/cpu.c                         |   2 +-
 target/openrisc/mmu.c                         |   9 -
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
 93 files changed, 961 insertions(+), 1312 deletions(-)
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


