Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B387E1816
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 12:36:06 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNDzp-0006FI-4H
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 06:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42935)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNDpv-0000yg-6D
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNDpr-0002xX-FM
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:50 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45374 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iNDpo-0002VE-Rm
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:45 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 753EC1A1E09;
 Wed, 23 Oct 2019 12:24:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6E5161A22AD;
 Wed, 23 Oct 2019 12:23:59 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 04/14] target/mips: msa: Split helpers for
 <MAX|MIN>_A.<B|H|W|D>
Date: Wed, 23 Oct 2019 12:23:37 +0200
Message-Id: <1571826227-10583-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571826227-10583-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1571826227-10583-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: aleksandar.rikalo@rt-rk.com, Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Achieves clearer code and slightly better performance.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/helper.h     |  11 +++-
 target/mips/msa_helper.c | 163 ++++++++++++++++++++++++++++++++++++++++++-----
 target/mips/translate.c  |  38 +++++++++--
 3 files changed, 187 insertions(+), 25 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index d615c83..cef4de6 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -877,6 +877,15 @@ DEF_HELPER_4(msa_div_u_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_div_u_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_div_u_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_max_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_max_a_d, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_min_a_d, void, env, i32, i32, i32)
+
 DEF_HELPER_4(msa_mod_u_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_u_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_u_w, void, env, i32, i32, i32)
@@ -940,8 +949,6 @@ DEF_HELPER_5(msa_max_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_max_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_min_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_min_u_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_max_a_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_min_a_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_add_a_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_adds_a_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_adds_s_df, void, env, i32, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index a2052ba..3eb0ab1 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1736,7 +1736,152 @@ void helper_msa_div_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Int Max Min group helpers here */
+static inline int64_t msa_max_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
+    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
+    return abs_arg1 > abs_arg2 ? arg1 : arg2;
+}
+
+void helper_msa_max_a_b(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_max_a_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_max_a_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_max_a_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_max_a_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_max_a_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_max_a_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_max_a_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_max_a_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_max_a_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_max_a_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_max_a_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_max_a_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_max_a_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_max_a_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_max_a_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_max_a_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_max_a_h(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_max_a_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_max_a_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_max_a_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_max_a_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_max_a_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_max_a_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_max_a_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_max_a_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_max_a_w(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_max_a_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_max_a_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_max_a_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_max_a_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_max_a_d(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_max_a_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_max_a_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
+static inline int64_t msa_min_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
+    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
+    return abs_arg1 < abs_arg2 ? arg1 : arg2;
+}
+
+void helper_msa_min_a_b(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_min_a_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_min_a_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_min_a_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_min_a_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_min_a_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_min_a_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_min_a_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_min_a_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_min_a_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_min_a_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_min_a_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_min_a_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_min_a_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_min_a_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_min_a_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_min_a_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_min_a_h(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_min_a_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_min_a_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_min_a_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_min_a_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_min_a_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_min_a_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_min_a_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_min_a_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_min_a_w(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_min_a_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_min_a_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_min_a_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_min_a_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_min_a_d(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_min_a_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_min_a_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
 
 
 /*
@@ -2456,20 +2601,6 @@ MSA_TEROP_IMMU_DF(binsli, binsl)
 MSA_TEROP_IMMU_DF(binsri, binsr)
 #undef MSA_TEROP_IMMU_DF
 
-static inline int64_t msa_max_a_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
-    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
-    return abs_arg1 > abs_arg2 ? arg1 : arg2;
-}
-
-static inline int64_t msa_min_a_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
-    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
-    return abs_arg1 < abs_arg2 ? arg1 : arg2;
-}
-
 static inline int64_t msa_add_a_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
@@ -2773,8 +2904,6 @@ MSA_BINOP_DF(max_s)
 MSA_BINOP_DF(max_u)
 MSA_BINOP_DF(min_s)
 MSA_BINOP_DF(min_u)
-MSA_BINOP_DF(max_a)
-MSA_BINOP_DF(min_a)
 MSA_BINOP_DF(add_a)
 MSA_BINOP_DF(adds_a)
 MSA_BINOP_DF(adds_s)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5039716..8e26548 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28642,6 +28642,38 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         break;
+    case OPC_MAX_A_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_max_a_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_max_a_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_max_a_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_max_a_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
+    case OPC_MIN_A_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_min_a_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_min_a_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_min_a_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_min_a_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
     case OPC_MOD_S_df:
         switch (df) {
         case DF_BYTE:
@@ -28767,15 +28799,9 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_ILVR_df:
         gen_helper_msa_ilvr_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MAX_A_df:
-        gen_helper_msa_max_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_ILVEV_df:
         gen_helper_msa_ilvev_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_MIN_A_df:
-        gen_helper_msa_min_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_ILVOD_df:
         gen_helper_msa_ilvod_df(cpu_env, tdf, twd, tws, twt);
         break;
-- 
2.7.4


