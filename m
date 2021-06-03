Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D577039A539
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:02:26 +0200 (CEST)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lopnd-0003uP-RY
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkW-0007oN-PR
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkU-0006lE-3w
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id z8so6355448wrp.12
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=a7vuyrkb2vzc3hIuNJsHgyPQ2xdcERO/+RVIeaq9+Do=;
 b=gCG2xMCY5GC9fV3L9LhnCtpOAa1QE5rxuAOfWpqQJBF2MfJ1nAA7Bue4IzXNWsFcg8
 IY9Wiy2YEnCMzQHQQbd8FIU9vgPG/ybWu7aEkM8LNeUN2FClsa9WsdWk1k007yWADlq3
 whKh3aN5pE7tBqUCLpa2UC/1EdtbPcT0+GH9uHwWzxod2co5dJG31TBRm3sLyyOybqNK
 XUM8B1KOKDD+775fWeHine+GFofycRWZ1iDvAzzzsu2Fw8dUQVDQdxQLM92nKqTtG/j4
 gDr93zW0gS5HtP2/e3WGQ3QV6O+bb06U+SyPmgqnQOAiD50t2XQRm/G9L8/HF+pXH4q/
 OOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7vuyrkb2vzc3hIuNJsHgyPQ2xdcERO/+RVIeaq9+Do=;
 b=cTrl6D8ZmiGHK76oH8rNDxSdqgVAmD32Jlo5mx634HqTXAjk76XRzQm3VPdL8JZRwb
 JOCak2+c2Ctf64QcHNiY5XZNAtl/CRWoAvAyklt22kcs/Htm/FKOJJE8vODcz9XU+2yn
 +N8QePPH9tXST++j+73xfwiwMlk/Mwgiao+lbnLR8OyI31atGts7zguPJyiaswwKlTHF
 K2u6BFLvd6rBAuOCWRDmgAG7gezeJixKnNWnkNHezkx5VbipvNfFrhhxo+D7OhhqLpxs
 LJnGt2LNjnosk1bmnKT6mC2wQFnZr6H8K7ZX1xaA4rL53DxbVO+8WpjLyOoSfkVdChzg
 TzaA==
X-Gm-Message-State: AOAM533bE0C68f+LvTvUspoCGd0QMEx8wO4oM3xyN0ohHALPhzwLKtL4
 hSv1hXVXSLWdfjMq7VNQFnT44J+2GRVepfnI
X-Google-Smtp-Source: ABdhPJw7fH+6Avxj5z7cGnMXkEFDE6nCDlDD4NUr36KkF63DH6tYZVWCRCwCNd79N6JBqIwhH4Q3tQ==
X-Received: by 2002:a5d:46cb:: with SMTP id g11mr644377wrs.418.1622735948484; 
 Thu, 03 Jun 2021 08:59:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/45] target/arm: Update feature checks for insns which are
 "MVE or FP"
Date: Thu,  3 Jun 2021 16:58:21 +0100
Message-Id: <20210603155904.26021-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Some v8M instructions are present if either the floating point
extension or MVE is implemented.  Update our implementation of them
to check for MVE as well as for FP.

This is all the insns which use CheckDecodeFaults(ExtType_MveOrFp) or
CheckDecodeFaults(ExtType_MveOrDpFp) in their pseudocode, which are
essentially the loads and stores, moves and sysreg accesses, except
for VMOV_reg_sp and VMOV_reg_dp, which we handle in subsequent
patches because they need a refactor to provide a place to put the
new MVE check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210520152840.24453-3-peter.maydell@linaro.org
---
 target/arm/translate-vfp.c | 48 +++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 3da84f30a01..2202f8985d2 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -543,11 +543,16 @@ static bool trans_VMOV_to_gp(DisasContext *s, arg_VMOV_to_gp *a)
     /* VMOV scalar to general purpose register */
     TCGv_i32 tmp;
 
-    /* SIZE == MO_32 is a VFP instruction; otherwise NEON.  */
-    if (a->size == MO_32
-        ? !dc_isar_feature(aa32_fpsp_v2, s)
-        : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
-        return false;
+    /*
+     * SIZE == MO_32 is a VFP instruction; otherwise NEON. MVE has
+     * all sizes, whether the CPU has fp or not.
+     */
+    if (!dc_isar_feature(aa32_mve, s)) {
+        if (a->size == MO_32
+            ? !dc_isar_feature(aa32_fpsp_v2, s)
+            : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
+            return false;
+        }
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
@@ -571,11 +576,16 @@ static bool trans_VMOV_from_gp(DisasContext *s, arg_VMOV_from_gp *a)
     /* VMOV general purpose register to scalar */
     TCGv_i32 tmp;
 
-    /* SIZE == MO_32 is a VFP instruction; otherwise NEON.  */
-    if (a->size == MO_32
-        ? !dc_isar_feature(aa32_fpsp_v2, s)
-        : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
-        return false;
+    /*
+     * SIZE == MO_32 is a VFP instruction; otherwise NEON. MVE has
+     * all sizes, whether the CPU has fp or not.
+     */
+    if (!dc_isar_feature(aa32_mve, s)) {
+        if (a->size == MO_32
+            ? !dc_isar_feature(aa32_fpsp_v2, s)
+            : !arm_dc_feature(s, ARM_FEATURE_NEON)) {
+            return false;
+        }
     }
 
     /* UNDEF accesses to D16-D31 if they don't exist */
@@ -671,7 +681,7 @@ typedef enum FPSysRegCheckResult {
 
 static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
 {
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return FPSysRegCheckFailed;
     }
 
@@ -1254,7 +1264,7 @@ static bool trans_VMOV_single(DisasContext *s, arg_VMOV_single *a)
 {
     TCGv_i32 tmp;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1287,7 +1297,7 @@ static bool trans_VMOV_64_sp(DisasContext *s, arg_VMOV_64_sp *a)
 {
     TCGv_i32 tmp;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1329,7 +1339,7 @@ static bool trans_VMOV_64_dp(DisasContext *s, arg_VMOV_64_dp *a)
      * floating point register.  Note that this does not require support
      * for double precision arithmetic.
      */
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1368,7 +1378,7 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     uint32_t offset;
     TCGv_i32 addr, tmp;
 
-    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1403,7 +1413,7 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     uint32_t offset;
     TCGv_i32 addr, tmp;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1439,7 +1449,7 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     TCGv_i64 tmp;
 
     /* Note that this does not require support for double arithmetic.  */
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1479,7 +1489,7 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     TCGv_i32 addr, tmp;
     int i, n;
 
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
@@ -1557,7 +1567,7 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     int i, n;
 
     /* Note that this does not require support for double arithmetic.  */
-    if (!dc_isar_feature(aa32_fpsp_v2, s)) {
+    if (!dc_isar_feature(aa32_fpsp_v2, s) && !dc_isar_feature(aa32_mve, s)) {
         return false;
     }
 
-- 
2.20.1


