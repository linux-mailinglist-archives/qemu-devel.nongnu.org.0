Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EF33A75D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:17:24 +0100 (CET)
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVIp-0007QO-1v
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1X-0002Jr-ND
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:31 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1O-0002AL-NX
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:31 -0400
Received: by mail-qt1-x82d.google.com with SMTP id 73so7647331qtg.13
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fm4BN1FAYzcobXIUNrNdXuRiaQp/Ku74cUVfr1tQ2mY=;
 b=rMuju3Yawl6FaObO93c7+QBAFnUw5BlpDaFeX+InfXu50PuzpaPeOWRp1FuMYHqbvO
 pend4z4y/lwOD4tQZwYgeDxfyWHLUYMdAixnRfuxouqebLQxW35+aQ8RE/bEosW7KVHI
 fknKOMcZI6yHxlq1ZXTzlEnhi0U4fysyiqVrPlAJ58CZlq6ktjSheJETk6MtbYT1dsVY
 RJYrfG82rO6BTMypKwgXEg0Y7hWzSMmMjl+JXYiq4KsXIjltaexLxIm+YgtBfQhvqhS9
 ldO7H2BbiHWie5loqj7EYYSy0WysmSzGduwJIY9EyI30JBmTHo6Gv52+HGbjFrVO7ucs
 VgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fm4BN1FAYzcobXIUNrNdXuRiaQp/Ku74cUVfr1tQ2mY=;
 b=hPC2x0Wu4NUPzaibvCxoCUUPASQDXXX27qvQGtnAwqPy70yhajsPcJH+rV8xhitIgM
 P2V/jgZ9e6WPwWUj6qOBJbm+kn4v7Q3dhi63Mf2gIwA/LIXK84Yp5qjUsEWCO+fYHq2/
 YHw7EKWkP5WGsfa+/Aj/LDzKKP6SgvI8Gtjk+mSJp1An+F8Iga/OQr4ezf4tAQViaOSp
 tCoTu+9p7zw4fiLQcixNvefoLvWpbWoHyo+eP9EJKmqhvWE2aXuQQxIMaKrWswz61noz
 MKvXa6Q5v2cNvbNyoB4bajPfm4kr0/2++n9J5j1E5GB4OkNl5bpBvygjleZqOK6F2M0u
 pdig==
X-Gm-Message-State: AOAM530EPIFo4H/yNJli67sMZ1Z7O6xP/Uvu7POAqzF65YAmROa3JCl0
 EzXCcK6SHqDlNxvTGssDAMYZHQQUdTsFl1RT
X-Google-Smtp-Source: ABdhPJz91VGxeg92TtNeux1r5lydqG/YG1RX/QAp2CnOOktObQ/gSJtNmk4M5/6+DdmiYG4rvwbuCg==
X-Received: by 2002:ac8:44cc:: with SMTP id b12mr19865393qto.382.1615744761663; 
 Sun, 14 Mar 2021 10:59:21 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/16] target/ppc: Put LPCR[GTSE] in hflags
Date: Sun, 14 Mar 2021 11:59:01 -0600
Message-Id: <20210314175906.1733746-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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


