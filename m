Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E1486330
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:52:33 +0100 (CET)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QNk-0007HB-4W
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:52:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDV-0007dX-Nc
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:57 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:34251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004ii-Q9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:57 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mgvj3-1mT5C30ruv-00hNCZ; Thu, 06
 Jan 2022 11:41:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/27] target/hppa: Implement prctl_unalign_sigbus
Date: Thu,  6 Jan 2022 11:41:21 +0100
Message-Id: <20220106104137.732883-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kiwqWioa8pwH62vt2bj2DK8vZUodcrthSFww0+yA4gGf7F37kT7
 Scm4mzJPzGjTU7zWY8HhnkDwdop+QIjYtN69i+X35I+AJpRXy8KEu9LS+uSWVzSP4KTsu5z
 us69Oz+Kemk2mn4tomo3Gx/tDJJ19Ybh/VuNFcZ7B0F4sU9APturR7XeeIAP14qLncxZhQ6
 dI0peWLWzOz6xyPqvH1Aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9KTJbbrXwsY=:U0o8JBZbyFi+M/6JHRuTUa
 KfqJPaWY9AggjFa71hQYg5QVIRyOstHiznM7PZGrpp0Lc5wLoslyyFEOipRCiNNPTf3PDau5c
 t/+Mr7jf6HDi8BXeigWOwLXEXCwJ6GxOGAQp5y8PDsNuAVmA5DxaBeHb06dq0cJanov0zVv38
 ctPcCAurv3J91A8NpCnTB+DCzX1E/UsPtbPlmn2+5rLXIn50Wo6KQBVCx2IGseHlKi74dndpB
 uDWSI6XLwIgRi7QWkcK3IMvWmGf4lcZ3Rv43DydyDGf1Tbrrh4O/D4e5/CBG8obvFqydA0K3f
 ModusbRllON/yYkGsQlufvTxQkxkrHkBFPPIPi6/8KUBQe3znbkXAzQ5pUO8rubNBoBIgTofu
 DydYZje8DZduWke6bSLj6koQy4Y86VsPaRWWOBfRi3ZJ/jhcUWuCuKu6c4gZjuY9kJrLkXiLU
 89awLaolkmdbJC1ooEAv0yrPqwqMmUkEPM7h6wJLUQOQqQ9fR94APU3gK7PXc1Tf3EIpFl2gj
 lgIn1iRqAARcKHt8m2JkTy/G/aJFOIV5gAMlmGR1pliBOpouA1WnsXMSgA+mKOy0uAVl6N5kY
 p3m9JJhuoB80KNaUoPoimMnOFyL6q9+aMj/UKGdzTa8tiiAUWJFrSbqIbqIdJEyyU2MI8uNyX
 hsI1/wHoZ0voSiN29NscXm5QYo08ZBGctpXlHT3tl0lvVYwuuDUPknPBy1b2aRDch0pE=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
flag to set MO_UNALN for the instructions that the kernel
handles in the unaligned trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211227150127.2659293-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/target_prctl.h |  2 +-
 target/hppa/cpu.h              |  5 ++++-
 target/hppa/translate.c        | 19 +++++++++++++++----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/linux-user/hppa/target_prctl.h b/linux-user/hppa/target_prctl.h
index eb53b31ad554..5629ddbf39cd 100644
--- a/linux-user/hppa/target_prctl.h
+++ b/linux-user/hppa/target_prctl.h
@@ -1 +1 @@
-/* No special prctl support required. */
+#include "../generic/target_prctl_unalign.h"
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 294fd7297f91..45fd338b02f8 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -259,12 +259,14 @@ static inline target_ulong hppa_form_gva(CPUHPPAState *env, uint64_t spc,
     return hppa_form_gva_psw(env->psw, spc, off);
 }
 
-/* Since PSW_{I,CB} will never need to be in tb->flags, reuse them.
+/*
+ * Since PSW_{I,CB} will never need to be in tb->flags, reuse them.
  * TB_FLAG_SR_SAME indicates that SR4 through SR7 all contain the
  * same value.
  */
 #define TB_FLAG_SR_SAME     PSW_I
 #define TB_FLAG_PRIV_SHIFT  8
+#define TB_FLAG_UNALIGN     0x400
 
 static inline void cpu_get_tb_cpu_state(CPUHPPAState *env, target_ulong *pc,
                                         target_ulong *cs_base,
@@ -279,6 +281,7 @@ static inline void cpu_get_tb_cpu_state(CPUHPPAState *env, target_ulong *pc,
 #ifdef CONFIG_USER_ONLY
     *pc = env->iaoq_f & -4;
     *cs_base = env->iaoq_b & -4;
+    flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
 #else
     /* ??? E, T, H, L, B, P bits need to be here, when implemented.  */
     flags |= env->psw & (PSW_W | PSW_C | PSW_D);
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 952027a28e12..a2392a1b64a4 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -274,8 +274,18 @@ typedef struct DisasContext {
     int mmu_idx;
     int privilege;
     bool psw_n_nonzero;
+
+#ifdef CONFIG_USER_ONLY
+    MemOp unalign;
+#endif
 } DisasContext;
 
+#ifdef CONFIG_USER_ONLY
+#define UNALIGN(C)  (C)->unalign
+#else
+#define UNALIGN(C)  0
+#endif
+
 /* Note that ssm/rsm instructions number PSW_W and PSW_E differently.  */
 static int expand_sm_imm(DisasContext *ctx, int val)
 {
@@ -1475,7 +1485,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1493,7 +1503,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1511,7 +1521,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1529,7 +1539,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -4107,6 +4117,7 @@ static void hppa_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mmu_idx = MMU_USER_IDX;
     ctx->iaoq_f = ctx->base.pc_first | MMU_USER_IDX;
     ctx->iaoq_b = ctx->base.tb->cs_base | MMU_USER_IDX;
+    ctx->unalign = (ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->privilege = (ctx->tb_flags >> TB_FLAG_PRIV_SHIFT) & 3;
     ctx->mmu_idx = (ctx->tb_flags & PSW_D ? ctx->privilege : MMU_PHYS_IDX);
-- 
2.33.1


