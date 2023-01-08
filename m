Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB7D661311
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELYw-0004aD-LY; Sat, 07 Jan 2023 21:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYu-0004ZF-M7
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:28 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYq-0004UV-8W
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:28 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so9263159pjk.3
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kmNsSCZyNhPWOKz/+C6kbOmdqXe8QlrZ2Yagkc9eIrk=;
 b=G0TJbcbp896XB1hmQghCV6JnjPG815eSE2wnYNqueTp4Q+nE7KV+MrKxzsoPp0OcbS
 B3VCVvKx8IPReky4Yjs+98eehCsF92f4wHdltavpwT++8TeKPBQdQRf2FO0GMUW8MPTK
 By5lUyhXXWoeLIXhMixSsq/lG/f+r43xFb0Og3MtBdEF1GRDbEMTocFzDFDqb5SsvHnI
 V48uDsoH5lfINU69I4cVk4nfaH9xJ2X3KXJSXI0yvBWyUY2AKulRAm8K3GCBSs0oa7Oa
 VflazEyZJmnpY0ZHep8TYiUPXGigGGmYBs+gcpKZuABYcPLWaNBV0fNtaqe2EVa6BD+R
 MF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kmNsSCZyNhPWOKz/+C6kbOmdqXe8QlrZ2Yagkc9eIrk=;
 b=7wJIJbPR5oxcltmHNSPjnkZ9/xFHLbW0cfCwRAO6vzfYlvNXkeIKM3ou1/icqf2f+o
 RH/bt5yvQFYwiMHNkQtRz12PM+wGCNvkvVRy0TBvfX0u5T6x4pqEj0iy/bceksgFLseC
 rlAZLNi360+XLPOFyDV0fUGMYSFGS7LSBv09R0Whg/G/Fo3h1/rHtLwJUf1bSkFXJvA4
 uKi35lp39xF5ZdEW3N20hY20d21vdjYtnvLvRXuKkEB5FapmGsRqqc7bUWuZcoNY0/cu
 r/QbkbVyqJ/i2Swb6F1bkqzbCQ5klr9s8ygt5oCYB1dFAsIArqiUInWSv0vrtOaKV4rd
 2+kQ==
X-Gm-Message-State: AFqh2kruu7//0KEvgdZOs684/ySdLfnv9Fk/UZrhzJSCdf4+kUtGBapP
 YbsoFh057SF2g/+SJmeKkL2gpagkoHF3r9G2
X-Google-Smtp-Source: AMrXdXv47KgunpKjy4W372fLXK0/RkDPToPxGEFmrDzDErDGVeOYM8qFAwkotEUm1o123QvxR0P09A==
X-Received: by 2002:a17:902:6a85:b0:191:420e:e6b1 with SMTP id
 n5-20020a1709026a8500b00191420ee6b1mr61043782plk.32.1673145441574; 
 Sat, 07 Jan 2023 18:37:21 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 00/36] tcg: Support for Int128 with helpers
Date: Sat,  7 Jan 2023 18:36:43 -0800
Message-Id: <20230108023719.2466341-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Changes for v4:
  * About half of the v3 series has been merged,
  * AArch64 host requires even argument register.
  * target/{arm,ppc,s390x,i386} uses included here.

Patches requiring review:
  01-tcg-Define-TCG_TYPE_I128-and-related-helper-macro.patch
  02-tcg-Handle-dh_typecode_i128-with-TCG_CALL_-RET-AR.patch
  03-tcg-Allocate-objects-contiguously-in-temp_allocat.patch
  05-tcg-Add-TCG_CALL_-RET-ARG-_BY_REF.patch
  07-tcg-Add-TCG_CALL_RET_BY_VEC.patch
  08-include-qemu-int128-Use-Int128-structure-for-TCI.patch
  09-tcg-i386-Add-TCG_TARGET_CALL_-RET-ARG-_I128.patch
  10-tcg-tci-Fix-big-endian-return-register-ordering.patch
  11-tcg-tci-Add-TCG_TARGET_CALL_-RET-ARG-_I128.patch
  13-tcg-Add-temp-allocation-for-TCGv_i128.patch
  14-tcg-Add-basic-data-movement-for-TCGv_i128.patch
  15-tcg-Add-guest-load-store-primitives-for-TCGv_i128.patch
  16-tcg-Add-tcg_gen_-non-atomic_cmpxchg_i128.patch
  17-tcg-Split-out-tcg_gen_nonatomic_cmpxchg_i-32-64.patch
  24-target-s390x-Use-a-single-return-for-helper_divs3.patch
  31-target-s390x-Use-Int128-for-passing-float128.patch
  32-target-s390x-Use-tcg_gen_atomic_cmpxchg_i128-for-.patch
  33-target-s390x-Implement-CC_OP_NZ-in-gen_op_calc_cc.patch
  34-target-i386-Split-out-gen_cmpxchg8b-gen_cmpxchg16.patch
  35-target-i386-Inline-cmpxchg8b.patch
  36-target-i386-Inline-cmpxchg16b.patch


r~


Ilya Leoshkevich (2):
  tests/tcg/s390x: Add div.c
  tests/tcg/s390x: Add clst.c

Richard Henderson (34):
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

 accel/tcg/tcg-runtime.h          |  11 +
 include/exec/cpu_ldst.h          |  10 +
 include/exec/helper-head.h       |   7 +
 include/qemu/atomic128.h         |  29 ++-
 include/qemu/int128.h            |  25 +-
 include/tcg/tcg-op.h             |  15 ++
 include/tcg/tcg.h                |  49 +++-
 target/arm/helper-a64.h          |   8 -
 target/i386/helper.h             |   6 -
 target/ppc/helper.h              |   2 -
 target/s390x/helper.h            |  54 ++---
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
 target/s390x/tcg/insn-data.h.inc |  60 ++---
 accel/tcg/cputlb.c               | 112 +++++++++
 accel/tcg/user-exec.c            |  66 ++++++
 target/arm/helper-a64.c          | 147 ------------
 target/arm/translate-a64.c       | 121 +++++-----
 target/i386/tcg/mem_helper.c     | 126 ----------
 target/i386/tcg/translate.c      | 126 ++++++++--
 target/ppc/mem_helper.c          |  44 ----
 target/ppc/translate.c           | 102 ++++----
 target/s390x/tcg/fpu_helper.c    | 103 ++++----
 target/s390x/tcg/int_helper.c    |  64 ++---
 target/s390x/tcg/mem_helper.c    |  77 +-----
 target/s390x/tcg/translate.c     | 217 +++++++++++------
 tcg/tcg-op.c                     | 393 ++++++++++++++++++++++++++-----
 tcg/tcg.c                        | 303 +++++++++++++++++++++---
 tcg/tci.c                        |  65 ++---
 tests/tcg/s390x/clst.c           |  82 +++++++
 tests/tcg/s390x/div.c            |  75 ++++++
 tests/tcg/s390x/long-double.c    |  24 ++
 util/int128.c                    |  42 ++++
 accel/tcg/atomic_common.c.inc    |  45 ++++
 tcg/aarch64/tcg-target.c.inc     |  17 +-
 tcg/arm/tcg-target.c.inc         |  30 ++-
 tcg/i386/tcg-target.c.inc        |  52 +++-
 tcg/loongarch64/tcg-target.c.inc |  17 +-
 tcg/mips/tcg-target.c.inc        |  17 +-
 tcg/ppc/tcg-target.c.inc         |  20 +-
 tcg/riscv/tcg-target.c.inc       |  17 +-
 tcg/s390x/tcg-target.c.inc       |  16 +-
 tcg/sparc64/tcg-target.c.inc     |  19 +-
 tcg/tci/tcg-target.c.inc         |  27 ++-
 tests/tcg/s390x/Makefile.target  |   3 +
 53 files changed, 1936 insertions(+), 954 deletions(-)
 create mode 100644 tests/tcg/s390x/clst.c
 create mode 100644 tests/tcg/s390x/div.c
 create mode 100644 tests/tcg/s390x/long-double.c

-- 
2.34.1


