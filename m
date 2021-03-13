Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B68339ABA
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:12:36 +0100 (CET)
Received: from localhost ([::1]:36220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKspX-0003ny-Mu
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:12:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKse0-0007Mj-98
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:43 -0500
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:34739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKsdv-0003TY-IY
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:39 -0500
Received: by mail-qv1-xf31.google.com with SMTP id g8so5172944qvx.1
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fm4BN1FAYzcobXIUNrNdXuRiaQp/Ku74cUVfr1tQ2mY=;
 b=ZPDfotqZkwLgMY82II2d8KzcFDUKm+QoC/DOf3p5BZEiwKiFkF4ld39CK5Wr3SkBXt
 Fe3Ynmbm/u0KdYMkSXB2uYb8WgNvjOFyaZV3HAttfNYCbpHLWqpqMkNRdED2IHII6tGX
 qdx3NgjJ0Fs6mlV2d6GH8Fs4a+sMwxRRzSlMW7FIlxJl2d25WBKQ8kAagX5uEGOFiE5Y
 FO9lVfxwyy65EqwYAu1cQeNuSyY6J047scQ7Qpf0jA1ZhwQ8w3ELTskxQ3aS6scJ62Fn
 DG1wPFMdU0zA3WW8c3yv0YI1MPQIaZa7wD388s4tf0PLakEZLHNfGgahnjEZaWQYpGpY
 HJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fm4BN1FAYzcobXIUNrNdXuRiaQp/Ku74cUVfr1tQ2mY=;
 b=UA/BzgDvxqmkCRsL5dGF+aq0q9YpW2cHDPsdnkuk8aw/H6PkSeymiZLwZRiQchJk0v
 tFB/BlDyZRLLnHJYqY59ztJUTXpd3w34RiJlzSY1D6YGVVH0mvxV8jzZIBtoA9H6kJYe
 pjL8lZNA4h0E35fI11Cn82Nt4WhXUSJFXQ9+/QdH79MfL8+Dh8wDJRnAq3q4RjrUCbxf
 C87jd6eTLwypRB+sSrNBzJDPWTfIyQjc4nTyVcSIQ4DjPbKKyl68NyzkaMh20ETm7g/0
 9IjuzD+YZUHjowK6Qs3DKB654sJZQ5GKios0iLCjx1vKcjhpUbC3Q3s5oaIV4X/VCGPP
 5MPQ==
X-Gm-Message-State: AOAM532ff9tDKfjLKoRQNRQMAYQT4Yis8R4lqUxA2+MNxhXP4NJV1m5u
 QamjFQ4SsWIsRfpRhMshhZygvED1+qOAR/yP
X-Google-Smtp-Source: ABdhPJxIrZlMfq6SVGJf6a9aAvPgs6RLlEEPHXSJD4QcfFAdJVw8KiDbfskcKRE2KTFI2LQNTeClig==
X-Received: by 2002:ad4:4e23:: with SMTP id dm3mr14892653qvb.4.1615597234584; 
 Fri, 12 Mar 2021 17:00:34 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/15] target/ppc: Put LPCR[GTSE] in hflags
Date: Fri, 12 Mar 2021 19:00:14 -0600
Message-Id: <20210313010018.819153-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
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

Because this bit was not in hflags, the privilege check
for tlb instructions was essentially random.
Recompute hflags when storing to LPCR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 1 +
 target/ppc/helper_regs.c | 3 +++
 target/ppc/mmu-hash64.c  | 3 +++
 target/ppc/translate.c   | 2 +-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2abaf56869..07a4331eec 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -603,6 +603,7 @@ enum {
     HFLAGS_TM = 8,   /* computed from MSR_TM */
     HFLAGS_BE = 9,   /* MSR_BE -- from elsewhere on embedded ppc */
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
+    HFLAGS_GTSE = 11, /* computed from SPR_LPCR[GTSE] */
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_SA = 22,  /* MSR_SA */
     HFLAGS_AP = 23,  /* MSR_AP */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index c735540333..8479789e24 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -139,6 +139,9 @@ void hreg_compute_hflags(CPUPPCState *env)
     if ((ppc_flags & POWERPC_FLAG_TM) && (msr & (1ull << MSR_TM))) {
         hflags |= 1 << HFLAGS_TM;
     }
+    if (env->spr[SPR_LPCR] & LPCR_GTSE) {
+        hflags |= 1 << HFLAGS_GTSE;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 0fabc10302..d517a99832 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -30,6 +30,7 @@
 #include "exec/log.h"
 #include "hw/hw.h"
 #include "mmu-book3s-v3.h"
+#include "helper_regs.h"
 
 /* #define DEBUG_SLB */
 
@@ -1125,6 +1126,8 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
     CPUPPCState *env = &cpu->env;
 
     env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
+    /* The gtse bit affects hflags */
+    hreg_compute_hflags(env);
 }
 
 void helper_store_lpcr(CPUPPCState *env, target_ulong val)
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d48c554290..5e629291d3 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7908,7 +7908,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->altivec_enabled = (hflags >> HFLAGS_VR) & 1;
     ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
-    ctx->gtse = !!(env->spr[SPR_LPCR] & LPCR_GTSE);
+    ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
-- 
2.25.1


