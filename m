Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E2681D6F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1H-0001qw-I9; Mon, 30 Jan 2023 16:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1E-0001qd-Du
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:48:52 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1C-0005ZD-Fa
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:48:52 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so1095883pjb.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzGeCtZd6D4qBrR5HazxQTezeL0CXTuIlVaxg0iZ5XM=;
 b=fWCk971/G38nxV7ZyKBqfZBm/HjgXXFbnQ4i3FyyZKIE/M+B6U2FZTV9CBJqP7WoUj
 l9GblUospLv6VtkBxBEuFxoZ5WEu6B1r6mFr9BAnIox52Xf4+7PoFFlDX4d1p63SCbuM
 SpCvJ+0GaeslL/FmCgcmNVVlW7cSQcQDJCD+Cxr0RIOh5iIU7NH1DmHdnCxBEF8PnPQu
 WUNI5VarA1LKmOZE3JrG/rp79AL4d0z+CnWJzF+Vg+WpD26Tdc1JZrwPvKG+MZ2XFLTo
 bHCymCLtysU6iX50A+5ofNj1fA59qUUq6dVZ8uwQlbWvrrmAJ3LIfy7zUATCT5vgIqqM
 JC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kzGeCtZd6D4qBrR5HazxQTezeL0CXTuIlVaxg0iZ5XM=;
 b=B4wZfF+b8trlxsaR/FUxDzN1U+fSW90z07wYszhDAQ+QqSdPDR8HShhWE90XB3mmB4
 WoHE+pP7YtZbphIEnOvgHxng1n+B7CZpPYTBz1MMQyJEc8o/Gx+XKmENCyiS1UaZWh1K
 iAQC/Sf//Xb2ShJDp3ZChMDZ98GprA1z/WUCRyfJyLfPIRLIMR+ByNW1giiAlyNoRuUQ
 6ADIVZXelI3fJYwNKomVZbMqhgFkLO/bz+pIlywBQYswYTCRwzZYYVGXAGiT56SRm3HR
 FUXVOVi2vE/eXFMyLx/iYjprdah+BwZdABdlQJK99pXIazTfFglH5hHgJ5rS8c2DI0Me
 J6EA==
X-Gm-Message-State: AFqh2kqhdTZu7FkLZINJzMLWR8JusuzGAayHSkDDlGabMdmeRMJckvD5
 zL1yd/d45t14BPgDMGnVVwcpnEWI2AZJ7Kih
X-Google-Smtp-Source: AMrXdXtqAJXKyqQUvphCkzN5Xn02IbeAVVLszCJeMjdAhjxNy3VO7qx3IBdd/bWh9XKCY+l3HBr9cA==
X-Received: by 2002:a17:90b:3eca:b0:229:f4cd:1e03 with SMTP id
 rm10-20020a17090b3eca00b00229f4cd1e03mr42801749pjb.22.1675115327882; 
 Mon, 30 Jan 2023 13:48:47 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:48:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 00/36] tcg: Support for Int128 with helpers
Date: Mon, 30 Jan 2023 11:48:08 -1000
Message-Id: <20230130214844.1158612-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Branch: https://gitlab.com/rth7680/qemu/-/tree/tcg-i128
Based-on: 20230124020507.3732200-1-richard.henderson@linaro.org
("[PULL v2 00/15] tcg patch queue")

Changes for v6:
  * R-b applied.

Patches lacking review:
  05-tcg-Add-TCG_CALL_-RET-ARG-_BY_REF.patch
  15-tcg-Add-guest-load-store-primitives-for-TCGv_i128.patch
  17-tcg-Split-out-tcg_gen_nonatomic_cmpxchg_i-32-64.patch
  32-target-s390x-Use-tcg_gen_atomic_cmpxchg_i128-for-.patch
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
 target/s390x/tcg/translate.c     | 212 +++++++++++------
 tcg/tcg-op.c                     | 393 ++++++++++++++++++++++++++-----
 tcg/tcg.c                        | 307 +++++++++++++++++++++---
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
 53 files changed, 1935 insertions(+), 954 deletions(-)
 create mode 100644 tests/tcg/s390x/clst.c
 create mode 100644 tests/tcg/s390x/div.c
 create mode 100644 tests/tcg/s390x/long-double.c

-- 
2.34.1


