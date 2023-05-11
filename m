Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A46FF7AC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:44:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px9OO-00077v-SK; Thu, 11 May 2023 12:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9OM-00077P-An
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:43:46 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px9OJ-0007nd-S6
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:43:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-307c040797bso1353504f8f.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683823422; x=1686415422;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXtD3inAgDJifVEgOPhb5CqhXIwlr8yXWt86c35ecCg=;
 b=C2Mvuo25qpWbU/wP54tAI1wknnGDqKdwVMxLlP7JrWjhZN+3affFIPs01aulbcriK0
 CoAzrlT1/1KQFqLFVV2AgE9XOYXywwO4r+ke8KYVCraQofWQDBEjlJvlieo0yZO0xHeo
 0WSxPgMLnXuPPzUUk5WOf95beAGuW5BfVsVtbomPs2OaGdGduxSaz3dUBHYSViBU8j0I
 T2h01CGrA+E2T+a6UnLif3jNaIApkrjpJksSMwdRnsn0BmUo9b/QDM5vIMLMLIZhc9gY
 /xyO1DHK6wNGmxjhILEEHwvrZDfmhkkF4vw8ilPCFtnI+gNu5NyllrLQgz+2O5+NTkhY
 VNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683823422; x=1686415422;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JXtD3inAgDJifVEgOPhb5CqhXIwlr8yXWt86c35ecCg=;
 b=GPm2ZeYBnubDfG9qisJ0cxx/IP7bfWALMHl2UFrWN50jGl5/0D/WOs6ygheGwFa5JK
 LIuE2Ro+6JSgilZ84s/rRTZ6NjJrWn9Zy3EhKmnUwQ1N+8k72q84tErodDQlPdq00knN
 aKma1ueu5z60P1eSPRWbOUkEWYtav7tHgsZKVcDRU8JOBCiG7xOvXqnpgBFJ8Odq4dEV
 l+EuSBiWp/qPml1xU13E7nCWOno6uZfO+xzeOQnFMaMkgUvGTbx2zBxNajnPmzPQTYkN
 bZ9IbCbRsQGyZiwKX0k+VB0pR2DefGnVFxPcI/8DhfgcJ4Ycl184H0Mzlwzbb/65xh5P
 9dow==
X-Gm-Message-State: AC+VfDzjaMbNPZ4pQkXSBIXt6xEqoLREAzAJnVF2zmmkJpZFiqxRZhqt
 ORje0lf6o3bXHuVeQM5jnWD9fQ==
X-Google-Smtp-Source: ACHHUZ5gakaah3u4o9lYnulWYeK0r/j9kAQI6aBzqjfpreFg0EqihFWIquoVXCnNcrZtCpTFjByAeg==
X-Received: by 2002:a05:6000:18cd:b0:306:2841:7abb with SMTP id
 w13-20020a05600018cd00b0030628417abbmr13710417wrq.20.1683823422049; 
 Thu, 11 May 2023 09:43:42 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r13-20020adfe68d000000b003012030a0c6sm20762734wrm.18.2023.05.11.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 09:43:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FC291FFBB;
 Thu, 11 May 2023 17:43:41 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [RESEND PATCH 00/84] tcg: Build once for system, once for user
Date: Thu, 11 May 2023 17:42:46 +0100
In-reply-to: <20230503072331.1747057-1-richard.henderson@linaro.org>
Message-ID: <87jzxezuma.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Based-on: 20230503070656.1746170-1-richard.henderson@linaro.org
> ("[PATCH v4 00/57] tcg: Improve atomicity support")
>
> and also
>
> Based-on: 20230502160846.1289975-1-richard.henderson@linaro.org
> ("[PATCH 00/16] tcg: Remove TARGET_ALIGNED_ONLY")
>
> The goal here is only tcg/, leaving accel/tcg/ for future work.

On clang-user:

  TEST    cdsg on s390x
/builds/stsquad/qemu/tcg/i386/tcg-target.c.inc:2176:17: runtime error: exec=
ution reached an unreachable program point
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior /builds/stsquad/qem=
u/tcg/i386/tcg-target.c.inc:2176:17 in=20
make[1]: *** [Makefile:174: run-cdsg] Error 1
make: *** [/builds/stsquad/qemu/tests/Makefile.include:56: run-tcg-tests-s3=
90x-linux-user] Error 2
make: *** Waiting for unfinished jobs....

which is:

    case MO_128:
        {
            TCGLabel *l1 =3D NULL, *l2 =3D NULL;
            bool use_pair =3D h.align < MO_128;

            tcg_debug_assert(TCG_TARGET_REG_BITS =3D=3D 64);

            if (!use_pair) {
                tcg_debug_assert(!use_movbe);
                /*
                 * Atomicity requires that we use use VMOVDQA.
                 * If we've already checked for 16-byte alignment, that's a=
ll
                 * we need.  If we arrive here with lesser alignment, then =
we
                 * have determined that less than 16-byte alignment can be
                 * satisfied with two 8-byte loads.
                 */

So possibly the atomic prereq in the tree?

>
>
> r~
>
>
> Richard Henderson (84):
>   tcg: Split out memory ops to tcg-op-ldst.c
>   tcg: Widen gen_insn_data to uint64_t
>   accel/tcg: Widen tcg-ldst.h addresses to uint64_t
>   tcg: Widen helper_{ld,st}_i128 addresses to uint64_t
>   tcg: Widen helper_atomic_* addresses to uint64_t
>   tcg: Widen tcg_gen_code pc_start argument to uint64_t
>   accel/tcg: Merge gen_mem_wrapped with plugin_gen_empty_mem_callback
>   accel/tcg: Merge do_gen_mem_cb into caller
>   tcg: Reduce copies for plugin_gen_mem_callbacks
>   accel/tcg: Widen plugin_gen_empty_mem_callback to i64
>   tcg: Add addr_type to TCGContext
>   tcg: Remove TCGv from tcg_gen_qemu_{ld,st}_*
>   tcg: Remove TCGv from tcg_gen_atomic_*
>   tcg: Split INDEX_op_qemu_{ld,st}* for guest address size
>   tcg/tci: Elimnate TARGET_LONG_BITS, target_ulong
>   tcg/i386: Always enable TCG_TARGET_HAS_extr[lh]_i64_i32
>   tcg/i386: Conditionalize tcg_out_extu_i32_i64
>   tcg/i386: Adjust type of tlb_mask
>   tcg/i386: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg/arm: Remove TARGET_LONG_BITS
>   tcg/aarch64: Remove USE_GUEST_BASE
>   tcg/aarch64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg/loongarch64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg/mips: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg/ppc: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg/riscv: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg/s390x: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg/sparc64: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg: Remove TARGET_LONG_BITS, TCG_TYPE_TL
>   tcg: Move TCG_TYPE_TL from tcg.h to tcg-op.h
>   tcg: Add page_bits and page_mask to TCGContext
>   tcg: Add tlb_dyn_max_bits to TCGContext
>   tcg: Widen CPUTLBEntry comparators to 64-bits
>   tcg: Add tlb_fast_offset to TCGContext
>   tcg: Remove TCG_TARGET_TLB_DISPLACEMENT_BITS
>   tcg: Split out tcg/debug-assert.h
>   *: Add missing includes of qemu/error-report.h
>   *: Add missing includes of tcg/debug-assert.h
>   *: Add missing includes of tcg/tcg.h
>   tcg: Split out tcg-target-reg-bits.h
>   target/arm: Fix test of TCG_OVERSIZED_GUEST
>   tcg: Split out tcg/oversized-guest.h
>   tcg: Move TCGv, dup_const_tl definitions to tcg-op.h
>   tcg: Split tcg/tcg-op-common.h from tcg/tcg-op.h
>   target/arm: Include helper-gen.h in translator.h
>   target/hexagon: Include helper-gen.h where needed
>   tcg: Remove outdated comments in helper-head.h
>   tcg: Move TCGHelperInfo and dependencies to tcg/helper-info.h
>   tcg: Pass TCGHelperInfo to tcg_gen_callN
>   tcg: Move temp_idx and tcgv_i32_temp debug out of line
>   tcg: Split tcg_gen_callN
>   tcg: Split helper-gen.h
>   tcg: Split helper-proto.h
>   tcg: Add insn_start_words to TCGContext
>   tcg: Add guest_mo to TCGContext
>   tcg: Move TLB_FLAGS_MASK check out of get_alignment_bits
>   tcg: Split tcg/tcg-op-gvec.h
>   tcg: Remove NO_CPU_IO_DEFS
>   exec-all: Widen tb_page_addr_t for user-only
>   exec-all: Widen TranslationBlock pc and cs_base to 64-bits
>   tcg: Remove DEBUG_DISAS
>   tcg: Remove USE_TCG_OPTIMIZATIONS
>   tcg: Spit out exec/translation-block.h
>   include/exec: Remove CODE_GEN_AVG_BLOCK_SIZE
>   accel/tcg: Move most of gen-icount.h into translator.c
>   accel/tcg: Introduce translator_io_start
>   accel/tcg: Move translator_fake_ldb out of line
>   target/arm: Tidy helpers for translation
>   target/mips: Tidy helpers for translation
>   *: Add missing includes of exec/translation-block.h
>   *: Add missing includes of exec/exec-all.h
>   accel/tcg: Tidy includes for translator.[ch]
>   tcg: Define IN_TCG
>   tcg: Fix PAGE/PROT confusion
>   tcg: Move env defines out of NEED_CPU_H in helper-head.h
>   tcg: Remove target-specific headers from tcg.[ch]
>   plugins: Move plugin_insn_append to translator.c
>   plugins: Drop unused headers from exec/plugin-gen.h
>   disas: Move disas.c to disas/
>   disas: Remove target_ulong from the interface
>   tcg: Split out exec/user/guest-base.h
>   disas: Remove target-specific headers
>   exec/poison: Do not poison CONFIG_SOFTMMU
>   tcg: Build once for system and once for user-only
>
>  accel/tcg/tcg-runtime.h                       |   50 +-
>  include/disas/disas.h                         |   23 +-
>  include/exec/cpu-all.h                        |    8 +-
>  include/exec/cpu-defs.h                       |   50 +-
>  include/exec/cpu_ldst.h                       |   22 +-
>  include/exec/exec-all.h                       |  148 +-
>  include/exec/gen-icount.h                     |   83 --
>  include/exec/helper-gen-common.h              |   17 +
>  include/exec/helper-gen.h                     |   96 +-
>  include/exec/helper-head.h                    |   24 +-
>  include/exec/helper-proto-common.h            |   17 +
>  include/exec/helper-proto.h                   |   72 +-
>  include/exec/helper-tcg.h                     |   75 -
>  include/exec/plugin-gen.h                     |   28 +-
>  include/exec/poison.h                         |    1 -
>  include/exec/tlb-common.h                     |   56 +
>  include/exec/translation-block.h              |  152 ++
>  include/exec/translator.h                     |   24 +-
>  include/exec/user/guest-base.h                |   12 +
>  include/qemu/typedefs.h                       |    1 +
>  include/tcg/debug-assert.h                    |   17 +
>  include/tcg/helper-info.h                     |   64 +
>  include/tcg/insn-start-words.h                |   17 +
>  include/tcg/oversized-guest.h                 |   23 +
>  include/tcg/tcg-ldst.h                        |   26 +-
>  include/tcg/tcg-op-common.h                   |  996 +++++++++++++
>  include/tcg/tcg-op-gvec-common.h              |  426 ++++++
>  include/tcg/tcg-op-gvec.h                     |  444 +-----
>  include/tcg/tcg-op.h                          | 1118 ++-------------
>  include/tcg/tcg-opc.h                         |   41 +-
>  include/tcg/tcg.h                             |  153 +-
>  target/arm/tcg/translate.h                    |    5 +
>  target/mips/tcg/translate.h                   |    5 +-
>  target/ppc/cpu.h                              |    2 -
>  target/sparc/cpu.h                            |    2 -
>  tcg/aarch64/tcg-target-reg-bits.h             |   12 +
>  tcg/aarch64/tcg-target.h                      |    1 -
>  tcg/arm/tcg-target-reg-bits.h                 |   12 +
>  tcg/arm/tcg-target.h                          |    1 -
>  tcg/i386/tcg-target-reg-bits.h                |   16 +
>  tcg/i386/tcg-target.h                         |    9 +-
>  tcg/loongarch64/tcg-target-reg-bits.h         |   21 +
>  tcg/loongarch64/tcg-target.h                  |   11 -
>  tcg/mips/tcg-target-reg-bits.h                |   18 +
>  tcg/mips/tcg-target.h                         |    9 -
>  tcg/ppc/tcg-target-reg-bits.h                 |   16 +
>  tcg/ppc/tcg-target.h                          |    6 -
>  tcg/riscv/tcg-target-reg-bits.h               |   19 +
>  tcg/riscv/tcg-target.h                        |   10 -
>  tcg/s390x/tcg-target-reg-bits.h               |   17 +
>  tcg/s390x/tcg-target.h                        |    1 -
>  tcg/sparc64/tcg-target-reg-bits.h             |   12 +
>  tcg/sparc64/tcg-target.h                      |    1 -
>  tcg/tcg-internal.h                            |   47 +-
>  tcg/tci/tcg-target-reg-bits.h                 |   18 +
>  tcg/tci/tcg-target.h                          |    9 -
>  accel/tcg/cpu-exec.c                          |    4 +-
>  accel/tcg/cputlb.c                            |   43 +-
>  accel/tcg/monitor.c                           |    1 +
>  accel/tcg/perf.c                              |    8 +-
>  accel/tcg/plugin-gen.c                        |   74 +-
>  accel/tcg/tcg-accel-ops-mttcg.c               |    2 +-
>  accel/tcg/tcg-accel-ops-rr.c                  |    2 +-
>  accel/tcg/tcg-all.c                           |    1 +
>  accel/tcg/tcg-runtime-gvec.c                  |    2 +-
>  accel/tcg/tcg-runtime.c                       |    6 +-
>  accel/tcg/translate-all.c                     |   58 +-
>  accel/tcg/translator.c                        |  142 +-
>  accel/tcg/user-exec.c                         |   31 +-
>  disas.c =3D> disas/disas.c                      |   22 +-
>  linux-user/elfload.c                          |    5 +-
>  target/alpha/translate.c                      |   18 +-
>  target/arm/ptw.c                              |    8 +-
>  target/arm/tcg/translate-a64.c                |   38 +-
>  target/arm/tcg/translate-m-nocp.c             |    2 -
>  target/arm/tcg/translate-mve.c                |    4 -
>  target/arm/tcg/translate-neon.c               |    4 -
>  target/arm/tcg/translate-sme.c                |    7 -
>  target/arm/tcg/translate-sve.c                |   11 -
>  target/arm/tcg/translate-vfp.c                |    7 +-
>  target/arm/tcg/translate.c                    |   41 +-
>  target/avr/cpu.c                              |    1 +
>  target/avr/helper.c                           |    1 +
>  target/avr/translate.c                        |    6 +-
>  target/cris/translate.c                       |    8 +-
>  target/hexagon/genptr.c                       |    1 +
>  target/hexagon/translate.c                    |    7 +
>  target/hppa/translate.c                       |   10 +-
>  target/i386/helper.c                          |    3 +
>  target/i386/tcg/translate.c                   |   57 +-
>  target/loongarch/translate.c                  |    6 +-
>  target/m68k/translate.c                       |    5 +-
>  target/microblaze/translate.c                 |    6 +-
>  target/mips/tcg/msa_translate.c               |    3 -
>  target/mips/tcg/mxu_translate.c               |    2 -
>  target/mips/tcg/octeon_translate.c            |    4 +-
>  target/mips/tcg/rel6_translate.c              |    2 -
>  target/mips/tcg/translate.c                   |   53 +-
>  target/mips/tcg/translate_addr_const.c        |    1 -
>  target/mips/tcg/tx79_translate.c              |    4 +-
>  target/mips/tcg/vr54xx_translate.c            |    3 -
>  target/nios2/translate.c                      |    6 +-
>  target/openrisc/sys_helper.c                  |    1 +
>  target/openrisc/translate.c                   |   13 +-
>  target/ppc/translate.c                        |   17 +-
>  target/riscv/cpu_helper.c                     |    1 +
>  target/riscv/translate.c                      |    6 +-
>  target/rx/cpu.c                               |    1 +
>  target/rx/op_helper.c                         |    1 +
>  target/rx/translate.c                         |    7 +-
>  target/s390x/tcg/translate.c                  |   10 +-
>  target/sh4/translate.c                        |    8 +-
>  target/sparc/translate.c                      |   80 +-
>  target/tricore/cpu.c                          |    1 +
>  target/tricore/translate.c                    |    7 +-
>  target/xtensa/translate.c                     |   31 +-
>  tcg/optimize.c                                |   21 +-
>  tcg/region.c                                  |   22 +-
>  tcg/tcg-common.c                              |    2 +
>  tcg/tcg-op-gvec.c                             |    6 +-
>  tcg/tcg-op-ldst.c                             | 1259 +++++++++++++++++
>  tcg/tcg-op-vec.c                              |    4 +-
>  tcg/tcg-op.c                                  |  991 +------------
>  tcg/tcg.c                                     |  359 +++--
>  tcg/tci.c                                     |   96 +-
>  MAINTAINERS                                   |    1 -
>  accel/tcg/atomic_common.c.inc                 |   14 +-
>  disas/meson.build                             |    4 +-
>  include/exec/helper-gen.h.inc                 |  101 ++
>  include/exec/helper-info.c.inc                |   95 ++
>  include/exec/helper-proto.h.inc               |   67 +
>  meson.build                                   |    3 -
>  scripts/make-config-poison.sh                 |    5 +-
>  target/hexagon/idef-parser/idef-parser.y      |    3 +-
>  target/loongarch/insn_trans/trans_extra.c.inc |    4 +-
>  .../insn_trans/trans_privileged.c.inc         |    4 +-
>  target/riscv/insn_trans/trans_rvi.c.inc       |   24 +-
>  tcg/aarch64/tcg-target.c.inc                  |   80 +-
>  tcg/arm/tcg-target.c.inc                      |  115 +-
>  tcg/i386/tcg-target.c.inc                     |  120 +-
>  tcg/loongarch64/tcg-target.c.inc              |   45 +-
>  tcg/meson.build                               |   31 +-
>  tcg/mips/tcg-target.c.inc                     |  112 +-
>  tcg/ppc/tcg-target.c.inc                      |  151 +-
>  tcg/riscv/tcg-target.c.inc                    |   47 +-
>  tcg/s390x/tcg-target.c.inc                    |   62 +-
>  tcg/sparc64/tcg-target.c.inc                  |   48 +-
>  tcg/tci/tcg-target.c.inc                      |   53 +-
>  148 files changed, 5143 insertions(+), 4284 deletions(-)
>  delete mode 100644 include/exec/gen-icount.h
>  create mode 100644 include/exec/helper-gen-common.h
>  create mode 100644 include/exec/helper-proto-common.h
>  delete mode 100644 include/exec/helper-tcg.h
>  create mode 100644 include/exec/tlb-common.h
>  create mode 100644 include/exec/translation-block.h
>  create mode 100644 include/exec/user/guest-base.h
>  create mode 100644 include/tcg/debug-assert.h
>  create mode 100644 include/tcg/helper-info.h
>  create mode 100644 include/tcg/insn-start-words.h
>  create mode 100644 include/tcg/oversized-guest.h
>  create mode 100644 include/tcg/tcg-op-common.h
>  create mode 100644 include/tcg/tcg-op-gvec-common.h
>  create mode 100644 tcg/aarch64/tcg-target-reg-bits.h
>  create mode 100644 tcg/arm/tcg-target-reg-bits.h
>  create mode 100644 tcg/i386/tcg-target-reg-bits.h
>  create mode 100644 tcg/loongarch64/tcg-target-reg-bits.h
>  create mode 100644 tcg/mips/tcg-target-reg-bits.h
>  create mode 100644 tcg/ppc/tcg-target-reg-bits.h
>  create mode 100644 tcg/riscv/tcg-target-reg-bits.h
>  create mode 100644 tcg/s390x/tcg-target-reg-bits.h
>  create mode 100644 tcg/sparc64/tcg-target-reg-bits.h
>  create mode 100644 tcg/tci/tcg-target-reg-bits.h
>  rename disas.c =3D> disas/disas.c (95%)
>  create mode 100644 tcg/tcg-op-ldst.c
>  create mode 100644 include/exec/helper-gen.h.inc
>  create mode 100644 include/exec/helper-info.c.inc
>  create mode 100644 include/exec/helper-proto.h.inc


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

