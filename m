Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5EC38FA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 17:28:59 +0200 (CEST)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFK5C-0007Bv-AY
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 11:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJtq-0004vn-UF
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iFJtp-000256-E2
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:14 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:59982 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iFJtp-0001uh-6z
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:17:13 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 6348D1A22D0;
 Tue,  1 Oct 2019 17:15:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.55])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 161F01A239A;
 Tue,  1 Oct 2019 17:15:55 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] target/mips: msa: Simplify and move helper for MOVE.V
Date: Tue,  1 Oct 2019 17:15:43 +0200
Message-Id: <1569942944-10381-18-git-send-email-aleksandar.markovic@rt-rk.com>
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
Message-Id: <1569415572-19635-20-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/helper.h     |  2 +-
 target/mips/msa_helper.c | 31 +++++++++++++------------------
 2 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index cc216f7..3b1a965 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -887,6 +887,7 @@ DEF_HELPER_4(msa_mod_s_h, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_s_w, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_mod_s_d, void, env, i32, i32, i32)
 
+DEF_HELPER_3(msa_move_v, void, env, i32, i32)
 
 DEF_HELPER_4(msa_andi_b, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ori_b, void, env, i32, i32, i32)
@@ -977,7 +978,6 @@ DEF_HELPER_5(msa_splati_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_insve_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_3(msa_ctcmsa, void, env, tl, i32)
 DEF_HELPER_2(msa_cfcmsa, tl, env, i32)
-DEF_HELPER_3(msa_move_v, void, env, i32, i32)
 
 DEF_HELPER_5(msa_fcaf_df, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(msa_fcun_df, void, env, i32, i32, i32, i32)
diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 04fee66..03b198c 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -2022,7 +2022,19 @@ void helper_msa_mod_u_d(CPUMIPSState *env,
  * +---------------+----------------------------------------------------------+
  */
 
-/* TODO: insert Move group helpers here */
+static inline void msa_move_v(wr_t *pwd, wr_t *pws)
+{
+    pwd->d[0] = pws->d[0];
+    pwd->d[1] = pws->d[1];
+}
+
+void helper_msa_move_v(CPUMIPSState *env, uint32_t wd, uint32_t ws)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+
+    msa_move_v(pwd, pws);
+}
 
 
 /*
@@ -2079,15 +2091,6 @@ void helper_msa_mod_u_d(CPUMIPSState *env,
 /* TODO: insert Shift group helpers here */
 
 
-static inline void msa_move_v(wr_t *pwd, wr_t *pws)
-{
-    uint32_t i;
-
-    for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-        pwd->d[i] = pws->d[i];
-    }
-}
-
 #define MSA_FN_IMM8(FUNC, DEST, OPERATION)                              \
 void helper_msa_ ## FUNC(CPUMIPSState *env, uint32_t wd, uint32_t ws,   \
         uint32_t i8)                                                    \
@@ -3874,14 +3877,6 @@ target_ulong helper_msa_cfcmsa(CPUMIPSState *env, uint32_t cs)
     return 0;
 }
 
-void helper_msa_move_v(CPUMIPSState *env, uint32_t wd, uint32_t ws)
-{
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
-    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
-
-    msa_move_v(pwd, pws);
-}
-
 void helper_msa_fill_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
                         uint32_t rs)
 {
-- 
2.7.4


