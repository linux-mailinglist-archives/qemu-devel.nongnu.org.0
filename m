Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CC13AB36B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:19:55 +0200 (CEST)
Received: from localhost ([::1]:34250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqzy-00062T-DT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwv-0001JQ-LI
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwo-0006xD-Rg
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id k42so1410403wms.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AjU+j51JCz+8YTrac3SuF15ciH6osQr8PuKPZdyYi+k=;
 b=aI3YSagXc6razkEAD/4P1fF9w+nue1EI+2MuwqMsq1Ltv/rBfMcboBwEHF1mg60Goi
 OKPJFla7hLbvz08O6wOVA4Y7g/DHm4LIOXPP0ZQq0tbhZwVOQwkuETNhwG4gxMn5uxkG
 a9zhvtw/nldSUjmZE97crixKmazksA57aUgC1joJVR376bsTpAO/EGHXad6AS5jOJVQz
 85CpFn+HzQYasNk//loF4jYpHuV1wYF+8GkJg+fvU0TeBfX9EneVQjEcGYFRsm24Lz9Z
 8/Nc+B1qJlccQOCItYdH68MJPXpKzyhn1YHKtMToQFSqpPrJ1tbO8/yUBTK8FpvjIQ8t
 t0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjU+j51JCz+8YTrac3SuF15ciH6osQr8PuKPZdyYi+k=;
 b=EpXcFTCj1JeDIZUmM1GMSB0OAj6Ek8yxLkIVKpwdWf342IZ+7lZ1XMRCUtGoxbTZBa
 Z43n5fIFB05esoGneV6D6ihv0nZKSQCFIrCjoVwGFoBZ9XKWVTlY+OMLhG339E6vL1su
 Clt/YzesbmjyQlPY2Akjy3XXlc5xaI9YkzbTPVlroUcfB+HAgEoIEt7CJV7ogI6fp4mm
 aPijYxfTEi60pdaO8aA9yBBPaB7Zu3bDwEwzoSspBETac6m1YyFVbM8caUIJU3iR0yIq
 k863ZBzuFiyf8tJPbV3ljfUm/JLBO/QNUBOkk5xx7mRzmsY42YUXGl1zfQ2kzvEubwTv
 HsBg==
X-Gm-Message-State: AOAM531VS7ngUdIS+0Cxg7apPy5+yYHFkx+nPFeP4Hln4DNphiGaF+/7
 Z2Bvn67znixXZgomSR2MnVMr1w==
X-Google-Smtp-Source: ABdhPJxiS78lde7saMt/hx5lmYq9JaKt7PRCmXAqWgM7/cTSudm68ECVpYAFp80w5SFsBJPUdS87sg==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr4735166wmb.130.1623932197499; 
 Thu, 17 Jun 2021 05:16:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 09/44] tcg: Make gen_dup_i32/i64() public as
 tcg_gen_dup_i32/i64
Date: Thu, 17 Jun 2021 13:15:53 +0100
Message-Id: <20210617121628.20116-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
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
---
Changes v2->v3: renamed and used different header file, as suggested
by Richard. I also added the _tl #define.
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


