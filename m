Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789516A283E
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:20:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqdh-0004Qm-Ss; Sat, 25 Feb 2023 04:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqda-0004L7-OY
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:39 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqdW-0001NS-Dl
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:14:38 -0500
Received: by mail-pj1-x1044.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so1555637pja.5
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nCcfgciwkNYLhvqmiM4sbtocENVF28QNNXJ/+qj0qxU=;
 b=Lo2S21/jNehyWF7g37yrIiQ6hPCX6zYrAI5xKvBaF5O/lHLZ9IXx+qEfoPKN5JKXXg
 lRqf327RF99/dTw1ObFU5bmoC9cl5Azr2EEQJlB/4XtYj14JaLfwZTPS8trDaG1ECDKY
 JCdWMrnpXGWX2eZtg/GDpScHgwbYszkHIEEWUyrxpA4LAHS/ARLstiXBmgVDzNJqBMWn
 ybgrS4mZNsLNhu3bbRCdr2hDpNwSZaO9mRJgu4Gq8C/EGMUi/jKBaYAh2i2Ih3cVX3PP
 iVvKwaYgFSufHv1VbR7oLd1NTEUh3ou3qQcDSOnjCyr8US65X8HxBSyKRb1qPxQA23d7
 9r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nCcfgciwkNYLhvqmiM4sbtocENVF28QNNXJ/+qj0qxU=;
 b=K9UlRJaGU/yqOc8mW0HqrbUxRTqrjOIAsmpmDnUTZZmU1q+1xqgBcLsjAZRIPXfJ8b
 7zy+Ze6zG+0cXz7FOKmW0Z1tQofxWn/f6UGqteCKJwE/SA1l4dANVfGYhnMzlCQhdsRS
 dIFf3R/9HnQ22kXqzdhMaqEH6rkU00N6vNLLhElwdgBu1SAY0PWCeMD72wSZQUK1FvaI
 3YnrFVejLEvFEU1yO33xrbL1DxhPXBGX/gOxsqpTOcZXPt3gDY0c9zXfpnt0qTGmh+MT
 5nV4ra9RjHEzfSfUXBb6BjX2mNNdAfq28aPNOxRPDNiO1xStHMUriEzWe6GPtx/9BoFO
 X9iQ==
X-Gm-Message-State: AO0yUKWnjbg82gvdnJxNk4Nac5lvXf4Ixl01HNEm9QNgqUoa2CQJyv3C
 4OsSPLM7EYNzNdpuMIDsTcBMNjKfcHyC8Z6rYENuDA==
X-Google-Smtp-Source: AK7set+Wsd5TV2gzwTdPu9UjDZR4h2Jz4DvyAT6pG9qpeUxRBaFzKdCGSoAgx+5GhNPeZNa8r69Naw==
X-Received: by 2002:a17:903:70c:b0:19c:be03:b4d7 with SMTP id
 kk12-20020a170903070c00b0019cbe03b4d7mr7058396plb.14.1677316472459; 
 Sat, 25 Feb 2023 01:14:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:14:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 00/76] tcg: Drop tcg_temp_free from translators
Date: Fri, 24 Feb 2023 23:13:11 -1000
Message-Id: <20230225091427.1817156-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Based-on: 20230225085945.1798188-1-richard.henderson@linaro.org
("[PATCH v3 00/30] tcg: Simplify temporary usage")

In the above patch set, we changed the lifetime of the temps
allocated by the guest translators, and eliminated their reuse,
so that we have the best chance of reducing their strength.

That we don't reuse them means that we gain nothing by freeing them.
Therefore, drop all mention of tcg_temp_free from target/.

This may be the most negative diffstat I've ever produced.  :-)

r~

Richard Henderson (76):
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
  target/cris: Drop tcg_temp_free from C code
  target/cris: Drop tcg_temp_free from gen_tcg_funcs.py
  target/hexagon/idef-parser: Drop tcg_temp_free
  target/hexagon/idef-parser: Drop HexValue.is_manual
  target/hppa: Drop tcg_temp_free
  target/i386: Drop tcg_temp_free
  target/loongarch: Drop temp_new
  target/loongarch: Drop tcg_temp_free
  target/m68k: Drop mark_to_release
  target/m68k: Drop free_cond
  target/m68k: Drop tcg_temp_free
  target/microblaze: Drop tcg_temp_free
  target/mips: Drop tcg_temp_free from micromips_translate.c.inc
  target/mips: Drop tcg_temp_free from mips16e_translate.c.inc
  target/mips: Drop tcg_temp_free from msa_translate.c
  target/mips: Drop tcg_temp_free from mxu_translate.c
  target/mips: Drop tcg_temp_free from nanomips_translate.c.inc
  target/mips: Drop tcg_temp_free from octeon_translate.c
  target/mips: Drop tcg_temp_free from translate_addr_const.c
  target/mips: Drop tcg_temp_free from tx79_translate.c
  target/mips: Fix trans_mult_acc return
  target/mips: Drop tcg_temp_free from vr54xx_translate.c
  target/mips: Drop tcg_temp_free from translate.c
  target/nios2: Drop tcg_temp_free
  target/openrisc: Drop tcg_temp_free
  target/ppc: Drop tcg_temp_free
  target/riscv: Drop ftemp_new
  target/riscv: Drop temp_new
  target/riscv: Drop tcg_temp_free
  target/rx: Drop tcg_temp_free
  target/s390x: Use tcg_constant_* in local contexts
  target/s390x: Use tcg_constant_* for DisasCompare
  target/s390x: Use tcg_constant_i32 for fpinst_extract_m34
  target/s390x: Use tcg_constant_* in translate_vx.c.inc
  target/s390x: Drop free_compare
  target/s390x: Drop tcg_temp_free from translate_vx.c.inc
  target/s390x: Drop tcg_temp_free from translate.c
  target/s390x: Remove assert vs g_in2
  target/s390x: Remove g_out, g_out2, g_in1, g_in2 from DisasContext
  target/sh4: Drop tcg_temp_free
  target/sparc: Drop get_temp_tl
  target/sparc: Drop get_temp_i32
  target/sparc: Remove egress label in disas_sparc_context
  target/sparc: Drop free_compare
  target/sparc: Drop tcg_temp_free
  target/tricore: Drop tcg_temp_free
  target/sparc: Drop reset_sar_tracker
  target/xtensa: Drop tcg_temp_free
  include/exec/gen-icount: Drop tcg_temp_free in gen_tb_start
  tracing: remove transform.py
  tcg: Create tcg/tcg-temp-internal.h
  docs/devel/tcg-ops: Drop recommendation to free temps

 docs/devel/tcg-ops.rst                        |   4 -
 target/hexagon/idef-parser/README.rst         |   8 -
 meson.build                                   |   1 -
 include/exec/gen-icount.h                     |   2 -
 include/exec/translator.h                     |   2 -
 include/tcg/tcg-temp-internal.h               |  83 +++
 include/tcg/tcg.h                             |  68 --
 target/arm/translate-a64.h                    |   2 -
 target/arm/translate.h                        |   7 -
 target/hexagon/gen_tcg.h                      |  29 -
 target/hexagon/gen_tcg_hvx.h                  |  15 -
 target/hexagon/idef-parser/idef-parser.h      |   1 -
 target/hexagon/idef-parser/parser-helpers.h   |   4 -
 target/hexagon/macros.h                       |   7 -
 target/loongarch/translate.h                  |   3 -
 accel/tcg/plugin-gen.c                        |   1 +
 accel/tcg/translator.c                        |  16 -
 target/alpha/translate.c                      |  71 --
 target/arm/translate-a64.c                    | 594 ++--------------
 target/arm/translate-m-nocp.c                 |  20 -
 target/arm/translate-mve.c                    |  52 --
 target/arm/translate-neon.c                   | 131 +---
 target/arm/translate-sme.c                    |  28 -
 target/arm/translate-sve.c                    | 206 +-----
 target/arm/translate-vfp.c                    | 193 -----
 target/arm/translate.c                        | 281 +-------
 target/avr/translate.c                        | 251 -------
 target/cris/translate.c                       | 113 ---
 target/hexagon/genptr.c                       |  58 --
 target/hexagon/idef-parser/parser-helpers.c   | 158 -----
 target/hexagon/translate.c                    |   7 -
 target/hppa/translate.c                       |  93 +--
 target/i386/tcg/translate.c                   |  41 --
 target/loongarch/translate.c                  |  21 +-
 target/m68k/translate.c                       | 276 +-------
 target/microblaze/translate.c                 |  54 --
 target/mips/tcg/msa_translate.c               |   9 -
 target/mips/tcg/mxu_translate.c               |  51 --
 target/mips/tcg/octeon_translate.c            |  23 -
 target/mips/tcg/translate.c                   | 537 +-------------
 target/mips/tcg/translate_addr_const.c        |   7 -
 target/mips/tcg/tx79_translate.c              |  41 --
 target/mips/tcg/vr54xx_translate.c            |   6 +-
 target/nios2/translate.c                      |  15 -
 target/openrisc/translate.c                   |  39 -
 target/ppc/translate.c                        | 285 --------
 target/riscv/translate.c                      |  61 +-
 target/rx/translate.c                         |  84 ---
 target/s390x/tcg/translate.c                  | 668 +++++-------------
 target/sh4/translate.c                        | 110 ---
 target/sparc/translate.c                      | 259 +------
 target/tricore/translate.c                    | 540 +-------------
 target/xtensa/translate.c                     | 121 +---
 tcg/tcg-op-gvec.c                             |   1 +
 tcg/tcg-op-vec.c                              |   1 +
 tcg/tcg-op.c                                  |   1 +
 tcg/tcg.c                                     |  55 +-
 target/cris/translate_v10.c.inc               |  49 +-
 target/i386/tcg/decode-new.c.inc              |  15 -
 target/i386/tcg/emit.c.inc                    |   6 -
 target/loongarch/insn_trans/trans_arith.c.inc |  12 -
 .../loongarch/insn_trans/trans_atomic.c.inc   |   3 -
 target/loongarch/insn_trans/trans_bit.c.inc   |  12 -
 target/loongarch/insn_trans/trans_fcmp.c.inc  |   3 -
 .../loongarch/insn_trans/trans_fmemory.c.inc  |  20 +-
 target/loongarch/insn_trans/trans_fmov.c.inc  |   6 -
 .../loongarch/insn_trans/trans_memory.c.inc   |  34 +-
 .../insn_trans/trans_privileged.c.inc         |   6 +-
 target/loongarch/insn_trans/trans_shift.c.inc |  11 -
 target/mips/tcg/micromips_translate.c.inc     |   8 -
 target/mips/tcg/mips16e_translate.c.inc       |   6 -
 target/mips/tcg/nanomips_translate.c.inc      | 127 +---
 target/ppc/power8-pmu-regs.c.inc              |  16 -
 target/ppc/translate/dfp-impl.c.inc           |  20 -
 target/ppc/translate/fixedpoint-impl.c.inc    |  16 -
 target/ppc/translate/fp-impl.c.inc            | 122 +---
 target/ppc/translate/spe-impl.c.inc           |  59 --
 target/ppc/translate/storage-ctrl-impl.c.inc  |   2 -
 target/ppc/translate/vmx-impl.c.inc           | 296 +-------
 target/ppc/translate/vsx-impl.c.inc           | 287 +-------
 target/riscv/insn_trans/trans_rvb.c.inc       |  24 -
 target/riscv/insn_trans/trans_rvd.c.inc       |   2 -
 target/riscv/insn_trans/trans_rvf.c.inc       |   9 -
 target/riscv/insn_trans/trans_rvi.c.inc       |  37 -
 target/riscv/insn_trans/trans_rvk.c.inc       |  15 -
 target/riscv/insn_trans/trans_rvm.c.inc       |  33 -
 target/riscv/insn_trans/trans_rvv.c.inc       |  55 --
 target/riscv/insn_trans/trans_rvzfh.c.inc     |  12 +-
 target/riscv/insn_trans/trans_xthead.c.inc    |  24 +-
 target/s390x/tcg/translate_vx.c.inc           | 188 +----
 scripts/tracetool/transform.py                | 168 -----
 target/hexagon/README                         |   5 -
 target/hexagon/gen_tcg_funcs.py               |  79 +--
 target/hexagon/idef-parser/idef-parser.y      |  12 -
 94 files changed, 471 insertions(+), 7143 deletions(-)
 create mode 100644 include/tcg/tcg-temp-internal.h
 delete mode 100644 scripts/tracetool/transform.py

-- 
2.34.1


