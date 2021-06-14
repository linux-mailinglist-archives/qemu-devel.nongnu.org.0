Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2FF3A69D3
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:12:52 +0200 (CEST)
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoGh-0003XI-Uw
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEE-000064-Ls
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoE8-0008WK-SV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id z8so14939490wrp.12
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7qixvh89g9/DW4J+NVzZ6nYoyDHZqfP2LcR8cuEH5E=;
 b=GuN1MELUrmSPZZKRkvJ1zu6mMDnRJrbfq/+XpkKHRwqxWpneI5Sr0PibJijErXV3sS
 YgE68I/HuCJ+OZ9zoJAlLmMEJ5fHj0pZfiQRAgAnNMRw2TysYEqZYw+yZ+Gx9GMScDHQ
 RQuJWV62mQ8Nq6ikEo9kqCJn6vedT6FXDZmvt6fDCdvlcTsip2DsdmzoQjw3yHc79qkK
 lWsZI6oPzJ87ooUnHU87o5EMso8cqA4hj8luqOXodFDatzlOqAWHNfHqKZj0DkxtVfqY
 jJqsM6AEClr4VVfDeJFbjuNv1l0o+4nTKBEjvZX7ho/GFU/SnxkS/9Mpo+nOoRMGO3Vb
 a8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/7qixvh89g9/DW4J+NVzZ6nYoyDHZqfP2LcR8cuEH5E=;
 b=ZwkPMDnmilwGfUfxmGOSwHUiWvKcvDFQ0u8hlG3hL0woYzL7OjZDqmKuOoZSjNoMJQ
 +M1Zeyl52Pd/CtboK1U4Rahr65ZTQ2M5NsKr7t5tXyEn8G1GNpLsOuV/p40Bk7aCJY07
 F16VO09kCbrP0nwrbUz1cuUY8Mlt05IWPSB4jkXHt1EAGaEBzkGqMdWvSp8K8WN8QE4o
 3C7cMqJS0dcB3LMo6tkiwouubmj4Fkk8XaCX1ivs2170DdM1sZsyOAafhRNMA85Nup3K
 NOnBRwo7mmuhRa+CxcWXI0UVZrXsxTaHnf+T1PgjJe2lIfcCPZRjcpM/pyzDsd5xVg+r
 4HvQ==
X-Gm-Message-State: AOAM5335x5ECQJBdqLQFcS7aNFFJMrNUjMxadyE2L2li84GtQC/IBAp/
 kcyYQTMbzlwrTWi8fRHM/P2mbA==
X-Google-Smtp-Source: ABdhPJwUaxLvPpVqeQiUvIG2L+TIMXAO/RwhuGW5Ln9Yv9h6+bDZEC13BAlC8MeuCtnOb4xDknqBaQ==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr14942903wri.66.1623683409808; 
 Mon, 14 Jun 2021 08:10:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 00/57] target/arm: First slice of MVE implementation
Date: Mon, 14 Jun 2021 16:09:10 +0100
Message-Id: <20210614151007.4545-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchseries provides an initial slice of the MVE
implementation. (MVE is "vector instructions for M-profile", also
known as Helium).

The series covers:
 * framework for MVE decode, including infrastructure for
   handling predication, PSR.ECI, etc
 * tail-predication forms of low-overhead-loop insns (LCTP, WLSTP, LETP)
 * basic (non-gather) loads and stores
 * pretty much all the integer 2-operand vector and scalar insns
 * most of the integer 1-operand insns
 * a handful of other insns
but is not (by a long way) complete MVE support, and this code
will remain 'dead' until the enable-MVE patch eventually lands.

Changes v1->v2:
 * Addressed code review comments
 * Where some style changes were suggested and made for patches at
   the beginning of the series I have retained the r-by tags for
   later patches which had minor changes to follow that style:
    - adding 'static const' for function pointer arrays
    - using mve_check_qreg_bank()
    - compressing the early-return-false and early-return-true
      checks in trans functions down to fewer lines
    - pass only ESIZE, not H, to macros in mve_helper.c
    - adjustments to handling of QC

Patches still in need of review are:
   04 "target/arm: Add handling for PSR.ECI/ICI"
   07 "target/arm: Implement MVE WLSTP insn"
   11 "target/arm: Implement MVE VLDR/VSTR (non-widening forms)"
   13 "target/arm: Move expand_pred_b() data to translate.c" (new patch)
   14 "target/arm: Implement MVE VCLZ"
   17 "target/arm: Implement MVE VREV16, VREV32, VREV64"
   19 "target/arm: Implement MVE VABS"
   21 "tcg: Make gen_dup_i32() public" (new patch)
   22 "target/arm: Implement MVE VDUP"
   34 "target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH"
   35 "target/arm: Implement MVE VADD (scalar)"
   45 "target/arm: Implement MVE VQSHL (vector)"
   53 "target/arm: Implement MVE VADC, VSBC"
   55 "target/arm: Implement MVE VHCADD"

Nobody seemed to object when I posted v1, so I propose to land
these via target-arm.next once they pass code review.

thanks
-- PMM

Peter Maydell (57):
  target/arm: Provide and use H8 and H1_8 macros
  target/arm: Enable FPSCR.QC bit for MVE
  target/arm: Handle VPR semantics in existing code
  target/arm: Add handling for PSR.ECI/ICI
  target/arm: Let vfp_access_check() handle late NOCP checks
  target/arm: Implement MVE LCTP
  target/arm: Implement MVE WLSTP insn
  target/arm: Implement MVE DLSTP
  target/arm: Implement MVE LETP insn
  target/arm: Add framework for MVE decode
  target/arm: Implement MVE VLDR/VSTR (non-widening forms)
  target/arm: Implement widening/narrowing MVE VLDR/VSTR insns
  target/arm: Move expand_pred_b() data to translate.c
  target/arm: Implement MVE VCLZ
  target/arm: Implement MVE VCLS
  bitops.h: Provide hswap32(), hswap64(), wswap64() swapping operations
  target/arm: Implement MVE VREV16, VREV32, VREV64
  target/arm: Implement MVE VMVN (register)
  target/arm: Implement MVE VABS
  target/arm: Implement MVE VNEG
  tcg: Make gen_dup_i32() public
  target/arm: Implement MVE VDUP
  target/arm: Implement MVE VAND, VBIC, VORR, VORN, VEOR
  target/arm: Implement MVE VADD, VSUB, VMUL
  target/arm: Implement MVE VMULH
  target/arm: Implement MVE VRMULH
  target/arm: Implement MVE VMAX, VMIN
  target/arm: Implement MVE VABD
  target/arm: Implement MVE VHADD, VHSUB
  target/arm: Implement MVE VMULL
  target/arm: Implement MVE VMLALDAV
  target/arm: Implement MVE VMLSLDAV
  include/qemu/int128.h: Add function to create Int128 from int64_t
  target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
  target/arm: Implement MVE VADD (scalar)
  target/arm: Implement MVE VSUB, VMUL (scalar)
  target/arm: Implement MVE VHADD, VHSUB (scalar)
  target/arm: Implement MVE VBRSR
  target/arm: Implement MVE VPST
  target/arm: Implement MVE VQADD and VQSUB
  target/arm: Implement MVE VQDMULH and VQRDMULH (scalar)
  target/arm: Implement MVE VQDMULL scalar
  target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
  target/arm: Implement MVE VQADD, VQSUB (vector)
  target/arm: Implement MVE VQSHL (vector)
  target/arm: Implement MVE VQRSHL
  target/arm: Implement MVE VSHL insn
  target/arm: Implmement MVE VRSHL
  target/arm: Implement MVE VQDMLADH and VQRDMLADH
  target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
  target/arm: Implement MVE VQDMULL (vector)
  target/arm: Implement MVE VRHADD
  target/arm: Implement MVE VADC, VSBC
  target/arm: Implement MVE VCADD
  target/arm: Implement MVE VHCADD
  target/arm: Implement MVE VADDV
  target/arm: Make VMOV scalar <-> gpreg beatwise for MVE

 include/qemu/bitops.h         |   29 +
 include/qemu/int128.h         |   10 +
 include/tcg/tcg.h             |    3 +
 target/arm/helper-mve.h       |  357 ++++++++++
 target/arm/helper.h           |    2 +
 target/arm/internals.h        |   11 +
 target/arm/translate-a32.h    |    4 +
 target/arm/translate.h        |   19 +
 target/arm/vec_internal.h     |    9 +
 target/arm/mve.decode         |  260 ++++++++
 target/arm/t32.decode         |   15 +-
 target/arm/m_helper.c         |   54 +-
 target/arm/mve_helper.c       | 1175 +++++++++++++++++++++++++++++++++
 target/arm/sve_helper.c       |  381 ++++-------
 target/arm/translate-m-nocp.c |   16 +-
 target/arm/translate-mve.c    |  788 ++++++++++++++++++++++
 target/arm/translate-vfp.c    |  142 +++-
 target/arm/translate.c        |  300 ++++++++-
 target/arm/vec_helper.c       |  116 +++-
 target/arm/vfp_helper.c       |    3 +-
 tcg/tcg-op-gvec.c             |    4 +-
 target/arm/meson.build        |    3 +
 22 files changed, 3393 insertions(+), 308 deletions(-)
 create mode 100644 target/arm/helper-mve.h
 create mode 100644 target/arm/mve.decode
 create mode 100644 target/arm/mve_helper.c
 create mode 100644 target/arm/translate-mve.c

-- 
2.20.1


