Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9453468F4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:26:26 +0100 (CET)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmfX-00040o-Mg
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0y-0008O0-5j
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:28 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0P-0003hr-1v
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:27 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so20481260oto.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDEzeJHZqdUXe/dXYq7qR5PEy35VBqTIPDXHrdEdgcc=;
 b=s/lmuF8TUfFrYmchVU+a8BF+Df99LWU72xmH0sNvilnp9hMxTpPQTwrnof1rgrCh1M
 pX2fRGwsXindS7yvVjuD6kn35a27UjT9Xg4JxaJACfhZI6GIBPLuA0VtKOVuSAIAKxZI
 1ATGsnalhNW2MIcmtAPq72WjBn9AcsSb7OM8ZU4o8rN2uCP6N7128yFCqFp8o7sQ4bdQ
 n/zV/M7DaeWHNRr2Co4KoGqV7j2wPse9S8kCGBfaX5ESORyFm6TTFe9d/1vFHS7wQYrJ
 52+a9O0/dmXqkaXTXLWMYukt8OFuigkrd8+dCW0v4T82HM31fAWCVQ/3jF2PFSxUJQ/a
 8eLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDEzeJHZqdUXe/dXYq7qR5PEy35VBqTIPDXHrdEdgcc=;
 b=D1cW7T3F1w+fkxYm/Ve0SD2/QDOj35qJ127DKvtAWaw+s+g7DtJCicsQuBAHchQdwv
 By4o2Y9krOmT0meqbbElsmJqcxxAzDUWVCbm4XbwS0UWsX+Vn3HBf3oLJj9Qtw+sIP5V
 +R27sAR4RtOHbiYsWeMWGqsOkGCRy+bbH5YKPZDLljhadBGfZ8vkIzWxV25+l7EDUlE1
 dKetqqUK91VdPeX/wPsZMHPqR+57BTAfJsabZMkbRAcAeVplDqTgwCIbRKJeUlp+7lgv
 ljBNf4qGKz3igt0dT0g8ZvmYrwSY7kXExgZAra6s+EH/0Sf/iZ4NgemPb+YLnY3eK7mm
 aGvA==
X-Gm-Message-State: AOAM532IFbzDiE1XP13cf4bU9LqemzbJfc/sh8u2fjaLPGlS7P5TQ5Rz
 x6HHiqr/FfEWUh1oifZMu8GBWkU+FD5v7coW
X-Google-Smtp-Source: ABdhPJw6hh7XAN/Fkc6RegnHy9BCk+RwVk7n/v6oTPYOctuSaxOJtFGLRDNal/h1D7wwqedmd0rOsA==
X-Received: by 2002:a05:6830:158d:: with SMTP id
 i13mr5721403otr.8.1616525029547; 
 Tue, 23 Mar 2021 11:43:49 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/10] target/ppc: Create helper_scv
Date: Tue, 23 Mar 2021 12:43:35 -0600
Message-Id: <20210323184340.619757-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform the test against FSCR_SCV at runtime, in the helper.

This means we can remove the incorrect set against SCV in
ppc_tr_init_disas_context and do not need to add an HFLAGS bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h      |  1 +
 target/ppc/excp_helper.c |  9 +++++++++
 target/ppc/translate.c   | 20 +++++++-------------
 3 files changed, 17 insertions(+), 13 deletions(-)

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
2.25.1


