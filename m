Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5343F7396
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:45:49 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqPa-0005Bp-4P
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG6-0003AJ-22
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:50 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqG4-0005MW-AM
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:49 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h13so35715687wrp.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lONbbID3VHlgzJU0nIMD9RpteXWbXJ5QRJzmueidsYM=;
 b=uwYaC7pRbu1AyEl8+tiB3Oa4VgvqBku08puYh37GvnfuSKc5JhxpQqgtDaLrYB2IGf
 aaXCdO/GtuPfYwUW28eBbzw4v2UWghAs5Hca+YQ67hkUnJFe+a3mtvuR4VJ3TdF7QXQJ
 KjxZnsR3052OI8eItAuF8DUcPs1bo3df+Qb5/l052WDD/84LP64obTJgPzYjrX1uJ8dj
 AF5i/t03F/3ou4hz1LbqfNkd0Etw8oSkxRci6LzxNcX3K08eTQqmcyoItMkxfm6GSbxe
 yluMQA9avDyTLQZKCYsfzfTuSCXWDXNTq7UOIRux/Ruipd8Ko8sI9baaHKkEBSdwYWU5
 McTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lONbbID3VHlgzJU0nIMD9RpteXWbXJ5QRJzmueidsYM=;
 b=fvlBP4XwKfrAFprmXYCqfLOacXc0l4R2kbnr8t8MSLpZPHXcT9oWTNrc6wYgAcy5V4
 BTek2W0Qv6XzHT2r/POxsWcuoWWcashXUaTb7YJKzxV/m/L9MSpQ6U2mrveIGuQkseTg
 2CLsmEqxppV5S9UJQRqMDXCLKcpk4DBHToZzXGyCBOOVaFZ+v0epssmidpstJnx8uQfR
 uIQKrF3tbSe8mdLscJtfMHAMsWz3xz3u2PxCOt+eu8qnNu0Z4BYR9tYnLP1q+23qi34o
 P5Vlq2DYELMH3NNaMpzyjFtOhiiT9rvfLhuqcrvOmXn2jvlf85wH6rhBgceak92G+4NX
 G5dg==
X-Gm-Message-State: AOAM531mUKmhCEFGFJPaktlxLt5FxFHQ6I+36e6Ld1IYdd/vLADj+2K/
 ZgueZDsADixdwxkf14o/goMSFdofza1zpw==
X-Google-Smtp-Source: ABdhPJwPCX+QovSk4xeuJMnZxZbOm/rhfcosbuW1WHUux3y+ZgKAlFtfJb5fV2T2+KaXdysO3Wn/5Q==
X-Received: by 2002:a5d:638d:: with SMTP id p13mr18698667wru.223.1629887746950; 
 Wed, 25 Aug 2021 03:35:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/44] target/arm: Factor out gen_vpst()
Date: Wed, 25 Aug 2021 11:35:04 +0100
Message-Id: <20210825103534.6936-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Factor out the "generate code to update VPR.MASK01/MASK23" part of
trans_VPST(); we are going to want to reuse it for the VPT insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a220521c00b..6d8da361469 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -737,33 +737,24 @@ static bool trans_VRMLSLDAVH(DisasContext *s, arg_vmlaldav *a)
     return do_long_dual_acc(s, a, fns[a->x]);
 }
 
-static bool trans_VPST(DisasContext *s, arg_VPST *a)
+static void gen_vpst(DisasContext *s, uint32_t mask)
 {
-    TCGv_i32 vpr;
-
-    /* mask == 0 is a "related encoding" */
-    if (!dc_isar_feature(aa32_mve, s) || !a->mask) {
-        return false;
-    }
-    if (!mve_eci_check(s) || !vfp_access_check(s)) {
-        return true;
-    }
     /*
      * Set the VPR mask fields. We take advantage of MASK01 and MASK23
      * being adjacent fields in the register.
      *
-     * This insn is not predicated, but it is subject to beat-wise
+     * Updating the masks is not predicated, but it is subject to beat-wise
      * execution, and the mask is updated on the odd-numbered beats.
      * So if PSR.ECI says we should skip beat 1, we mustn't update the
      * 01 mask field.
      */
-    vpr = load_cpu_field(v7m.vpr);
+    TCGv_i32 vpr = load_cpu_field(v7m.vpr);
     switch (s->eci) {
     case ECI_NONE:
     case ECI_A0:
         /* Update both 01 and 23 fields */
         tcg_gen_deposit_i32(vpr, vpr,
-                            tcg_constant_i32(a->mask | (a->mask << 4)),
+                            tcg_constant_i32(mask | (mask << 4)),
                             R_V7M_VPR_MASK01_SHIFT,
                             R_V7M_VPR_MASK01_LENGTH + R_V7M_VPR_MASK23_LENGTH);
         break;
@@ -772,13 +763,25 @@ static bool trans_VPST(DisasContext *s, arg_VPST *a)
     case ECI_A0A1A2B0:
         /* Update only the 23 mask field */
         tcg_gen_deposit_i32(vpr, vpr,
-                            tcg_constant_i32(a->mask),
+                            tcg_constant_i32(mask),
                             R_V7M_VPR_MASK23_SHIFT, R_V7M_VPR_MASK23_LENGTH);
         break;
     default:
         g_assert_not_reached();
     }
     store_cpu_field(vpr, v7m.vpr);
+}
+
+static bool trans_VPST(DisasContext *s, arg_VPST *a)
+{
+    /* mask == 0 is a "related encoding" */
+    if (!dc_isar_feature(aa32_mve, s) || !a->mask) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+    gen_vpst(s, a->mask);
     mve_update_and_store_eci(s);
     return true;
 }
-- 
2.20.1


