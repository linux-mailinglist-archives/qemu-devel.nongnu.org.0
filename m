Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239138B34F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 17:34:39 +0200 (CEST)
Received: from localhost ([::1]:49166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljkh4-0004vM-6n
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 11:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbP-0007of-BT
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbN-0000eC-3s
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:47 -0400
Received: by mail-wr1-x436.google.com with SMTP id c14so16321109wrx.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=n9p8pwMQumtdp/ZJ3zle1+NP3mYs3Ow9NwHjhceO1EI=;
 b=n8P1asFLSIAnOGCd12KUnDnQixup+dyPgnetfxege+3L+qcw9yd/zTN98KnM4J4w7z
 9nX/zyfBH0gAX7OzatbfkEuzn/sVFe8qMsrPau++X85ip5j2e1VS/tRBCxu3FhJZeE+f
 yMNn/wc9Nrr62N/d1VeQcHbVogE6pcpDJON3IsApFpZaa6YZt4X3JIBwC2jgVimrendr
 VBQQkxsAmVhdFOOJr23nnszwzjaMRc+Yu32QWhWMM2libzd90qIKYVKO/W9mhyn36Q5i
 hYJ2fLLaNq0G+8nr3PgY1w3jKLuMq7IVcB7eR7mTcinesnMQodw4aQ5HdGBILiQ9h6hM
 NHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n9p8pwMQumtdp/ZJ3zle1+NP3mYs3Ow9NwHjhceO1EI=;
 b=btsws9YAJwfjpoS1xpxGtX6ZA1t062Z3lUnciP3vO4rennFcWSmBmavPXf9QbX1EL5
 2qWyu8ySTyC63fIYIsz6fKM+e0rFycVl/5375znMabPKMW8aWNeOhXwF37WeTjOqFF83
 wQ2s7QMrDdpwWbFrTJTnApCb8G08Lho177pq46gfNentBUhXF1Nhch+fMGbNf5cJ+zJn
 BAqI7MBf7BtepD2Y/IdL57GBS5pfCxTxvkcb3zG7CbK2iZe5b+I6SZV3ICgooROl0Dtq
 W2ZniC2uVYZdZlNCy8yehwPEGYdHpQtDpPc/w7LJ+qU/gQ5QeSdgKcDqVtU1tv6hncy9
 USqQ==
X-Gm-Message-State: AOAM533sMVhlqBTCuzAV0dh8PNMcvZ1P0OIQTd3sDbQdUo0TYzHXLwM+
 uDWGb7CMvtESgUPWplm7jhCvgw==
X-Google-Smtp-Source: ABdhPJxraS84MoszFAYtMRiPN6MfwyuuZCIYhkLQz5GtrMOJeJk/LbcsRMkm2Airt9ULOdg6VIU9oQ==
X-Received: by 2002:a5d:58d0:: with SMTP id o16mr4895414wrf.420.1621524523763; 
 Thu, 20 May 2021 08:28:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/9] target/arm: Update feature checks for insns which are
 "MVE or FP"
Date: Thu, 20 May 2021 16:28:33 +0100
Message-Id: <20210520152840.24453-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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


