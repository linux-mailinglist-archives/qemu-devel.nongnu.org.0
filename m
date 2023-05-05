Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FA46F8B03
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2v8-0000aT-NZ; Fri, 05 May 2023 17:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v7-0000aC-4e
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v5-0004Na-3g
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:52 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f315712406so113476105e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321889; x=1685913889;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=wdNc3wWTM9H6p5j483GQ3HjWXBrGivFwogJqNsS/9vw=;
 b=WB2cRqZmjy+6t/uE5JFXKNxuY8xyUqUvTY5OkC10q5OXg7nMd/2lR07ELpgA1Et/Wr
 Q2rlqx7n48k/mpGXxnSh+VzHB7DxkXNrJHzRgKCXXw1dn2uCTux5A1rlUUsLx+hr7rgt
 uXj/PKVlI/aHTWgI15BVnsMCrhpKpLpPtRgsCvCc2JWhcFuQU80KgXatKch69nYz8P7W
 duqQ7SfiMLOBcsegfadeKrDNfV7TkADnep6X8BfB99Wp0GFZESMYamMy29coDOUalV0+
 W1lkVS6NFFYS73gMe+s0fxQFtlMU5241zD4TilxEqv4aQLoJc/qtxaH3chZyTT6HPtSO
 V7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321889; x=1685913889;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wdNc3wWTM9H6p5j483GQ3HjWXBrGivFwogJqNsS/9vw=;
 b=CYmVXwvifbkeC+Pe6xwrxjD30+cyVKPkGUB/hLcQCi1ghIGXwiJ8eD/4RTf+et2sC9
 vw1/UvAwQpAPHywJZekLMj1WSDZmT+kXEd01vQRVwh0xsDz5MvUFoBrGdlhCASVp62yN
 dOMHRkOuBQzEumtDyg2qrJhWUm8z4kpCf72c/xEtxRMEd5hEUjWfDbH41v7njw38bEIq
 NB3iFiyVlOImridLQhimmTYN5sZzm5GVcb/dnrqUBS4gocFn2D2R6f5IgmR/tmaLHFML
 QGkAHSnU90iwdK34DJi7ApFL31caiscdXI3UDG0yLYb1XZiMfPM2CzLVpeXsldpGYx0t
 B9LA==
X-Gm-Message-State: AC+VfDxTwsPc+g9EEnwXTDf70b3a+/bfOwB4xqLpoceo8OBRtuhngvHN
 V4jYSUwAlGNu21ILqxjS7IBOLpXOTHJNinkd7nsStQ==
X-Google-Smtp-Source: ACHHUZ6Qbl0Tijrt7NfCD+9Eaax3Es33F8D95d7jGFtXwuU9+on2j/r7PV+tclNcfYY4BYlfBUQG0Q==
X-Received: by 2002:adf:e483:0:b0:2ff:801b:dec6 with SMTP id
 i3-20020adfe483000000b002ff801bdec6mr2180195wrm.20.1683321888881; 
 Fri, 05 May 2023 14:24:48 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/42] tcg patch queue
Date: Fri,  5 May 2023 22:24:05 +0100
Message-Id: <20230505212447.374546-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

The following changes since commit a9fe9e191b4305b88c356a1ed9ac3baf89eb18aa:

  Merge tag 'pull-riscv-to-apply-20230505-1' of https://github.com/alistair23/qemu into staging (2023-05-05 09:25:13 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230505

for you to fetch changes up to 35a0bd63b458f30389b6bc6b7471c1665fe7b9d8:

  tcg: Widen helper_*_st[bw]_mmu val arguments (2023-05-05 17:21:03 +0100)

----------------------------------------------------------------
softfloat: Fix the incorrect computation in float32_exp2
tcg: Remove compatability helpers for qemu ld/st
target/alpha: Remove TARGET_ALIGNED_ONLY
target/hppa: Remove TARGET_ALIGNED_ONLY
target/sparc: Remove TARGET_ALIGNED_ONLY
tcg: Cleanups preparing to unify calls to qemu_ld/st helpers

----------------------------------------------------------------
Richard Henderson (41):
      target/avr: Finish conversion to tcg_gen_qemu_{ld,st}_*
      target/cris: Finish conversion to tcg_gen_qemu_{ld,st}_*
      target/Hexagon: Finish conversion to tcg_gen_qemu_{ld, st}_*
      target/m68k: Finish conversion to tcg_gen_qemu_{ld,st}_*
      target/mips: Finish conversion to tcg_gen_qemu_{ld,st}_*
      target/s390x: Finish conversion to tcg_gen_qemu_{ld, st}_*
      target/sparc: Finish conversion to tcg_gen_qemu_{ld, st}_*
      target/xtensa: Finish conversion to tcg_gen_qemu_{ld, st}_*
      tcg: Remove compatability helpers for qemu ld/st
      target/alpha: Use MO_ALIGN for system UNALIGN()
      target/alpha: Use MO_ALIGN where required
      target/alpha: Remove TARGET_ALIGNED_ONLY
      target/hppa: Use MO_ALIGN for system UNALIGN()
      target/hppa: Remove TARGET_ALIGNED_ONLY
      target/sparc: Use MO_ALIGN where required
      target/sparc: Use cpu_ld*_code_mmu
      target/sparc: Remove TARGET_ALIGNED_ONLY
      tcg/i386: Rationalize args to tcg_out_qemu_{ld,st}
      tcg/i386: Generalize multi-part load overlap test
      tcg/i386: Introduce HostAddress
      tcg/i386: Drop r0+r1 local variables from tcg_out_tlb_load
      tcg/i386: Introduce tcg_out_testi
      tcg/aarch64: Rationalize args to tcg_out_qemu_{ld,st}
      tcg/aarch64: Introduce HostAddress
      tcg/arm: Rationalize args to tcg_out_qemu_{ld,st}
      tcg/arm: Introduce HostAddress
      tcg/loongarch64: Rationalize args to tcg_out_qemu_{ld,st}
      tcg/loongarch64: Introduce HostAddress
      tcg/mips: Rationalize args to tcg_out_qemu_{ld,st}
      tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
      tcg/ppc: Introduce HostAddress
      tcg/riscv: Require TCG_TARGET_REG_BITS == 64
      tcg/riscv: Rationalize args to tcg_out_qemu_{ld,st}
      tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
      tcg/s390x: Introduce HostAddress
      tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data return
      tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
      tcg: Move TCGLabelQemuLdst to tcg.c
      tcg: Replace REG_P with arg_loc_reg_p
      tcg: Introduce arg_slot_stk_ofs
      tcg: Widen helper_*_st[bw]_mmu val arguments

Shivaprasad G Bhat (1):
      softfloat: Fix the incorrect computation in float32_exp2

 configs/targets/alpha-linux-user.mak        |   1 -
 configs/targets/alpha-softmmu.mak           |   1 -
 configs/targets/hppa-linux-user.mak         |   1 -
 configs/targets/hppa-softmmu.mak            |   1 -
 configs/targets/sparc-linux-user.mak        |   1 -
 configs/targets/sparc-softmmu.mak           |   1 -
 configs/targets/sparc32plus-linux-user.mak  |   1 -
 configs/targets/sparc64-linux-user.mak      |   1 -
 configs/targets/sparc64-softmmu.mak         |   1 -
 include/tcg/tcg-ldst.h                      |  10 +-
 include/tcg/tcg-op.h                        |  55 -----
 target/hexagon/macros.h                     |  14 +-
 tcg/riscv/tcg-target-con-set.h              |   8 -
 tcg/riscv/tcg-target.h                      |  22 +-
 tcg/tcg-internal.h                          |   4 -
 accel/tcg/cputlb.c                          |   6 +-
 fpu/softfloat.c                             |   2 +-
 target/alpha/translate.c                    |  38 +--
 target/avr/translate.c                      |  16 +-
 target/hexagon/genptr.c                     |   8 +-
 target/hexagon/idef-parser/parser-helpers.c |  28 +--
 target/hexagon/translate.c                  |  32 +--
 target/hppa/translate.c                     |   2 +-
 target/m68k/translate.c                     |  76 ++----
 target/mips/tcg/translate.c                 |   8 +-
 target/s390x/tcg/translate.c                | 152 ++++++------
 target/sparc/ldst_helper.c                  |  10 +-
 target/sparc/translate.c                    |  85 ++++---
 target/xtensa/translate.c                   |   4 +-
 tcg/tcg.c                                   |  58 +++--
 target/cris/translate_v10.c.inc             |  18 +-
 target/mips/tcg/nanomips_translate.c.inc    |   2 +-
 tcg/aarch64/tcg-target.c.inc                | 108 ++++++---
 tcg/arm/tcg-target.c.inc                    | 357 +++++++++++++---------------
 tcg/i386/tcg-target.c.inc                   | 345 ++++++++++++++-------------
 tcg/loongarch64/tcg-target.c.inc            | 135 +++++------
 tcg/mips/tcg-target.c.inc                   | 186 ++++++++-------
 tcg/ppc/tcg-target.c.inc                    | 192 ++++++++-------
 tcg/riscv/tcg-target.c.inc                  | 268 ++++++---------------
 tcg/s390x/tcg-target.c.inc                  | 131 +++++-----
 tcg/sparc64/tcg-target.c.inc                |   8 +-
 tcg/tcg-ldst.c.inc                          |  14 --
 42 files changed, 1120 insertions(+), 1291 deletions(-)

