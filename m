Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8533A741
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:05:05 +0100 (CET)
Received: from localhost ([::1]:43292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLV6u-00057U-Do
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1Z-0002O4-4f
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:33 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1Q-00029v-Lx
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:32 -0400
Received: by mail-qk1-x72f.google.com with SMTP id a9so29555509qkn.13
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LL8bkt3cpcyBMDK/LZ6QT2j+SFhG/YMWEf75uL1t8Es=;
 b=h8HtEOy1GoWi0VY9Qon22JoTkSIf8uvHLrIxuAKXeCrm6uVw5ZtBcQF8E5xEZcnOWq
 2K6EABUzHMnl661TCTcT21ZHSwlX2xAmvNEXDekKUF1BVAmRWcJw9NMGM5kzprx/wSh7
 Vq9UrnLMyek3PDpqsltdRaT8UU4RmOccgHZKlqC6pO2778Y0fCbyrQq3Ep0HATXfLknV
 sP4xNRDvkUghZ1LE8eKaHumEG5ZwZwG8aUxIOI9gsteGqPOW4w1BTOoOEQcqa39fHBrU
 RgCgKcmkUlKpOtawLWz6z8N8PW88PatNJVUsKZRyQ2XsrdzNHZj6JkmWsS+uN2v1bwX4
 4krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LL8bkt3cpcyBMDK/LZ6QT2j+SFhG/YMWEf75uL1t8Es=;
 b=EyRLeObv1qC6z8FsxBo1Rpsc5Hv9pgeB6BsVNPW9XN+MVm/6dIHLDl/uyyANBA2yHe
 y51CyTXkxn6E0iXlq2acETyxq6qhUy3lHV7aSR3TawpRb2ZZEWR5C6+Gcuf4mV6p2REy
 mXLNtcoJKDKrh7wJ7LmyA3TU34vltwX+BpeT22HCS5emF58CoIzsEMu6xFzuZvnzHaSS
 hrIlYaXtl/N0HNCqsFQ87FIZGIsIdDzopD7592658QiXBVoCUCViRXmHWcXBRVCPZLLM
 K9rMHC8weMHz9xBLp5WAvjk1Dq9ESLb1b1Q3BWABjXUgqux8CW3bGB8g6GGkkSjh/nWv
 +Smg==
X-Gm-Message-State: AOAM531rmnPHtgTyT6u1+dqiUHg5KJNtAQhvi+Tyq5pr6k7OVWYufuQk
 UUc19Jf6elKg33sohw1Ie9jH6/M1C/i3iY7+
X-Google-Smtp-Source: ABdhPJxSgWtRyHSZUqebLhwmOehUD6PW/iLd8Rv0S7SBQ1toLI7sjmnvP/j92ESpwGr1DxE4NCPwlA==
X-Received: by 2002:a37:8506:: with SMTP id h6mr21488325qkd.134.1615744759287; 
 Sun, 14 Mar 2021 10:59:19 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/16] target/ppc: Put dbcr0 single-step bits into hflags
Date: Sun, 14 Mar 2021 11:58:59 -0600
Message-Id: <20210314175906.1733746-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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


