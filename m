Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016833C6A8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:17:41 +0100 (CET)
Received: from localhost ([::1]:38602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsii-0004WH-Dt
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEd-0007Th-Gb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:35 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:33427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEb-0001eY-18
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:35 -0400
Received: by mail-oi1-x233.google.com with SMTP id d16so26194279oic.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fm4BN1FAYzcobXIUNrNdXuRiaQp/Ku74cUVfr1tQ2mY=;
 b=QIvrSSM9JV3wxnwkIyzHEaJvSEsMMEboCtxDdhqBzyXSDDU0KF0qEfehXtqbDk9kIB
 zZPmNzXqZ60iEWoAuRa856Ja8x2pa+ZAxXhbTIuEQVg6PA8P389xRGAKn99FMoqIJXn1
 8Zg+TmUI6L8u/Nb8HGVcsCkDpAOVG+6F6anYi0qvpKb5XLb/ng0+LnVE2ib3TEVqdz4d
 2pOGkk/hphZdYlKwduetaMEGslss5UqDIsHdGiFCrKRWMppQYLE9CoJ/xHwA4qPpr8sr
 r4TZc9SxP1GDIlbxmtDghIbSjogUg/LAHVHWWrxn5oiJGqUJWAGRHWcJfO1avZMChKef
 YNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fm4BN1FAYzcobXIUNrNdXuRiaQp/Ku74cUVfr1tQ2mY=;
 b=X4OlCZuVOmpYAEYuARkM42VoAQQ8fekBs9/sEfEmxkfUqsJQM9YPcob5gzBIsgulQ1
 h7PDXF+4NsMh7HVXO/LXZ1M4gfE8TKt9Xfgee60uo7nV/csXH+eyn173EFbzWNFH+C9w
 oXHrgZVcJC/PvWWOsMA9Ks0rB+7kZuTDFnR6s/nrktK3jv7BTkK66qThg1OCwQa0ycoW
 HDxJAAeUGC3AVRx/W4dR/h4K6y+quIBVR06PwpVnTa5EoXf//8euRqE2I9C6BdjwPJrZ
 UOGnPVg3EV6UGY1nSO+8FKeStgq/2ZbAYmMTPWtMAzd7BKtbftA8d0Gl7erFdYNgIUgi
 A9Yg==
X-Gm-Message-State: AOAM533p8YC3EVp96DKLt27NmzLo1oOTqVr5rv6aDPqzBSSlsaSyj98E
 QeygcdAuhERqbLfXcLi6ffXT3GDwqUY/UVft
X-Google-Smtp-Source: ABdhPJzO4CdVnnAuCEBWMGhxHL+1K97Bbc6k9SgWhqumZKh1vSGnisrQcKAWEhE7LP2ln1okIvm/fA==
X-Received: by 2002:aca:dcc6:: with SMTP id t189mr365118oig.9.1615833991818;
 Mon, 15 Mar 2021 11:46:31 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/17] target/ppc: Put LPCR[GTSE] in hflags
Date: Mon, 15 Mar 2021 12:46:09 -0600
Message-Id: <20210315184615.1985590-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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


