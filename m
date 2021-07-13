Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1AC3C7173
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:47:39 +0200 (CEST)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Il8-0001Go-2W
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Iba-0008W8-ND
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbU-0003fx-Ol
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1652400wmh.4
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WAuWkxdCynAW+qf4yNf2j7XCCuMuasPntN4NpfrGcTs=;
 b=ZeOcnWQdlj1Uc9k89hRhxBVW0WJXX6a2Lqhbw729fruUwaoWRSYdkgWEcLOB6jaWbK
 xVgCNSs3DKaXh3BMmNTTIrEh24GT1FeVZZ8x3yhAFe8++XHp+EiqJyfFOwuW/nGhc+pj
 qYQ7itUbcCe2H4kChuCWH4NuT21s6LfTGqLrIfBgGyXBTL5rw3AA62BPqYBP6drNuBKX
 e16NGhuw6q8f43t4ZA8UjPsyjunu3yAypqOEIjiaBk7UdIHl+NjdBHy9XnmSQkIstcIZ
 cJtyVzsz7cofvSm209ofjIRjAWLfAa8F3kWvCNRFamFfVljj3g5TbaqcAfaKDaT79GCc
 BTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAuWkxdCynAW+qf4yNf2j7XCCuMuasPntN4NpfrGcTs=;
 b=oi4/w5/G5DCrJtpjRB6GHEzM4KmfHomQyLaDOpWAfQ3Pfk8e2yH8ch3k+E0OpL8pyf
 I6tYmlkWEg1i/JcwXqm60sFMEfBXcCJTa8C01bTAcwrNcGaxMu+4fIQZvJTuYT+xFqbR
 uT6PYICCPsrJOR2mjeKKo0SrHy8BnB32+AabC6kk4GzH1P7U7ql8une/vHBp73XmhTEQ
 Na59kcyRbnpv6M5R3J5+crrH6f8AuAPXbWFkfKFRjOpx8Veatu3QcPfbHjVV+CqCOqVv
 2vWE62h4SMMFFkAZUNXIHSbuCx8j4CuBnulMwdRnBtPd8lPDMe3gwodY+Yh31Od0ZFUJ
 CMwg==
X-Gm-Message-State: AOAM530a86N/h5gFbG7Jx9+AqpAdbcavxsDbNg8TeDuB1SN8ouDsPA2W
 Fmese8GQsIbQrINFEcvaSI6RJ7eg0rkCWVOR
X-Google-Smtp-Source: ABdhPJwOjwLa8bgx4/U+ei2S83H0wcF5kU4XUjr87I6pa7BZpFX0anpmDKUpiAWvXuUCwwZBnh0Z+Q==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr70971wmb.27.1626183459137;
 Tue, 13 Jul 2021 06:37:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 13/34] target/arm: Factor out gen_vpst()
Date: Tue, 13 Jul 2021 14:37:05 +0100
Message-Id: <20210713133726.26842-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
---
 target/arm/translate-mve.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 52400864692..de65a1c3cf1 100644
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


