Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE660BDE66
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 14:58:28 +0200 (CEST)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD6sF-0003P2-0l
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 08:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gh-0001JE-2H
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gd-0002G3-Bh
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:30 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56119 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iD6gc-0002Ei-S8
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:27 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id C5DF71A23CA;
 Wed, 25 Sep 2019 14:46:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 9898D1A2060;
 Wed, 25 Sep 2019 14:46:21 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/20] target/mips: msa: Split helpers for
 <NLOC|NLZC>.<B|H|W|D>
Date: Wed, 25 Sep 2019 14:45:59 +0200
Message-Id: <1569415572-19635-8-git-send-email-aleksandar.markovic@rt-rk.com>
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
 target/mips/helper.h     |  14 +++-
 target/mips/msa_helper.c | 170 +++++++++++++++++++++++++++++++++++++++--------
 target/mips/translate.c  |  30 ++++++++-
 3 files changed, 181 insertions(+), 33 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 51f0e1c..d709083 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -777,6 +777,18 @@ DEF_HELPER_FLAGS_3(wrdsp, 0, void, tl, tl, env)
 DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 
 /* MIPS SIMD Architecture */
+
+DEF_HELPER_3(msa_nloc_b, void, env, i32, i32)
+DEF_HELPER_3(msa_nloc_h, void, env, i32, i32)
+DEF_HELPER_3(msa_nloc_w, void, env, i32, i32)
+DEF_HELPER_3(msa_nloc_d, void, env, i32, i32)
+
+DEF_HELPER_3(msa_nlzc_b, void, env, i32, i32)
+DEF_HELPER_3(msa_nlzc_h, void, env, i32, i32)
+DEF_HELPER_3(msa_nlzc_w, void, env, i32, i32)
+DEF_HELPER_3(msa_nlzc_d, void, env, i32, i32)
+
+
 DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ori_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_nori_b, void, env, i32, i32, i32)
@@ -935,8 +947,6 @@ DEF_HELPER_4(msa_bmz_v, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_bsel_v, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_fill_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_pcnt_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_nloc_df, void, env, i32, i32, i32)
-DEF_HELPER_4(msa_nlzc_df, void, env, i32, i32, i32)
 
 DEF_HELPER_4(msa_copy_s_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_copy_s_h, void, env, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index f24061e..8c27c1b 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -65,7 +65,147 @@
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Bit Count group helpers here */
+static inline int64_t msa_nlzc_df(uint32_t df, int64_t arg)
+{
+    uint64_t x, y;
+    int n, c;
+
+    x = UNSIGNED(arg, df);
+    n = DF_BITS(df);
+    c = DF_BITS(df) / 2;
+
+    do {
+        y = x >> c;
+        if (y != 0) {
+            n = n - c;
+            x = y;
+        }
+        c = c >> 1;
+    } while (c != 0);
+
+    return n - x;
+}
+
+static inline int64_t msa_nloc_df(uint32_t df, int64_t arg)
+{
+    return msa_nlzc_df(df, UNSIGNED((~arg), df));
+}
+
+void helper_msa_nloc_b(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->b[0]  = msa_nloc_df(DF_BYTE, pws->b[0]);
+    pwd->b[1]  = msa_nloc_df(DF_BYTE, pws->b[1]);
+    pwd->b[2]  = msa_nloc_df(DF_BYTE, pws->b[2]);
+    pwd->b[3]  = msa_nloc_df(DF_BYTE, pws->b[3]);
+    pwd->b[4]  = msa_nloc_df(DF_BYTE, pws->b[4]);
+    pwd->b[5]  = msa_nloc_df(DF_BYTE, pws->b[5]);
+    pwd->b[6]  = msa_nloc_df(DF_BYTE, pws->b[6]);
+    pwd->b[7]  = msa_nloc_df(DF_BYTE, pws->b[7]);
+    pwd->b[8]  = msa_nloc_df(DF_BYTE, pws->b[8]);
+    pwd->b[9]  = msa_nloc_df(DF_BYTE, pws->b[9]);
+    pwd->b[10] = msa_nloc_df(DF_BYTE, pws->b[10]);
+    pwd->b[11] = msa_nloc_df(DF_BYTE, pws->b[11]);
+    pwd->b[12] = msa_nloc_df(DF_BYTE, pws->b[12]);
+    pwd->b[13] = msa_nloc_df(DF_BYTE, pws->b[13]);
+    pwd->b[14] = msa_nloc_df(DF_BYTE, pws->b[14]);
+    pwd->b[15] = msa_nloc_df(DF_BYTE, pws->b[15]);
+}
+
+void helper_msa_nloc_h(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->h[0]  = msa_nloc_df(DF_HALF, pws->h[0]);
+    pwd->h[1]  = msa_nloc_df(DF_HALF, pws->h[1]);
+    pwd->h[2]  = msa_nloc_df(DF_HALF, pws->h[2]);
+    pwd->h[3]  = msa_nloc_df(DF_HALF, pws->h[3]);
+    pwd->h[4]  = msa_nloc_df(DF_HALF, pws->h[4]);
+    pwd->h[5]  = msa_nloc_df(DF_HALF, pws->h[5]);
+    pwd->h[6]  = msa_nloc_df(DF_HALF, pws->h[6]);
+    pwd->h[7]  = msa_nloc_df(DF_HALF, pws->h[7]);
+}
+
+void helper_msa_nloc_w(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->w[0]  = msa_nloc_df(DF_WORD, pws->w[0]);
+    pwd->w[1]  = msa_nloc_df(DF_WORD, pws->w[1]);
+    pwd->w[2]  = msa_nloc_df(DF_WORD, pws->w[2]);
+    pwd->w[3]  = msa_nloc_df(DF_WORD, pws->w[3]);
+}
+
+void helper_msa_nloc_d(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->d[0]  = msa_nloc_df(DF_DOUBLE, pws->d[0]);
+    pwd->d[1]  = msa_nloc_df(DF_DOUBLE, pws->d[1]);
+}
+
+void helper_msa_nlzc_b(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->b[0]  = msa_nlzc_df(DF_BYTE, pws->b[0]);
+    pwd->b[1]  = msa_nlzc_df(DF_BYTE, pws->b[1]);
+    pwd->b[2]  = msa_nlzc_df(DF_BYTE, pws->b[2]);
+    pwd->b[3]  = msa_nlzc_df(DF_BYTE, pws->b[3]);
+    pwd->b[4]  = msa_nlzc_df(DF_BYTE, pws->b[4]);
+    pwd->b[5]  = msa_nlzc_df(DF_BYTE, pws->b[5]);
+    pwd->b[6]  = msa_nlzc_df(DF_BYTE, pws->b[6]);
+    pwd->b[7]  = msa_nlzc_df(DF_BYTE, pws->b[7]);
+    pwd->b[8]  = msa_nlzc_df(DF_BYTE, pws->b[8]);
+    pwd->b[9]  = msa_nlzc_df(DF_BYTE, pws->b[9]);
+    pwd->b[10] = msa_nlzc_df(DF_BYTE, pws->b[10]);
+    pwd->b[11] = msa_nlzc_df(DF_BYTE, pws->b[11]);
+    pwd->b[12] = msa_nlzc_df(DF_BYTE, pws->b[12]);
+    pwd->b[13] = msa_nlzc_df(DF_BYTE, pws->b[13]);
+    pwd->b[14] = msa_nlzc_df(DF_BYTE, pws->b[14]);
+    pwd->b[15] = msa_nlzc_df(DF_BYTE, pws->b[15]);
+}
+
+void helper_msa_nlzc_h(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->h[0]  = msa_nlzc_df(DF_HALF, pws->h[0]);
+    pwd->h[1]  = msa_nlzc_df(DF_HALF, pws->h[1]);
+    pwd->h[2]  = msa_nlzc_df(DF_HALF, pws->h[2]);
+    pwd->h[3]  = msa_nlzc_df(DF_HALF, pws->h[3]);
+    pwd->h[4]  = msa_nlzc_df(DF_HALF, pws->h[4]);
+    pwd->h[5]  = msa_nlzc_df(DF_HALF, pws->h[5]);
+    pwd->h[6]  = msa_nlzc_df(DF_HALF, pws->h[6]);
+    pwd->h[7]  = msa_nlzc_df(DF_HALF, pws->h[7]);
+}
+
+void helper_msa_nlzc_w(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->w[0]  = msa_nlzc_df(DF_WORD, pws->w[0]);
+    pwd->w[1]  = msa_nlzc_df(DF_WORD, pws->w[1]);
+    pwd->w[2]  = msa_nlzc_df(DF_WORD, pws->w[2]);
+    pwd->w[3]  = msa_nlzc_df(DF_WORD, pws->w[3]);
+}
+
+void helper_msa_nlzc_d(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    pwd->d[0]  = msa_nlzc_df(DF_DOUBLE, pws->d[0]);
+    pwd->d[1]  = msa_nlzc_df(DF_DOUBLE, pws->d[1]);
+}
 
 
 /*
@@ -2524,32 +2664,6 @@ static inline int64_t msa_pcnt_df(uint32_t df, int64_t arg)
     return x;
 }
 
-static inline int64_t msa_nlzc_df(uint32_t df, int64_t arg)
-{
-    uint64_t x, y;
-    int n, c;
-
-    x = UNSIGNED(arg, df);
-    n = DF_BITS(df);
-    c = DF_BITS(df) / 2;
-
-    do {
-        y = x >> c;
-        if (y != 0) {
-            n = n - c;
-            x = y;
-        }
-        c = c >> 1;
-    } while (c != 0);
-
-    return n - x;
-}
-
-static inline int64_t msa_nloc_df(uint32_t df, int64_t arg)
-{
-    return msa_nlzc_df(df, UNSIGNED((~arg), df));
-}
-
 void helper_msa_fill_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                         uint32_t rs)
 {
@@ -2633,8 +2747,6 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df,         \
     }                                                                   \
 }
 
-MSA_UNOP_DF(nlzc)
-MSA_UNOP_DF(nloc)
 MSA_UNOP_DF(pcnt)
 #undef MSA_UNOP_DF
 
diff --git a/target/mips/translate.c b/target/mips/translate.c
index cc5af2a..6de4609 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28962,10 +28962,36 @@ static void gen_msa_2r(CPUMIPSState *env, DisasContext *ctx)
         gen_helper_msa_pcnt_df(cpu_env, tdf, twd, tws);
         break;
     case OPC_NLOC_df:
-        gen_helper_msa_nloc_df(cpu_env, tdf, twd, tws);
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_nloc_b(cpu_env, twd, tws);
+            break;
+        case DF_HALF:
+            gen_helper_msa_nloc_h(cpu_env, twd, tws);
+            break;
+        case DF_WORD:
+            gen_helper_msa_nloc_w(cpu_env, twd, tws);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_nloc_d(cpu_env, twd, tws);
+            break;
+        }
         break;
     case OPC_NLZC_df:
-        gen_helper_msa_nlzc_df(cpu_env, tdf, twd, tws);
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_nlzc_b(cpu_env, twd, tws);
+            break;
+        case DF_HALF:
+            gen_helper_msa_nlzc_h(cpu_env, twd, tws);
+            break;
+        case DF_WORD:
+            gen_helper_msa_nlzc_w(cpu_env, twd, tws);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_nlzc_d(cpu_env, twd, tws);
+            break;
+        }
         break;
     default:
         MIPS_INVAL("MSA instruction");
-- 
2.7.4


