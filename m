Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140393F738E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:43:10 +0200 (CEST)
Received: from localhost ([::1]:37008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqNB-0005tT-57
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGL-0004Bu-Dw
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGJ-0005Y3-I8
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v10so24448456wrd.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Qp88lepzk56QVkhZRSGO2VDv/JbZJtAi4P83EneyDdw=;
 b=A44bHS3ZwSAXAjBPRxcgBd6VirTPvZtoql3YQr1BVgA2scJ/JTqdfqT3kke21sWDU3
 VpPiy8v/xyZujqjztAV1nVipb1jUke0ruWFO4sPBs8gF7+en45At6ygD3qvLFORu0HsH
 VBXuXXhC92fqhNoQpPJJvxSGeh4RbvQWeFYG2ij1TpxF6KTxuRvhEMH4Tmo9JmD9x1H+
 2d1RQ7x3Ch12n2/gzzXOJk+QfHCm3PXmLk2IPckJVFx3gXoTO2TjhpEaNyHpiYkgZ5/d
 9z6sWC0G+qUewdds9ianjnrGCF/wYDBr/oj9CR+TB3qIAtPKJiBgWiO0U2Apab7wMbC2
 g12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qp88lepzk56QVkhZRSGO2VDv/JbZJtAi4P83EneyDdw=;
 b=B+Ys2i8uuRl2C0e3s0kdav190N/VGDiTA3Z0ZAR+qWJT8T5rob/gBIrnI5UnmSSsls
 TtWwR5X7UvJGmPCTULKorFuQpLv/rWokkza4COCpK9ARAo2dGMCdoHB+HFDpFb1g5I/V
 tVSOZ8LN9QRBgkm1GvT+XeLnzQkoJUFBX8ahttXADMKa1/+SkeBTla1mBIfONfJsaVSr
 YGmE1jgSVQnIE9L3R6T0S0IfkH1vE9NedxZAnvscDB4orMBHsgSIVLKZ75PYIjBvVL8r
 DTUmjCRLsNkrUfJSWPMtclztjy5tPvO45NXHkBtuKFgShAEOjBy4Y2RBTXdZELLWWSJo
 d76g==
X-Gm-Message-State: AOAM532hD98nDFGE9cumFiHBHmoxVF17PlvDoro433XFd73SEe+bkkKu
 n8xIsDaO0TWXSKnojdphMu1sX1d04VZ4KA==
X-Google-Smtp-Source: ABdhPJxFYME5caNsWY3WFlD5HBHhmYFfRqRMEYTRWNMubK/dnCaw5l8rp/uNE+8JfhTCJuUijhVpkA==
X-Received: by 2002:a5d:490d:: with SMTP id x13mr22972171wrq.412.1629887762075; 
 Wed, 25 Aug 2021 03:36:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/44] target/arm: Implement MVE VMOV to/from 2 general-purpose
 registers
Date: Wed, 25 Aug 2021 11:35:20 +0100
Message-Id: <20210825103534.6936-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VMOV forms that move data between 2 general-purpose
registers and 2 32-bit lanes in a vector register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a32.h |  1 +
 target/arm/mve.decode      |  4 ++
 target/arm/translate-mve.c | 85 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-vfp.c |  2 +-
 4 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
index 6dfcafe1796..6f4d65ddb00 100644
--- a/target/arm/translate-a32.h
+++ b/target/arm/translate-a32.h
@@ -49,6 +49,7 @@ void gen_rev16(TCGv_i32 dest, TCGv_i32 var);
 void clear_eci_state(DisasContext *s);
 bool mve_eci_check(DisasContext *s);
 void mve_update_and_store_eci(DisasContext *s);
+bool mve_skip_vmov(DisasContext *s, int vn, int index, int size);
 
 static inline TCGv_i32 load_cpu_offset(int offset)
 {
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 0955ed0cc22..774ee2a1a5b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -136,6 +136,10 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
 
+# Moves between 2 32-bit vector lanes and 2 general purpose registers
+VMOV_to_2gp      1110 1100 0 . 00 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
+VMOV_from_2gp    1110 1100 0 . 01 rt2:4 ... 0 1111 000 idx:1 rt:4 qd=%qd
+
 # Vector 2-op
 VAND             1110 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
 VBIC             1110 1111 0 . 01 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 02c26987a2d..93707fdd681 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1507,3 +1507,88 @@ static bool do_vabav(DisasContext *s, arg_vabav *a, MVEGenVABAVFn *fn)
 
 DO_VABAV(VABAV_S, vabavs)
 DO_VABAV(VABAV_U, vabavu)
+
+static bool trans_VMOV_to_2gp(DisasContext *s, arg_VMOV_to_2gp *a)
+{
+    /*
+     * VMOV two 32-bit vector lanes to two general-purpose registers.
+     * This insn is not predicated but it is subject to beat-wise
+     * execution if it is not in an IT block. For us this means
+     * only that if PSR.ECI says we should not be executing the beat
+     * corresponding to the lane of the vector register being accessed
+     * then we should skip perfoming the move, and that we need to do
+     * the usual check for bad ECI state and advance of ECI state.
+     * (If PSR.ECI is non-zero then we cannot be in an IT block.)
+     */
+    TCGv_i32 tmp;
+    int vd;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qd) ||
+        a->rt == 13 || a->rt == 15 || a->rt2 == 13 || a->rt2 == 15 ||
+        a->rt == a->rt2) {
+        /* Rt/Rt2 cases are UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Convert Qreg index to Dreg for read_neon_element32() etc */
+    vd = a->qd * 2;
+
+    if (!mve_skip_vmov(s, vd, a->idx, MO_32)) {
+        tmp = tcg_temp_new_i32();
+        read_neon_element32(tmp, vd, a->idx, MO_32);
+        store_reg(s, a->rt, tmp);
+    }
+    if (!mve_skip_vmov(s, vd + 1, a->idx, MO_32)) {
+        tmp = tcg_temp_new_i32();
+        read_neon_element32(tmp, vd + 1, a->idx, MO_32);
+        store_reg(s, a->rt2, tmp);
+    }
+
+    mve_update_and_store_eci(s);
+    return true;
+}
+
+static bool trans_VMOV_from_2gp(DisasContext *s, arg_VMOV_to_2gp *a)
+{
+    /*
+     * VMOV two general-purpose registers to two 32-bit vector lanes.
+     * This insn is not predicated but it is subject to beat-wise
+     * execution if it is not in an IT block. For us this means
+     * only that if PSR.ECI says we should not be executing the beat
+     * corresponding to the lane of the vector register being accessed
+     * then we should skip perfoming the move, and that we need to do
+     * the usual check for bad ECI state and advance of ECI state.
+     * (If PSR.ECI is non-zero then we cannot be in an IT block.)
+     */
+    TCGv_i32 tmp;
+    int vd;
+
+    if (!dc_isar_feature(aa32_mve, s) || !mve_check_qreg_bank(s, a->qd) ||
+        a->rt == 13 || a->rt == 15 || a->rt2 == 13 || a->rt2 == 15) {
+        /* Rt/Rt2 cases are UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Convert Qreg idx to Dreg for read_neon_element32() etc */
+    vd = a->qd * 2;
+
+    if (!mve_skip_vmov(s, vd, a->idx, MO_32)) {
+        tmp = load_reg(s, a->rt);
+        write_neon_element32(tmp, vd, a->idx, MO_32);
+        tcg_temp_free_i32(tmp);
+    }
+    if (!mve_skip_vmov(s, vd + 1, a->idx, MO_32)) {
+        tmp = load_reg(s, a->rt2);
+        write_neon_element32(tmp, vd + 1, a->idx, MO_32);
+        tcg_temp_free_i32(tmp);
+    }
+
+    mve_update_and_store_eci(s);
+    return true;
+}
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index b2991e21ec7..e2eb797c829 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -581,7 +581,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     return true;
 }
 
-static bool mve_skip_vmov(DisasContext *s, int vn, int index, int size)
+bool mve_skip_vmov(DisasContext *s, int vn, int index, int size)
 {
     /*
      * In a CPU with MVE, the VMOV (vector lane to general-purpose register)
-- 
2.20.1


