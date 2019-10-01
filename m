Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951E8C38F7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 17:28:55 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFK57-00075w-V0
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 11:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45364)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJth-0004hI-89
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJte-0001vD-As
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:05 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59932 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iFJtd-0001sz-O9
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 392D11A23B5;
 Tue,  1 Oct 2019 17:15:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.55])
 by mail.rt-rk.com (Postfix) with ESMTPSA id BCD781A22D5;
 Tue,  1 Oct 2019 17:15:54 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] target/mips: msa: Split helpers for CEQ.<B|H|W|D>
Date: Tue,  1 Oct 2019 17:15:38 +0200
Message-Id: <1569942944-10381-13-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569942944-10381-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1569942944-10381-1-git-send-email-aleksandar.markovic@rt-rk.com>
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Achieves clearer code and slightly better performance.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Message-Id: <1569415572-19635-15-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/helper.h     |  6 +++-
 target/mips/msa_helper.c | 73 +++++++++++++++++++++++++++++++++++++++++++-----
 target/mips/translate.c  | 19 +++++++++++--
 3 files changed, 87 insertions(+), 11 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 9d4c9f1..95eb065 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -842,6 +842,11 @@ DEF_HELPER_4(msa_aver_u_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_aver_u_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_aver_u_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_ceq_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ceq_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ceq_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_ceq_d, void, env, i32, i32, i32)
+
 
 DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ori_b, void, env, i32, i32, i32)
@@ -891,7 +896,6 @@ DEF_HELPER_5(msa_min_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_min_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_max_a_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_min_a_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_ceq_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_clt_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_clt_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_cle_s_df, void, env, i32, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 17443b9..c8c6cdb 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -1153,7 +1153,72 @@ void helper_msa_aver_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Int Compare group helpers here */
+static inline int64_t msa_ceq_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    return arg1 == arg2 ? -1 : 0;
+}
+
+void helper_msa_ceq_b(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_ceq_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_ceq_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_ceq_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_ceq_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_ceq_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_ceq_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_ceq_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_ceq_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_ceq_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_ceq_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_ceq_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_ceq_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_ceq_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_ceq_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_ceq_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_ceq_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_ceq_h(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_ceq_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_ceq_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_ceq_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_ceq_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_ceq_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_ceq_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_ceq_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_ceq_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_ceq_w(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_ceq_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_ceq_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_ceq_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_ceq_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_ceq_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_ceq_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_ceq_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
 
 
 /*
@@ -1562,11 +1627,6 @@ static inline int64_t msa_subv_df(uint32_t df, int64_t arg1, int64_t arg2)
     return arg1 - arg2;
 }
 
-static inline int64_t msa_ceq_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    return arg1 == arg2 ? -1 : 0;
-}
-
 static inline int64_t msa_cle_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 <= arg2 ? -1 : 0;
@@ -2188,7 +2248,6 @@ MSA_BINOP_DF(min_s)
 MSA_BINOP_DF(min_u)
 MSA_BINOP_DF(max_a)
 MSA_BINOP_DF(min_a)
-MSA_BINOP_DF(ceq)
 MSA_BINOP_DF(clt_s)
 MSA_BINOP_DF(clt_u)
 MSA_BINOP_DF(cle_s)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9b186d3..ad1572e 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28530,15 +28530,28 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         break;
+    case OPC_CEQ_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_ceq_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_ceq_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_ceq_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_ceq_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
     case OPC_SLL_df:
         gen_helper_msa_sll_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_ADDV_df:
         gen_helper_msa_addv_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_CEQ_df:
-        gen_helper_msa_ceq_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_ADD_A_df:
         gen_helper_msa_add_a_df(cpu_env, tdf, twd, tws, twt);
         break;
-- 
2.7.4


