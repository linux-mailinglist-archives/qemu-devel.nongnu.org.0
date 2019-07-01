Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53535F73
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 16:41:42 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYX6j-0002iY-Ab
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 10:41:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1o-0007aB-O2
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYX1n-00024I-Ji
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:36 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:55876 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hYX1n-0007nR-C3
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 10:36:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 5270F1A2173;
	Wed,  5 Jun 2019 16:35:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 1FF7A1A21FA;
	Wed,  5 Jun 2019 16:35:32 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 16:35:13 +0200
Message-Id: <1559745316-1454-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559745316-1454-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559745316-1454-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 3/6] target/mips: Unroll loops in helpers for
 MSA logic instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Unroll loops in helpers for MSA logic instructions for better
performance.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/msa_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 851450c..f57c906 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -130,10 +130,6 @@ void helper_msa_ ## FUNC(CPUMIPSState *env, uint32_t wd, uint32_t ws,   \
     }                                                                   \
 }
 
-MSA_FN_VECTOR(and_v, pwd->d[i], pws->d[i] & pwt->d[i])
-MSA_FN_VECTOR(or_v, pwd->d[i], pws->d[i] | pwt->d[i])
-MSA_FN_VECTOR(nor_v, pwd->d[i], ~(pws->d[i] | pwt->d[i]))
-MSA_FN_VECTOR(xor_v, pwd->d[i], pws->d[i] ^ pwt->d[i])
 MSA_FN_VECTOR(bmnz_v, pwd->d[i],
         BIT_MOVE_IF_NOT_ZERO(pwd->d[i], pws->d[i], pwt->d[i], DF_DOUBLE))
 MSA_FN_VECTOR(bmz_v, pwd->d[i],
@@ -145,6 +141,46 @@ MSA_FN_VECTOR(bsel_v, pwd->d[i],
 #undef BIT_SELECT
 #undef MSA_FN_VECTOR
 
+void helper_msa_and_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = pws->d[0] & pwt->d[0];
+    pwd->d[1] = pws->d[1] & pwt->d[1];
+}
+
+void helper_msa_or_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = pws->d[0] | pwt->d[0];
+    pwd->d[1] = pws->d[1] | pwt->d[1];
+}
+
+void helper_msa_nor_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = ~(pws->d[0] | pwt->d[0]);
+    pwd->d[1] = ~(pws->d[1] | pwt->d[1]);
+}
+
+void helper_msa_xor_v(CPUMIPSState *env, uint32_t wd, uint32_t ws, uint32_t wt)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    wr_t *pws = &(env->active_fpu.fpr[ws].wr);
+    wr_t *pwt = &(env->active_fpu.fpr[wt].wr);
+
+    pwd->d[0] = pws->d[0] ^ pwt->d[0];
+    pwd->d[1] = pws->d[1] ^ pwt->d[1];
+}
+
 static inline int64_t msa_addv_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
     return arg1 + arg2;
-- 
2.7.4


