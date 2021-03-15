Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C146C33C67F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:09:54 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsbB-00054K-M0
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEY-0007H2-Q3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:30 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:44468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEW-0001cM-Nc
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:30 -0400
Received: by mail-ot1-x32c.google.com with SMTP id p24so7457183ota.11
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LL8bkt3cpcyBMDK/LZ6QT2j+SFhG/YMWEf75uL1t8Es=;
 b=gXj5sWNH6Azsm+KifBOuJ+5E8aGrJvvQyrzAE08WvM47XlDgJINipRiAWZHTQC8LVy
 fzYGwVnzE9CBQkbNveW1AH1b7QpXWQM3ysU9YQvcii8acFP/JEicBUl3AjyyVyH1wkIp
 7l4ktMVctG1GQzj2BUaW6ObYhx8/cysPE3kcpcNr9l/mNGAUUn09VeC58LmvO0o7hfNU
 nFNJ5Sz2Jc+00/FT8OPDDpc4ZtPDXe1NO8QZn+bPzGARNdoA4wDvNlPMaNB9kvDe0ZFm
 +UzWruE7r08KacpdOFIB5jnMqAyeT1OoXMJP1sG+2SVX/OPcBbyGV8XSjMa9cUEB2HEi
 nN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LL8bkt3cpcyBMDK/LZ6QT2j+SFhG/YMWEf75uL1t8Es=;
 b=hIOQh0pGQemIAAReq51vypHF4Dqk5xDEbY9rzswb/0pLT3hXQSrljy0C0fnUvndDHs
 3v9A3zCiLUIlBxSsZScGCcClh+rPHNCVNVV60jDVQlfJ8/chq1QbLCGXofhPLDUewwCg
 x8iP1j21i21w9Zc66oU/f+H50gKbyCyuwS35aRXLOb7A2RJEHJ+S5OAvtcwH8oERp2Z4
 XNlG1KC3KnqeQv+flXsjIXM1tNsdYfTtIXjDHEDBXS7Zqed+iyyVlWwCI46U1L2v8OWF
 w45RR3f33rlXDb1qXHvLvam3qh7ucYH7n8E8DMaXaWYWrOVlHiUKp3yWHGukAMHMQqfC
 74IA==
X-Gm-Message-State: AOAM530rzRo2/S8rh9KYq3umZipbULKUUaHxyOVPlew0iaO9TrrpFiwV
 dW2Q9WdRp6qZZa+rBEDx9HA+Pz6MBxNpx5de
X-Google-Smtp-Source: ABdhPJx3zjuka0zObXAtr7rQFoH8kJAE+c2153zJgDMKirEvWDVDOeN37lMVgkbFYyJKxCcvZ8QY4Q==
X-Received: by 2002:a9d:3c8:: with SMTP id f66mr406451otf.246.1615833987689;
 Mon, 15 Mar 2021 11:46:27 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/17] target/ppc: Put dbcr0 single-step bits into hflags
Date: Mon, 15 Mar 2021 12:46:07 -0600
Message-Id: <20210315184615.1985590-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because these bits were not in hflags, the code generated
for single-stepping on BookE was essentially random.
Recompute hflags when storing to dbcr0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper_regs.c | 20 +++++++++++++++-----
 target/ppc/misc_helper.c |  3 +++
 target/ppc/translate.c   | 11 -----------
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 0a746bffd7..c735540333 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -107,11 +107,21 @@ void hreg_compute_hflags(CPUPPCState *env)
         hflags |= le << MSR_LE;
     }
 
-    if (ppc_flags & POWERPC_FLAG_BE) {
-        msr_mask |= 1 << MSR_BE;
-    }
-    if (ppc_flags & POWERPC_FLAG_SE) {
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
+            msr_mask |= 1 << MSR_BE;
+        }
+        if (ppc_flags & POWERPC_FLAG_SE) {
+            msr_mask |= 1 << MSR_SE;
+        }
     }
 
     if (msr_is_64bit(env, msr)) {
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index b04b4d7c6e..a5ee1fd63c 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -215,6 +215,9 @@ void helper_store_403_pbr(CPUPPCState *env, uint32_t num, target_ulong value)
 
 void helper_store_40x_dbcr0(CPUPPCState *env, target_ulong val)
 {
+    /* Bits 26 & 27 affect single-stepping */
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


