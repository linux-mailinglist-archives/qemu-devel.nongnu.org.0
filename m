Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D450A4DD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:58:49 +0200 (CEST)
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZCi-0007Hm-RW
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZl-0008ER-Eb
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:34 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZj-0006MO-O5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:33 -0400
Received: by mail-pg1-x532.google.com with SMTP id q12so4879270pgj.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B6BF8VIlp/A1BCVtuMAbl4vrBEgrJ81cLXGHvqVKfUw=;
 b=R4797mz6GUvA6Y/MFW1Yl9vUXJ5CJ8p1LO3lM4Use0IVmBrw0TkE7RUyKHLMsj9eeD
 OexvI3xrCwNdvEWX/TDrhBTEumQNx8qB17rafrt+2G/47mhQyn9Cd89YhOzV3jy7l8u9
 oxX7aMXupXT9T/WZrhVCWapey9l4nzELf9Wip174IESYezjC/fWUcNlg6DeT01XoldJD
 Z2p8ovWq92YdpnBcowqda28FzOMBFXj3gAiDQCPwWJPIH/QYR3ZOmpgaPgny1V66uNR4
 Zvg7X3+0um9sK3pI/kFOjtOF35qhcFdrAoyFK4DBqOukXyn6LoyYekOyhrpxDIV/k64M
 zTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B6BF8VIlp/A1BCVtuMAbl4vrBEgrJ81cLXGHvqVKfUw=;
 b=pVK+KM7kP61YSty2AHYCGW9CwmCfvuz8DjnZe4X63D+bxSxkArfVDjP+uK8E2EecZA
 B0F8/WS2UFscHIZVsU1WTLQIxflPt3OClpepAlwZi09tc6DaXcZbW3bgDiyYg8R+sRRy
 qUHentj8HEjoZCA0EcZWy7QDCBgwC9cvLlD2LYNJKn82IvjAM0CE4ZxR5A8fMOGOYNZq
 Wu1toNcWKh8loyA654ZnJmkdUOUUSMjjSvDlXIq5KaEnS4FfXdjCzqh0jREWA+WQdf6i
 SZeX1BPGhv7ollVGBPNDmLq1YJmGMUB7CrifDcfgl9nuM2qEjA0RShS2nzH8a01rbYgH
 m87w==
X-Gm-Message-State: AOAM530WN9wKgrFr1xXhbELum0wvUzab0UfRjM0KobyqY8bCPup9EQaY
 zp7iU5uDfZ31OGuVylKQWJSRGMgKLZf5fw==
X-Google-Smtp-Source: ABdhPJwI/JYWxHtCPkC36hB8nMfulwLBfhrmfjfj3HPh7XCCoUvrJBjGNgXag41Q/KkiZLVYlqMsHg==
X-Received: by 2002:a63:db4c:0:b0:39d:18bf:7857 with SMTP id
 x12-20020a63db4c000000b0039d18bf7857mr24495120pgi.413.1650554309455; 
 Thu, 21 Apr 2022 08:18:29 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 33/64] target/nios2: Hoist CPU_LOG_INT logging
Date: Thu, 21 Apr 2022 08:17:04 -0700
Message-Id: <20220421151735.31996-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Performing this early means that we can merge more cases
within the non-logging switch statement.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 58 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 63971a8b3c..c57ffd64e0 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -70,20 +70,64 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
+            name = "BREAK insn";
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
@@ -92,7 +136,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_TLBR:
     case EXCP_TLBW:
     case EXCP_TLBX:
-        qemu_log_mask(CPU_LOG_INT, "TLB PERM at pc=%x\n", env->pc);
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WE;
         }
@@ -102,23 +145,16 @@ void nios2_cpu_do_interrupt(CPUState *cs)
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
2.34.1


