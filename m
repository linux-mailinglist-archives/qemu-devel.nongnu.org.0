Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A76F5153
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:26:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6q2-00016j-56; Wed, 03 May 2023 03:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6pv-0000zW-4x
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:42 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ps-0001Nf-JV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so4592060f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098615; x=1685690615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2s1wakyxvtnmdANdaVf1g367gGiqC5iSkTJ0auZJcgo=;
 b=NptcD7N4gzGuvVDR8ZNSUyQWu3q/CYH9jwOqJdNg3JD5eO0lC/QddBIlEpLI+mGKMo
 ntVRZaZBwSND5xja8mq1mASrvEUGkYQXy2wpGP7A4XGJolD9qcVMohCsuZ2ZRqObSX8l
 G4LxeQc8vMoO7rwhpl2zSizOsIAj0ujcXGeWBqRrUPZqAn/nEwqLF7V0glahFRXAZuCD
 Y+H+ZViDsKwCfQhC8AKQ0lNzzCWaO2Uv6pHYB8miYAxROy8x4FG4KrSFzqhy1BNtWgEM
 yX7erJhBivz2qQPyg14FsCuFdT36w5Eby3oFJ4OkvNb8EwT340cE2AIK2kiW2emMui4w
 ckFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098615; x=1685690615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2s1wakyxvtnmdANdaVf1g367gGiqC5iSkTJ0auZJcgo=;
 b=grE6gmLLeWtG+QIR/HaCnp26TZ5zHjaIKEIYwNRs5FQrl0K/CH5klyEu5vYEsLOStp
 j2Hr3Tkd26eGlNnwyk6x/D268da0JnufM8jtvNQLTa4muRsq3AOMfcOUrdz1Fx3cyVWa
 ckOnvZRfweBjfauQpgRtdp797m7lpJDBH3OzvqKFNIJt1zD4Qo2+o4LQV+TG+HRrDiYf
 8/eSSlrMvcHEiG0w52zZv4dXldkpa96X/gCmzJ2h5ALfIqN5lomzYa3Bu/wBDsi91KkX
 Llv28pWA9h019Z859lozRDCEtkGoFopm7mw5qTd1gLsayLidXTm3521Z7iXu/YuGnsoZ
 yyiw==
X-Gm-Message-State: AC+VfDwiB4XmzVlmNguvGpLsKS0wCVB6JXMoYyNTDGnnhC1mTSdAVB0o
 TRZaLn6r2BsS7drMhLlUn625v753TsZzKF3Z1K4qwg==
X-Google-Smtp-Source: ACHHUZ6f5foJsll+WQBMtD8v7suohaQWtwwIimOOABYml7oW76/rLboSzdnEX8lbqxDeJr5tZHrzaQ==
X-Received: by 2002:adf:ef84:0:b0:2fb:5296:cd19 with SMTP id
 d4-20020adfef84000000b002fb5296cd19mr13713997wro.53.1683098614809; 
 Wed, 03 May 2023 00:23:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [RESEND PATCH 00/84] tcg: Build once for system, once for user
Date: Wed,  3 May 2023 08:22:07 +0100
Message-Id: <20230503072331.1747057-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Based-on: 20230503070656.1746170-1-richard.henderson@linaro.org
("[PATCH v4 00/57] tcg: Improve atomicity support")

and also

Based-on: 20230502160846.1289975-1-richard.henderson@linaro.org
("[PATCH 00/16] tcg: Remove TARGET_ALIGNED_ONLY")

The goal here is only tcg/, leaving accel/tcg/ for future work.


r~


Richard Henderson (84):
  tcg: Split out memory ops to tcg-op-ldst.c
  tcg: Widen gen_insn_data to uint64_t
  accel/tcg: Widen tcg-ldst.h addresses to uint64_t
  tcg: Widen helper_{ld,st}_i128 addresses to uint64_t
  tcg: Widen helper_atomic_* addresses to uint64_t
  tcg: Widen tcg_gen_code pc_start argument to uint64_t
  accel/tcg: Merge gen_mem_wrapped with plugin_gen_empty_mem_callback
  accel/tcg: Merge do_gen_mem_cb into caller
  tcg: Reduce copies for plugin_gen_mem_callbacks
  accel/tcg: Widen plugin_gen_empty_mem_callback to i64
  tcg: Add addr_type to TCGContext
  tcg: Remove TCGv from tcg_gen_qemu_{ld,st}_*
  tcg: Remove TCGv from tcg_gen_atomic_*
  tcg: Split INDEX_op_qemu_{ld,st}* for guest address size
  tcg/tci: Elimnate TARGET_LONG_BITS, target_ulong
  tcg/i386: Always enable TCG_TARGET_HAS_extr[lh]_i64_i32
  tcg/i386: Conditionalize tcg_out_extu_i32_i64
  tcg/i386: Adjust type of tlb_mask
  tcg/i386: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg/arm: Remove TARGET_LONG_BITS
  tcg/aarch64: Remove USE_GUEST_BASE
  tcg/aarch64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg/loongarch64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg/mips: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg/ppc: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg/riscv: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg/s390x: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg/sparc64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg: Remove TARGET_LONG_BITS, TCG_TYPE_TL
  tcg: Move TCG_TYPE_TL from tcg.h to tcg-op.h
  tcg: Add page_bits and page_mask to TCGContext
  tcg: Add tlb_dyn_max_bits to TCGContext
  tcg: Widen CPUTLBEntry comparators to 64-bits
  tcg: Add tlb_fast_offset to TCGContext
  tcg: Remove TCG_TARGET_TLB_DISPLACEMENT_BITS
  tcg: Split out tcg/debug-assert.h
  *: Add missing includes of qemu/error-report.h
  *: Add missing includes of tcg/debug-assert.h
  *: Add missing includes of tcg/tcg.h
  tcg: Split out tcg-target-reg-bits.h
  target/arm: Fix test of TCG_OVERSIZED_GUEST
  tcg: Split out tcg/oversized-guest.h
  tcg: Move TCGv, dup_const_tl definitions to tcg-op.h
  tcg: Split tcg/tcg-op-common.h from tcg/tcg-op.h
  target/arm: Include helper-gen.h in translator.h
  target/hexagon: Include helper-gen.h where needed
  tcg: Remove outdated comments in helper-head.h
  tcg: Move TCGHelperInfo and dependencies to tcg/helper-info.h
  tcg: Pass TCGHelperInfo to tcg_gen_callN
  tcg: Move temp_idx and tcgv_i32_temp debug out of line
  tcg: Split tcg_gen_callN
  tcg: Split helper-gen.h
  tcg: Split helper-proto.h
  tcg: Add insn_start_words to TCGContext
  tcg: Add guest_mo to TCGContext
  tcg: Move TLB_FLAGS_MASK check out of get_alignment_bits
  tcg: Split tcg/tcg-op-gvec.h
  tcg: Remove NO_CPU_IO_DEFS
  exec-all: Widen tb_page_addr_t for user-only
  exec-all: Widen TranslationBlock pc and cs_base to 64-bits
  tcg: Remove DEBUG_DISAS
  tcg: Remove USE_TCG_OPTIMIZATIONS
  tcg: Spit out exec/translation-block.h
  include/exec: Remove CODE_GEN_AVG_BLOCK_SIZE
  accel/tcg: Move most of gen-icount.h into translator.c
  accel/tcg: Introduce translator_io_start
  accel/tcg: Move translator_fake_ldb out of line
  target/arm: Tidy helpers for translation
  target/mips: Tidy helpers for translation
  *: Add missing includes of exec/translation-block.h
  *: Add missing includes of exec/exec-all.h
  accel/tcg: Tidy includes for translator.[ch]
  tcg: Define IN_TCG
  tcg: Fix PAGE/PROT confusion
  tcg: Move env defines out of NEED_CPU_H in helper-head.h
  tcg: Remove target-specific headers from tcg.[ch]
  plugins: Move plugin_insn_append to translator.c
  plugins: Drop unused headers from exec/plugin-gen.h
  disas: Move disas.c to disas/
  disas: Remove target_ulong from the interface
  tcg: Split out exec/user/guest-base.h
  disas: Remove target-specific headers
  exec/poison: Do not poison CONFIG_SOFTMMU
  tcg: Build once for system and once for user-only

 accel/tcg/tcg-runtime.h                       |   50 +-
 include/disas/disas.h                         |   23 +-
 include/exec/cpu-all.h                        |    8 +-
 include/exec/cpu-defs.h                       |   50 +-
 include/exec/cpu_ldst.h                       |   22 +-
 include/exec/exec-all.h                       |  148 +-
 include/exec/gen-icount.h                     |   83 --
 include/exec/helper-gen-common.h              |   17 +
 include/exec/helper-gen.h                     |   96 +-
 include/exec/helper-head.h                    |   24 +-
 include/exec/helper-proto-common.h            |   17 +
 include/exec/helper-proto.h                   |   72 +-
 include/exec/helper-tcg.h                     |   75 -
 include/exec/plugin-gen.h                     |   28 +-
 include/exec/poison.h                         |    1 -
 include/exec/tlb-common.h                     |   56 +
 include/exec/translation-block.h              |  152 ++
 include/exec/translator.h                     |   24 +-
 include/exec/user/guest-base.h                |   12 +
 include/qemu/typedefs.h                       |    1 +
 include/tcg/debug-assert.h                    |   17 +
 include/tcg/helper-info.h                     |   64 +
 include/tcg/insn-start-words.h                |   17 +
 include/tcg/oversized-guest.h                 |   23 +
 include/tcg/tcg-ldst.h                        |   26 +-
 include/tcg/tcg-op-common.h                   |  996 +++++++++++++
 include/tcg/tcg-op-gvec-common.h              |  426 ++++++
 include/tcg/tcg-op-gvec.h                     |  444 +-----
 include/tcg/tcg-op.h                          | 1118 ++-------------
 include/tcg/tcg-opc.h                         |   41 +-
 include/tcg/tcg.h                             |  153 +-
 target/arm/tcg/translate.h                    |    5 +
 target/mips/tcg/translate.h                   |    5 +-
 target/ppc/cpu.h                              |    2 -
 target/sparc/cpu.h                            |    2 -
 tcg/aarch64/tcg-target-reg-bits.h             |   12 +
 tcg/aarch64/tcg-target.h                      |    1 -
 tcg/arm/tcg-target-reg-bits.h                 |   12 +
 tcg/arm/tcg-target.h                          |    1 -
 tcg/i386/tcg-target-reg-bits.h                |   16 +
 tcg/i386/tcg-target.h                         |    9 +-
 tcg/loongarch64/tcg-target-reg-bits.h         |   21 +
 tcg/loongarch64/tcg-target.h                  |   11 -
 tcg/mips/tcg-target-reg-bits.h                |   18 +
 tcg/mips/tcg-target.h                         |    9 -
 tcg/ppc/tcg-target-reg-bits.h                 |   16 +
 tcg/ppc/tcg-target.h                          |    6 -
 tcg/riscv/tcg-target-reg-bits.h               |   19 +
 tcg/riscv/tcg-target.h                        |   10 -
 tcg/s390x/tcg-target-reg-bits.h               |   17 +
 tcg/s390x/tcg-target.h                        |    1 -
 tcg/sparc64/tcg-target-reg-bits.h             |   12 +
 tcg/sparc64/tcg-target.h                      |    1 -
 tcg/tcg-internal.h                            |   47 +-
 tcg/tci/tcg-target-reg-bits.h                 |   18 +
 tcg/tci/tcg-target.h                          |    9 -
 accel/tcg/cpu-exec.c                          |    4 +-
 accel/tcg/cputlb.c                            |   43 +-
 accel/tcg/monitor.c                           |    1 +
 accel/tcg/perf.c                              |    8 +-
 accel/tcg/plugin-gen.c                        |   74 +-
 accel/tcg/tcg-accel-ops-mttcg.c               |    2 +-
 accel/tcg/tcg-accel-ops-rr.c                  |    2 +-
 accel/tcg/tcg-all.c                           |    1 +
 accel/tcg/tcg-runtime-gvec.c                  |    2 +-
 accel/tcg/tcg-runtime.c                       |    6 +-
 accel/tcg/translate-all.c                     |   58 +-
 accel/tcg/translator.c                        |  142 +-
 accel/tcg/user-exec.c                         |   31 +-
 disas.c => disas/disas.c                      |   22 +-
 linux-user/elfload.c                          |    5 +-
 target/alpha/translate.c                      |   18 +-
 target/arm/ptw.c                              |    8 +-
 target/arm/tcg/translate-a64.c                |   38 +-
 target/arm/tcg/translate-m-nocp.c             |    2 -
 target/arm/tcg/translate-mve.c                |    4 -
 target/arm/tcg/translate-neon.c               |    4 -
 target/arm/tcg/translate-sme.c                |    7 -
 target/arm/tcg/translate-sve.c                |   11 -
 target/arm/tcg/translate-vfp.c                |    7 +-
 target/arm/tcg/translate.c                    |   41 +-
 target/avr/cpu.c                              |    1 +
 target/avr/helper.c                           |    1 +
 target/avr/translate.c                        |    6 +-
 target/cris/translate.c                       |    8 +-
 target/hexagon/genptr.c                       |    1 +
 target/hexagon/translate.c                    |    7 +
 target/hppa/translate.c                       |   10 +-
 target/i386/helper.c                          |    3 +
 target/i386/tcg/translate.c                   |   57 +-
 target/loongarch/translate.c                  |    6 +-
 target/m68k/translate.c                       |    5 +-
 target/microblaze/translate.c                 |    6 +-
 target/mips/tcg/msa_translate.c               |    3 -
 target/mips/tcg/mxu_translate.c               |    2 -
 target/mips/tcg/octeon_translate.c            |    4 +-
 target/mips/tcg/rel6_translate.c              |    2 -
 target/mips/tcg/translate.c                   |   53 +-
 target/mips/tcg/translate_addr_const.c        |    1 -
 target/mips/tcg/tx79_translate.c              |    4 +-
 target/mips/tcg/vr54xx_translate.c            |    3 -
 target/nios2/translate.c                      |    6 +-
 target/openrisc/sys_helper.c                  |    1 +
 target/openrisc/translate.c                   |   13 +-
 target/ppc/translate.c                        |   17 +-
 target/riscv/cpu_helper.c                     |    1 +
 target/riscv/translate.c                      |    6 +-
 target/rx/cpu.c                               |    1 +
 target/rx/op_helper.c                         |    1 +
 target/rx/translate.c                         |    7 +-
 target/s390x/tcg/translate.c                  |   10 +-
 target/sh4/translate.c                        |    8 +-
 target/sparc/translate.c                      |   80 +-
 target/tricore/cpu.c                          |    1 +
 target/tricore/translate.c                    |    7 +-
 target/xtensa/translate.c                     |   31 +-
 tcg/optimize.c                                |   21 +-
 tcg/region.c                                  |   22 +-
 tcg/tcg-common.c                              |    2 +
 tcg/tcg-op-gvec.c                             |    6 +-
 tcg/tcg-op-ldst.c                             | 1259 +++++++++++++++++
 tcg/tcg-op-vec.c                              |    4 +-
 tcg/tcg-op.c                                  |  991 +------------
 tcg/tcg.c                                     |  359 +++--
 tcg/tci.c                                     |   96 +-
 MAINTAINERS                                   |    1 -
 accel/tcg/atomic_common.c.inc                 |   14 +-
 disas/meson.build                             |    4 +-
 include/exec/helper-gen.h.inc                 |  101 ++
 include/exec/helper-info.c.inc                |   95 ++
 include/exec/helper-proto.h.inc               |   67 +
 meson.build                                   |    3 -
 scripts/make-config-poison.sh                 |    5 +-
 target/hexagon/idef-parser/idef-parser.y      |    3 +-
 target/loongarch/insn_trans/trans_extra.c.inc |    4 +-
 .../insn_trans/trans_privileged.c.inc         |    4 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |   24 +-
 tcg/aarch64/tcg-target.c.inc                  |   80 +-
 tcg/arm/tcg-target.c.inc                      |  115 +-
 tcg/i386/tcg-target.c.inc                     |  120 +-
 tcg/loongarch64/tcg-target.c.inc              |   45 +-
 tcg/meson.build                               |   31 +-
 tcg/mips/tcg-target.c.inc                     |  112 +-
 tcg/ppc/tcg-target.c.inc                      |  151 +-
 tcg/riscv/tcg-target.c.inc                    |   47 +-
 tcg/s390x/tcg-target.c.inc                    |   62 +-
 tcg/sparc64/tcg-target.c.inc                  |   48 +-
 tcg/tci/tcg-target.c.inc                      |   53 +-
 148 files changed, 5143 insertions(+), 4284 deletions(-)
 delete mode 100644 include/exec/gen-icount.h
 create mode 100644 include/exec/helper-gen-common.h
 create mode 100644 include/exec/helper-proto-common.h
 delete mode 100644 include/exec/helper-tcg.h
 create mode 100644 include/exec/tlb-common.h
 create mode 100644 include/exec/translation-block.h
 create mode 100644 include/exec/user/guest-base.h
 create mode 100644 include/tcg/debug-assert.h
 create mode 100644 include/tcg/helper-info.h
 create mode 100644 include/tcg/insn-start-words.h
 create mode 100644 include/tcg/oversized-guest.h
 create mode 100644 include/tcg/tcg-op-common.h
 create mode 100644 include/tcg/tcg-op-gvec-common.h
 create mode 100644 tcg/aarch64/tcg-target-reg-bits.h
 create mode 100644 tcg/arm/tcg-target-reg-bits.h
 create mode 100644 tcg/i386/tcg-target-reg-bits.h
 create mode 100644 tcg/loongarch64/tcg-target-reg-bits.h
 create mode 100644 tcg/mips/tcg-target-reg-bits.h
 create mode 100644 tcg/ppc/tcg-target-reg-bits.h
 create mode 100644 tcg/riscv/tcg-target-reg-bits.h
 create mode 100644 tcg/s390x/tcg-target-reg-bits.h
 create mode 100644 tcg/sparc64/tcg-target-reg-bits.h
 create mode 100644 tcg/tci/tcg-target-reg-bits.h
 rename disas.c => disas/disas.c (95%)
 create mode 100644 tcg/tcg-op-ldst.c
 create mode 100644 include/exec/helper-gen.h.inc
 create mode 100644 include/exec/helper-info.c.inc
 create mode 100644 include/exec/helper-proto.h.inc

-- 
2.34.1


