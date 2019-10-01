Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A234C38F8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 17:28:57 +0200 (CEST)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFK5A-000789-CA
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 11:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJti-0004iG-AI
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJte-0001vn-Kh
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:06 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59930 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iFJtd-0001sv-Oz
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 187BB1A23B2;
 Tue,  1 Oct 2019 17:15:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.55])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 8C29D1A23A8;
 Tue,  1 Oct 2019 17:15:54 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] target/mips: msa: Split helpers for BINS<L|R>.<B|H|W|D>
Date: Tue,  1 Oct 2019 17:15:33 +0200
Message-Id: <1569942944-10381-8-git-send-email-aleksandar.markovic@rt-rk.com>
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
Message-Id: <1569415572-19635-10-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/helper.h     |  10 +++
 target/mips/msa_helper.c | 198 +++++++++++++++++++++++++++++++++++++++--------
 target/mips/translate.c  |  38 +++++++--
 3 files changed, 206 insertions(+), 40 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 18e4c7a..9349482 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -793,6 +793,16 @@ DEF_HELPER_3(msa_pcnt_h, void, env, i32, i32)
 DEF_HELPER_3(msa_pcnt_w, void, env, i32, i32)
 DEF_HELPER_3(msa_pcnt_d, void, env, i32, i32)
 
+DEF_HELPER_4(msa_binsl_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsl_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsl_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsl_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_binsr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_binsr_d, void, env, i32, i32, i32)
+
 
 DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ori_b, void, env, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index fe27efc..c9b0583 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -301,7 +301,170 @@ void helper_msa_pcnt_d(CPUMIPSState *env, uint32_t wd, uint32_t ws)
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Bit Move group helpers here */
+/* Data format bit position and unsigned values */
+#define BIT_POSITION(x, df) ((uint64_t)(x) % DF_BITS(df))
+
+static inline int64_t msa_binsl_df(uint32_t df,
+                                   int64_t dest, int64_t arg1, int64_t arg2)
+{
+    uint64_t u_arg1 = UNSIGNED(arg1, df);
+    uint64_t u_dest = UNSIGNED(dest, df);
+    int32_t sh_d = BIT_POSITION(arg2, df) + 1;
+    int32_t sh_a = DF_BITS(df) - sh_d;
+    if (sh_d == DF_BITS(df)) {
+        return u_arg1;
+    } else {
+        return UNSIGNED(UNSIGNED(u_dest << sh_d, df) >> sh_d, df) |
+               UNSIGNED(UNSIGNED(u_arg1 >> sh_a, df) << sh_a, df);
+    }
+}
+
+void helper_msa_binsl_b(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_binsl_df(DF_BYTE, pwd->b[0],  pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_binsl_df(DF_BYTE, pwd->b[1],  pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_binsl_df(DF_BYTE, pwd->b[2],  pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_binsl_df(DF_BYTE, pwd->b[3],  pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_binsl_df(DF_BYTE, pwd->b[4],  pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_binsl_df(DF_BYTE, pwd->b[5],  pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_binsl_df(DF_BYTE, pwd->b[6],  pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_binsl_df(DF_BYTE, pwd->b[7],  pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_binsl_df(DF_BYTE, pwd->b[8],  pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_binsl_df(DF_BYTE, pwd->b[9],  pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_binsl_df(DF_BYTE, pwd->b[10], pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_binsl_df(DF_BYTE, pwd->b[11], pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_binsl_df(DF_BYTE, pwd->b[12], pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_binsl_df(DF_BYTE, pwd->b[13], pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_binsl_df(DF_BYTE, pwd->b[14], pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_binsl_df(DF_BYTE, pwd->b[15], pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_binsl_h(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_binsl_df(DF_HALF, pwd->h[0],  pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_binsl_df(DF_HALF, pwd->h[1],  pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_binsl_df(DF_HALF, pwd->h[2],  pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_binsl_df(DF_HALF, pwd->h[3],  pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_binsl_df(DF_HALF, pwd->h[4],  pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_binsl_df(DF_HALF, pwd->h[5],  pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_binsl_df(DF_HALF, pwd->h[6],  pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_binsl_df(DF_HALF, pwd->h[7],  pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_binsl_w(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_binsl_df(DF_WORD, pwd->w[0],  pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_binsl_df(DF_WORD, pwd->w[1],  pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_binsl_df(DF_WORD, pwd->w[2],  pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_binsl_df(DF_WORD, pwd->w[3],  pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_binsl_d(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_binsl_df(DF_DOUBLE, pwd->d[0],  pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_binsl_df(DF_DOUBLE, pwd->d[1],  pws->d[1],  pwt->d[1]);
+}
+
+static inline int64_t msa_binsr_df(uint32_t df,
+                                   int64_t dest, int64_t arg1, int64_t arg2)
+{
+    uint64_t u_arg1 = UNSIGNED(arg1, df);
+    uint64_t u_dest = UNSIGNED(dest, df);
+    int32_t sh_d = BIT_POSITION(arg2, df) + 1;
+    int32_t sh_a = DF_BITS(df) - sh_d;
+    if (sh_d == DF_BITS(df)) {
+        return u_arg1;
+    } else {
+        return UNSIGNED(UNSIGNED(u_dest >> sh_d, df) << sh_d, df) |
+               UNSIGNED(UNSIGNED(u_arg1 << sh_a, df) >> sh_a, df);
+    }
+}
+
+void helper_msa_binsr_b(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_binsr_df(DF_BYTE, pwd->b[0],  pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_binsr_df(DF_BYTE, pwd->b[1],  pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_binsr_df(DF_BYTE, pwd->b[2],  pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_binsr_df(DF_BYTE, pwd->b[3],  pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_binsr_df(DF_BYTE, pwd->b[4],  pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_binsr_df(DF_BYTE, pwd->b[5],  pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_binsr_df(DF_BYTE, pwd->b[6],  pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_binsr_df(DF_BYTE, pwd->b[7],  pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_binsr_df(DF_BYTE, pwd->b[8],  pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_binsr_df(DF_BYTE, pwd->b[9],  pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_binsr_df(DF_BYTE, pwd->b[10], pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_binsr_df(DF_BYTE, pwd->b[11], pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_binsr_df(DF_BYTE, pwd->b[12], pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_binsr_df(DF_BYTE, pwd->b[13], pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_binsr_df(DF_BYTE, pwd->b[14], pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_binsr_df(DF_BYTE, pwd->b[15], pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_binsr_h(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_binsr_df(DF_HALF, pwd->h[0],  pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_binsr_df(DF_HALF, pwd->h[1],  pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_binsr_df(DF_HALF, pwd->h[2],  pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_binsr_df(DF_HALF, pwd->h[3],  pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_binsr_df(DF_HALF, pwd->h[4],  pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_binsr_df(DF_HALF, pwd->h[5],  pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_binsr_df(DF_HALF, pwd->h[6],  pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_binsr_df(DF_HALF, pwd->h[7],  pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_binsr_w(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_binsr_df(DF_WORD, pwd->w[0],  pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_binsr_df(DF_WORD, pwd->w[1],  pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_binsr_df(DF_WORD, pwd->w[2],  pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_binsr_df(DF_WORD, pwd->w[3],  pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_binsr_d(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_binsr_df(DF_DOUBLE, pwd->d[0],  pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_binsr_df(DF_DOUBLE, pwd->d[1],  pws->d[1],  pwt->d[1]);
+}
 
 
 /*
@@ -1023,9 +1186,6 @@ void helper_msa_ldi_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     }
 }
 
-/* Data format bit position and unsigned values */
-#define BIT_POSITION(x, df) ((uint64_t)(x) % DF_BITS(df))
-
 static inline int64_t msa_sll_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int32_t b_arg2 = BIT_POSITION(arg2, df);
@@ -1064,36 +1224,6 @@ static inline int64_t msa_bneg_df(uint32_t df, int64_t arg1, int64_t arg2)
     return UNSIGNED(arg1 ^ (1LL << b_arg2), df);
 }
 
-static inline int64_t msa_binsl_df(uint32_t df, int64_t dest, int64_t arg1,
-                                   int64_t arg2)
-{
-    uint64_t u_arg1 = UNSIGNED(arg1, df);
-    uint64_t u_dest = UNSIGNED(dest, df);
-    int32_t sh_d = BIT_POSITION(arg2, df) + 1;
-    int32_t sh_a = DF_BITS(df) - sh_d;
-    if (sh_d == DF_BITS(df)) {
-        return u_arg1;
-    } else {
-        return UNSIGNED(UNSIGNED(u_dest << sh_d, df) >> sh_d, df) |
-               UNSIGNED(UNSIGNED(u_arg1 >> sh_a, df) << sh_a, df);
-    }
-}
-
-static inline int64_t msa_binsr_df(uint32_t df, int64_t dest, int64_t arg1,
-                                   int64_t arg2)
-{
-    uint64_t u_arg1 = UNSIGNED(arg1, df);
-    uint64_t u_dest = UNSIGNED(dest, df);
-    int32_t sh_d = BIT_POSITION(arg2, df) + 1;
-    int32_t sh_a = DF_BITS(df) - sh_d;
-    if (sh_d == DF_BITS(df)) {
-        return u_arg1;
-    } else {
-        return UNSIGNED(UNSIGNED(u_dest >> sh_d, df) << sh_d, df) |
-               UNSIGNED(UNSIGNED(u_arg1 << sh_a, df) >> sh_a, df);
-    }
-}
-
 static inline int64_t msa_sat_s_df(uint32_t df, int64_t arg, uint32_t m)
 {
     return arg < M_MIN_INT(m + 1) ? M_MIN_INT(m + 1) :
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0d06ba9..6080c72 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28386,6 +28386,38 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     TCGv_i32 twt = tcg_const_i32(wt);
 
     switch (MASK_MSA_3R(ctx->opcode)) {
+    case OPC_BINSL_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_binsl_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_binsl_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_binsl_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_binsl_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
+    case OPC_BINSR_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_binsr_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_binsr_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_binsr_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_binsr_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
     case OPC_SLL_df:
         gen_helper_msa_sll_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -28515,9 +28547,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_ILVR_df:
         gen_helper_msa_ilvr_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_BINSL_df:
-        gen_helper_msa_binsl_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_MAX_A_df:
         gen_helper_msa_max_a_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -28530,9 +28559,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_ILVEV_df:
         gen_helper_msa_ilvev_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_BINSR_df:
-        gen_helper_msa_binsr_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_MIN_A_df:
         gen_helper_msa_min_a_df(cpu_env, tdf, twd, tws, twt);
         break;
-- 
2.7.4


