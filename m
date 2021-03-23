Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0630346835
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:57:26 +0100 (CET)
Received: from localhost ([::1]:52856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmDV-0003pz-Mu
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0u-0008Ix-M3
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:26 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0P-0003i7-Aq
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:24 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 n6-20020a4ac7060000b02901b50acc169fso5176845ooq.12
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0y0jim2Psup2n6cJG/ney9BoSyKMVklHs3Io6+sGx/4=;
 b=sAfD/7jSD6Ksf0s8u8XkvBnDdPYJ+815xYmIH1Z29UZDcs3nM91npwhsOnHPGHnMHj
 RRP9wW5nBbbxxWc6+fy8gOHffOvqo/VNptFuSx8ZsAhZP8i1o5WLhRvbfaveM43/CtvL
 1+gQfnfKz8fnFYb5xtNF+K1kdNeEuFtGpR7irw+7G5O34h1wO5mVgbjl85//v8X+sWio
 HDe5qAPt4vQClPUAmVhnnASrEuZkjcvhK/nlg+nZEh0LT4xD14axp8ZDpMNeuDD2Tlws
 6x2ap1nNTQtPcjw67nbtUkj1as0EiLSyl85eCKntb59cxD1ugXUviePdxWdRWPQxFLvl
 GBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0y0jim2Psup2n6cJG/ney9BoSyKMVklHs3Io6+sGx/4=;
 b=OZT957klICv6UVFwV6NVOkKglszhsVx+DApchZj2/DgvHNF1JXZifcQc/Uniu9zq6r
 iYm/4EEQDTMCrW9b+jgtIQNVw1gOT9H6w8yPA5AaUjMb2jnYrO9svK4WlIRtrnZncwI5
 626H47vW8vKN2OVeLjO1wHAxiPRc5Ks02kBic8ObzE6NKp7XSVhSJdgcpsPjHjcxJbW7
 GG3RbEVnH3BA7KZlW6o9KaQ+jv5hqlNcXYbCNyKWeNktm51049AA0vDdwe7On5sGW9vo
 XCEDUTaZDzHNFmYI61jDwu3vEWVdXdKHuDl+aK875O2FpHLbUJ+n7+YXPUhngnuns3m5
 y9Xg==
X-Gm-Message-State: AOAM530ukJBO6v2YSErH8FLceiwp9g8agx9VMEd4xe4/RlsfWx/lYh8F
 oAo/7C67+cUfY2E0D/y8PPzKx/LvGxxiABQL
X-Google-Smtp-Source: ABdhPJytEu/NHRKWK/tjdkWL6aSpQwRNNnsD1fPYSDiD5YsTjHpn5hxKUTgkXVJnpyFa6fRCpdTiyw==
X-Received: by 2002:a4a:c706:: with SMTP id n6mr4918636ooq.19.1616525030973;
 Tue, 23 Mar 2021 11:43:50 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/10] target/ppc: Put LPCR[GTSE] in hflags
Date: Tue, 23 Mar 2021 12:43:36 -0600
Message-Id: <20210323184340.619757-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc34.google.com
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

Because this bit was not in hflags, the privilege check
for tlb instructions was essentially random.
Recompute hflags when storing to LPCR.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 1 +
 target/ppc/helper_regs.c | 3 +++
 target/ppc/mmu-hash64.c  | 3 +++
 target/ppc/translate.c   | 2 +-
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index d5f362506a..3c28ddb331 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -596,6 +596,7 @@ enum {
     HFLAGS_LE = 0,   /* MSR_LE -- comes from elsewhere on 601 */
     HFLAGS_HV = 1,   /* computed from MSR_HV and other state */
     HFLAGS_64 = 2,   /* computed from MSR_CE and MSR_SF */
+    HFLAGS_GTSE = 3, /* computed from SPR_LPCR[GTSE] */
     HFLAGS_DR = 4,   /* MSR_DR */
     HFLAGS_IR = 5,   /* MSR_IR */
     HFLAGS_SPE = 6,  /* from MSR_SPE if cpu has SPE; avoid overlap w/ MSR_VR */
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index e345966b6b..f85bb14d1d 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -149,6 +149,9 @@ void hreg_compute_hflags(CPUPPCState *env)
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


