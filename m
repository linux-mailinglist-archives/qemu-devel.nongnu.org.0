Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3A4D4660
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:01:46 +0100 (CET)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHUH-0000Rd-VN
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxV-0005kO-TO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:53 -0500
Received: from [2607:f8b0:4864:20::102f] (port=56234
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxU-0007zH-AD
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:53 -0500
Received: by mail-pj1-x102f.google.com with SMTP id e3so4812671pjm.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrZNI1SxmaS+Q1Ja/qtDT6B5V9ddvf4cp0nG/uUGkSI=;
 b=vYrEtOkZvnsHvUObs23VxdT1EAqQKFFhCaHLdLJn540Cz4BByKl70igKU5xKjPk9AE
 VMBIzgJcTSEwOOIi6Wy6DyU8wVt96Hxye3Q70uaOnnAFMtISzwaustld1rpfAUhKwNKD
 0JAr2xIM/SaofA2XXLR1JWepPRjyW6bpQQafKPfdUFVInQ7HrwS16Xb+2I/zLtKh640Z
 vlcbsc200a4DnoIpL+c11XcSew5x+QEUiTNAp7DFhsvmVqA2PAepziQTKk5yUullIkFs
 meZdpaBFfI6OIbd2oDtsencypQlXYhw89rBbfaebXM0QIYpyaC6yawKPel6dvJ00amkX
 rJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrZNI1SxmaS+Q1Ja/qtDT6B5V9ddvf4cp0nG/uUGkSI=;
 b=C1pNl7ri2W9k6SX9RLXhm2G0hR7HDEec+2KyI6GJNHA6SVMJ5uDNqRUfoDduH2ZoDL
 2oCPiVJf6qdxdV6fSCAOxumZy3HR+iZzuew/7LrWN8YlvsZO6zLcycD4BhNysdotHcwu
 zkIq2YV4182qX8Vju0uyr9wkqXfL8/Tdp3olBuyChtQTKmrmCurasmYis78Eqzrt8XH5
 DleOKnNIMEGmGEBaWNgc/+ZTBDr1NARuHiTEpuKOclxLvci2ADR1S1DDsf0txadZIbTr
 vaAUcqiNK+R9crwcgDrdO25JZQcWxKPU+W1tQ1QfnfUMlRmtg+JcYV5F5zJZvemJo7ic
 j9yA==
X-Gm-Message-State: AOAM530kqcv7+Ue0L4qUikg9D97Zopr/3bIJ3FoCtO6Ftzo7oj1/kqZ4
 xb/qbt64TgayTzyff9pHNseLa0hNzvYSLw==
X-Google-Smtp-Source: ABdhPJzlvK36l4oDJLTHcpFP6o7pXUf+mv01N6mypCsjV8x1WkKtRj8A/YDeUs5YC4DckK8SzEyISg==
X-Received: by 2002:a17:902:e74e:b0:151:c46f:6e18 with SMTP id
 p14-20020a170902e74e00b00151c46f6e18mr4491481plf.32.1646911670987; 
 Thu, 10 Mar 2022 03:27:50 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 22/48] target/nios2: Hoist CPU_LOG_INT logging
Date: Thu, 10 Mar 2022 03:26:59 -0800
Message-Id: <20220310112725.570053-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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


