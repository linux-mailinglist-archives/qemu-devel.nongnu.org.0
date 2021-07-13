Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45103C71AF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:59:40 +0200 (CEST)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Iwl-0002pm-Rt
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibr-0000Qd-VL
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Ibg-0003p2-QD
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:38:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id t5so16681437wrw.12
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=g56+4yRtsX4HmaJSKKEITprEduln747BESSrSYF9XdU=;
 b=PLF+1z+cdAjyuUo7ZkDD1mPGpWrkKw/m9ZJ8paYDRbmpovr5qkkIR2HSDk+wMoQS7i
 XC5Lwt8FQG3BHiv+wOLhB2DVrHpbdYa66TlSc3giOsVgmxMiDUb14wl/odId2r4rRt3w
 V5Jfwqc2HGq2YmWHj3FkTLkSelrOGz4v3X2TUdXtDnf0voo15+WOSdXyu8d4aQLQg+QU
 WHQt8WrH1Ch3Qd1NffBAeJ7xnscWWLfqFy+ts4oPq6YPzz5GvAP93dUXwPmsYi1w+kOJ
 bJbrfGJ93y9kz5Q4S07CtduiouZk4fwDCdsRTDiBruqxJAUxcaMPVLuH6v0xT+GjfLah
 Q2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g56+4yRtsX4HmaJSKKEITprEduln747BESSrSYF9XdU=;
 b=V/n7N/FvGkByG0FDpI7nUEgNSsQ+cZDtA0VUXaPchdl8Dp5cp2nTYoDbqES+MdPk67
 M+Yl2BuLDn2IMEOw+KpKNg80OwzAFvQVHkkEgas539W4vxdk7whn8F2afeaAfe5g0oDQ
 gPxejeFSc0Td4KcgmB2Fqz1v+x/8D92qpCaKGwG/LM//TIkB/CKMO5mCd6F6IU4aTeE5
 CfWeqBTPgNx6NScTaq8+vv2H3ABcHUc2HVfJv0q15mZnCqOh2COwVq6QjuQypbQvMwSB
 1lZCr19nPuw0yhv3wgSFRdZ78CUM6Tyod5tjOykQyH0SqZW/7v4NHKoHBYsiUSBNK83W
 1R1Q==
X-Gm-Message-State: AOAM532AP+SK92Q6QySCTL2n/SQf0FHhf1ON/3l75JXSuJnFqyrgUUI5
 3uBhpaECIZpi9AXifPjMhLZEosLAaxUSZYmM
X-Google-Smtp-Source: ABdhPJzaaEuxsriXEl2zoSjAcZba+sSn4E8l0oIbI8xd4n9VcMC13fCb/tR3bugkZf4jqNVLxY1CNw==
X-Received: by 2002:adf:ec07:: with SMTP id x7mr5932828wrn.262.1626183471130; 
 Tue, 13 Jul 2021 06:37:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 29/34] target/arm: Implement MVE VMOV to/from 2
 general-purpose registers
Date: Tue, 13 Jul 2021 14:37:21 +0100
Message-Id: <20210713133726.26842-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
index 3899937f033..6ac9cb8e4d4 100644
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
index f243c34bd21..43f917e609e 100644
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


