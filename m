Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D559A4D1158
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:55:16 +0100 (CET)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUgd-0007qz-W4
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:55:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9Q-0005V8-NQ
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:56 -0500
Received: from [2607:f8b0:4864:20::1035] (port=40744
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU9P-0006VH-1q
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so1419682pjb.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZ2C5DabhR4UWhlHHPl5YgAYQYqTqvWzN8pMZpMuTzI=;
 b=y4ulzfZJZOATKzy0+K9e4pRN7ZRqxKTSMsWUTGSRWzBeSvjsj9IrChMLeZVsPfpTY/
 xscqdVA4ZQ/xt+S5KDz6ficmTPyx3KC5XovmH6URGcv7AFFKXEWVG2y4D4BVK+DEXy7m
 7oLJp287MOBbaiO7e0/JrrCoy/P/h0czNuYBI7rSrCe6so+obBpUfbXxROoyIsEhPCm1
 MTaO/0Ig4cEksrP8goMNGzbGDnECHP3tYQ2faQasXSjeSjgrMagICpOGNiEytgA+bLyQ
 ikfk9E/IDYlhafKXjdxh0/eWWdz/5xDvu/AObRPIgXDeMSFIGpqd/sI03Qw4Hws4MPS0
 1I5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZ2C5DabhR4UWhlHHPl5YgAYQYqTqvWzN8pMZpMuTzI=;
 b=WD+6+97ey+iQGw2YlzdZZ1n8FjJkAqkNy7xN6FQmK4GCJmr6MAvgv7NTS8UwXofojK
 pbGqj5nu1ajnxRm2QaVXUqNJCqfT0ENjpAZ7Z8xsyPWlu3eajQ4wra3NDUmfjfPchd/y
 16pmbM0qqIBUbBP5MIvAoJ+prF8sg0it+SpjNEqV0pURj76cphqRQbZJ/IQ46TZatjTD
 8borqkH539uiv2yztEIE2hOXGXJ9Vo14ryB56uguGqXQ6PojrcQyinsJ4QFYS76OSXiQ
 C7jE2T+pq9cskBjsJqv18wQy59piOT6OaWFWKXAqbUOEIMeZ06Db0mlWn6MsX+bGBcdN
 XdSA==
X-Gm-Message-State: AOAM530bkSY5ZjpB8HcQicPWQ0RBWbk8CPc9EaHQ03tWshTGEpafKZZx
 Yr8mhmoKXsLxtfmeFkUn4Cu7yEuu5ngvJQ==
X-Google-Smtp-Source: ABdhPJxOEoe0picZD1ycL1BXseTHt6v1OsfOYnylxEURXw/9EqC2S0WF4sKSk9vH2BGcKSGumeiODQ==
X-Received: by 2002:a17:90b:4b51:b0:1bf:88c7:aecc with SMTP id
 mi17-20020a17090b4b5100b001bf88c7aeccmr2443669pjb.115.1646724053740; 
 Mon, 07 Mar 2022 23:20:53 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/33] target/nios2: Clean up nios2_cpu_do_interrupt
Date: Mon,  7 Mar 2022 21:20:00 -1000
Message-Id: <20220308072005.307955-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sink the bulk of the interrupt processing to the end
of the file.  All of the internal interrupt and
non-interrupt exception code shares EH processing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 100 +++++++++++-------------------------------
 1 file changed, 25 insertions(+), 75 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index a338d02f6b..ccf2634c9b 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -53,48 +53,25 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 {
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
+    uint32_t exception_addr = cpu->exception_addr;
+    unsigned r_ea = R_EA;
+    unsigned cr_estatus = CR_ESTATUS;
 
     switch (cs->exception_index) {
     case EXCP_IRQ:
-        assert(env->status & CR_STATUS_PIE);
-
         qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
-
-        env->estatus = env->status;
-        env->status |= CR_STATUS_IH;
-        env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        nios2_crs(env)[R_EA] = env->pc + 4;
-        env->pc = cpu->exception_addr;
         break;
 
     case EXCP_TLBD:
-        if ((env->status & CR_STATUS_EH) == 0) {
+        if (env->status & CR_STATUS_EH) {
+            qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
+            /* Double TLB miss */
+            env->tlbmisc |= CR_TLBMISC_DBL;
+        } else {
             qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n", env->pc);
-
-            /* Fast TLB miss */
-            /* Variation from the spec. Table 3-35 of the cpu reference shows
-             * estatus not being changed for TLB miss but this appears to
-             * be incorrect. */
-            env->estatus = env->status;
-            env->status |= CR_STATUS_EH;
-            env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
             env->tlbmisc &= ~CR_TLBMISC_DBL;
             env->tlbmisc |= CR_TLBMISC_WR;
-
-            nios2_crs(env)[R_EA] = env->pc + 4;
-            env->pc = cpu->fast_tlb_miss_addr;
-        } else {
-            qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
-
-            /* Double TLB miss */
-            env->status |= CR_STATUS_EH;
-            env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-            env->tlbmisc |= CR_TLBMISC_DBL;
-
-            env->pc = cpu->exception_addr;
+            exception_addr = cpu->fast_tlb_miss_addr;
         }
         break;
 
@@ -102,48 +79,18 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TLBW:
     case EXCP_TLBX:
         qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
-
-        env->estatus = env->status;
-        env->status |= CR_STATUS_EH;
-        env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        if ((env->status & CR_STATUS_EH) == 0) {
-            env->tlbmisc |= CR_TLBMISC_WR;
-        }
-
-        nios2_crs(env)[R_EA] = env->pc + 4;
-        env->pc = cpu->exception_addr;
+        env->tlbmisc |= CR_TLBMISC_WR;
         break;
 
     case EXCP_SUPERA:
     case EXCP_SUPERI:
     case EXCP_SUPERD:
         qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n", env->pc);
-
-        if ((env->status & CR_STATUS_EH) == 0) {
-            env->estatus = env->status;
-            nios2_crs(env)[R_EA] = env->pc + 4;
-        }
-
-        env->status |= CR_STATUS_EH;
-        env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->pc = cpu->exception_addr;
         break;
 
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
         qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n", env->pc);
-
-        if ((env->status & CR_STATUS_EH) == 0) {
-            env->estatus = env->status;
-            nios2_crs(env)[R_EA] = env->pc + 4;
-        }
-
-        env->status |= CR_STATUS_EH;
-        env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->pc = cpu->exception_addr;
         break;
 
     case EXCP_SEMIHOST:
@@ -154,23 +101,26 @@ void nios2_cpu_do_interrupt(CPUState *cs)
 
     case EXCP_BREAK:
         qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
-        if ((env->status & CR_STATUS_EH) == 0) {
-            env->bstatus = env->status;
-            nios2_crs(env)[R_BA] = env->pc + 4;
-        }
-
-        env->status |= CR_STATUS_EH;
-        env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
-
-        env->pc = cpu->exception_addr;
+        r_ea = R_BA;
+        cr_estatus = CR_BSTATUS;
         break;
 
     default:
-        cpu_abort(cs, "unhandled exception type=%d\n",
-                  cs->exception_index);
-        break;
+        cpu_abort(cs, "unhandled exception type=%d\n", cs->exception_index);
     }
 
+    /*
+     * Finish Internal Interrupt or Noninterrupt Exception.
+     */
+
+    if (!(env->status & CR_STATUS_EH)) {
+        env->ctrl[cr_estatus] = env->status;
+        env->crs[r_ea] = env->pc + 4;
+        env->status |= CR_STATUS_EH;
+    }
+    env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
+
+    env->pc = exception_addr;
     env->exception = FIELD_DP32(env->exception, CR_EXCEPTION, CAUSE,
                                 cs->exception_index);
 }
-- 
2.25.1


