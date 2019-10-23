Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B8EE18AE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 13:20:11 +0200 (CEST)
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNEgK-0005Qt-Lm
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 07:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNDpx-000102-TN
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNDpu-0002yi-5q
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:53 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:45453 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iNDpp-0002VP-A3
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 06:25:47 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 52A6B1A2143;
 Wed, 23 Oct 2019 12:24:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id F29811A2261;
 Wed, 23 Oct 2019 12:23:59 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/14] target/mips: msa: Split helpers for
 HADD_<S|U>.<H|W|D>
Date: Wed, 23 Oct 2019 12:23:41 +0200
Message-Id: <1571826227-10583-9-git-send-email-aleksandar.markovic@rt-rk.com>
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
 target/mips/helper.h     |  10 +++-
 target/mips/msa_helper.c | 131 ++++++++++++++++++++++++++++++++++++++---------
 target/mips/translate.c  |  32 +++++++++---
 3 files changed, 141 insertions(+), 32 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index ce01e97..f25ba90 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -847,6 +847,14 @@ DEF_HELPER_4(msa_addv_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_addv_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_addv_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_hadd_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_hadd_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_hadd_u_d, void, env, i32, i32, i32)
+
 DEF_HELPER_4(msa_ave_s_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ave_s_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ave_s_w, void, env, i32, i32, i32)
@@ -1024,8 +1032,6 @@ DEF_HELPER_5(msa_pckod_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_vshf_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_srar_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_srlr_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_hadd_s_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_hadd_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_hsub_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_hsub_u_df, void, env, i32, i32, i32, i32)
 
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index c31f46c..f5d3737 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1184,6 +1184,113 @@ void helper_msa_addv_d(CPUMIPSState *env,
 }
 
 
+#define SIGNED_EVEN(a, df) \
+        ((((int64_t)(a)) << (64 - DF_BITS(df) / 2)) >> (64 - DF_BITS(df) / 2))
+
+#define UNSIGNED_EVEN(a, df) \
+        ((((uint64_t)(a)) << (64 - DF_BITS(df) / 2)) >> (64 - DF_BITS(df) / 2))
+
+#define SIGNED_ODD(a, df) \
+        ((((int64_t)(a)) << (64 - DF_BITS(df))) >> (64 - DF_BITS(df) / 2))
+
+#define UNSIGNED_ODD(a, df) \
+        ((((uint64_t)(a)) << (64 - DF_BITS(df))) >> (64 - DF_BITS(df) / 2))
+
+
+static inline int64_t msa_hadd_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    return SIGNED_ODD(arg1, df) + SIGNED_EVEN(arg2, df);
+}
+
+void helper_msa_hadd_s_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_hadd_s_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_hadd_s_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_hadd_s_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_hadd_s_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_hadd_s_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_hadd_s_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_hadd_s_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_hadd_s_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_hadd_s_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_hadd_s_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_hadd_s_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_hadd_s_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_hadd_s_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_hadd_s_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_hadd_s_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_hadd_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
+static inline int64_t msa_hadd_u_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    return UNSIGNED_ODD(arg1, df) + UNSIGNED_EVEN(arg2, df);
+}
+
+void helper_msa_hadd_u_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_hadd_u_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_hadd_u_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_hadd_u_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_hadd_u_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_hadd_u_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_hadd_u_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_hadd_u_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_hadd_u_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_hadd_u_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_hadd_u_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_hadd_u_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_hadd_u_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_hadd_u_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_hadd_u_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_hadd_u_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_hadd_u_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
 /*
  * Int Average
  * -----------
@@ -3727,18 +3834,6 @@ static inline int64_t msa_mulv_df(uint32_t df, int64_t arg1, int64_t arg2)
     return arg1 * arg2;
 }
 
-#define SIGNED_EVEN(a, df) \
-        ((((int64_t)(a)) << (64 - DF_BITS(df) / 2)) >> (64 - DF_BITS(df) / 2))
-
-#define UNSIGNED_EVEN(a, df) \
-        ((((uint64_t)(a)) << (64 - DF_BITS(df) / 2)) >> (64 - DF_BITS(df) / 2))
-
-#define SIGNED_ODD(a, df) \
-        ((((int64_t)(a)) << (64 - DF_BITS(df))) >> (64 - DF_BITS(df) / 2))
-
-#define UNSIGNED_ODD(a, df) \
-        ((((uint64_t)(a)) << (64 - DF_BITS(df))) >> (64 - DF_BITS(df) / 2))
-
 #define SIGNED_EXTRACT(e, o, a, df)     \
     do {                                \
         e = SIGNED_EVEN(a, df);         \
@@ -3815,16 +3910,6 @@ static inline void msa_sld_df(uint32_t df, wr_t *pwd,
     }
 }
 
-static inline int64_t msa_hadd_s_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    return SIGNED_ODD(arg1, df) + SIGNED_EVEN(arg2, df);
-}
-
-static inline int64_t msa_hadd_u_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    return UNSIGNED_ODD(arg1, df) + UNSIGNED_EVEN(arg2, df);
-}
-
 static inline int64_t msa_hsub_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return SIGNED_ODD(arg1, df) - SIGNED_EVEN(arg2, df);
@@ -3925,8 +4010,6 @@ MSA_BINOP_DF(dotp_s)
 MSA_BINOP_DF(dotp_u)
 MSA_BINOP_DF(srar)
 MSA_BINOP_DF(srlr)
-MSA_BINOP_DF(hadd_s)
-MSA_BINOP_DF(hadd_u)
 MSA_BINOP_DF(hsub_s)
 MSA_BINOP_DF(hsub_u)
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 14f9891..9e8e973 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28990,6 +28990,32 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         switch (MASK_MSA_3R(ctx->opcode)) {
+        case OPC_HADD_S_df:
+            switch (df) {
+            case DF_HALF:
+                gen_helper_msa_hadd_s_h(cpu_env, twd, tws, twt);
+                break;
+            case DF_WORD:
+                gen_helper_msa_hadd_s_w(cpu_env, twd, tws, twt);
+                break;
+            case DF_DOUBLE:
+                gen_helper_msa_hadd_s_d(cpu_env, twd, tws, twt);
+                break;
+            }
+            break;
+        case OPC_HADD_U_df:
+            switch (df) {
+            case DF_HALF:
+                gen_helper_msa_hadd_u_h(cpu_env, twd, tws, twt);
+                break;
+            case DF_WORD:
+                gen_helper_msa_hadd_u_w(cpu_env, twd, tws, twt);
+                break;
+            case DF_DOUBLE:
+                gen_helper_msa_hadd_u_d(cpu_env, twd, tws, twt);
+                break;
+            }
+            break;
         case OPC_DOTP_S_df:
             gen_helper_msa_dotp_s_df(cpu_env, tdf, twd, tws, twt);
             break;
@@ -29005,15 +29031,9 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
         case OPC_DPSUB_S_df:
             gen_helper_msa_dpsub_s_df(cpu_env, tdf, twd, tws, twt);
             break;
-        case OPC_HADD_S_df:
-            gen_helper_msa_hadd_s_df(cpu_env, tdf, twd, tws, twt);
-            break;
         case OPC_DPSUB_U_df:
             gen_helper_msa_dpsub_u_df(cpu_env, tdf, twd, tws, twt);
             break;
-        case OPC_HADD_U_df:
-            gen_helper_msa_hadd_u_df(cpu_env, tdf, twd, tws, twt);
-            break;
         case OPC_HSUB_S_df:
             gen_helper_msa_hsub_s_df(cpu_env, tdf, twd, tws, twt);
             break;
-- 
2.7.4


