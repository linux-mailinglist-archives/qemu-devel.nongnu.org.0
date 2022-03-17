Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CD44DBE30
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:24:25 +0100 (CET)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUica-0006zp-PH
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:24:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKq-0001FD-P1
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:04 -0400
Received: from [2607:f8b0:4864:20::102e] (port=34039
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKp-0002Gg-4w
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:04 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so312578pjo.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrZNI1SxmaS+Q1Ja/qtDT6B5V9ddvf4cp0nG/uUGkSI=;
 b=V5XS3F1Q9V69D9ilyF7+etx9XLBTWRdy253x/A3LiG6eLgJfH4wxh1yIRmAMx0uQlC
 ZpIevHMC0P2R/w+Wk/jVY6B0XfIRhMdYg1j02z74FW5ZgzbhiiMP/MmFvj0BG0jiMmdG
 Z/+OEfnKFzbuwpb1QkOkBQI+RVIGWqBjg0BOO5la8UI1fcquORgqE0XqIcrIldBfQsLl
 dVRKzcUUfXqoAqDbs5oquiWlDwIkpJZNn6Z64rw49BA2vNGipi0bfDXMuVb2uuh3jniK
 yb+Nf/ZU4oFUQrM08OHh8X7LcSXsRl2bqrsh4YGgghXBPmAcq9wiMJXs/UZT1cHqoOn7
 EAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrZNI1SxmaS+Q1Ja/qtDT6B5V9ddvf4cp0nG/uUGkSI=;
 b=xTgwpWObqteSxz9+bTiWoJiWJk/oHbrmBjiZ11d81NnY/BJXBTTavwP75ApVmCt9bf
 +CTe+QFAndFCzRjxK8mdlQZrKlfGUysDquoIJmKg5KxoUgx4+H/vIDne06klxjpRtaS9
 lzEKBFQMsouV/2A2yX4cqG+gJV+3iW9yUqj/UFMYN4wgJpNqaiUdnvhwmyibXMjrVoDF
 1VyZ2mkdBxXZmFU9bUztXkr/TcXSzEzfsKU5PQBTxcYB7x8ab1F9Jkwg4Qp1RoqY04ek
 G++A6WHznJBQPK5Ce6G77it2aZyAWG3s/pBftO9XRwKJ3CWlsct/55GQAlHl2K304tDl
 uYAA==
X-Gm-Message-State: AOAM533F7YM8Ouk8NyjlceM4kx8lNN8TRFsH8IMLJiMt0AEaG4AfRxT7
 exyFH5El5/K6/dTWUzA60ZbvKX1Km4pBQw==
X-Google-Smtp-Source: ABdhPJwHPwa0eQPWB4txEzL3VK3iZeDE+me7aJsp9Zqc1ZlDePyR56qb1xxYvR4DBtUSCi0hV/8wDQ==
X-Received: by 2002:a17:90b:2246:b0:1c6:5781:7193 with SMTP id
 hk6-20020a17090b224600b001c657817193mr8517165pjb.48.1647493561857; 
 Wed, 16 Mar 2022 22:06:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 22/51] target/nios2: Hoist CPU_LOG_INT logging
Date: Wed, 16 Mar 2022 22:05:09 -0700
Message-Id: <20220317050538.924111-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Performing this early means that we can merge more cases
within the non-logging switch statement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 58 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 6019e2443b..285f3aae1d 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -90,20 +90,64 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     Nios2CPU *cpu = NIOS2_CPU(cs);
     CPUNios2State *env = &cpu->env;
 
+    if (qemu_loglevel_mask(CPU_LOG_INT)) {
+        const char *name = NULL;
+
+        switch (cs->exception_index) {
+        case EXCP_IRQ:
+            name = "interrupt";
+            break;
+        case EXCP_TLBD:
+            if (env->ctrl[CR_STATUS] & CR_STATUS_EH) {
+                name = "TLB MISS (double)";
+            } else {
+                name = "TLB MISS (fast)";
+            }
+            break;
+        case EXCP_TLBR:
+        case EXCP_TLBW:
+        case EXCP_TLBX:
+            name = "TLB PERM";
+            break;
+        case EXCP_SUPERA:
+        case EXCP_SUPERD:
+            name = "SUPERVISOR (address)";
+            break;
+        case EXCP_SUPERI:
+            name = "SUPERVISOR (insn)";
+            break;
+        case EXCP_ILLEGAL:
+            name = "ILLEGAL insn";
+            break;
+        case EXCP_TRAP:
+            name = "TRAP insn";
+            break;
+        case EXCP_BREAK:
+            name = "TRAP insn";
+            break;
+        case EXCP_SEMIHOST:
+            name = "SEMIHOST insn";
+            break;
+        }
+        if (name) {
+            qemu_log("%s at pc=0x%08x\n", name, env->pc);
+        } else {
+            qemu_log("Unknown exception %d at pc=0x%08x\n",
+                     cs->exception_index, env->pc);
+        }
+    }
+
     switch (cs->exception_index) {
     case EXCP_IRQ:
-        qemu_log_mask(CPU_LOG_INT, "interrupt at pc=%x\n", env->pc);
         do_iic_irq(cpu);
         break;
 
     case EXCP_TLBD:
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
-            qemu_log_mask(CPU_LOG_INT, "TLB MISS (fast) at pc=%x\n", env->pc);
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
             do_exception(cpu, cpu->fast_tlb_miss_addr, false);
         } else {
-            qemu_log_mask(CPU_LOG_INT, "TLB MISS (double) at pc=%x\n", env->pc);
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
             do_exception(cpu, cpu->exception_addr, false);
         }
@@ -112,7 +156,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TLBR:
     case EXCP_TLBW:
     case EXCP_TLBX:
-        qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
@@ -122,23 +165,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERA:
     case EXCP_SUPERI:
     case EXCP_SUPERD:
-        qemu_log_mask(CPU_LOG_INT, "SUPERVISOR exception at pc=%x\n", env->pc);
-        do_exception(cpu, cpu->exception_addr, false);
-        break;
-
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
-        qemu_log_mask(CPU_LOG_INT, "TRAP exception at pc=%x\n", env->pc);
         do_exception(cpu, cpu->exception_addr, false);
         break;
 
     case EXCP_BREAK:
-        qemu_log_mask(CPU_LOG_INT, "BREAK exception at pc=%x\n", env->pc);
         do_exception(cpu, cpu->exception_addr, true);
         break;
 
     case EXCP_SEMIHOST:
-        qemu_log_mask(CPU_LOG_INT, "BREAK semihosting at pc=%x\n", env->pc);
         env->pc += 4;
         do_nios2_semihosting(env);
         break;
-- 
2.25.1


