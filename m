Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8303AEFCF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:40:05 +0200 (CEST)
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMxw-0002J4-5w
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnH-0007EC-9j
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:03 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMn9-0007Zy-46
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:02 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso407081wms.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Pw1LoX5aEGi8/1gaQ+fA9/sHVVZFYrW4J8ovX5aE9LA=;
 b=EXno+1ZOGeyQCHochh6AsuHlhmjzPBlfm9iBNtLx0uzVpLSSCVFYmHRcXy2x99NfVp
 kfhkMhVkpCMPtD06QndGiBkRLsQ49TeNtnyTFsWmngXw1Fn53v1OOqoY5ah7T016jAUS
 7nHQAUpCIjr6YwWySPCfHnFEIyQA056F4Id3LaDkR/YB1KqAaIvGnLKDTpPInkwCoiU1
 W8aEhfJwriHgqY0eSn+ROciffn1oiZizeZoY00bfKXIwccGzwvNqkszJs1st74KCJjLF
 rXcswrfpk4WoqojWkVAGKCvsvbFoS2QrWndN9xmNiLoIIQjz82Y41ostNIA2yekFOHYX
 4D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pw1LoX5aEGi8/1gaQ+fA9/sHVVZFYrW4J8ovX5aE9LA=;
 b=OqjDMJ/9qxpgpmjA9rhNRfttlLQVr45E6f2lczk4XgWUDCn24rzcBqTl6F8L9kh/vy
 JX1quQfwbXed3YPaG2BPg9VhQTMxtMt1v4atsnoMp/YGUhcF1SLViDK9rjH/gTSAUwc8
 c1PCnVhCqi3NCYi170BN3XcktlDtW1VEXDmWcUFCmHnLpV1xA6PcuSrFJjplVBp1YADe
 yWwrdyXr55cYamslbkbicavNeqyHadZQwRrBTkBdRS7o1YU2759FD8jDOdkA4/LvvIi0
 tVEKuig3nfeRA0Axr7g73ursXb1tnJAHvH1v9sIRlMlAVKPS87HhXtY6Hm0yz4xYbWMj
 0/QA==
X-Gm-Message-State: AOAM531repkmFrgYjlf1SiTpk0hTS5iRZMDJs11wlVdNZT6ktT3Uv9Mh
 8vz+yImybYFnGwqATCNoecpREyADeDVBeU5d
X-Google-Smtp-Source: ABdhPJxQKY0zg0QYTG7eYRusGAv8/aigMs+aiiDjZdHFGveA7tYGWOuZfeDCzLHNbszV1+evZWtR+Q==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr28572611wmj.128.1624292933076; 
 Mon, 21 Jun 2021 09:28:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/57] tcg: Make gen_dup_i32/i64() public as tcg_gen_dup_i32/i64
Date: Mon, 21 Jun 2021 17:27:56 +0100
Message-Id: <20210621162833.32535-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The Arm MVE VDUP implementation would like to be able to emit code to
duplicate a byte or halfword value into an i32.  We have code to do
this already in tcg-op-gvec.c, so all we need to do is make the
functions global.

For consistency with other functions made available to the frontends:
 * we rename to tcg_gen_dup_*
 * we expose both the _i32 and _i64 forms
 * we provide the #define for a _tl form

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210617121628.20116-10-peter.maydell@linaro.org
---
 include/tcg/tcg-op.h |  8 ++++++++
 include/tcg/tcg.h    |  1 -
 tcg/tcg-op-gvec.c    | 20 ++++++++++----------
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index ef8a008ea74..1a2ae937583 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -338,6 +338,9 @@ void tcg_gen_umin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_umax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
 void tcg_gen_abs_i32(TCGv_i32, TCGv_i32);
 
+/* Replicate a value of size @vece from @in to all the lanes in @out */
+void tcg_gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in);
+
 static inline void tcg_gen_discard_i32(TCGv_i32 arg)
 {
     tcg_gen_op1_i32(INDEX_op_discard, arg);
@@ -534,6 +537,9 @@ void tcg_gen_umin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_umax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
 void tcg_gen_abs_i64(TCGv_i64, TCGv_i64);
 
+/* Replicate a value of size @vece from @in to all the lanes in @out */
+void tcg_gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in);
+
 #if TCG_TARGET_REG_BITS == 64
 static inline void tcg_gen_discard_i64(TCGv_i64 arg)
 {
@@ -1127,6 +1133,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_atomic_smax_fetch_tl tcg_gen_atomic_smax_fetch_i64
 #define tcg_gen_atomic_umax_fetch_tl tcg_gen_atomic_umax_fetch_i64
 #define tcg_gen_dup_tl_vec  tcg_gen_dup_i64_vec
+#define tcg_gen_dup_tl tcg_gen_dup_i64
 #else
 #define tcg_gen_movi_tl tcg_gen_movi_i32
 #define tcg_gen_mov_tl tcg_gen_mov_i32
@@ -1241,6 +1248,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_atomic_smax_fetch_tl tcg_gen_atomic_smax_fetch_i32
 #define tcg_gen_atomic_umax_fetch_tl tcg_gen_atomic_umax_fetch_i32
 #define tcg_gen_dup_tl_vec  tcg_gen_dup_i32_vec
+#define tcg_gen_dup_tl tcg_gen_dup_i32
 #endif
 
 #if UINTPTR_MAX == UINT32_MAX
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 064dab383bc..483e1e1f24e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1331,7 +1331,6 @@ uint64_t dup_const(unsigned vece, uint64_t c);
         : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
-
 /*
  * Memory helpers that will be used by TCG generated code.
  */
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 498a959839f..515db120cc6 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -386,7 +386,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c)
 }
 
 /* Duplicate IN into OUT as per VECE.  */
-static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
+void tcg_gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
 {
     switch (vece) {
     case MO_8:
@@ -404,7 +404,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
     }
 }
 
-static void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in)
+void tcg_gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in)
 {
     switch (vece) {
     case MO_8:
@@ -578,15 +578,15 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
                 && (vece != MO_32 || !check_size_impl(oprsz, 4))) {
                 t_64 = tcg_temp_new_i64();
                 tcg_gen_extu_i32_i64(t_64, in_32);
-                gen_dup_i64(vece, t_64, t_64);
+                tcg_gen_dup_i64(vece, t_64, t_64);
             } else {
                 t_32 = tcg_temp_new_i32();
-                gen_dup_i32(vece, t_32, in_32);
+                tcg_gen_dup_i32(vece, t_32, in_32);
             }
         } else if (in_64) {
             /* We are given a 64-bit variable input.  */
             t_64 = tcg_temp_new_i64();
-            gen_dup_i64(vece, t_64, in_64);
+            tcg_gen_dup_i64(vece, t_64, in_64);
         } else {
             /* We are given a constant input.  */
             /* For 64-bit hosts, use 64-bit constants for "simple" constants
@@ -1311,14 +1311,14 @@ void tcg_gen_gvec_2s(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
     } else if (g->fni8 && check_size_impl(oprsz, 8)) {
         TCGv_i64 t64 = tcg_temp_new_i64();
 
-        gen_dup_i64(g->vece, t64, c);
+        tcg_gen_dup_i64(g->vece, t64, c);
         expand_2s_i64(dofs, aofs, oprsz, t64, g->scalar_first, g->fni8);
         tcg_temp_free_i64(t64);
     } else if (g->fni4 && check_size_impl(oprsz, 4)) {
         TCGv_i32 t32 = tcg_temp_new_i32();
 
         tcg_gen_extrl_i64_i32(t32, c);
-        gen_dup_i32(g->vece, t32, t32);
+        tcg_gen_dup_i32(g->vece, t32, t32);
         expand_2s_i32(dofs, aofs, oprsz, t32, g->scalar_first, g->fni4);
         tcg_temp_free_i32(t32);
     } else {
@@ -2538,7 +2538,7 @@ void tcg_gen_gvec_ands(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    gen_dup_i64(vece, tmp, c);
+    tcg_gen_dup_i64(vece, tmp, c);
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ands);
     tcg_temp_free_i64(tmp);
 }
@@ -2562,7 +2562,7 @@ void tcg_gen_gvec_xors(unsigned vece, uint32_t dofs, uint32_t aofs,
                        TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    gen_dup_i64(vece, tmp, c);
+    tcg_gen_dup_i64(vece, tmp, c);
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_xors);
     tcg_temp_free_i64(tmp);
 }
@@ -2586,7 +2586,7 @@ void tcg_gen_gvec_ors(unsigned vece, uint32_t dofs, uint32_t aofs,
                       TCGv_i64 c, uint32_t oprsz, uint32_t maxsz)
 {
     TCGv_i64 tmp = tcg_temp_new_i64();
-    gen_dup_i64(vece, tmp, c);
+    tcg_gen_dup_i64(vece, tmp, c);
     tcg_gen_gvec_2s(dofs, aofs, oprsz, maxsz, tmp, &gop_ors);
     tcg_temp_free_i64(tmp);
 }
-- 
2.20.1


