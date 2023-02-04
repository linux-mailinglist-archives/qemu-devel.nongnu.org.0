Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625D468AB56
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:37:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLTy-000548-CL; Sat, 04 Feb 2023 11:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTb-00050N-Eb
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTY-0002TW-9d
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:18 -0500
Received: by mail-pl1-x636.google.com with SMTP id m13so8133011plx.13
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9dz9DbS9D8yFC9zY1LhE0jMNlwPwcuVQr3ruHcWqZEU=;
 b=kdcADEqsnJhgrC7e135lcVX6m8ZZ//pVYHC/LXE+fsfULUsQxoSRB81HDao/GTCj1Y
 z/ax/ONA2eJ//QW4zw8GJCKiUuU3yhXw76oocyhqwNvX3LeP1iacu/u7In/UNUeuKZGZ
 9RyxfwAtEqbQO8L4kqLlT0VvI9CAKDQONPptCojg7WYRPjPD1LjL2c4/EqKOH0OGrbWG
 bClOwusp4m82hT/OgF9yA7xQqYSbs7c8qJRR4Mbq1QEeABh6Cb8GfJXPpYU/lbME4bKf
 i9RTmgdlaUQUDIlEGJLP1GOmKID/qSF4FBDAe+DOuI8DGv6cvPddR21Nt6u2t2NV/CJn
 5Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9dz9DbS9D8yFC9zY1LhE0jMNlwPwcuVQr3ruHcWqZEU=;
 b=EoWKWwwEnSOpn63rkaTvetrh3ndS5xYbfjs8QngS5sptuP9E0txQLIyt91j9cMLgbc
 Hv8F60Z+Y2Y334gWdDowHJU3uY/mf4CzxMXeFzUTFbaLVG4LwBzO0eXQdkfUKXBK5TXh
 zeQuPz50oDQV9FplOFRzv+PWGtcuNW2+2bActos5RmwaFWHdJwd/90V/VmSd6Iu7SFB8
 ybG1OPeCuANhRwu5RTeUEGFHcQps8hTlSudA4Voq+q1OoeEToQlHPROPdm6gjDYHI0TN
 F/cm9mQkp6rvdiTr8L9E364s4ZcPMBuTbRz3xnBMv87RCRI/r1CvkuO1quYZzZXbDQRJ
 otsQ==
X-Gm-Message-State: AO0yUKXVVTc+oIW4vGv+5rXkK8uinco7bsYmxjfcMyUtdoKQp2FFwRmx
 CUMGKE1ARQVJkk0mHKjZuy3jZiexNUTL/RvZ
X-Google-Smtp-Source: AK7set/yRwAhAsTN3qHbMjKLpsK69d6uTbKaOgmvJEdYLLUUAnDO0VtvTEMNW8NWisofp/ksJrLDOA==
X-Received: by 2002:a17:903:120b:b0:194:58c7:ab79 with SMTP id
 l11-20020a170903120b00b0019458c7ab79mr16526809plh.63.1675528394164; 
 Sat, 04 Feb 2023 08:33:14 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/40] tcg patch queue
Date: Sat,  4 Feb 2023 06:32:30 -1000
Message-Id: <20230204163310.815536-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

The following changes since commit 579510e196a544b42bd8bca9cc61688d4d1211ac:

  Merge tag 'pull-monitor-2023-02-03-v2' of https://repo.or.cz/qemu/armbru into staging (2023-02-04 10:19:55 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230204

for you to fetch changes up to a2495ede07498ee36b18b03e7038ba30c9871bb2:

  tcg/aarch64: Fix patching of LDR in tb_target_set_jmp_target (2023-02-04 06:19:43 -1000)

----------------------------------------------------------------
tcg: Add support for TCGv_i128 in parameters and returns.
tcg: Add support for TCGv_i128 in cmpxchg.
tcg: Test CPUJumpCache in tb_jmp_cache_clear_page
tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
tcg/aarch64: Fix patching of LDR in tb_target_set_jmp_target
target/arm: Use tcg_gen_atomic_cmpxchg_i128
target/i386: Use tcg_gen_atomic_cmpxchg_i128
target/i386: Use tcg_gen_nonatomic_cmpxchg_i{32,64}
target/s390x: Use tcg_gen_atomic_cmpxchg_i128
target/s390x: Use TCGv_i128 in passing and returning float128
target/s390x: Implement CC_OP_NZ in gen_op_calc_cc

----------------------------------------------------------------
Eric Auger (1):
      accel/tcg: Test CPUJumpCache in tb_jmp_cache_clear_page

Ilya Leoshkevich (3):
      tests/tcg/s390x: Add div.c
      tests/tcg/s390x: Add clst.c
      tests/tcg/s390x: Add cdsg.c

Richard Henderson (36):
      tcg: Init temp_subindex in liveness_pass_2
      tcg: Define TCG_TYPE_I128 and related helper macros
      tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,ARG}_NORMAL
      tcg: Allocate objects contiguously in temp_allocate_frame
      tcg: Introduce tcg_out_addi_ptr
      tcg: Add TCG_CALL_{RET,ARG}_BY_REF
      tcg: Introduce tcg_target_call_oarg_reg
      tcg: Add TCG_CALL_RET_BY_VEC
      include/qemu/int128: Use Int128 structure for TCI
      tcg/i386: Add TCG_TARGET_CALL_{RET,ARG}_I128
      tcg/tci: Fix big-endian return register ordering
      tcg/tci: Add TCG_TARGET_CALL_{RET,ARG}_I128
      tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
      tcg: Add temp allocation for TCGv_i128
      tcg: Add basic data movement for TCGv_i128
      tcg: Add guest load/store primitives for TCGv_i128
      tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
      tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
      target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
      target/arm: Use tcg_gen_atomic_cmpxchg_i128 for CASP
      target/ppc: Use tcg_gen_atomic_cmpxchg_i128 for STQCX
      tests/tcg/s390x: Add long-double.c
      target/s390x: Use a single return for helper_divs32/u32
      target/s390x: Use a single return for helper_divs64/u64
      target/s390x: Use Int128 for return from CLST
      target/s390x: Use Int128 for return from CKSM
      target/s390x: Use Int128 for return from TRE
      target/s390x: Copy wout_x1 to wout_x1_P
      target/s390x: Use Int128 for returning float128
      target/s390x: Use Int128 for passing float128
      target/s390x: Use tcg_gen_atomic_cmpxchg_i128 for CDSG
      target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
      target/i386: Split out gen_cmpxchg8b, gen_cmpxchg16b
      target/i386: Inline cmpxchg8b
      target/i386: Inline cmpxchg16b
      tcg/aarch64: Fix patching of LDR in tb_target_set_jmp_target

 accel/tcg/tcg-runtime.h          |  11 ++
 include/exec/cpu_ldst.h          |  10 +
 include/exec/helper-head.h       |   7 +
 include/qemu/atomic128.h         |  29 ++-
 include/qemu/int128.h            |  25 ++-
 include/tcg/tcg-op.h             |  15 ++
 include/tcg/tcg.h                |  49 ++++-
 target/arm/helper-a64.h          |   8 -
 target/i386/helper.h             |   6 -
 target/ppc/helper.h              |   2 -
 target/s390x/helper.h            |  54 +++---
 tcg/aarch64/tcg-target.h         |   2 +
 tcg/arm/tcg-target.h             |   2 +
 tcg/i386/tcg-target.h            |  10 +
 tcg/loongarch64/tcg-target.h     |   2 +
 tcg/mips/tcg-target.h            |   2 +
 tcg/riscv/tcg-target.h           |   3 +
 tcg/s390x/tcg-target.h           |   2 +
 tcg/sparc64/tcg-target.h         |   2 +
 tcg/tcg-internal.h               |  17 ++
 tcg/tci/tcg-target.h             |   3 +
 target/s390x/tcg/insn-data.h.inc |  60 +++---
 accel/tcg/cputlb.c               | 119 +++++++++++-
 accel/tcg/user-exec.c            |  66 +++++++
 target/arm/helper-a64.c          | 147 ---------------
 target/arm/translate-a64.c       | 121 ++++++------
 target/i386/tcg/mem_helper.c     | 126 -------------
 target/i386/tcg/translate.c      | 126 +++++++++++--
 target/ppc/mem_helper.c          |  44 -----
 target/ppc/translate.c           | 102 +++++-----
 target/s390x/tcg/fpu_helper.c    | 103 +++++-----
 target/s390x/tcg/int_helper.c    |  64 +++----
 target/s390x/tcg/mem_helper.c    |  77 +-------
 target/s390x/tcg/translate.c     | 212 ++++++++++++++-------
 tcg/tcg-op.c                     | 393 +++++++++++++++++++++++++++++++++------
 tcg/tcg.c                        | 308 ++++++++++++++++++++++++++----
 tcg/tci.c                        |  65 +++----
 tests/tcg/s390x/cdsg.c           |  93 +++++++++
 tests/tcg/s390x/clst.c           |  82 ++++++++
 tests/tcg/s390x/div.c            |  75 ++++++++
 tests/tcg/s390x/long-double.c    |  24 +++
 util/int128.c                    |  42 +++++
 accel/tcg/atomic_common.c.inc    |  45 +++++
 tcg/aarch64/tcg-target.c.inc     |  19 +-
 tcg/arm/tcg-target.c.inc         |  30 ++-
 tcg/i386/tcg-target.c.inc        |  52 +++++-
 tcg/loongarch64/tcg-target.c.inc |  17 +-
 tcg/mips/tcg-target.c.inc        |  17 +-
 tcg/ppc/tcg-target.c.inc         |  20 +-
 tcg/riscv/tcg-target.c.inc       |  17 +-
 tcg/s390x/tcg-target.c.inc       |  16 +-
 tcg/sparc64/tcg-target.c.inc     |  19 +-
 tcg/tci/tcg-target.c.inc         |  27 ++-
 tests/tcg/s390x/Makefile.target  |   7 +
 54 files changed, 2040 insertions(+), 956 deletions(-)
 create mode 100644 tests/tcg/s390x/cdsg.c
 create mode 100644 tests/tcg/s390x/clst.c
 create mode 100644 tests/tcg/s390x/div.c
 create mode 100644 tests/tcg/s390x/long-double.c

