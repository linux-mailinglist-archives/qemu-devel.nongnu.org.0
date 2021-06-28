Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30073B5FC0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:13:54 +0200 (CEST)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxs1J-0006Rd-VZ
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrn8-0003TG-A4
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:14 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrml-00066k-Lc
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o35-20020a05600c5123b02901e6a7a3266cso25577wms.1
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tlLLDi8pi1S70Nd5QN7KmXElszdemOHF3wRtfTYwD1Q=;
 b=QR8m399p2jyNOy+DhMNH/mrKRVj+Pr2Nu6d6WtnUQCpi+7GWimdHp56CvueE99AXB1
 5OfxXqrIttDh8jz5EbsjqJf8bbD5Q1xYnMwfHR3DFVKqzecY+qI0jF7TD+gG/TxTSTVD
 6a4rk8I2TyBU9lD0KctxCYR27aVzx6IijxBaJf8OrGCXdj4SM0F9siu6Ss9J0DHGTNVf
 7eCZXvWWSOPmhRAtXcN3YT0RfmzWiIwfkONfqBucEC7MrQVgo/qgr5A9Fpq6eIahxr3S
 Au/Bzi9cxaSAEqb+muHQmVsngZgG48j4Kq/oP126zmbdcp+m8r260Xnm9Cm5scsg9uJ2
 y61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tlLLDi8pi1S70Nd5QN7KmXElszdemOHF3wRtfTYwD1Q=;
 b=Pcbp4JY2+Z+ChMf733REPWeERMzoO16w10j/Dq9HDgUQ2oZulxGY8JoVn+N1Fja24A
 Avtdng4afQ2vcf62fWpHxYvxKcxqkYQxcawldGvnuZlv9ZdkNilGU7AIN54aUVXXLbx8
 NfWt4LGiTRD9Zhu8gTasyJ/VhYYGV+FwPb0Gk5V6TJXO6bZee4JCP5pva8kZHgSJ04F5
 IfJyY8G6vsfp/Y7h4DvJbEXKedtrWtkGgpvEaN1y0pqFcuRlOjL9nAgCT33SSN6IqawB
 tSXYMvZsRmSMVYjl6P7UWExmwiiuEsTg6eg5sEbK+LZtUYnTEQDjX2HNF5J8shGseJYr
 QmPw==
X-Gm-Message-State: AOAM533Z9x6u18yM2y1gwmoPbAmzJPjVeK0h3Pq43jYwWOiDT9HalK7E
 6WkuHPj/ZdG9TP04jKBHN0bUEgAumg2rdioK
X-Google-Smtp-Source: ABdhPJwFq3xzMX66A7BPfEYwY+eqTd5fGkx3WE5mfEORgHVb6PPZMJENC3Zt1D1crjCS/D49iL3ucQ==
X-Received: by 2002:a7b:c2a2:: with SMTP id c2mr27005327wmk.89.1624888730416; 
 Mon, 28 Jun 2021 06:58:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/18] target/arm: Implement MVE shifts by register
Date: Mon, 28 Jun 2021 14:58:35 +0100
Message-Id: <20210628135835.6690-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the MVE shifts by register, which perform
shifts on a single general-purpose register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h |  2 ++
 target/arm/translate.h  |  1 +
 target/arm/t32.decode   |  5 +++++
 target/arm/mve_helper.c | 10 ++++++++++
 target/arm/translate.c  | 30 ++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1fba9d6422d..56e40844ad9 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -461,3 +461,5 @@ DEF_HELPER_FLAGS_3(mve_uqrshll48, TCG_CALL_NO_RWG, i64, env, i64, i32)
 
 DEF_HELPER_FLAGS_3(mve_uqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_uqrshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_sqrshr, TCG_CALL_NO_RWG, i32, env, i32, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 2c7ca2a1f77..241596c5bda 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -467,6 +467,7 @@ typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
 typedef void WideShiftImmFn(TCGv_i64, TCGv_i64, int64_t shift);
 typedef void WideShiftFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i32);
 typedef void ShiftImmFn(TCGv_i32, TCGv_i32, int32_t shift);
+typedef void ShiftFn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
 
 /**
  * arm_tbflags_from_tb:
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 12cc751ad4c..911896409a7 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -51,6 +51,7 @@
 &mve_shl_ri      rdalo rdahi shim
 &mve_shl_rr      rdalo rdahi rm
 &mve_sh_ri       rda shim
+&mve_sh_rr       rda rm
 
 # rdahi: bits [3:1] from insn, bit 0 is 1
 # rdalo: bits [3:1] from insn, bit 0 is 0
@@ -74,6 +75,7 @@
                  &mve_shl_rr rdalo=%rdalo_17 rdahi=%rdahi_9
 @mve_sh_ri       ....... .... . rda:4 . ... ... . .. .. .... \
                  &mve_sh_ri shim=%imm5_12_6
+@mve_sh_rr       ....... .... . rda:4 rm:4 .... .... .... &mve_sh_rr
 
 {
   TST_xrri       1110101 0000 1 .... 0 ... 1111 .... ....     @S_xrr_shi
@@ -109,6 +111,9 @@ BIC_rrri         1110101 0001 . .... 0 ... .... .... ....     @s_rrr_shi
   SRSHR_ri       1110101 0010 1 .... 0 ... 1111 .. 10 1111    @mve_sh_ri
   SQSHL_ri       1110101 0010 1 .... 0 ... 1111 .. 11 1111    @mve_sh_ri
 
+  SQRSHR_rr      1110101 0010 1 .... .... 1111 0010 1101      @mve_sh_rr
+  UQRSHL_rr      1110101 0010 1 .... .... 1111 0000 1101      @mve_sh_rr
+
   MOV_rxri       1110101 0010 . 1111 0 ... .... .... ....     @s_rxr_shi
   ORR_rrri       1110101 0010 . .... 0 ... .... .... ....     @s_rrr_shi
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5e60e2a9d83..db5d6220854 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1638,3 +1638,13 @@ uint32_t HELPER(mve_sqshl)(CPUARMState *env, uint32_t n, uint32_t shift)
 {
     return do_sqrshl_bhs(n, (int8_t)shift, 32, false, &env->QF);
 }
+
+uint32_t HELPER(mve_uqrshl)(CPUARMState *env, uint32_t n, uint32_t shift)
+{
+    return do_uqrshl_bhs(n, (int8_t)shift, 32, true, &env->QF);
+}
+
+uint32_t HELPER(mve_sqrshr)(CPUARMState *env, uint32_t n, uint32_t shift)
+{
+    return do_sqrshl_bhs(n, -(int8_t)shift, 32, true, &env->QF);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e66d6469117..b51b55b9ea1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5927,6 +5927,36 @@ static bool trans_UQSHL_ri(DisasContext *s, arg_mve_sh_ri *a)
     return do_mve_sh_ri(s, a, gen_mve_uqshl);
 }
 
+static bool do_mve_sh_rr(DisasContext *s, arg_mve_sh_rr *a, ShiftFn *fn)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        /* Decode falls through to ORR/MOV UNPREDICTABLE handling */
+        return false;
+    }
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !arm_dc_feature(s, ARM_FEATURE_M_MAIN) ||
+        a->rda == 13 || a->rda == 15 || a->rm == 13 || a->rm == 15 ||
+        a->rm == a->rda) {
+        /* These rda/rm cases are UNPREDICTABLE; we choose to UNDEF */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    /* The helper takes care of the sign-extension of the low 8 bits of Rm */
+    fn(cpu_R[a->rda], cpu_env, cpu_R[a->rda], cpu_R[a->rm]);
+    return true;
+}
+
+static bool trans_SQRSHR_rr(DisasContext *s, arg_mve_sh_rr *a)
+{
+    return do_mve_sh_rr(s, a, gen_helper_mve_sqrshr);
+}
+
+static bool trans_UQRSHL_rr(DisasContext *s, arg_mve_sh_rr *a)
+{
+    return do_mve_sh_rr(s, a, gen_helper_mve_uqrshl);
+}
+
 /*
  * Multiply and multiply accumulate
  */
-- 
2.20.1


