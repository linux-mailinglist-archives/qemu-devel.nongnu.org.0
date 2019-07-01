Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D741A26BF1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 21:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTWy7-00068Q-2i
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 15:32:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hTWRy-0003EM-Rv
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hTWRw-0000NH-Vc
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:58:54 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:60465 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hTWRw-0000Lx-JK
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:58:52 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 80B4C1A4168;
	Wed, 22 May 2019 20:58:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 5CD2E1A4167;
	Wed, 22 May 2019 20:58:49 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 20:58:34 +0200
Message-Id: <1558551522-24147-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558551522-24147-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1558551522-24147-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL v2 03/11] target/mips: Fix MSA instructions
 LD.<B|H|W|D> on big endian host
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mateja Marjanovic <Mateja.Marjanovic@rt-rk.com>

Fix the case when the host is a big endian machine, and change
the approach toward LD.<B|H|W|D> instruction helpers.

Signed-off-by: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1554212605-16457-2-git-send-email-mateja.marjanovic@rt-rk.com>
---
 target/mips/op_helper.c | 188 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 168 insertions(+), 20 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 6d86912..a8ae438 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -4356,31 +4356,179 @@ FOP_CONDN_S(sne,  (float32_lt(fst1, fst0, &env->active_fpu.fp_status)
 #define MEMOP_IDX(DF)
 #endif
 
-#define MSA_LD_DF(DF, TYPE, LD_INSN, ...)                               \
-void helper_msa_ld_ ## TYPE(CPUMIPSState *env, uint32_t wd,             \
-                            target_ulong addr)                          \
-{                                                                       \
-    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);                          \
-    wr_t wx;                                                            \
-    int i;                                                              \
-    MEMOP_IDX(DF)                                                       \
-    for (i = 0; i < DF_ELEMENTS(DF); i++) {                             \
-        wx.TYPE[i] = LD_INSN(env, addr + (i << DF), ##__VA_ARGS__);     \
-    }                                                                   \
-    memcpy(pwd, &wx, sizeof(wr_t));                                     \
+void helper_msa_ld_b(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_BYTE)
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
+    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
+    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
+    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
+    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
+    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
+    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
+    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
+    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
+    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
+    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
+    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
+    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
+    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
+    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
+    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
+#else
+    pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (7  << DF_BYTE), oi, GETPC());
+    pwd->b[1]  = helper_ret_ldub_mmu(env, addr + (6  << DF_BYTE), oi, GETPC());
+    pwd->b[2]  = helper_ret_ldub_mmu(env, addr + (5  << DF_BYTE), oi, GETPC());
+    pwd->b[3]  = helper_ret_ldub_mmu(env, addr + (4  << DF_BYTE), oi, GETPC());
+    pwd->b[4]  = helper_ret_ldub_mmu(env, addr + (3  << DF_BYTE), oi, GETPC());
+    pwd->b[5]  = helper_ret_ldub_mmu(env, addr + (2  << DF_BYTE), oi, GETPC());
+    pwd->b[6]  = helper_ret_ldub_mmu(env, addr + (1  << DF_BYTE), oi, GETPC());
+    pwd->b[7]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
+    pwd->b[8]  = helper_ret_ldub_mmu(env, addr + (15 << DF_BYTE), oi, GETPC());
+    pwd->b[9]  = helper_ret_ldub_mmu(env, addr + (14 << DF_BYTE), oi, GETPC());
+    pwd->b[10] = helper_ret_ldub_mmu(env, addr + (13 << DF_BYTE), oi, GETPC());
+    pwd->b[11] = helper_ret_ldub_mmu(env, addr + (12 << DF_BYTE), oi, GETPC());
+    pwd->b[12] = helper_ret_ldub_mmu(env, addr + (11 << DF_BYTE), oi, GETPC());
+    pwd->b[13] = helper_ret_ldub_mmu(env, addr + (10 << DF_BYTE), oi, GETPC());
+    pwd->b[14] = helper_ret_ldub_mmu(env, addr + (9  << DF_BYTE), oi, GETPC());
+    pwd->b[15] = helper_ret_ldub_mmu(env, addr + (8  << DF_BYTE), oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->b[0]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
+    pwd->b[1]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
+    pwd->b[2]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
+    pwd->b[3]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
+    pwd->b[4]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
+    pwd->b[5]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
+    pwd->b[6]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
+    pwd->b[7]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
+    pwd->b[8]  = cpu_ldub_data(env, addr + (8  << DF_BYTE));
+    pwd->b[9]  = cpu_ldub_data(env, addr + (9  << DF_BYTE));
+    pwd->b[10] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
+    pwd->b[11] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
+    pwd->b[12] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
+    pwd->b[13] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
+    pwd->b[14] = cpu_ldub_data(env, addr + (14 << DF_BYTE));
+    pwd->b[15] = cpu_ldub_data(env, addr + (15 << DF_BYTE));
+#else
+    pwd->b[0]  = cpu_ldub_data(env, addr + (7  << DF_BYTE));
+    pwd->b[1]  = cpu_ldub_data(env, addr + (6  << DF_BYTE));
+    pwd->b[2]  = cpu_ldub_data(env, addr + (5  << DF_BYTE));
+    pwd->b[3]  = cpu_ldub_data(env, addr + (4  << DF_BYTE));
+    pwd->b[4]  = cpu_ldub_data(env, addr + (3  << DF_BYTE));
+    pwd->b[5]  = cpu_ldub_data(env, addr + (2  << DF_BYTE));
+    pwd->b[6]  = cpu_ldub_data(env, addr + (1  << DF_BYTE));
+    pwd->b[7]  = cpu_ldub_data(env, addr + (0  << DF_BYTE));
+    pwd->b[8]  = cpu_ldub_data(env, addr + (15 << DF_BYTE));
+    pwd->b[9]  = cpu_ldub_data(env, addr + (14 << DF_BYTE));
+    pwd->b[10] = cpu_ldub_data(env, addr + (13 << DF_BYTE));
+    pwd->b[11] = cpu_ldub_data(env, addr + (12 << DF_BYTE));
+    pwd->b[12] = cpu_ldub_data(env, addr + (11 << DF_BYTE));
+    pwd->b[13] = cpu_ldub_data(env, addr + (10 << DF_BYTE));
+    pwd->b[14] = cpu_ldub_data(env, addr + (9 << DF_BYTE));
+    pwd->b[15] = cpu_ldub_data(env, addr + (8 << DF_BYTE));
+#endif
+#endif
 }
 
+void helper_msa_ld_h(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_HALF)
 #if !defined(CONFIG_USER_ONLY)
-MSA_LD_DF(DF_BYTE,   b, helper_ret_ldub_mmu, oi, GETPC())
-MSA_LD_DF(DF_HALF,   h, helper_ret_lduw_mmu, oi, GETPC())
-MSA_LD_DF(DF_WORD,   w, helper_ret_ldul_mmu, oi, GETPC())
-MSA_LD_DF(DF_DOUBLE, d, helper_ret_ldq_mmu,  oi, GETPC())
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
+    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
+    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
+    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
+    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
+    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
+    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
+    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
+#else
+    pwd->h[0] = helper_ret_lduw_mmu(env, addr + (3 << DF_HALF), oi, GETPC());
+    pwd->h[1] = helper_ret_lduw_mmu(env, addr + (2 << DF_HALF), oi, GETPC());
+    pwd->h[2] = helper_ret_lduw_mmu(env, addr + (1 << DF_HALF), oi, GETPC());
+    pwd->h[3] = helper_ret_lduw_mmu(env, addr + (0 << DF_HALF), oi, GETPC());
+    pwd->h[4] = helper_ret_lduw_mmu(env, addr + (7 << DF_HALF), oi, GETPC());
+    pwd->h[5] = helper_ret_lduw_mmu(env, addr + (6 << DF_HALF), oi, GETPC());
+    pwd->h[6] = helper_ret_lduw_mmu(env, addr + (5 << DF_HALF), oi, GETPC());
+    pwd->h[7] = helper_ret_lduw_mmu(env, addr + (4 << DF_HALF), oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->h[0] = cpu_lduw_data(env, addr + (0 << DF_HALF));
+    pwd->h[1] = cpu_lduw_data(env, addr + (1 << DF_HALF));
+    pwd->h[2] = cpu_lduw_data(env, addr + (2 << DF_HALF));
+    pwd->h[3] = cpu_lduw_data(env, addr + (3 << DF_HALF));
+    pwd->h[4] = cpu_lduw_data(env, addr + (4 << DF_HALF));
+    pwd->h[5] = cpu_lduw_data(env, addr + (5 << DF_HALF));
+    pwd->h[6] = cpu_lduw_data(env, addr + (6 << DF_HALF));
+    pwd->h[7] = cpu_lduw_data(env, addr + (7 << DF_HALF));
 #else
-MSA_LD_DF(DF_BYTE,   b, cpu_ldub_data)
-MSA_LD_DF(DF_HALF,   h, cpu_lduw_data)
-MSA_LD_DF(DF_WORD,   w, cpu_ldl_data)
-MSA_LD_DF(DF_DOUBLE, d, cpu_ldq_data)
+    pwd->h[0] = cpu_lduw_data(env, addr + (3 << DF_HALF));
+    pwd->h[1] = cpu_lduw_data(env, addr + (2 << DF_HALF));
+    pwd->h[2] = cpu_lduw_data(env, addr + (1 << DF_HALF));
+    pwd->h[3] = cpu_lduw_data(env, addr + (0 << DF_HALF));
+    pwd->h[4] = cpu_lduw_data(env, addr + (7 << DF_HALF));
+    pwd->h[5] = cpu_lduw_data(env, addr + (6 << DF_HALF));
+    pwd->h[6] = cpu_lduw_data(env, addr + (5 << DF_HALF));
+    pwd->h[7] = cpu_lduw_data(env, addr + (4 << DF_HALF));
 #endif
+#endif
+}
+
+void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_WORD)
+#if !defined(CONFIG_USER_ONLY)
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
+    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
+    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
+    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
+#else
+    pwd->w[0] = helper_ret_ldul_mmu(env, addr + (1 << DF_WORD), oi, GETPC());
+    pwd->w[1] = helper_ret_ldul_mmu(env, addr + (0 << DF_WORD), oi, GETPC());
+    pwd->w[2] = helper_ret_ldul_mmu(env, addr + (3 << DF_WORD), oi, GETPC());
+    pwd->w[3] = helper_ret_ldul_mmu(env, addr + (2 << DF_WORD), oi, GETPC());
+#endif
+#else
+#if !defined(HOST_WORDS_BIGENDIAN)
+    pwd->w[0] = cpu_ldl_data(env, addr + (0 << DF_WORD));
+    pwd->w[1] = cpu_ldl_data(env, addr + (1 << DF_WORD));
+    pwd->w[2] = cpu_ldl_data(env, addr + (2 << DF_WORD));
+    pwd->w[3] = cpu_ldl_data(env, addr + (3 << DF_WORD));
+#else
+    pwd->w[0] = cpu_ldl_data(env, addr + (1 << DF_WORD));
+    pwd->w[1] = cpu_ldl_data(env, addr + (0 << DF_WORD));
+    pwd->w[2] = cpu_ldl_data(env, addr + (3 << DF_WORD));
+    pwd->w[3] = cpu_ldl_data(env, addr + (2 << DF_WORD));
+#endif
+#endif
+}
+
+void helper_msa_ld_d(CPUMIPSState *env, uint32_t wd,
+                     target_ulong addr)
+{
+    wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
+    MEMOP_IDX(DF_DOUBLE)
+#if !defined(CONFIG_USER_ONLY)
+    pwd->d[0] = helper_ret_ldq_mmu(env, addr + (0 << DF_DOUBLE), oi, GETPC());
+    pwd->d[1] = helper_ret_ldq_mmu(env, addr + (1 << DF_DOUBLE), oi, GETPC());
+#else
+    pwd->d[0] = cpu_ldq_data(env, addr + (0 << DF_DOUBLE));
+    pwd->d[1] = cpu_ldq_data(env, addr + (1 << DF_DOUBLE));
+#endif
+}
 
 #define MSA_PAGESPAN(x) \
         ((((x) & ~TARGET_PAGE_MASK) + MSA_WRLEN/8 - 1) >= TARGET_PAGE_SIZE)
-- 
2.7.4


