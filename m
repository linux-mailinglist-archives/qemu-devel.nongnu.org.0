Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0FBDE85
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 15:05:49 +0200 (CEST)
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD6zM-000213-2h
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 09:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gr-0001U6-9f
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6go-0002Ld-Mj
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:40 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56137 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iD6go-0002GP-Ag
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:38 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 3D7791A2012;
 Wed, 25 Sep 2019 14:46:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 04DD51A23C0;
 Wed, 25 Sep 2019 14:46:22 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/20] target/mips: msa: Split helpers for
 DIV_<S|U>.<B|H|W|D>
Date: Wed, 25 Sep 2019 14:46:09 +0200
Message-Id: <1569415572-19635-18-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: arikalo@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Achieves clearer code and slightly better performance.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/helper.h     |  12 +++-
 target/mips/msa_helper.c | 159 +++++++++++++++++++++++++++++++++++++++++------
 target/mips/translate.c  |  38 +++++++++--
 3 files changed, 182 insertions(+), 27 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 29dfcf0..ec4982f 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -867,6 +867,16 @@ DEF_HELPER_4(msa_clt_u_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_clt_u_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_clt_u_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_div_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_div_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_div_u_d, void, env, i32, i32, i32)
+
 
 DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ori_b, void, env, i32, i32, i32)
@@ -929,8 +939,6 @@ DEF_HELPER_5(msa_asub_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_mulv_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_maddv_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_msubv_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_div_s_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_div_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_mod_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_mod_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_dotp_s_df, void, env, i32, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 4cf1a57..5f64e51 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1493,7 +1493,146 @@ void helper_msa_clt_u_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Int Divide group helpers here */
+
+static inline int64_t msa_div_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    if (arg1 == DF_MIN_INT(df) && arg2 == -1) {
+        return DF_MIN_INT(df);
+    }
+    return arg2 ? arg1 / arg2
+                : arg1 >= 0 ? -1 : 1;
+}
+
+void helper_msa_div_s_b(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[1]);
+    pwd->b[2]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[2]);
+    pwd->b[3]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[3]);
+    pwd->b[4]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[4]);
+    pwd->b[5]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[5]);
+    pwd->b[6]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[6]);
+    pwd->b[7]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[7]);
+    pwd->b[8]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[8]);
+    pwd->b[9]  = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[9]);
+    pwd->b[10] = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[10]);
+    pwd->b[11] = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[11]);
+    pwd->b[12] = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[12]);
+    pwd->b[13] = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[13]);
+    pwd->b[14] = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[14]);
+    pwd->b[15] = msa_div_s_df(DF_BYTE, pws->b[0],  pwt->b[15]);
+}
+
+void helper_msa_div_s_h(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[1]);
+    pwd->h[2]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[2]);
+    pwd->h[3]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[3]);
+    pwd->h[4]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[4]);
+    pwd->h[5]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[5]);
+    pwd->h[6]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[6]);
+    pwd->h[7]  = msa_div_s_df(DF_HALF, pws->h[0],  pwt->h[7]);
+}
+
+void helper_msa_div_s_w(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_div_s_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_div_s_df(DF_WORD, pws->w[0],  pwt->w[1]);
+    pwd->w[2]  = msa_div_s_df(DF_WORD, pws->w[0],  pwt->w[2]);
+    pwd->w[3]  = msa_div_s_df(DF_WORD, pws->w[0],  pwt->w[3]);
+}
+
+void helper_msa_div_s_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_div_s_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_div_s_df(DF_DOUBLE, pws->d[0],  pwt->d[1]);
+}
+
+static inline int64_t msa_div_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    uint64_t u_arg1 = UNSIGNED(arg1, df);
+    uint64_t u_arg2 = UNSIGNED(arg2, df);
+    return arg2 ? u_arg1 / u_arg2 : -1;
+}
+
+void helper_msa_div_u_b(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[1]);
+    pwd->b[2]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[2]);
+    pwd->b[3]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[3]);
+    pwd->b[4]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[4]);
+    pwd->b[5]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[5]);
+    pwd->b[6]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[6]);
+    pwd->b[7]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[7]);
+    pwd->b[8]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[8]);
+    pwd->b[9]  = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[9]);
+    pwd->b[10] = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[10]);
+    pwd->b[11] = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[11]);
+    pwd->b[12] = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[12]);
+    pwd->b[13] = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[13]);
+    pwd->b[14] = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[14]);
+    pwd->b[15] = msa_div_u_df(DF_BYTE, pws->b[0],  pwt->b[15]);
+}
+
+void helper_msa_div_u_h(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[1]);
+    pwd->h[2]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[2]);
+    pwd->h[3]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[3]);
+    pwd->h[4]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[4]);
+    pwd->h[5]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[5]);
+    pwd->h[6]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[6]);
+    pwd->h[7]  = msa_div_u_df(DF_HALF, pws->h[0],  pwt->h[7]);
+}
+
+void helper_msa_div_u_w(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_div_u_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_div_u_df(DF_WORD, pws->w[0],  pwt->w[1]);
+    pwd->w[2]  = msa_div_u_df(DF_WORD, pws->w[0],  pwt->w[2]);
+    pwd->w[3]  = msa_div_u_df(DF_WORD, pws->w[0],  pwt->w[3]);
+}
+
+void helper_msa_div_u_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_div_u_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_div_u_df(DF_DOUBLE, pws->d[0],  pwt->d[1]);
+}
 
 
 /*
@@ -2255,22 +2394,6 @@ static inline int64_t msa_mulv_df(uint32_t df, int64_t arg1, int64_t arg2)
     return arg1 * arg2;
 }
 
-static inline int64_t msa_div_s_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    if (arg1 == DF_MIN_INT(df) && arg2 == -1) {
-        return DF_MIN_INT(df);
-    }
-    return arg2 ? arg1 / arg2
-                : arg1 >= 0 ? -1 : 1;
-}
-
-static inline int64_t msa_div_u_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    uint64_t u_arg1 = UNSIGNED(arg1, df);
-    uint64_t u_arg2 = UNSIGNED(arg2, df);
-    return arg2 ? u_arg1 / u_arg2 : -1;
-}
-
 static inline int64_t msa_mod_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     if (arg1 == DF_MIN_INT(df) && arg2 == -1) {
@@ -2491,8 +2614,6 @@ MSA_BINOP_DF(subsuu_s)
 MSA_BINOP_DF(asub_s)
 MSA_BINOP_DF(asub_u)
 MSA_BINOP_DF(mulv)
-MSA_BINOP_DF(div_s)
-MSA_BINOP_DF(div_u)
 MSA_BINOP_DF(mod_s)
 MSA_BINOP_DF(mod_u)
 MSA_BINOP_DF(dotp_s)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 4db87d6..27eca0a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28610,6 +28610,38 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         break;
+    case OPC_DIV_S_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_div_s_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_div_s_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_div_s_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_div_s_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
+    case OPC_DIV_U_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_div_u_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_div_u_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_div_u_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_div_u_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
     case OPC_SLL_df:
         gen_helper_msa_sll_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -28691,9 +28723,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_ASUB_S_df:
         gen_helper_msa_asub_s_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_DIV_S_df:
-        gen_helper_msa_div_s_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_ILVL_df:
         gen_helper_msa_ilvl_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -28703,9 +28732,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_ASUB_U_df:
         gen_helper_msa_asub_u_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_DIV_U_df:
-        gen_helper_msa_div_u_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_ILVR_df:
         gen_helper_msa_ilvr_df(cpu_env, tdf, twd, tws, twt);
         break;
-- 
2.7.4


