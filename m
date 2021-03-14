Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DC133A74A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:08:22 +0100 (CET)
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVA5-0000J1-Sy
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1c-0002WC-66
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:36 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:39194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1S-0002AA-T2
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:35 -0400
Received: by mail-qk1-x736.google.com with SMTP id g185so29587728qkf.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nDEzeJHZqdUXe/dXYq7qR5PEy35VBqTIPDXHrdEdgcc=;
 b=g7cYJVkbLThk/h2k9vtKEGK6c1ZrtHalidEAN5DgdaL9D4L8hZETV3bt1Bc3Qgf2iQ
 w8Ik2CZnwRKuJRTCl8BF1mjcxXYXm3WUDxogGZPMLTPZnxS2mQ4pIFQ5CNjj0mo8/i6E
 ddL7xISa/saEQdD98k8ZR9kwb6Cp3nim++XgsEGgA0d9ZEvtWo8mUCDt3wLMyPLY2+BI
 uEUI15mLlxl7enh/WRwWx2bvgdGKiDUNmGWRvzm9qrN0iuzfKzFYHcnX7I1d6tuaB838
 mlg5B2hIVi3jJd5eEBcHcXAvrUiiteMrSww2+8GkdWoOAlJtBWgkxwoXR4WhwF1MT/yz
 BzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDEzeJHZqdUXe/dXYq7qR5PEy35VBqTIPDXHrdEdgcc=;
 b=BMwfirZ8R45tidtdEoaWythgdcsYtzUPIy+/Z0UofAVzQdcYX5r9jnOl0lKGVcRbXm
 ovNGqwi6npexdvgHxU1O0J4rtL1VX0WIRMArIDWFOAhFJnIdQ0CzPVYsJ7xdWWqm70Gr
 DM1nBja4bTJbF7DIcowtuoWW2AI5e4xI6l0UKmAPPAoypBEzZCU5+bKhSEbJyVHkataf
 m7+UcseypjO/8Wg7EINSnkt/tve0n3fdkefD11bf4PZ6zj32dh7fc/s4ePtVhhhMkhQF
 K8/XMElYzZoB8GRRBLzQy4vge+mfm3Oy33zUt4KDEgrhHYKmtDYzZA88BUoWQwUdVdx1
 zLRA==
X-Gm-Message-State: AOAM530i6f2T+8yhpKeuPbf+FIZoJpMw6hU4lgnBnxSQ6HFhNmauoeW1
 sp/boeNUvu+CC+U65pIPu1RINpckBZPZGRJM
X-Google-Smtp-Source: ABdhPJxQUFxnegEwmNWso+WagIBv0bUlrxWRyJFB7p+Aeuwoouvs6paDEesJSBfgDVIR1E6nMajkuA==
X-Received: by 2002:a37:bc45:: with SMTP id m66mr22349615qkf.82.1615744760600; 
 Sun, 14 Mar 2021 10:59:20 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/16] target/ppc: Create helper_scv
Date: Sun, 14 Mar 2021 11:59:00 -0600
Message-Id: <20210314175906.1733746-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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


