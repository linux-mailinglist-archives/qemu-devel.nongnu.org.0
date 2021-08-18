Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0A3F0BAE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:22:05 +0200 (CEST)
Received: from localhost ([::1]:38614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGR8V-0002nc-Tg
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR5z-0008RU-Qf
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:27 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR5x-0008GF-Nx
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:27 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso9556590pjh.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQsxRtJvrhMElQBmqd2/Q9IzNE6vlUgn00j+ff84SDU=;
 b=fwLoyGmxcCTwWFeqaLvtP1IO0aOI2gAZrOanHjXsTPLcELI3d1MpNytGeChixWECeF
 dnxkmXTTLX/1F6t01QLYwEAMJF8l7rEmL9dgOdygn9zrkyD0xEOAfGr3gEIA/jkBuFdH
 hjrgixmkpxqvPa73shIJUyRtZtP5R8Syt1mf1k9QrONK4ged4PgL4Aji0a/Dv3Va+G2a
 BWKt+qoaH4bK9W5/at8GeQDMBkk74Le9pP2iuy3pxrNdgpDQeYF0DVv4XJDiSqWNSNlh
 sBzmJgNQ7ogxKFCmz0HVf6Q1Ny1OELcuxNWyyUOgToUo/8lCFZjuw38bbsUk+ZcvQMRC
 hFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQsxRtJvrhMElQBmqd2/Q9IzNE6vlUgn00j+ff84SDU=;
 b=C/G8snEtsy/F7jjQBPu48r/qNUURoVLCE97OreJDraLCmSZFSFVRfb1ZTsWhWAZl9B
 rs+e8om81uuToZiQCSguK8A9rsILZXrolyXOtuKboF7RxYlc5eNZXGkfJ2mfv6AVy0jn
 GpsO7kKX3/MmtRCoVXtQuMiGOgtNxhvjhzpWU8RzpvHJ1dh8csuq3ymqB1Du/AIlMNhy
 QtgujTulqsmgBO7pBitl0nBqSf6boiulBhQZC43BY7y1HhBvjIwweAToZ00Ot3oLhuUN
 YfGd65b6FLfc0E5+nrmNQ0H+uOYRMouoVwbGGA8m/npN1jc0hS5jdT0GlnyFeRzxQHlM
 uU6Q==
X-Gm-Message-State: AOAM530x/7tmJ5wOMZ8yozDFhvz52noQBGrVixz/T03HAeJZjNNLTq9V
 Agb/GDW8N+/3BBZ7OKPLaz4CRnGVWgJjuw==
X-Google-Smtp-Source: ABdhPJzebt7//2g7AcgWTPb1s+CZ2m7DuwuC2pTyHfkVrsRqP10zuGblyku5C3QEwWp1x/FZC1exyg==
X-Received: by 2002:a17:90a:de93:: with SMTP id
 n19mr10488517pjv.148.1629314363914; 
 Wed, 18 Aug 2021 12:19:23 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/66] Unaligned access for user-only
Date: Wed, 18 Aug 2021 09:18:14 -1000
Message-Id: <20210818191920.390759-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This began with Peter wanting a cpu_ldst.h interface that can handle
alignment info for Arm M-profile system mode, which will also compile
for user-only without ifdefs.  This is patch 32.

Once I had that interface, I thought I might as well enforce the
requested alignment in user-only.  There are plenty of cases where
we ought to have been doing that for quite a while.  This took rather
more work than I imagined to start.

I have now updated all of the tcg backends, but arm, sparc and mips
are rather larger cleanups and I'll post them separately.

Changes for v3:
  * Updated tcg/{aarch64,ppc,s390,riscv,tci}.

Changes for v2:
  * Cleanup prctl(2), add support for prctl(PR_GET/SET_UNALIGN).
  * Adjustments for ppc and sparc reporting address during alignment fault.


r~


Richard Henderson (66):
  util: Suppress -Wstringop-overflow in qemu_thread_start
  hw/core: Make do_unaligned_access noreturn
  hw/core: Make do_unaligned_access available to user-only
  target/alpha: Implement do_unaligned_access for user-only
  target/arm: Implement do_unaligned_access for user-only
  target/hppa: Implement do_unaligned_access for user-only
  target/microblaze: Do not set MO_ALIGN for user-only
  target/mips: Implement do_unaligned_access for user-only
  target/ppc: Move SPR_DSISR setting to powerpc_excp
  target/ppc: Set fault address in ppc_cpu_do_unaligned_access
  target/ppc: Implement do_unaligned_access for user-only
  target/riscv: Implement do_unaligned_access for user-only
  target/s390x: Implement do_unaligned_access for user-only
  target/sh4: Set fault address in superh_cpu_do_unaligned_access
  target/sh4: Implement do_unaligned_access for user-only
  target/sparc: Remove DEBUG_UNALIGNED
  target/sparc: Split out build_sfsr
  target/sparc: Set fault address in sparc_cpu_do_unaligned_access
  target/sparc: Implement do_unaligned_access for user-only
  target/xtensa: Implement do_unaligned_access for user-only
  accel/tcg: Report unaligned atomics for user-only
  accel/tcg: Drop signness in tracing in cputlb.c
  tcg: Expand MO_SIZE to 3 bits
  tcg: Rename TCGMemOpIdx to MemOpIdx
  tcg: Split out MemOpIdx to exec/memopidx.h
  trace/mem: Pass MemOpIdx to trace_mem_get_info
  accel/tcg: Pass MemOpIdx to atomic_trace_*_post
  plugins: Reorg arguments to qemu_plugin_vcpu_mem_cb
  trace: Split guest_mem_before
  target/arm: Use MO_128 for 16 byte atomics
  target/i386: Use MO_128 for 16 byte atomics
  target/ppc: Use MO_128 for 16 byte atomics
  target/s390x: Use MO_128 for 16 byte atomics
  target/hexagon: Implement cpu_mmu_index
  accel/tcg: Add cpu_{ld,st}*_mmu interfaces
  accel/tcg: Move cpu_atomic decls to exec/cpu_ldst.h
  target/mips: Use cpu_*_data_ra for msa load/store
  target/mips: Use 8-byte memory ops for msa load/store
  target/s390x: Use cpu_*_mmu instead of helper_*_mmu
  target/sparc: Use cpu_*_mmu instead of helper_*_mmu
  target/arm: Use cpu_*_mmu instead of helper_*_mmu
  tcg: Move helper_*_mmu decls to tcg/tcg-ldst.h
  tcg: Add helper_unaligned_{ld,st} for user-only sigbus
  tcg/i386: Support raising sigbus for user-only
  tests/tcg/multiarch: Add sigbus.c
  linux-user: Split out do_prctl and subroutines
  linux-user: Disable more prctl subcodes
  hw/core/cpu: Re-sort the non-pointers to the end of CPUClass
  linux-user: Add code for PR_GET/SET_UNALIGN
  hw/core/cpu: Move cpu properties to cpu-sysemu.c
  hw/core/cpu: Add prctl-unalign-sigbus property for user-only
  target/alpha: Reorg fp memory operations
  target/alpha: Reorg integer memory operations
  target/alpha: Implement prctl_unalign_sigbus
  target/hppa: Implement prctl_unalign_sigbus
  target/sh4: Implement prctl_unalign_sigbus
  accel/tcg/user-exec: Convert DEBUG_SIGNAL to tracepoint
  include/exec: Move cpu_signal_handler declaration
  accel/tcg: Handle SIGBUS in handle_cpu_signal
  tcg/aarch64: Support raising sigbus for user-only
  tcg/ppc: Support raising sigbus for user-only
  tcg/s390: Support raising sigbus for user-only
  tcg/tci: Support raising sigbus for user-only
  tcg: Canonicalize alignment flags in MemOp
  tcg/riscv: Support raising sigbus for user-only
  tcg/riscv: Remove add with zero on user-only memory access

 docs/devel/loads-stores.rst         |  52 +-
 accel/tcg/atomic_template.h         |  73 ++-
 accel/tcg/internal.h                |   4 +
 hw/core/cpu-common.h                |  17 +
 include/exec/cpu_ldst.h             | 332 ++++++-------
 include/exec/exec-all.h             |  13 +
 include/exec/memop.h                |  14 +-
 include/exec/memopidx.h             |  55 +++
 include/hw/core/cpu.h               |  14 +-
 include/hw/core/tcg-cpu-ops.h       |  15 +-
 include/qemu/plugin.h               |  26 +-
 include/tcg/tcg-ldst.h              |  79 ++++
 include/tcg/tcg.h                   | 197 +-------
 linux-user/aarch64/target_syscall.h |  23 -
 linux-user/mips/target_syscall.h    |   6 -
 linux-user/mips64/target_syscall.h  |   6 -
 target/alpha/cpu.h                  |  15 +-
 target/arm/cpu.h                    |   7 -
 target/arm/internals.h              |   2 +-
 target/avr/cpu.h                    |   2 -
 target/cris/cpu.h                   |   8 -
 target/hexagon/cpu.h                |  12 +-
 target/hppa/cpu.h                   |   8 +-
 target/i386/cpu.h                   |   7 -
 target/m68k/cpu.h                   |   8 -
 target/microblaze/cpu.h             |   9 +-
 target/mips/cpu.h                   |   3 -
 target/mips/internal.h              |   2 -
 target/mips/tcg/tcg-internal.h      |   4 +-
 target/nios2/cpu.h                  |   6 +-
 target/openrisc/cpu.h               |   2 -
 target/ppc/cpu.h                    |   7 -
 target/ppc/internal.h               |   4 +-
 target/riscv/cpu.h                  |   4 +-
 target/rx/cpu.h                     |   4 -
 target/s390x/cpu.h                  |   7 -
 target/s390x/s390x-internal.h       |   4 +-
 target/sh4/cpu.h                    |  11 +-
 target/sparc/cpu.h                  |   2 -
 target/tricore/cpu.h                |   2 -
 target/xtensa/cpu.h                 |   6 +-
 tcg/aarch64/tcg-target.h            |   2 -
 tcg/i386/tcg-target.h               |   2 -
 tcg/ppc/tcg-target.h                |   2 -
 tcg/riscv/tcg-target.h              |   2 -
 tcg/s390/tcg-target.h               |   2 -
 trace/mem.h                         |  63 ---
 accel/tcg/cpu-exec-common.c         |  12 +
 accel/tcg/cputlb.c                  | 495 +++++++------------
 accel/tcg/plugin-gen.c              |   5 +-
 accel/tcg/user-exec.c               | 634 ++++++++++++-------------
 hw/core/cpu-common.c                |  18 +-
 hw/core/cpu-sysemu.c                |  24 +
 hw/core/cpu-user.c                  |  37 ++
 linux-user/aarch64/cpu_loop.c       |   4 +
 linux-user/arm/cpu_loop.c           |  43 +-
 linux-user/hppa/cpu_loop.c          |   2 +-
 linux-user/mips/cpu_loop.c          |  20 +-
 linux-user/ppc/cpu_loop.c           |   2 +-
 linux-user/riscv/cpu_loop.c         |   7 +
 linux-user/sh4/cpu_loop.c           |   8 +
 linux-user/signal.c                 |  36 +-
 linux-user/sparc/cpu_loop.c         |  11 +
 linux-user/syscall.c                | 709 +++++++++++++++++-----------
 plugins/api.c                       |  19 +-
 plugins/core.c                      |  10 +-
 target/alpha/cpu.c                  |   2 +-
 target/alpha/mem_helper.c           |   8 +-
 target/alpha/translate.c            | 188 ++++----
 target/arm/cpu.c                    |   2 +-
 target/arm/cpu_tcg.c                |   2 +-
 target/arm/helper-a64.c             |  77 +--
 target/arm/m_helper.c               |   8 +-
 target/arm/translate-a64.c          |   2 +-
 target/hppa/cpu.c                   |  16 +-
 target/hppa/translate.c             |  19 +-
 target/i386/tcg/mem_helper.c        |   4 +-
 target/m68k/op_helper.c             |   3 +-
 target/microblaze/translate.c       |  16 +
 target/mips/cpu.c                   |   2 +-
 target/mips/tcg/msa_helper.c        | 395 ++++------------
 target/mips/tcg/op_helper.c         |   3 +-
 target/mips/tcg/user/tlb_helper.c   |  23 +-
 target/ppc/cpu_init.c               |   2 +-
 target/ppc/excp_helper.c            |  35 +-
 target/ppc/mem_helper.c             |   1 -
 target/ppc/translate.c              |  12 +-
 target/riscv/cpu.c                  |   2 +-
 target/riscv/cpu_helper.c           |   8 +-
 target/s390x/cpu.c                  |   2 +-
 target/s390x/tcg/excp_helper.c      |  28 +-
 target/s390x/tcg/mem_helper.c       |  31 +-
 target/sh4/cpu.c                    |   2 +-
 target/sh4/op_helper.c              |   8 +-
 target/sh4/translate.c              |  50 +-
 target/sparc/cpu.c                  |   2 +-
 target/sparc/ldst_helper.c          |  38 +-
 target/sparc/mmu_helper.c           |  92 +++-
 target/xtensa/cpu.c                 |   2 +-
 target/xtensa/helper.c              |  30 +-
 tcg/optimize.c                      |   2 +-
 tcg/tcg-op.c                        |  67 +--
 tcg/tcg.c                           |   3 +-
 tcg/tci.c                           |  33 +-
 tests/tcg/multiarch/sigbus.c        |  68 +++
 util/qemu-thread-posix.c            |  19 +
 accel/tcg/atomic_common.c.inc       |  43 +-
 accel/tcg/ldst_common.c.inc         | 307 ++++++++++++
 target/s390x/tcg/translate_vx.c.inc |   2 +-
 tcg/aarch64/tcg-target.c.inc        | 192 +++++++-
 tcg/arm/tcg-target.c.inc            |  14 +-
 tcg/i386/tcg-target.c.inc           | 121 ++++-
 tcg/mips/tcg-target.c.inc           |  16 +-
 tcg/ppc/tcg-target.c.inc            | 120 ++++-
 tcg/riscv/tcg-target.c.inc          |  92 +++-
 tcg/s390/tcg-target.c.inc           |  77 ++-
 tcg/sparc/tcg-target.c.inc          |  20 +-
 tcg/tcg-ldst.c.inc                  |   2 +-
 accel/tcg/trace-events              |   4 +
 hw/core/meson.build                 |   4 +
 trace-events                        |  18 +-
 121 files changed, 3126 insertions(+), 2454 deletions(-)
 create mode 100644 hw/core/cpu-common.h
 create mode 100644 include/exec/memopidx.h
 create mode 100644 include/tcg/tcg-ldst.h
 delete mode 100644 trace/mem.h
 create mode 100644 hw/core/cpu-user.c
 create mode 100644 tests/tcg/multiarch/sigbus.c
 create mode 100644 accel/tcg/ldst_common.c.inc

-- 
2.25.1


