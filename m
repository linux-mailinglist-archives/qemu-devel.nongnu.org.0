Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7894C6AB3CC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYytX-0004N6-W5; Sun, 05 Mar 2023 19:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytU-0004Lw-7H
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:00 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytR-0006MZ-Us
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:39:59 -0500
Received: by mail-pj1-x1042.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso7367933pjs.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aHV8uTes/qD6RGDNqXRwjdobeA0pE/PGDCR4NQED/SI=;
 b=ld1V/E9speFVu5AKQ3cOTbiw5psyeLRTCjfuj9XmvkB27ncTwARVhTv5YRUcOlcosu
 vRwcmDCHPabvuWGMjgXxgCVX9kfVW7u6mK8EcO6R0I7zrDue16GCByKxPb97frB+OUK4
 fA8pfnCRBNPKdAl3BSExx+R0n6vZNoYLpBHntSD6JGA2MnBLQY/W+MW/ALvpCEZ5WPa5
 zSsXzvyQGG/WeiBnFTA6SP8KtPFb63MM7a4lF9bukHiwquQnCyd4V8pfnIH7exSPVaJu
 GwObu+z67Qd5q20I66BR5j7EZ3Xp9h/1yg2Pqn4VhbzvnnyxfjLh+TY5zCv2VaOBWgdN
 sqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063196;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aHV8uTes/qD6RGDNqXRwjdobeA0pE/PGDCR4NQED/SI=;
 b=NmXoli/y/xUx83VJlmB6JtCuEEpn6cz1QZEArd8mJ1u9oHgw6Y+lmRF/3PKh+pSL1m
 ynDEMmBtyyebW4UODCaW4jgDXE4JGM8+wsMK5zLwJ7+eXYR6js0Xa8Zi7QpVHAOTLYY+
 B/ghZriUGg8yrt7QJ2RLJtunuPuFRz+1oPA0qODTYnk75aQgyvyeu76SnF0kwgC7PgrA
 O5XL5OLJdZw7SLnBPvaqNmhppuCb7k2L8vyzbYWUYLNfwrLjrRtbCs9E/xwR2vKAEQ0O
 Pf2lN2O4C9toThqZvIeQMA+E+L5rPr/enYu58Yoebg+6szIEU18U0qc9GWZYhOxhK8rk
 3fOQ==
X-Gm-Message-State: AO0yUKWcPRlGTuA9Q7A+faJIj201PY8zQV8lokUQa959h32T77TzbIKm
 ZsTwIIht12xUUXeuFDYO7p1sl59RJ7e4dcYjH9vbIZ0C
X-Google-Smtp-Source: AK7set9SV/DMl6QhzOyqacqQFIjcTIau2cSwls2g0oXm74mAA9/YwmIUMa7akNp7F+3meQufFGBPRw==
X-Received: by 2002:a17:90b:4f42:b0:236:76cb:99d2 with SMTP id
 pj2-20020a17090b4f4200b0023676cb99d2mr9853226pjb.8.1678063196034; 
 Sun, 05 Mar 2023 16:39:56 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:39:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/84] tcg patch queue
Date: Sun,  5 Mar 2023 16:38:30 -0800
Message-Id: <20230306003954.1866998-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:

  configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230305

for you to fetch changes up to b6611d8d5c265c138a4a0cc36a2c02d84a768976:

  target/xtensa: Avoid tcg_const_i32 (2023-03-05 13:47:25 -0800)

----------------------------------------------------------------
tcg: Merge two sequential labels
accel/tcg: Retain prot flags from tlb_fill
accel/tcg: Honor TLB_DISCARD_WRITE in atomic_mmu_lookup
accel/tcg: Honor TLB_WATCHPOINTS in atomic_mmu_lookup
target/sparc: Use tlb_set_page_full
include/qemu/cpuid: Introduce xgetbv_low
tcg/i386: Mark Win64 call-saved vector regs as reserved
tcg: Decode the operand to INDEX_op_mb in dumps

Portion of the target/ patchset which eliminates use of tcg_temp_free*
Portion of the target/ patchset which eliminates use of tcg_const*

----------------------------------------------------------------
Richard Henderson (83):
      tcg: Link branches to the labels
      tcg: Merge two sequential labels
      target/sparc: Use tlb_set_page_full
      accel/tcg: Retain prot flags from tlb_fill
      accel/tcg: Honor TLB_DISCARD_WRITE in atomic_mmu_lookup
      softmmu: Check watchpoints for read+write at once
      accel/tcg: Trigger watchpoints from atomic_mmu_lookup
      include/qemu/cpuid: Introduce xgetbv_low
      tcg/i386: Mark Win64 call-saved vector regs as reserved
      tcg: Decode the operand to INDEX_op_mb in dumps
      tcg: Remove tcg_check_temp_count, tcg_clear_temp_count
      accel/tcg: Remove translator_loop_temp_check
      target/alpha: Drop tcg_temp_free
      target/arm: Remove arm_free_cc, a64_free_cc
      target/arm: Remove value_global from DisasCompare
      target/arm: Drop tcg_temp_free from translator.c
      target/arm: Drop DisasContext.tmp_a64
      target/arm: Drop new_tmp_a64
      target/arm: Drop new_tmp_a64_zero
      target/arm: Drop tcg_temp_free from translator-a64.c
      target/arm: Drop tcg_temp_free from translator-m-nocp.c
      target/arm: Drop tcg_temp_free from translator-mve.c
      target/arm: Drop tcg_temp_free from translator-neon.c
      target/arm: Drop tcg_temp_free from translator-sme.c
      target/arm: Drop tcg_temp_free from translator-sve.c
      target/arm: Drop tcg_temp_free from translator-vfp.c
      target/arm: Drop tcg_temp_free from translator.h
      target/avr: Drop DisasContext.free_skip_var0
      target/avr: Drop R from trans_COM
      target/avr: Drop tcg_temp_free
      target/cris: Drop cris_alu_free_temps
      target/cris: Drop cris_alu_m_free_temps
      target/cris: Drop addr from dec10_ind_move_m_pr
      target/cris: Drop tcg_temp_free
      target/hexagon: Drop tcg_temp_free from C code
      target/hexagon: Drop tcg_temp_free from gen_tcg_funcs.py
      target/hexagon/idef-parser: Drop tcg_temp_free
      target/hexagon/idef-parser: Drop HexValue.is_manual
      target/hppa: Drop tcg_temp_free
      target/loongarch: Drop temp_new
      target/loongarch: Drop tcg_temp_free
      target/m68k: Drop mark_to_release
      target/m68k: Drop free_cond
      target/m68k: Drop tcg_temp_free
      target/microblaze: Drop tcg_temp_free
      target/nios2: Drop tcg_temp_free
      target/openrisc: Drop tcg_temp_free
      target/ppc: Drop tcg_temp_free
      target/riscv: Drop ftemp_new
      target/riscv: Drop temp_new
      target/riscv: Drop tcg_temp_free
      target/rx: Drop tcg_temp_free
      target/sh4: Drop tcg_temp_free
      target/sparc: Drop get_temp_tl
      target/sparc: Drop get_temp_i32
      target/sparc: Remove egress label in disas_sparc_context
      target/sparc: Drop free_compare
      target/sparc: Drop tcg_temp_free
      target/xtensa: Drop reset_sar_tracker
      target/xtensa: Drop tcg_temp_free
      target/i386: Drop tcg_temp_free
      target/mips: Drop tcg_temp_free from mips16e_translate.c.inc
      target/mips: Fix trans_mult_acc return
      target/tricore: Drop tcg_temp_free
      include/exec/gen-icount: Drop tcg_temp_free in gen_tb_start
      tracing: remove transform.py
      docs/devel/tcg-ops: Drop recommendation to free temps
      target/hexagon: Use tcg_constant_* for gen_constant_from_imm
      target/hexagon/idef-parser: Use gen_tmp for LPCFG
      target/hexagon/idef-parser: Use gen_tmp for gen_pred_assign
      target/hexagon/idef-parser: Use gen_tmp for gen_rvalue_pred
      target/hexagon/idef-parser: Use gen_constant for gen_extend_tcg_width_op
      target/i386: Simplify POPF
      target/microblaze: Avoid tcg_const_* throughout
      target/riscv: Avoid tcg_const_*
      target/s390x: Split out gen_ri2
      target/sparc: Avoid tcg_const_{tl,i32}
      target/xtensa: Tidy translate_bb
      target/xtensa: Tidy translate_clamps
      target/xtensa: Avoid tcg_const_i32 in translate_l32r
      target/xtensa: Use tcg_gen_subfi_i32 in translate_sll
      target/xtensa: Split constant in bit shift
      target/xtensa: Avoid tcg_const_i32

Richard W.M. Jones (1):
      tcg: Include "qemu/timer.h" for profile_getclock

 docs/devel/tcg-ops.rst                             |   4 -
 target/hexagon/idef-parser/README.rst              |   8 -
 meson.build                                        |   1 -
 include/exec/gen-icount.h                          |   2 -
 include/exec/translator.h                          |   2 -
 include/hw/core/cpu.h                              |   7 +-
 include/qemu/cpuid.h                               |   7 +
 include/tcg/tcg-op.h                               |   7 +-
 include/tcg/tcg.h                                  |  33 +-
 target/arm/tcg/translate-a64.h                     |   2 -
 target/arm/tcg/translate.h                         |   7 -
 target/hexagon/gen_tcg.h                           |  29 -
 target/hexagon/gen_tcg_hvx.h                       |  15 -
 target/hexagon/idef-parser/idef-parser.h           |   1 -
 target/hexagon/idef-parser/parser-helpers.h        |  10 -
 target/hexagon/macros.h                            |   7 -
 target/loongarch/translate.h                       |   3 -
 accel/tcg/cputlb.c                                 |  43 +-
 accel/tcg/tcg-accel-ops.c                          |   1 +
 accel/tcg/translate-all.c                          |   1 +
 accel/tcg/translator.c                             |  16 -
 softmmu/runstate.c                                 |   1 +
 softmmu/watchpoint.c                               |  19 +-
 target/alpha/translate.c                           |  71 ---
 target/arm/tcg/translate-a64.c                     | 594 ++-------------------
 target/arm/tcg/translate-m-nocp.c                  |  20 -
 target/arm/tcg/translate-mve.c                     |  52 --
 target/arm/tcg/translate-neon.c                    | 131 +----
 target/arm/tcg/translate-sme.c                     |  28 -
 target/arm/tcg/translate-sve.c                     | 206 +------
 target/arm/tcg/translate-vfp.c                     | 193 -------
 target/arm/tcg/translate.c                         | 281 +---------
 target/avr/translate.c                             | 251 ---------
 target/cris/translate.c                            | 113 ----
 target/hexagon/genptr.c                            |  58 --
 target/hexagon/idef-parser/parser-helpers.c        | 206 +------
 target/hexagon/translate.c                         |   7 -
 target/hppa/translate.c                            |  93 +---
 target/i386/tcg/translate.c                        |  96 +---
 target/loongarch/translate.c                       |  21 +-
 target/m68k/translate.c                            | 276 +---------
 target/microblaze/translate.c                      |  89 +--
 target/mips/tcg/vr54xx_translate.c                 |   2 +-
 target/nios2/translate.c                           |  15 -
 target/openrisc/translate.c                        |  39 --
 target/ppc/translate.c                             | 285 ----------
 target/riscv/translate.c                           |  65 +--
 target/rx/translate.c                              |  84 ---
 target/s390x/tcg/translate.c                       |  23 +-
 target/sh4/translate.c                             | 110 ----
 target/sparc/mmu_helper.c                          | 121 ++---
 target/sparc/translate.c                           | 339 +++---------
 target/tricore/translate.c                         | 540 +------------------
 target/xtensa/translate.c                          | 171 +-----
 tcg/tcg-op.c                                       |  22 +-
 tcg/tcg.c                                          | 208 ++++++--
 util/bufferiszero.c                                |   3 +-
 target/cris/translate_v10.c.inc                    |  49 +-
 target/i386/tcg/decode-new.c.inc                   |  15 -
 target/i386/tcg/emit.c.inc                         |   6 -
 target/loongarch/insn_trans/trans_arith.c.inc      |  12 -
 target/loongarch/insn_trans/trans_atomic.c.inc     |   3 -
 target/loongarch/insn_trans/trans_bit.c.inc        |  12 -
 target/loongarch/insn_trans/trans_fcmp.c.inc       |   3 -
 target/loongarch/insn_trans/trans_fmemory.c.inc    |  20 +-
 target/loongarch/insn_trans/trans_fmov.c.inc       |   6 -
 target/loongarch/insn_trans/trans_memory.c.inc     |  34 +-
 target/loongarch/insn_trans/trans_privileged.c.inc |   6 +-
 target/loongarch/insn_trans/trans_shift.c.inc      |  11 -
 target/mips/tcg/mips16e_translate.c.inc            |   6 -
 target/ppc/power8-pmu-regs.c.inc                   |  16 -
 target/ppc/translate/dfp-impl.c.inc                |  20 -
 target/ppc/translate/fixedpoint-impl.c.inc         |  16 -
 target/ppc/translate/fp-impl.c.inc                 | 122 +----
 target/ppc/translate/spe-impl.c.inc                |  59 --
 target/ppc/translate/storage-ctrl-impl.c.inc       |   2 -
 target/ppc/translate/vmx-impl.c.inc                | 296 +---------
 target/ppc/translate/vsx-impl.c.inc                | 287 +---------
 target/riscv/insn_trans/trans_rvb.c.inc            |  24 -
 target/riscv/insn_trans/trans_rvd.c.inc            |   2 -
 target/riscv/insn_trans/trans_rvf.c.inc            |   9 -
 target/riscv/insn_trans/trans_rvi.c.inc            |  37 --
 target/riscv/insn_trans/trans_rvk.c.inc            |  15 -
 target/riscv/insn_trans/trans_rvm.c.inc            |  33 --
 target/riscv/insn_trans/trans_rvv.c.inc            |  59 +-
 target/riscv/insn_trans/trans_rvzfh.c.inc          |  14 +-
 target/riscv/insn_trans/trans_xthead.c.inc         |  24 +-
 tcg/i386/tcg-target.c.inc                          |  24 +-
 scripts/tracetool/__init__.py                      |  23 -
 scripts/tracetool/transform.py                     | 168 ------
 target/hexagon/README                              |   5 -
 target/hexagon/gen_tcg_funcs.py                    |  79 +--
 target/hexagon/idef-parser/idef-parser.y           |  14 +-
 93 files changed, 579 insertions(+), 5991 deletions(-)
 delete mode 100644 scripts/tracetool/transform.py

