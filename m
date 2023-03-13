Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E66B8150
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 20:00:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbnO9-0001dZ-Pr; Mon, 13 Mar 2023 14:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbnO2-0001bw-T1
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:59:11 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pbnO0-0003Wf-Ok
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 14:59:10 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 c184-20020a4a4fc1000000b005250b2dc0easo1984468oob.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 11:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678733945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ohjgo0koj7MCh16y6iVVUmzoWjOXJ2GkUbURJF+vsnI=;
 b=z5X07LkSvFxjmOid3VGLNsaOso5qAQOGjMnRxSHgSrVYGvUfWjSF+YMijZfYO8EhFb
 5TeLdr79Ii4nJU1wqeWTCpUsrMLUGkO8OpPb+TvI1av/a6xJH7cbN7umHVvVFcSwRR4P
 gAvoO624mPbkNaDDrd+qmPum6/Uh7ixtczKD1rIpaKEPhKpdyCIhliHUkxWvoUvtl33G
 UWrB/ioCNnMF+bFK99/in5QiNbR7Sq/VDzlXX+TRu6Ucf2yHKbHUNuSYnP7XY0o5b/ra
 98piHrwwZJXl3+Eg6qQEBT4ZoYIrksPgbG5islwuyJWQX2H5tG5gDPK9N0pt/Q4g0T3z
 Bjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678733945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ohjgo0koj7MCh16y6iVVUmzoWjOXJ2GkUbURJF+vsnI=;
 b=58uSdEynxY+qHDgNMQztfPxaMjz5pYzdXyGfam/0c5iYgSNHQUiML9xlSAZC9TM1Gh
 fcYj25CXY4PldrWSMgElf4CRcNeFabrtPgKLr3E1+LQldAX2l5l1OA1lkii2PgSMN/++
 LiHMMOHh17ZOrd3Zww5h7bPpwco7rV2t5XlfrZz9KSolzDTrrP6wEkCb6f7MAyweBGD6
 W2P+kZnHWY9KxY9uQJeLldO9uVOxwpNbewxR9tZ64WXhBvDipY870uytnNN8x1z5q0Tq
 rsVdKqfaF2ra+V66cDJPelfp8jN6ZrrzYrJcjyFtP7IRpm6nZkLYK0UAjTQIvjTKU+G7
 beSQ==
X-Gm-Message-State: AO0yUKV8gj60gkYCm4HjnwjGxKgIHO/3mE87eslpFAOLJfKGzcI1jDGi
 c3AHs+N18YmcQcpSviE51Jas5QaXd0ug2xSk7l4=
X-Google-Smtp-Source: AK7set/6J3xC84c96baH+v39H3l3DYATW60w82K6cSimWX3ZkBP91/g/NUkk0DGMH9u0+grcn6b9Uw==
X-Received: by 2002:a05:6820:150e:b0:525:7eaf:2084 with SMTP id
 ay14-20020a056820150e00b005257eaf2084mr18129072oob.2.1678733945626; 
 Mon, 13 Mar 2023 11:59:05 -0700 (PDT)
Received: from stoup.. ([50.232.40.61]) by smtp.gmail.com with ESMTPSA id
 i30-20020a4a6f5e000000b00525ccc4caadsm245044oof.4.2023.03.13.11.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 11:59:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v3 00/91] tcg patch queue
Date: Mon, 13 Mar 2023 11:59:02 -0700
Message-Id: <20230313185903.400351-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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

Version 3 fixes a rebase error from v2 affecting ARM BFC insn.


r~


The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:

  Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230313

for you to fetch changes up to 0c8b6b9a6383e2e37ff3d1d12b40c58b7ed36c1c:

  tcg: Drop tcg_const_* (2023-03-13 07:03:39 -0700)

----------------------------------------------------------------
accel/tcg: Fix NB_MMU_MODES to 16
Balance of the target/ patchset which eliminates tcg_temp_free
Balance of the target/ patchset which eliminates tcg_const

----------------------------------------------------------------
Anton Johansson (23):
      include/exec: Set default `NB_MMU_MODES` to 16
      target/alpha: Remove `NB_MMU_MODES` define
      target/arm: Remove `NB_MMU_MODES` define
      target/avr: Remove `NB_MMU_MODES` define
      target/cris: Remove `NB_MMU_MODES` define
      target/hexagon: Remove `NB_MMU_MODES` define
      target/hppa: Remove `NB_MMU_MODES` define
      target/i386: Remove `NB_MMU_MODES` define
      target/loongarch: Remove `NB_MMU_MODES` define
      target/m68k: Remove `NB_MMU_MODES` define
      target/microblaze: Remove `NB_MMU_MODES` define
      target/mips: Remove `NB_MMU_MODES` define
      target/nios2: Remove `NB_MMU_MODES` define
      target/openrisc: Remove `NB_MMU_MODES` define
      target/ppc: Remove `NB_MMU_MODES` define
      target/riscv: Remove `NB_MMU_MODES` define
      target/rx: Remove `NB_MMU_MODES` define
      target/s390x: Remove `NB_MMU_MODES` define
      target/sh4: Remove `NB_MMU_MODES` define
      target/sparc: Remove `NB_MMU_MODES` define
      target/tricore: Remove `NB_MMU_MODES` define
      target/xtensa: Remove `NB_MMU_MODES` define
      include/exec: Remove guards around `NB_MMU_MODES`

Richard Henderson (68):
      target/mips: Drop tcg_temp_free from micromips_translate.c.inc
      target/mips: Drop tcg_temp_free from msa_translate.c
      target/mips: Drop tcg_temp_free from mxu_translate.c
      target/mips: Drop tcg_temp_free from nanomips_translate.c.inc
      target/mips: Drop tcg_temp_free from octeon_translate.c
      target/mips: Drop tcg_temp_free from translate_addr_const.c
      target/mips: Drop tcg_temp_free from tx79_translate.c
      target/mips: Drop tcg_temp_free from vr54xx_translate.c
      target/mips: Drop tcg_temp_free from translate.c
      target/s390x: Drop free_compare
      target/s390x: Drop tcg_temp_free from translate_vx.c.inc
      target/s390x: Drop tcg_temp_free from translate.c
      target/s390x: Remove assert vs g_in2
      target/s390x: Remove g_out, g_out2, g_in1, g_in2 from DisasContext
      tcg: Create tcg/tcg-temp-internal.h
      target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
      target/avr: Avoid use of tcg_const_i32 throughout
      target/cris: Avoid use of tcg_const_i32 throughout
      target/hppa: Avoid tcg_const_i64 in trans_fid_f
      target/hppa: Avoid use of tcg_const_i32 throughout
      target/i386: Avoid use of tcg_const_* throughout
      target/m68k: Avoid tcg_const_i32 when modified
      target/m68k: Avoid tcg_const_i32 in bfop_reg
      target/m68k: Avoid tcg_const_* throughout
      target/mips: Split out gen_lxl
      target/mips: Split out gen_lxr
      target/mips: Avoid tcg_const_tl in gen_r6_ld
      target/mips: Avoid tcg_const_* throughout
      target/ppc: Split out gen_vx_vmul10
      target/ppc: Avoid tcg_const_i64 in do_vector_shift_quad
      target/rx: Use tcg_gen_abs_i32
      target/rx: Use cpu_psw_z as temp in flags computation
      target/rx: Avoid tcg_const_i32 when new temp needed
      target/rx: Avoid tcg_const_i32
      target/s390x: Avoid tcg_const_i64
      target/sh4: Avoid tcg_const_i32 for TAS.B
      target/sh4: Avoid tcg_const_i32
      tcg/sparc: Avoid tcg_const_tl in gen_edge
      target/tricore: Split t_n as constant from temp as variable
      target/tricore: Rename t_off10 and use tcg_constant_i32
      target/tricore: Use setcondi instead of explicit allocation
      target/tricore: Drop some temp initialization
      target/tricore: Avoid tcg_const_i32
      tcg: Replace tcg_const_i64 in tcg-op.c
      target/arm: Use rmode >= 0 for need_rmode
      target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
      target/arm: Improve arm_rmode_to_sf
      target/arm: Consistently use ARMFPRounding during translation
      target/arm: Create gen_set_rmode, gen_restore_rmode
      target/arm: Improve trans_BFCI
      target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
      target/arm: Avoid tcg_const_* in translate-mve.c
      target/arm: Avoid tcg_const_ptr in disas_simd_zip_trn
      target/arm: Avoid tcg_const_ptr in handle_vec_simd_sqshrn
      target/arm: Avoid tcg_const_ptr in handle_rev
      target/m68k: Use tcg_constant_i32 in gen_ea_mode
      target/ppc: Avoid tcg_const_i64 in do_vcntmb
      target/ppc: Avoid tcg_const_* in vmx-impl.c.inc
      target/ppc: Avoid tcg_const_* in xxeval
      target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
      target/ppc: Avoid tcg_const_* in fp-impl.c.inc
      target/ppc: Avoid tcg_const_* in power8-pmu-regs.c.inc
      target/ppc: Rewrite trans_ADDG6S
      target/ppc: Fix gen_tlbsx_booke206
      target/ppc: Avoid tcg_const_* in translate.c
      target/tricore: Use min/max for saturate
      tcg: Drop tcg_const_*_vec
      tcg: Drop tcg_const_*

 include/exec/cpu-defs.h                    |   9 +-
 include/tcg/tcg-op.h                       |   4 -
 include/tcg/tcg-temp-internal.h            |  83 +++
 include/tcg/tcg.h                          |  64 ---
 target/alpha/cpu-param.h                   |   2 -
 target/arm/cpu-param.h                     |   2 -
 target/arm/internals.h                     |  12 +-
 target/arm/tcg/translate.h                 |  17 +
 target/avr/cpu-param.h                     |   1 -
 target/cris/cpu-param.h                    |   1 -
 target/hexagon/cpu-param.h                 |   2 -
 target/hppa/cpu-param.h                    |   1 -
 target/i386/cpu-param.h                    |   1 -
 target/loongarch/cpu-param.h               |   1 -
 target/m68k/cpu-param.h                    |   1 -
 target/microblaze/cpu-param.h              |   1 -
 target/microblaze/cpu.h                    |   2 +-
 target/mips/cpu-param.h                    |   1 -
 target/nios2/cpu-param.h                   |   1 -
 target/openrisc/cpu-param.h                |   1 -
 target/ppc/cpu-param.h                     |   1 -
 target/riscv/cpu-param.h                   |   1 -
 target/rx/cpu-param.h                      |   2 -
 target/s390x/cpu-param.h                   |   1 -
 target/sh4/cpu-param.h                     |   1 -
 target/sparc/cpu-param.h                   |   2 -
 target/tricore/cpu-param.h                 |   1 -
 target/xtensa/cpu-param.h                  |   1 -
 accel/tcg/plugin-gen.c                     |   1 +
 target/arm/tcg/translate-a64.c             | 168 +++---
 target/arm/tcg/translate-mve.c             |  56 +-
 target/arm/tcg/translate-sve.c             |  28 +-
 target/arm/tcg/translate-vfp.c             |  26 +-
 target/arm/tcg/translate.c                 |  14 +-
 target/arm/vfp_helper.c                    |  35 +-
 target/avr/translate.c                     |  48 +-
 target/cris/translate.c                    |  46 +-
 target/hppa/translate.c                    |  35 +-
 target/i386/tcg/translate.c                |  83 +--
 target/m68k/translate.c                    | 231 ++++----
 target/mips/tcg/msa_translate.c            |   9 -
 target/mips/tcg/mxu_translate.c            |  55 +-
 target/mips/tcg/octeon_translate.c         |  23 -
 target/mips/tcg/translate.c                | 819 +++++------------------------
 target/mips/tcg/translate_addr_const.c     |   7 -
 target/mips/tcg/tx79_translate.c           |  45 +-
 target/mips/tcg/vr54xx_translate.c         |   4 -
 target/ppc/translate.c                     | 148 +++---
 target/rx/translate.c                      |  84 ++-
 target/s390x/tcg/translate.c               | 208 +-------
 target/sh4/translate.c                     |  35 +-
 target/sparc/translate.c                   |  14 +-
 target/tricore/translate.c                 | 476 ++++++++---------
 tcg/tcg-op-gvec.c                          |   1 +
 tcg/tcg-op-vec.c                           |  35 +-
 tcg/tcg-op.c                               |  13 +-
 tcg/tcg.c                                  |  17 +-
 target/cris/translate_v10.c.inc            |  26 +-
 target/mips/tcg/micromips_translate.c.inc  |  12 +-
 target/mips/tcg/nanomips_translate.c.inc   | 143 +----
 target/ppc/power8-pmu-regs.c.inc           |   4 +-
 target/ppc/translate/fixedpoint-impl.c.inc |  44 +-
 target/ppc/translate/fp-impl.c.inc         |  26 +-
 target/ppc/translate/vmx-impl.c.inc        | 130 ++---
 target/ppc/translate/vsx-impl.c.inc        |  36 +-
 target/s390x/tcg/translate_vx.c.inc        | 143 -----
 tcg/i386/tcg-target.c.inc                  |   9 +-
 67 files changed, 1166 insertions(+), 2388 deletions(-)
 create mode 100644 include/tcg/tcg-temp-internal.h

