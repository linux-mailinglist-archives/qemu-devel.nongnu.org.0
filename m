Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2058346929
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:35:30 +0100 (CET)
Received: from localhost ([::1]:57450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmoM-0001a4-10
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0x-0008MR-Hp
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:27 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:38543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0N-0003hH-3s
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:27 -0400
Received: by mail-oi1-x230.google.com with SMTP id f9so18099230oiw.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hjRKYvKwPhnZczNplHlGNdiwX+bsNrNu6SiB/+LyZA=;
 b=SQ+27xqYoHWPUGePhOitizEXdptaRcrdXHQgtC4NW9zjekptoDHGDF81yh0ntBfEG6
 EMP2KScax0ugWNK1FwUDxaIiPrjEveOM0W6nxIhmyMcLBAyCdk8cG7PeiP+gYvsM8zz3
 dQqKwVBIXCRCB8krnm70V4xRj3+NTy0SVi+gOPeImUCizWNF5i02wp0ehd2cvyolQgoo
 zM1v5dIbVyHq9qXwgyFE4a10Kgjrei35ihYJGb0R3EOvv14UQfU79N8PgiEu2PmN3oob
 yVbLiQAS5ETJEOUTDbOPns0z5TflCj3uPmUo6j5ZmuMwYBD2OYwjvLj0VEREQnTANLoa
 dWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hjRKYvKwPhnZczNplHlGNdiwX+bsNrNu6SiB/+LyZA=;
 b=FFygN3echDfi6l30ELVJApBS2FiFU7xLjxE7fExYap0Bz1IzQBQlafN/LhV6NB1IuP
 0eCKfgNQY323nHe2++q9q6Jbg4/n+8rcbqKnT3cF/3HFTTyy6dLahWM6gKuZaf9cl5RB
 HnrA8Xed30dOw1ilrjXLbVqXXkYSjwoZ2WVoRQQlBmTsLKN1H+AfteDEHDrDJ9BoOcGB
 OTRUpNGKeHufMIzQ5RdmjfcTeKLfLiEjR4BWjLOLHLF7ZhBZrMq0WZUhE/Fh3CHgWTaw
 CRnOqVtZc2xqn63KcGcXiCJt3yVAUl5cQfT8Df5utVuy8JkQ/o1/QQwAEpWte6+F2rDy
 PA2w==
X-Gm-Message-State: AOAM530TQzzBt+afaa8AHGR0ZT5brbcfG8pU2V5/8qHZ6KIn/OFu6ilU
 sy1XRpjIe/cJIaYs7sjnEzBqbrO4Z9pXr9iL
X-Google-Smtp-Source: ABdhPJzu7vBnI7kjkVVd1shqGGiFs0FupDxDwwWwuHgeMGJcj+U9bnMmPSDEwB7prpZ+AKWVtofEcQ==
X-Received: by 2002:a05:6808:b09:: with SMTP id
 s9mr4369537oij.36.1616525028288; 
 Tue, 23 Mar 2021 11:43:48 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/10] target/ppc: Put dbcr0 single-step bits into hflags
Date: Tue, 23 Mar 2021 12:43:34 -0600
Message-Id: <20210323184340.619757-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

Because these bits were not in hflags, the code generated
for single-stepping on BookE was essentially random.
Recompute hflags when storing to dbcr0.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper_regs.c | 24 +++++++++++++++++-------
 target/ppc/misc_helper.c |  3 +++
 target/ppc/translate.c   | 11 -----------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index df9673b90f..e345966b6b 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -114,13 +114,23 @@ void hreg_compute_hflags(CPUPPCState *env)
         hflags |= le << MSR_LE;
     }
 
-    if (ppc_flags & POWERPC_FLAG_BE) {
-        QEMU_BUILD_BUG_ON(MSR_BE != HFLAGS_BE);
-        msr_mask |= 1 << MSR_BE;
-    }
-    if (ppc_flags & POWERPC_FLAG_SE) {
-        QEMU_BUILD_BUG_ON(MSR_SE != HFLAGS_SE);
-        msr_mask |= 1 << MSR_SE;
+    if (ppc_flags & POWERPC_FLAG_DE) {
+        target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
+        if (dbcr0 & DBCR0_ICMP) {
+            hflags |= 1 << HFLAGS_SE;
+        }
+        if (dbcr0 & DBCR0_BRT) {
+            hflags |= 1 << HFLAGS_BE;
+        }
+    } else {
+        if (ppc_flags & POWERPC_FLAG_BE) {
+            QEMU_BUILD_BUG_ON(MSR_BE != HFLAGS_BE);
+            msr_mask |= 1 << MSR_BE;
+        }
+        if (ppc_flags & POWERPC_FLAG_SE) {
+            QEMU_BUILD_BUG_ON(MSR_SE != HFLAGS_SE);
+            msr_mask |= 1 << MSR_SE;
+        }
     }
 
     if (msr_is_64bit(env, msr)) {
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index b04b4d7c6e..002958be26 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -215,6 +215,9 @@ void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong value)
 
 void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
 {
+    /* Bits 26 & 27 affect single-stepping. */
+    hreg_compute_hflags(env);
+    /* Bits 28 & 29 affect reset or shutdown. */
     store_40x_dbcr0(env, val);
 }
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index a85b890bb0..7912495f28 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7923,17 +7923,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     if ((hflags >> HFLAGS_BE) & 1) {
         ctx->singlestep_enabled |= CPU_BRANCH_STEP;
     }
-    if ((env->flags & POWERPC_FLAG_DE) && msr_de) {
-        ctx->singlestep_enabled = 0;
-        target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
-        if (dbcr0 & DBCR0_ICMP) {
-            ctx->singlestep_enabled |= CPU_SINGLE_STEP;
-        }
-        if (dbcr0 & DBCR0_BRT) {
-            ctx->singlestep_enabled |= CPU_BRANCH_STEP;
-        }
-
-    }
     if (unlikely(ctx->base.singlestep_enabled)) {
         ctx->singlestep_enabled |= GDBSTUB_SINGLE_STEP;
     }
-- 
2.25.1


