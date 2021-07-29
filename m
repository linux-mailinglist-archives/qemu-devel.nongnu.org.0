Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE73DA238
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:34:54 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94JR-0005hn-Rx
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941E-00016Y-5D
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:05 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940r-0001IY-44
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:03 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so1131089wms.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Qp88lepzk56QVkhZRSGO2VDv/JbZJtAi4P83EneyDdw=;
 b=FakOkKQxABmcFJham9NEs+Cu2LZ2OT5L1gfSiSMDKJiJTp3WutvQUxidPYUcb/dM2i
 N4NcYPxQDCklozTuarkXs8u1CuLIDlCZbJuXP+lKn1pjkLIT95jbN+Wkhj8CljxCrukH
 dAuQl7JeG6abHc3DuDNvgl/79SwbKQkE9kaKj52XzZDS49fc+MajBzpBbMpz28SMQ2md
 KHEqiZdR6mU2b1EsI9Lij3sVAH3Sx0oED6nfzNnZY+M82hoV7cuCCGbRUvBZB0ZhqOMn
 IRc53ZZrPBfRcumHWPJzuJgnS0b9okqOZBoVgQfCneoNxPNwALlmc7l3zfmcYnyT6AG/
 mZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qp88lepzk56QVkhZRSGO2VDv/JbZJtAi4P83EneyDdw=;
 b=fq6mEO/Al+Vna3jJHksZLY5m44ixIqaTiysIiK7J3tGhLWV8HdZgPNSN39tU/D+iYJ
 PKwAk0V4ChDdz+vA/XZ0DqHfoIcKjDEMgNuxkXShRNvm8SW/6ug3qjskOR5rc8imdcn8
 tStU7rztzlb6HFXJpxWnowUmy5LBKWJBKbgHWOJepV8sKZ2bS8G5eQXam/L1qRLplFJc
 0qVFtW5sI8F8bzfLkzP2Mc5psZqZqD1DKuyKOn3f6tmBA2R776nRrEAkuIPH8lppQW+l
 aHtg3LTN3CaHqzwiNBAPH0NlbdvqDF+ZVPAq8BFLXE8fWstlv5mUq3TuDksRaqt46HZc
 6n7g==
X-Gm-Message-State: AOAM530vnpTZxuU2conSm8+D6ApedePLG5Vz63SSuq3Fk9BdqNUID+oV
 8KR6YuVmLWMBhGzRDppltX4fis+5yVyjHA==
X-Google-Smtp-Source: ABdhPJzyL0TVyXC6jvYKQB8lQ6Jbq/nxROOPdA1buMrU7Pc1jeLaxdMVQpLb0xLw/Xfs0462UUBTUg==
X-Received: by 2002:a05:600c:3b98:: with SMTP id
 n24mr13998775wms.182.1627557339571; 
 Thu, 29 Jul 2021 04:15:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 30/53] target/arm: Implement MVE VMOV to/from 2
 general-purpose registers
Date: Thu, 29 Jul 2021 12:14:49 +0100
Message-Id: <20210729111512.16541-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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


