Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF1DF5E4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 21:22:03 +0200 (CEST)
Received: from localhost ([::1]:47078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMdFh-0001fA-O9
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 15:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58725)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iMd73-0001Us-B5
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iMd71-0004IG-2S
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:13:05 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54034 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iMd70-0004H7-NG
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:13:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 5783E1A1FF1;
 Mon, 21 Oct 2019 21:11:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774.domain.local [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 0FCA21A219F;
 Mon, 21 Oct 2019 21:11:56 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/12] target/mips: msa: Split helpers for
 HSUB_<S|U>.<H|W|D>
Date: Mon, 21 Oct 2019 21:11:36 +0200
Message-Id: <1571685097-15175-12-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571685097-15175-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1571685097-15175-1-git-send-email-aleksandar.markovic@rt-rk.com>
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

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/helper.h     |  10 ++++-
 target/mips/msa_helper.c | 108 +++++++++++++++++++++++++++++++++++++++++------
 target/mips/translate.c  |  32 +++++++++++---
 3 files changed, 129 insertions(+), 21 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 7bb13d5..d7c4bbf 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -945,6 +945,14 @@ DEF_HELPER_4(msa_mod_s_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_s_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_s_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_hsub_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_hsub_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hsub_u_d, void, env, i32, i32, i32)
+
 DEF_HELPER_4(msa_ilvev_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ilvev_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ilvev_w, void, env, i32, i32, i32)
@@ -1059,8 +1067,6 @@ DEF_HELPER_5(msa_dpsub_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_sld_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_splat_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_vshf_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_hsub_s_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_hsub_u_df, void, env, i32, i32, i32, i32)
 
 DEF_HELPER_5(msa_sldi_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_splati_df, void, env, i32, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 2400632..ae9e8e0 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -2888,7 +2888,101 @@ void helper_msa_mod_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Int Subtract group helpers here */
+/* TODO: insert the rest of Int Subtract group helpers here */
+
+
+static inline int64_t msa_hsub_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    return SIGNED_ODD(arg1, df) - SIGNED_EVEN(arg2, df);
+}
+
+void helper_msa_hsub_s_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_hsub_s_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_hsub_s_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_hsub_s_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_hsub_s_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_hsub_s_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_hsub_s_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_hsub_s_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_hsub_s_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_hsub_s_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_hsub_s_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_hsub_s_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_hsub_s_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_hsub_s_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_hsub_s_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_hsub_s_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_hsub_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
+static inline int64_t msa_hsub_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    return UNSIGNED_ODD(arg1, df) - UNSIGNED_EVEN(arg2, df);
+}
+
+void helper_msa_hsub_u_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_hsub_u_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_hsub_u_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_hsub_u_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_hsub_u_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_hsub_u_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_hsub_u_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_hsub_u_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_hsub_u_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_hsub_u_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_hsub_u_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_hsub_u_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_hsub_u_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_hsub_u_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_hsub_u_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_hsub_u_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_hsub_u_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
 
 
 /*
@@ -4450,16 +4544,6 @@ static inline void msa_sld_df(uint32_t df, wr_t *pwd,
     }
 }
 
-static inline int64_t msa_hsub_s_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    return SIGNED_ODD(arg1, df) - SIGNED_EVEN(arg2, df);
-}
-
-static inline int64_t msa_hsub_u_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    return UNSIGNED_ODD(arg1, df) - UNSIGNED_EVEN(arg2, df);
-}
-
 static inline int64_t msa_mul_q_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t q_min = DF_MIN_INT(df);
@@ -4545,8 +4629,6 @@ MSA_BINOP_DF(asub_u)
 MSA_BINOP_DF(mulv)
 MSA_BINOP_DF(dotp_s)
 MSA_BINOP_DF(dotp_u)
-MSA_BINOP_DF(hsub_s)
-MSA_BINOP_DF(hsub_u)
 
 MSA_BINOP_DF(mul_q)
 MSA_BINOP_DF(mulr_q)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index a57e0da..4c68c5b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -29107,6 +29107,32 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
                 break;
             }
             break;
+        case OPC_HSUB_S_df:
+            switch (df) {
+            case DF_HALF:
+                gen_helper_msa_hsub_s_h(cpu_env, twd, tws, twt);
+                break;
+            case DF_WORD:
+                gen_helper_msa_hsub_s_w(cpu_env, twd, tws, twt);
+                break;
+            case DF_DOUBLE:
+                gen_helper_msa_hsub_s_d(cpu_env, twd, tws, twt);
+                break;
+            }
+            break;
+        case OPC_HSUB_U_df:
+            switch (df) {
+            case DF_HALF:
+                gen_helper_msa_hsub_u_h(cpu_env, twd, tws, twt);
+                break;
+            case DF_WORD:
+                gen_helper_msa_hsub_u_w(cpu_env, twd, tws, twt);
+                break;
+            case DF_DOUBLE:
+                gen_helper_msa_hsub_u_d(cpu_env, twd, tws, twt);
+                break;
+            }
+            break;
         case OPC_DOTP_S_df:
             gen_helper_msa_dotp_s_df(cpu_env, tdf, twd, tws, twt);
             break;
@@ -29125,12 +29151,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
         case OPC_DPSUB_U_df:
             gen_helper_msa_dpsub_u_df(cpu_env, tdf, twd, tws, twt);
             break;
-        case OPC_HSUB_S_df:
-            gen_helper_msa_hsub_s_df(cpu_env, tdf, twd, tws, twt);
-            break;
-        case OPC_HSUB_U_df:
-            gen_helper_msa_hsub_u_df(cpu_env, tdf, twd, tws, twt);
-            break;
         }
         break;
     default:
-- 
2.7.4


