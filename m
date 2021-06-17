Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76253AB376
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:23:07 +0200 (CEST)
Received: from localhost ([::1]:43248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltr34-0004Gx-Qz
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwk-0000qj-DV
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwh-0006tV-U7
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id o3so6538931wri.8
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0apxWPgQTsjMO30jLdGi2qRipMwjtbS4l8GmHNHVzGc=;
 b=OQRJD07AKcaBc1C/E7mRNH8S0j5JPwhCo/oYwwbLXWEGeVe3fD+ZMhRAR2he0Xu4Ht
 MmJmqtVa9n/Ke3jXkSG1Wzn6mnZ+IGl++yjjEz+OijNscn/bYWJvruONe6UkKozORIKO
 A+vuN8hhdHbcH5AfcBG80WF7PkOsdX5MKcblQSDtF4Ngxi+h0A9JsVFUPy3G0O1n+FGo
 Yc1tZzetc8fTudACC7yzSJ7sc3PGksLzwPHQbqE05n2uXRjfF3cayqZN7D+4kKUG/yKi
 EULwelrcdVYniV1JSztZsr7YyYgdpdVOOqecngDEcIWRuHCJXYmv6KkrwsKThar49TEg
 JsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0apxWPgQTsjMO30jLdGi2qRipMwjtbS4l8GmHNHVzGc=;
 b=TSrGzDKAp4xXxk1H6Nwe088KZ1W8GYFGHEG/g76hhaTozNQNW3i8/HqxN70gU5F4wh
 Kcw323UuMextFttG6lBcYczRh2Kb7D2BTqOAy7d6nf09HgFu5zWSrs6UYHGubzKBNdUt
 xQg2EKeDU76ccj8rvFnkmYnuUqO8E2+pWx/Xd7xN8axWU3rZ1xMx87Wx/u5KgSWHBsmY
 fEbYsHSJvWXf29/j5NKOUO6sRiMTCp029Fyp0LGWStch9n4pVmoQuZodT2s/WhSaunmZ
 jVgc75LDNxKCc71P+yy62eK0+BBPWVzZ2ebhIOW5b7c6r0qo0lL5LWDfmfvLChLwA3DU
 V9dw==
X-Gm-Message-State: AOAM533xBQkWe3TKapqX+opWqRYNYICbGdsJS1yj5y7RL6snf3xNddgW
 620Rkopd2Xyy4tlkz1/gaQIstg==
X-Google-Smtp-Source: ABdhPJxiaWPOhxp/5K9I2mWCgtMp3kIr0qGFKLnQ2/5CKqOcj+qHbnk2xkbTkbLVIkIyJ6ZJlxpFxQ==
X-Received: by 2002:a5d:6a41:: with SMTP id t1mr5438938wrw.113.1623932190438; 
 Thu, 17 Jun 2021 05:16:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 00/44] target/arm: First slice of MVE implementation
Date: Thu, 17 Jun 2021 13:15:44 +0100
Message-Id: <20210617121628.20116-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

This is the remainder of the MVE patches (a dozen or so are already
in git). All reviewed, except patches 1 and 2.

Changes v2->v3:
 * patches 1 and 2: pass MSIZE into DO_VLDR/DO_VSTR macros,
   so we increment the address by the correct amount for the
   widening/narrowing accesses. Increment the address outside
   the "only if predicated" condition.
 * patch 9: used the header file and renamed to tcg_gen_dup*.
   I also added in a tcg_gen_dup_tl #define.

thanks
-- PMM

Peter Maydell (44):
  target/arm: Implement MVE VLDR/VSTR (non-widening forms)
  target/arm: Implement widening/narrowing MVE VLDR/VSTR insns
  target/arm: Implement MVE VCLZ
  target/arm: Implement MVE VCLS
  target/arm: Implement MVE VREV16, VREV32, VREV64
  target/arm: Implement MVE VMVN (register)
  target/arm: Implement MVE VABS
  target/arm: Implement MVE VNEG
  tcg: Make gen_dup_i32/i64() public as tcg_gen_dup_i32/i64
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

 include/tcg/tcg-op.h       |    8 +
 include/tcg/tcg.h          |    1 -
 target/arm/helper-mve.h    |  357 +++++++++++
 target/arm/helper.h        |    2 +
 target/arm/internals.h     |   11 +
 target/arm/translate-a32.h |    2 +
 target/arm/translate.h     |   10 +
 target/arm/mve.decode      |  240 ++++++++
 target/arm/mve_helper.c    | 1175 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  759 +++++++++++++++++++++++
 target/arm/translate-vfp.c |   77 ++-
 tcg/tcg-op-gvec.c          |   20 +-
 target/arm/meson.build     |    1 +
 13 files changed, 2646 insertions(+), 17 deletions(-)
 create mode 100644 target/arm/helper-mve.h
 create mode 100644 target/arm/mve_helper.c

-- 
2.20.1


