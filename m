Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563813D9A93
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:40 +0200 (CEST)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8uFz-00071E-C0
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 20:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCM-0003sC-IM
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uCK-0002Kr-Mc
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:46:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so12840955pja.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FRrmHC4NMYYkaEGRHUCPDUDqzImSqJYVBZzu73k/ZCk=;
 b=BMQtZ1PHmVSd//yBMfhCy61RqbXWBe17ecOPKDDhuYWoAp9Ui9V2m0DVunvwu8KmxK
 +UYv32CxVkLSriVf7J7Uf8PVUSFHAfbvEBzDjQOqQoCNPssZde9Dy1J5M1ReZpTwLJSy
 qGKKL/+h0K3yNsnV77YzefPHeXJNmJPEg6Y2mlrNAD6526fzPtoBk94K5FPCaK/qVyBc
 xJYMIRQLdgyEX5smKBYxGA0fZ8dtnjreDaTzn74SuMDoNBvW5CqCqbzxWD2AyISoxTPT
 nnHGcp/afWjR1knGBLvYVWILz08844cd+7kUBW7lkHxnZKArS2p7vD/bdGZzifBukkdk
 HWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FRrmHC4NMYYkaEGRHUCPDUDqzImSqJYVBZzu73k/ZCk=;
 b=HGsBwR5rP9WrUDAQJvpl4BUoa6/sVy18R17qOI1U6PZZwbWLadTpFm71paSP0rsMUu
 lmwoTjWSJGkV3Fi6IQ9wmrQLaYfotfpXg6dc0F7XpYNU1iOKPgUFr4dpAKnTdLfonkdk
 0WbMgtM7RdqRj7EmiQ5ThR48qvAs9cl7EVtqbFfWr7XWLzhiALxI6MVJFvDL1kSJrhgg
 f5GZ5btcTOGGUrDrzjo9t3/XQSPKj8x1wRID7kpGj/ldDfFsMOn0bupOc3IOJYi3vAt/
 Jt2mDP7cdhdXZ3Xvu6WCTJnBTbwB+6CgcBBxJOFuHdRKJvz5BaZiaY8MpZbwx/zaC1If
 UEQQ==
X-Gm-Message-State: AOAM533iXas7ZEs2aC9M3GCCCkvFTwOBCuGpzulDvOVti4rYed6LySnI
 Czk9Hl3xlg70Df+sj8IVvpnlz6gowI1Q+Q==
X-Google-Smtp-Source: ABdhPJwVX2okV8/k8CMiGuyKTxk+pRoiv4WwbXcp3CeqOgJqjdF80iMneGTMmk52Fn6D5Pem1gPlLw==
X-Received: by 2002:a17:90a:658c:: with SMTP id
 k12mr11910743pjj.167.1627519610542; 
 Wed, 28 Jul 2021 17:46:50 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id t205sm1305005pfc.32.2021.07.28.17.46.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:46:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/43] Unaligned accesses for user-only
Date: Wed, 28 Jul 2021 14:46:04 -1000
Message-Id: <20210729004647.282017-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

So far only x86 host has been fully converted to handle unaligned
operations in user-only mode.  I'll get to the others later.  But
the added testcase is fairly broad, and caught lots of bugs and/or
missing code between target/ and linux-user/.

Notes:
  * For target/i386 we have no way to signal SIGBUS from user-only.
    In theory we could go through do_unaligned_access in system mode,
    via #AC.  But we don't even implement that control in tcg, probably
    because no one ever sets it.  The cmpxchg16b insn requires alignment,
    but raises #GP, which maps to SIGSEGV.

  * For target/s390x we have no way to signal SIGBUS from user-only.
    The atomic operations raise PGM_SPECIFICATION, which the linux
    kernel maps to SIGILL.

  * I think target/hexagon should be setting TARGET_ALIGNED_ONLY=y.
    In the meantime, all memory accesses are allowed to be unaligned.


r~


Richard Henderson (43):
  hw/core: Make do_unaligned_access available to user-only
  target/alpha: Implement do_unaligned_access for user-only
  target/arm: Implement do_unaligned_access for user-only
  target/hppa: Implement do_unaligned_access for user-only
  target/microblaze: Implement do_unaligned_access for user-only
  target/mips: Implement do_unaligned_access for user-only
  target/ppc: Set fault address in ppc_cpu_do_unaligned_access
  target/ppc: Implement do_unaligned_access for user-only
  target/riscv: Implement do_unaligned_access for user-only
  target/s390x: Implement do_unaligned_access for user-only
  target/sh4: Set fault address in superh_cpu_do_unaligned_access
  target/sh4: Implement do_unaligned_access for user-only
  target/sparc: Remove DEBUG_UNALIGNED
  target/sparc: Set fault address in sparc_cpu_do_unaligned_access
  target/sparc: Implement do_unaligned_access for user-only
  target/xtensa: Implement do_unaligned_access for user-only
  accel/tcg: Report unaligned atomics for user-only
  accel/tcg: Drop signness in tracing in cputlb.c
  tcg: Expand MO_SIZE to 3 bits
  tcg: Rename TCGMemOpIdx to MemOpIdx
  tcg: Split out MemOpIdx to exec/memopidx.h
  trace/mem: Pass MemOpIdx to trace_mem_get_info
  accel/tcg: Remove double bswap for helper_atomic_sto_*_mmu
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
  linux-user/alpha: Remove TARGET_ALIGNED_ONLY
  tcg: Add helper_unaligned_mmu for user-only sigbus
  tcg/i386: Support raising sigbus for user-only
  tests/tcg/multiarch: Add sigbus.c

 configs/targets/alpha-linux-user.mak |   1 -
 accel/tcg/atomic_template.h          |  74 ++--
 include/exec/cpu_ldst.h              | 332 +++++++++---------
 include/exec/memop.h                 |  14 +-
 include/exec/memopidx.h              |  55 +++
 include/hw/core/tcg-cpu-ops.h        |  14 +-
 include/qemu/plugin.h                |  26 +-
 include/tcg/tcg-ldst.h               |  79 +++++
 include/tcg/tcg.h                    | 197 +----------
 target/hexagon/cpu.h                 |   9 +
 tcg/i386/tcg-target.h                |   2 -
 trace/mem.h                          |  63 ----
 accel/tcg/cputlb.c                   | 486 +++++++++------------------
 accel/tcg/plugin-gen.c               |   5 +-
 accel/tcg/user-exec.c                | 444 ++++++++++--------------
 linux-user/aarch64/cpu_loop.c        |   4 +
 linux-user/arm/cpu_loop.c            |  43 ++-
 linux-user/hppa/cpu_loop.c           |   2 +-
 linux-user/mips/cpu_loop.c           |  20 +-
 linux-user/ppc/cpu_loop.c            |   2 +-
 linux-user/riscv/cpu_loop.c          |   7 +
 linux-user/sh4/cpu_loop.c            |   8 +
 linux-user/sparc/cpu_loop.c          |  11 +
 plugins/api.c                        |  19 +-
 plugins/core.c                       |  10 +-
 target/alpha/cpu.c                   |   2 +-
 target/alpha/mem_helper.c            |   8 +-
 target/alpha/translate.c             |   8 +-
 target/arm/cpu.c                     |   2 +-
 target/arm/cpu_tcg.c                 |   2 +-
 target/arm/helper-a64.c              |  77 ++---
 target/arm/m_helper.c                |   8 +-
 target/arm/translate-a64.c           |   2 +-
 target/hppa/cpu.c                    |   8 +-
 target/i386/tcg/mem_helper.c         |   4 +-
 target/m68k/op_helper.c              |   3 +-
 target/microblaze/cpu.c              |   2 +-
 target/mips/cpu.c                    |   2 +-
 target/mips/tcg/msa_helper.c         | 395 +++++-----------------
 target/mips/tcg/op_helper.c          |   3 +-
 target/mips/tcg/user/tlb_helper.c    |  23 +-
 target/ppc/cpu_init.c                |   2 +-
 target/ppc/excp_helper.c             |   2 +
 target/ppc/mem_helper.c              |   1 -
 target/ppc/translate.c               |  12 +-
 target/riscv/cpu.c                   |   2 +-
 target/riscv/cpu_helper.c            |   8 +-
 target/s390x/cpu.c                   |   2 +-
 target/s390x/tcg/excp_helper.c       |  28 +-
 target/s390x/tcg/mem_helper.c        |  31 +-
 target/sh4/cpu.c                     |   2 +-
 target/sh4/op_helper.c               |   8 +-
 target/sparc/cpu.c                   |   2 +-
 target/sparc/ldst_helper.c           |  33 +-
 target/xtensa/cpu.c                  |   2 +-
 target/xtensa/helper.c               |  30 +-
 tcg/optimize.c                       |   2 +-
 tcg/tcg-op.c                         |  60 ++--
 tcg/tcg.c                            |   3 +-
 tcg/tci.c                            |  15 +-
 tests/tcg/multiarch/sigbus.c         |  68 ++++
 accel/tcg/atomic_common.c.inc        |  43 +--
 accel/tcg/ldst_common.c.inc          | 307 +++++++++++++++++
 target/s390x/tcg/translate_vx.c.inc  |   2 +-
 tcg/aarch64/tcg-target.c.inc         |  18 +-
 tcg/arm/tcg-target.c.inc             |  14 +-
 tcg/i386/tcg-target.c.inc            | 128 ++++++-
 tcg/mips/tcg-target.c.inc            |  16 +-
 tcg/ppc/tcg-target.c.inc             |  18 +-
 tcg/riscv/tcg-target.c.inc           |  20 +-
 tcg/s390/tcg-target.c.inc            |  14 +-
 tcg/sparc/tcg-target.c.inc           |  20 +-
 tcg/tcg-ldst.c.inc                   |   2 +-
 trace-events                         |  18 +-
 74 files changed, 1699 insertions(+), 1710 deletions(-)
 create mode 100644 include/exec/memopidx.h
 create mode 100644 include/tcg/tcg-ldst.h
 delete mode 100644 trace/mem.h
 create mode 100644 tests/tcg/multiarch/sigbus.c
 create mode 100644 accel/tcg/ldst_common.c.inc

-- 
2.25.1


