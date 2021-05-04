Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E762F3725AC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:06:40 +0200 (CEST)
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoCe-0007RU-04
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo00-0005Fk-Rr; Tue, 04 May 2021 01:53:36 -0400
Received: from ozlabs.org ([203.11.71.1]:35751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzx-0004iX-Ds; Tue, 04 May 2021 01:53:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK3r9Gz9sWq; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=x/kaaARkUFgaoRSSOlm3/nAAxu0ti8r5riiog6MzMng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SS2Zb5K/3uP1HmLgP5f7Kc0o6l6jaXc1h2Ey54o4xWjRVQ2UNf37tLM5WEe50CGgC
 jjKENZ2oGHnNGs3raVfzXB08AJoEh6qWZDSB6SzHTgjD+veeYAM/BS/82oWMPjCt0l
 VERgCXZiBWjaLaCxMTTLpXSsAI6Md8OKq+MiYnqY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/46] target/ppc: Create helper_scv
Date: Tue,  4 May 2021 15:52:40 +1000
Message-Id: <20210504055312.306823-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Perform the test against FSCR_SCV at runtime, in the helper.

This means we can remove the incorrect set against SCV in
ppc_tr_init_disas_context and do not need to add an HFLAGS bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-6-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c |  9 +++++++++
 target/ppc/helper.h      |  1 +
 target/ppc/translate.c   | 20 +++++++-------------
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 85de7e6c90..5c95e0c103 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1130,6 +1130,15 @@ void helper_store_msr(CPUPPCState *env, target_ulong val)
 }
 
 #if defined(TARGET_PPC64)
+void helper_scv(CPUPPCState *env, uint32_t lev)
+{
+    if (env->spr[SPR_FSCR] & (1ull << FSCR_SCV)) {
+        raise_exception_err(env, POWERPC_EXCP_SYSCALL_VECTORED, lev);
+    } else {
+        raise_exception_err(env, POWERPC_EXCP_FU, FSCR_IC_SCV);
+    }
+}
+
 void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
 {
     CPUState *cs;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6a4dccf70c..513066d54d 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -13,6 +13,7 @@ DEF_HELPER_1(rfci, void, env)
 DEF_HELPER_1(rfdi, void, env)
 DEF_HELPER_1(rfmci, void, env)
 #if defined(TARGET_PPC64)
+DEF_HELPER_2(scv, noreturn, env, i32)
 DEF_HELPER_2(pminsn, void, env, i32)
 DEF_HELPER_1(rfid, void, env)
 DEF_HELPER_1(rfscv, void, env)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 7912495f28..d48c554290 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -173,7 +173,6 @@ struct DisasContext {
     bool vsx_enabled;
     bool spe_enabled;
     bool tm_enabled;
-    bool scv_enabled;
     bool gtse;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
@@ -4081,15 +4080,16 @@ static void gen_sc(DisasContext *ctx)
 #if !defined(CONFIG_USER_ONLY)
 static void gen_scv(DisasContext *ctx)
 {
-    uint32_t lev;
+    uint32_t lev = (ctx->opcode >> 5) & 0x7F;
 
-    if (unlikely(!ctx->scv_enabled)) {
-        gen_exception_err(ctx, POWERPC_EXCP_FU, FSCR_IC_SCV);
-        return;
+    /* Set the PC back to the faulting instruction. */
+    if (ctx->exception == POWERPC_EXCP_NONE) {
+        gen_update_nip(ctx, ctx->base.pc_next - 4);
     }
+    gen_helper_scv(cpu_env, tcg_constant_i32(lev));
 
-    lev = (ctx->opcode >> 5) & 0x7F;
-    gen_exception_err(ctx, POWERPC_SYSCALL_VECTORED, lev);
+    /* This need not be exact, just not POWERPC_EXCP_NONE */
+    ctx->exception = POWERPC_SYSCALL_VECTORED;
 }
 #endif
 #endif
@@ -7907,12 +7907,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->spe_enabled = (hflags >> HFLAGS_SPE) & 1;
     ctx->altivec_enabled = (hflags >> HFLAGS_VR) & 1;
     ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
-    if ((env->flags & POWERPC_FLAG_SCV)
-        && (env->spr[SPR_FSCR] & (1ull << FSCR_SCV))) {
-        ctx->scv_enabled = true;
-    } else {
-        ctx->scv_enabled = false;
-    }
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = !!(env->spr[SPR_LPCR] & LPCR_GTSE);
 
-- 
2.31.1


