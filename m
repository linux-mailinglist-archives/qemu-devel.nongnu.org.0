Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864DDF5EA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 21:25:02 +0200 (CEST)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMdIb-0004nO-ED
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 15:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iMd74-0001XK-VV
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iMd70-0004I6-UL
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:13:06 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:53952 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iMd70-0004G9-DZ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:13:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 226781A217D;
 Mon, 21 Oct 2019 21:11:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774.domain.local [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id CA4851A2196;
 Mon, 21 Oct 2019 21:11:55 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/12] target/mips: msa: Split helpers for
 ADD<_A|S_A|S_S|S_U|V>.<B|H|W|D>
Date: Mon, 21 Oct 2019 21:11:32 +0200
Message-Id: <1571685097-15175-8-git-send-email-aleksandar.markovic@rt-rk.com>
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

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/helper.h     |  30 +++-
 target/mips/msa_helper.c | 426 +++++++++++++++++++++++++++++++++++++++++------
 target/mips/translate.c  |  95 +++++++++--
 3 files changed, 482 insertions(+), 69 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index f3df187..ce01e97 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -822,6 +822,31 @@ DEF_HELPER_4(msa_bset_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_bset_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_bset_d, void, env, i32, i32, i32)
 
+DEF_HELPER_4(msa_add_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_add_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_add_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_add_a_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_adds_a_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_a_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_a_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_a_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_adds_s_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_s_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_s_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_s_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_adds_u_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_u_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_u_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_adds_u_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(msa_addv_b, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_addv_h, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_addv_w, void, env, i32, i32, i32)
+DEF_HELPER_4(msa_addv_d, void, env, i32, i32, i32)
+
 DEF_HELPER_4(msa_ave_s_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ave_s_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ave_s_w, void, env, i32, i32, i32)
@@ -976,12 +1001,7 @@ DEF_HELPER_5(msa_sra_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_srl_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_binsl_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_binsr_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_addv_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subv_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_add_a_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_adds_a_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_adds_s_df, void, env, i32, i32, i32, i32)
-DEF_HELPER_5(msa_adds_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subs_s_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subs_u_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_subsus_u_df, void, env, i32, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 499fcde..c31f46c 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -805,7 +805,383 @@ void helper_msa_bset_d(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Int Add group helpers here */
+
+static inline int64_t msa_add_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
+    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
+    return abs_arg1 + abs_arg2;
+}
+
+void helper_msa_add_a_b(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_add_a_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_add_a_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_add_a_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_add_a_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_add_a_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_add_a_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_add_a_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_add_a_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_add_a_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_add_a_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_add_a_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_add_a_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_add_a_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_add_a_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_add_a_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_add_a_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_add_a_h(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_add_a_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_add_a_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_add_a_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_add_a_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_add_a_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_add_a_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_add_a_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_add_a_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_add_a_w(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_add_a_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_add_a_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_add_a_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_add_a_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_add_a_d(CPUMIPSState *env,
+                        uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_add_a_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_add_a_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
+static inline int64_t msa_adds_a_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    uint64_t max_int = (uint64_t)DF_MAX_INT(df);
+    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
+    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
+    if (abs_arg1 > max_int || abs_arg2 > max_int) {
+        return (int64_t)max_int;
+    } else {
+        return (abs_arg1 < max_int - abs_arg2) ? abs_arg1 + abs_arg2 : max_int;
+    }
+}
+
+void helper_msa_adds_a_b(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_adds_a_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_adds_a_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_adds_a_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_adds_a_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_adds_a_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_adds_a_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_adds_a_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_adds_a_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_adds_a_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_adds_a_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_adds_a_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_adds_a_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_adds_a_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_adds_a_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_adds_a_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_adds_a_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_adds_a_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_adds_a_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_adds_a_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_adds_a_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_adds_a_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_adds_a_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_adds_a_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_adds_a_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_adds_a_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_adds_a_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_adds_a_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_adds_a_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_adds_a_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_adds_a_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_adds_a_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_adds_a_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_adds_a_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
+static inline int64_t msa_adds_s_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    int64_t max_int = DF_MAX_INT(df);
+    int64_t min_int = DF_MIN_INT(df);
+    if (arg1 < 0) {
+        return (min_int - arg1 < arg2) ? arg1 + arg2 : min_int;
+    } else {
+        return (arg2 < max_int - arg1) ? arg1 + arg2 : max_int;
+    }
+}
+
+void helper_msa_adds_s_b(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_adds_s_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_adds_s_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_adds_s_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_adds_s_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_adds_s_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_adds_s_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_adds_s_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_adds_s_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_adds_s_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_adds_s_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_adds_s_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_adds_s_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_adds_s_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_adds_s_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_adds_s_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_adds_s_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_adds_s_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_adds_s_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_adds_s_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_adds_s_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_adds_s_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_adds_s_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_adds_s_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_adds_s_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_adds_s_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_adds_s_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_adds_s_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_adds_s_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_adds_s_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_adds_s_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_adds_s_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_adds_s_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_adds_s_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
+static inline uint64_t msa_adds_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
+{
+    uint64_t max_uint = DF_MAX_UINT(df);
+    uint64_t u_arg1 = UNSIGNED(arg1, df);
+    uint64_t u_arg2 = UNSIGNED(arg2, df);
+    return (u_arg1 < max_uint - u_arg2) ? u_arg1 + u_arg2 : max_uint;
+}
+
+void helper_msa_adds_u_b(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_adds_u_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_adds_u_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_adds_u_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_adds_u_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_adds_u_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_adds_u_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_adds_u_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_adds_u_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_adds_u_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_adds_u_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_adds_u_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_adds_u_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_adds_u_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_adds_u_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_adds_u_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_adds_u_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_adds_u_h(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_adds_u_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_adds_u_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_adds_u_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_adds_u_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_adds_u_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_adds_u_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_adds_u_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_adds_u_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_adds_u_w(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_adds_u_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_adds_u_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_adds_u_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_adds_u_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_adds_u_d(CPUMIPSState *env,
+                         uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_adds_u_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_adds_u_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
+
+
+static inline int64_t msa_addv_df(uint32_t df, int64_t arg1, int64_t arg2)
+{
+    return arg1 + arg2;
+}
+
+void helper_msa_addv_b(CPUMIPSState *env,
+                       uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->b[0]  = msa_addv_df(DF_BYTE, pws->b[0],  pwt->b[0]);
+    pwd->b[1]  = msa_addv_df(DF_BYTE, pws->b[1],  pwt->b[1]);
+    pwd->b[2]  = msa_addv_df(DF_BYTE, pws->b[2],  pwt->b[2]);
+    pwd->b[3]  = msa_addv_df(DF_BYTE, pws->b[3],  pwt->b[3]);
+    pwd->b[4]  = msa_addv_df(DF_BYTE, pws->b[4],  pwt->b[4]);
+    pwd->b[5]  = msa_addv_df(DF_BYTE, pws->b[5],  pwt->b[5]);
+    pwd->b[6]  = msa_addv_df(DF_BYTE, pws->b[6],  pwt->b[6]);
+    pwd->b[7]  = msa_addv_df(DF_BYTE, pws->b[7],  pwt->b[7]);
+    pwd->b[8]  = msa_addv_df(DF_BYTE, pws->b[8],  pwt->b[8]);
+    pwd->b[9]  = msa_addv_df(DF_BYTE, pws->b[9],  pwt->b[9]);
+    pwd->b[10] = msa_addv_df(DF_BYTE, pws->b[10], pwt->b[10]);
+    pwd->b[11] = msa_addv_df(DF_BYTE, pws->b[11], pwt->b[11]);
+    pwd->b[12] = msa_addv_df(DF_BYTE, pws->b[12], pwt->b[12]);
+    pwd->b[13] = msa_addv_df(DF_BYTE, pws->b[13], pwt->b[13]);
+    pwd->b[14] = msa_addv_df(DF_BYTE, pws->b[14], pwt->b[14]);
+    pwd->b[15] = msa_addv_df(DF_BYTE, pws->b[15], pwt->b[15]);
+}
+
+void helper_msa_addv_h(CPUMIPSState *env,
+                       uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->h[0]  = msa_addv_df(DF_HALF, pws->h[0],  pwt->h[0]);
+    pwd->h[1]  = msa_addv_df(DF_HALF, pws->h[1],  pwt->h[1]);
+    pwd->h[2]  = msa_addv_df(DF_HALF, pws->h[2],  pwt->h[2]);
+    pwd->h[3]  = msa_addv_df(DF_HALF, pws->h[3],  pwt->h[3]);
+    pwd->h[4]  = msa_addv_df(DF_HALF, pws->h[4],  pwt->h[4]);
+    pwd->h[5]  = msa_addv_df(DF_HALF, pws->h[5],  pwt->h[5]);
+    pwd->h[6]  = msa_addv_df(DF_HALF, pws->h[6],  pwt->h[6]);
+    pwd->h[7]  = msa_addv_df(DF_HALF, pws->h[7],  pwt->h[7]);
+}
+
+void helper_msa_addv_w(CPUMIPSState *env,
+                       uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->w[0]  = msa_addv_df(DF_WORD, pws->w[0],  pwt->w[0]);
+    pwd->w[1]  = msa_addv_df(DF_WORD, pws->w[1],  pwt->w[1]);
+    pwd->w[2]  = msa_addv_df(DF_WORD, pws->w[2],  pwt->w[2]);
+    pwd->w[3]  = msa_addv_df(DF_WORD, pws->w[3],  pwt->w[3]);
+}
+
+void helper_msa_addv_d(CPUMIPSState *env,
+                       uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0]  = msa_addv_df(DF_DOUBLE, pws->d[0],  pwt->d[0]);
+    pwd->d[1]  = msa_addv_df(DF_DOUBLE, pws->d[1],  pwt->d[1]);
+}
 
 
 /*
@@ -3050,11 +3426,6 @@ void helper_msa_shf_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     msa_move_v(pwd, pwx);
 }
 
-static inline int64_t msa_addv_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    return arg1 + arg2;
-}
-
 static inline int64_t msa_subv_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 - arg2;
@@ -3283,44 +3654,6 @@ MSA_TEROP_IMMU_DF(binsli, binsl)
 MSA_TEROP_IMMU_DF(binsri, binsr)
 #undef MSA_TEROP_IMMU_DF
 
-static inline int64_t msa_add_a_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
-    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
-    return abs_arg1 + abs_arg2;
-}
-
-static inline int64_t msa_adds_a_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    uint64_t max_int = (uint64_t)DF_MAX_INT(df);
-    uint64_t abs_arg1 = arg1 >= 0 ? arg1 : -arg1;
-    uint64_t abs_arg2 = arg2 >= 0 ? arg2 : -arg2;
-    if (abs_arg1 > max_int || abs_arg2 > max_int) {
-        return (int64_t)max_int;
-    } else {
-        return (abs_arg1 < max_int - abs_arg2) ? abs_arg1 + abs_arg2 : max_int;
-    }
-}
-
-static inline int64_t msa_adds_s_df(uint32_t df, int64_t arg1, int64_t arg2)
-{
-    int64_t max_int = DF_MAX_INT(df);
-    int64_t min_int = DF_MIN_INT(df);
-    if (arg1 < 0) {
-        return (min_int - arg1 < arg2) ? arg1 + arg2 : min_int;
-    } else {
-        return (arg2 < max_int - arg1) ? arg1 + arg2 : max_int;
-    }
-}
-
-static inline uint64_t msa_adds_u_df(uint32_t df, uint64_t arg1, uint64_t arg2)
-{
-    uint64_t max_uint = DF_MAX_UINT(df);
-    uint64_t u_arg1 = UNSIGNED(arg1, df);
-    uint64_t u_arg2 = UNSIGNED(arg2, df);
-    return (u_arg1 < max_uint - u_arg2) ? u_arg1 + u_arg2 : max_uint;
-}
-
 static inline int64_t msa_subs_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     int64_t max_int = DF_MAX_INT(df);
@@ -3580,12 +3913,7 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df,         \
 MSA_BINOP_DF(sll)
 MSA_BINOP_DF(sra)
 MSA_BINOP_DF(srl)
-MSA_BINOP_DF(addv)
 MSA_BINOP_DF(subv)
-MSA_BINOP_DF(add_a)
-MSA_BINOP_DF(adds_a)
-MSA_BINOP_DF(adds_s)
-MSA_BINOP_DF(adds_u)
 MSA_BINOP_DF(subs_s)
 MSA_BINOP_DF(subs_u)
 MSA_BINOP_DF(subsus_u)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index ea8b8f4..14f9891 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28466,6 +28466,86 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
         break;
+    case OPC_ADD_A_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_add_a_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_add_a_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_add_a_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_add_a_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
+    case OPC_ADDS_A_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_adds_a_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_adds_a_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_adds_a_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_adds_a_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
+    case OPC_ADDS_S_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_adds_s_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_adds_s_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_adds_s_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_adds_s_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
+    case OPC_ADDS_U_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_adds_u_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_adds_u_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_adds_u_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_adds_u_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
+    case OPC_ADDV_df:
+        switch (df) {
+        case DF_BYTE:
+            gen_helper_msa_addv_b(cpu_env, twd, tws, twt);
+            break;
+        case DF_HALF:
+            gen_helper_msa_addv_h(cpu_env, twd, tws, twt);
+            break;
+        case DF_WORD:
+            gen_helper_msa_addv_w(cpu_env, twd, tws, twt);
+            break;
+        case DF_DOUBLE:
+            gen_helper_msa_addv_d(cpu_env, twd, tws, twt);
+            break;
+        }
+        break;
     case OPC_AVE_S_df:
         switch (df) {
         case DF_BYTE:
@@ -28837,12 +28917,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_SLL_df:
         gen_helper_msa_sll_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_ADDV_df:
-        gen_helper_msa_addv_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_ADD_A_df:
-        gen_helper_msa_add_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBS_S_df:
         gen_helper_msa_subs_s_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -28861,9 +28935,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_SUBV_df:
         gen_helper_msa_subv_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_ADDS_A_df:
-        gen_helper_msa_adds_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBS_U_df:
         gen_helper_msa_subs_u_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -28879,9 +28950,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_SRL_df:
         gen_helper_msa_srl_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_ADDS_S_df:
-        gen_helper_msa_adds_s_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBSUS_U_df:
         gen_helper_msa_subsus_u_df(cpu_env, tdf, twd, tws, twt);
         break;
@@ -28894,9 +28962,6 @@ static void gen_msa_3r(CPUMIPSState *env, DisasContext *ctx)
     case OPC_SRLR_df:
         gen_helper_msa_srlr_df(cpu_env, tdf, twd, tws, twt);
         break;
-    case OPC_ADDS_U_df:
-        gen_helper_msa_adds_u_df(cpu_env, tdf, twd, tws, twt);
-        break;
     case OPC_SUBSUU_S_df:
         gen_helper_msa_subsuu_s_df(cpu_env, tdf, twd, tws, twt);
         break;
-- 
2.7.4


