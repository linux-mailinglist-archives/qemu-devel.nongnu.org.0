Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6133B5F8A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:03:54 +0200 (CEST)
Received: from localhost ([::1]:58936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxrrd-000062-Mn
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrml-0002lb-Od
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrma-00061Q-Ua
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:58:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id a13so21388324wrf.10
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XO3DLIxHALVfZvKfS4jUqZHa6EDz5gRTzJxp9rmr/QQ=;
 b=rlZuvH49xuaWVnv7yvvHiHWBWZ39D9RdubQ1DP4OGIn5CknLdp1U6Hzjbk5j/VH0Y4
 96vsbGvYZWN+tcjzqiIkmfHCxEdjG38qaeezzJqL8fhggKUuaMKe/EYV1phsDrRIWg8U
 DssHbF8VFLRSGv91407E7Ixv2fL2dREuvqo6WHdXy5ghBBdOVAFKOIBdXlgPpa2w2XY3
 yM0fSI+/k/l+yXyXkqsZdBFN4m965VeaHUomBv0nmlXqK7zYSNOMUV2EhYGJs9SOA21T
 qHX3F5/n4J8cZ+KrdsmDP56KCLJr6fansVStjsPHmw2424QM5wGJAZEQnQ8bF3JA1HR7
 iMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XO3DLIxHALVfZvKfS4jUqZHa6EDz5gRTzJxp9rmr/QQ=;
 b=A5X8ntox9HSE2McAa5uayIm07X0tW1uDtK6eeY4glPf1ZCM2whREsyCa0EKGRej1yj
 Hp0gduiMlUA9ViWboOpKyHaQqyYXNAaQtJ5H+rSTYmuD1ZXVVZ8xSSomLg+2X8Bycynf
 6mqQf4j+MMDMs/31n/PWVznyPIDi25Qy9UND0c36GF85seX4qMxHPCRLLp4HzVJanSxW
 jJktNGAEpjKKgdEpjeH0JmeZ2bsYrqq+NXkm4SyVfUxbsqsku2Tr6Uf6Jyi2jUnXkohx
 gQXtt1INI6DB3dIl+2G3mcx7eMMlecSWTTfcl7IK1n3BGcgLzFlHYB7elKoFDrMBFMNJ
 DERw==
X-Gm-Message-State: AOAM532W3q7PiYjOIXVXH6+VuzxUsVHVgQw8OQlh/z99HCq24obMw5FT
 Y1VjG+VsGmZxNlpGGroQjZUQqw==
X-Google-Smtp-Source: ABdhPJzCf3Rf/LFQMEE/GIGqVFNCqHGszI6F3XvC8+skpUD7Y+v5z6j7Zi7uhsuL9ZKFxiHWBckQ4w==
X-Received: by 2002:a5d:4b92:: with SMTP id b18mr27535831wrt.124.1624888719618; 
 Mon, 28 Jun 2021 06:58:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/18] target/arm: Make asimd_imm_const() public
Date: Mon, 28 Jun 2021 14:58:20 +0100
Message-Id: <20210628135835.6690-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The function asimd_imm_const() in translate-neon.c is an
implementation of the pseudocode AdvSIMDExpandImm(), which we will
also want for MVE.  Move the implementation to translate.c, with a
prototype in translate.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h      | 16 ++++++++++
 target/arm/translate-neon.c | 63 -------------------------------------
 target/arm/translate.c      | 57 +++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 63 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 99c917c571a..6c8d5f6ede1 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -532,4 +532,20 @@ static inline MemOp finalize_memop(DisasContext *s, MemOp opc)
     return opc | s->be_data;
 }
 
+/**
+ * asimd_imm_const: Expand an encoded SIMD constant value
+ *
+ * Expand a SIMD constant value. This is essentially the pseudocode
+ * AdvSIMDExpandImm, except that we also perform the boolean NOT needed for
+ * VMVN and VBIC (when cmode < 14 && op == 1).
+ *
+ * The combination cmode == 15 op == 1 is a reserved encoding for AArch32;
+ * callers must catch this.
+ *
+ * cmode = 2,3,4,5,6,7,10,11,12,13 imm=0 was UNPREDICTABLE in v7A but
+ * is either not unpredictable or merely CONSTRAINED UNPREDICTABLE in v8A;
+ * we produce an immediate constant value of 0 in these cases.
+ */
+uint64_t asimd_imm_const(uint32_t imm, int cmode, int op);
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 633fef3bf76..f915f70970b 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -1781,69 +1781,6 @@ DO_FP_2SH(VCVT_UH, gen_helper_gvec_vcvt_uh)
 DO_FP_2SH(VCVT_HS, gen_helper_gvec_vcvt_hs)
 DO_FP_2SH(VCVT_HU, gen_helper_gvec_vcvt_hu)
 
-static uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
-{
-    /*
-     * Expand the encoded constant.
-     * Note that cmode = 2,3,4,5,6,7,10,11,12,13 imm=0 is UNPREDICTABLE.
-     * We choose to not special-case this and will behave as if a
-     * valid constant encoding of 0 had been given.
-     * cmode = 15 op = 1 must UNDEF; we assume decode has handled that.
-     */
-    switch (cmode) {
-    case 0: case 1:
-        /* no-op */
-        break;
-    case 2: case 3:
-        imm <<= 8;
-        break;
-    case 4: case 5:
-        imm <<= 16;
-        break;
-    case 6: case 7:
-        imm <<= 24;
-        break;
-    case 8: case 9:
-        imm |= imm << 16;
-        break;
-    case 10: case 11:
-        imm = (imm << 8) | (imm << 24);
-        break;
-    case 12:
-        imm = (imm << 8) | 0xff;
-        break;
-    case 13:
-        imm = (imm << 16) | 0xffff;
-        break;
-    case 14:
-        if (op) {
-            /*
-             * This is the only case where the top and bottom 32 bits
-             * of the encoded constant differ.
-             */
-            uint64_t imm64 = 0;
-            int n;
-
-            for (n = 0; n < 8; n++) {
-                if (imm & (1 << n)) {
-                    imm64 |= (0xffULL << (n * 8));
-                }
-            }
-            return imm64;
-        }
-        imm |= (imm << 8) | (imm << 16) | (imm << 24);
-        break;
-    case 15:
-        imm = ((imm & 0x80) << 24) | ((imm & 0x3f) << 19)
-            | ((imm & 0x40) ? (0x1f << 25) : (1 << 30));
-        break;
-    }
-    if (op) {
-        imm = ~imm;
-    }
-    return dup_const(MO_32, imm);
-}
-
 static bool do_1reg_imm(DisasContext *s, arg_1reg_imm *a,
                         GVecGen2iFn *fn)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9e2cca77077..97eea935433 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -90,6 +90,63 @@ void arm_translate_init(void)
     a64_translate_init();
 }
 
+uint64_t asimd_imm_const(uint32_t imm, int cmode, int op)
+{
+    /* Expand the encoded constant as per AdvSIMDExpandImm pseudocode */
+    switch (cmode) {
+    case 0: case 1:
+        /* no-op */
+        break;
+    case 2: case 3:
+        imm <<= 8;
+        break;
+    case 4: case 5:
+        imm <<= 16;
+        break;
+    case 6: case 7:
+        imm <<= 24;
+        break;
+    case 8: case 9:
+        imm |= imm << 16;
+        break;
+    case 10: case 11:
+        imm = (imm << 8) | (imm << 24);
+        break;
+    case 12:
+        imm = (imm << 8) | 0xff;
+        break;
+    case 13:
+        imm = (imm << 16) | 0xffff;
+        break;
+    case 14:
+        if (op) {
+            /*
+             * This is the only case where the top and bottom 32 bits
+             * of the encoded constant differ.
+             */
+            uint64_t imm64 = 0;
+            int n;
+
+            for (n = 0; n < 8; n++) {
+                if (imm & (1 << n)) {
+                    imm64 |= (0xffULL << (n * 8));
+                }
+            }
+            return imm64;
+        }
+        imm |= (imm << 8) | (imm << 16) | (imm << 24);
+        break;
+    case 15:
+        imm = ((imm & 0x80) << 24) | ((imm & 0x3f) << 19)
+            | ((imm & 0x40) ? (0x1f << 25) : (1 << 30));
+        break;
+    }
+    if (op) {
+        imm = ~imm;
+    }
+    return dup_const(MO_32, imm);
+}
+
 /* Generate a label used for skipping this instruction */
 void arm_gen_condlabel(DisasContext *s)
 {
-- 
2.20.1


