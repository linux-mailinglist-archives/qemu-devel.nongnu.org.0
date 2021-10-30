Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48B440B54
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:44:23 +0200 (CEST)
Received: from localhost ([::1]:46284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtL4-0005nw-8I
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs23-0001lh-R2
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:41 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs21-0002Ju-MN
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:39 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o10-20020a17090a3d4a00b001a6555878a8so1592883pjf.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7GFp0BnjNqf+HN7On2kB2ojF6HuQfaO5DIVgtLsXYvY=;
 b=ilCldCytIC6SbLn39fo3LG5OeVlnSLX0Vshw+dajfX8lZBsoEfRoJAI3lIwP9s9seq
 eV6hhHRDJMPJs/iWBvKBywz4N0Ux3Qym/tCybYJvsG3etJEwVkV3BsH70WP91pw9l5X5
 3Lgo9eBBJPHNpO+yLLAoGeAThYhZ8Itp5d2cwAJZzLV7Yf54wu6BFXveK1TfRV7qRL5W
 3RPqea0kDNOrzB4HWUL3GVkZKHcnUoDbsG04fKKCx4jNPAgg+Nq65Bf7jeQBo02HENil
 AazemyP62bsn33BgxWt5hFsO31SSPmYXVlX6h+glx3oCQrFpj10YkIX6gWM7nkaaj8lF
 iTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7GFp0BnjNqf+HN7On2kB2ojF6HuQfaO5DIVgtLsXYvY=;
 b=QKfJZ080WvpWeWkzOOrE7CI0QRUj1xy4wbTh1UOBVFls2wRa/Fyd6fOfCeobpOaqw8
 MwvXMLF5gX0B+ZqM3HHSn2hQoPi16uXe6JdR5SgE7UcxbHSgZ/q5K5KYQJlHfhslc7jb
 56/zAgfiwrEWJoklyWDhpy+RGfZMtrakPoYBfjiTEUdnW85ihQPXC2a7NFxOj70fcdES
 P+chbO/O7l5OA86gs6M/nx1MuE4vTnVM0K7y+ZOsQogNSveVhDDGSZcMwaIfkdx7X8sC
 wXPBM3WqLsSHxvFS4geo5T0BKXmnFMsyDv1t2CH1+B8ri91WSBocHpQivkUgTowwMlTw
 HDPw==
X-Gm-Message-State: AOAM532nmd5iV3IvPNLen4zBWcmWKPn0YswLFpygyxnoI3P+pzjsZ/R4
 vf64MGxCmR6aOz9Ns+QfJ0ORZ+r3vB+MMw==
X-Google-Smtp-Source: ABdhPJzdfkfEEjRFJacsX8DSu5ODP47T/7cPSH98v16tT/fS3SzqV35Pft6bqtwoB73EU0v1/pLQTg==
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr18820712pjl.19.1635614436512; 
 Sat, 30 Oct 2021 10:20:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 65/66] target/hppa: Implement prctl_unalign_sigbus
Date: Sat, 30 Oct 2021 10:16:34 -0700
Message-Id: <20211030171635.1689530-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
flag to set MO_UNALN for the instructions that the kernel
handles in the unaligned trap.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/target_prctl.h |  2 +-
 target/hppa/cpu.h              |  5 ++++-
 target/hppa/translate.c        | 19 +++++++++++++++----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/linux-user/hppa/target_prctl.h b/linux-user/hppa/target_prctl.h
index eb53b31ad5..5629ddbf39 100644
--- a/linux-user/hppa/target_prctl.h
+++ b/linux-user/hppa/target_prctl.h
@@ -1 +1 @@
-/* No special prctl support required. */
+#include "../generic/target_prctl_unalign.h"
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 294fd7297f..45fd338b02 100644
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
index 3b9744deb4..f555503024 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -272,8 +272,18 @@ typedef struct DisasContext {
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
@@ -1473,7 +1483,7 @@ static void do_load_32(DisasContext *ctx, TCGv_i32 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_reg(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1491,7 +1501,7 @@ static void do_load_64(DisasContext *ctx, TCGv_i64 dest, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_ld_i64(dest, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1509,7 +1519,7 @@ static void do_store_32(DisasContext *ctx, TCGv_i32 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i32(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -1527,7 +1537,7 @@ static void do_store_64(DisasContext *ctx, TCGv_i64 src, unsigned rb,
 
     form_gva(ctx, &addr, &ofs, rb, rx, scale, disp, sp, modify,
              ctx->mmu_idx == MMU_PHYS_IDX);
-    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop);
+    tcg_gen_qemu_st_i64(src, addr, ctx->mmu_idx, mop | UNALIGN(ctx));
     if (modify) {
         save_gpr(ctx, rb, ofs);
     }
@@ -4102,6 +4112,7 @@ static void hppa_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mmu_idx = MMU_USER_IDX;
     ctx->iaoq_f = ctx->base.pc_first | MMU_USER_IDX;
     ctx->iaoq_b = ctx->base.tb->cs_base | MMU_USER_IDX;
+    ctx->unalign = (ctx->tb_flags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN);
 #else
     ctx->privilege = (ctx->tb_flags >> TB_FLAG_PRIV_SHIFT) & 3;
     ctx->mmu_idx = (ctx->tb_flags & PSW_D ? ctx->privilege : MMU_PHYS_IDX);
-- 
2.25.1


