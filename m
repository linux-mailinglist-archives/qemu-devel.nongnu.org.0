Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C950BE97
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:27:59 +0200 (CEST)
Received: from localhost ([::1]:44406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx4Y-0002zH-I9
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXO-00023C-BO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:42 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXM-0007Ls-NE
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:42 -0400
Received: by mail-pf1-x433.google.com with SMTP id bo5so8537556pfb.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1+hFfX+YJ+rRNsAMYCjA2Q5J7nLgy08oqJtBrD3bio=;
 b=gwn7mI3SpA4lgqr3U0Sh7ULf/XSM9M0nr5l3IRxsNWDX8qTeVE8cPm9Hpwwf2CPgBd
 awS2JaGmmp0lSTlBTMjaIGjWvapKXd+MtSsvAFdp9I8NQ+SmtTecfbjQIdTqiPxqRN2j
 mDki866BlRD5uKjz9WDS3gt7N13Ywzl1Qqyk2V1PVDkYX3IrUP58nJpfs+scufd0d1XQ
 IuW+veU2uOLBRKTkcpTYDwBu9YX/z1yM8TW1Aox3wt1zpcpDIDkpmp3Ju2ch6kMtz/2W
 sU0dKjSEQ8Z9a2YKkYY3ltbZ/eeOVoKcPwB2YsYICZGVFqb40k5nmpgKhhbbxpTUKeNw
 6fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1+hFfX+YJ+rRNsAMYCjA2Q5J7nLgy08oqJtBrD3bio=;
 b=s5+nfqnOMxqn5o9UdVj/j4MJ5m8eW9Fo9Ev//U3SGN3fYan4bc9+XMy4WL6i5tpoK3
 MP0Qs/d3o08Os+S+M70W8OvwVp1G0H6OIM68cJfDAakY3zKoB1nofBpVTKSZr2MkFns2
 3iJM9AJQpTjIqBfQq0N8cL/bQrsmRSfjRBTu4pYXTIuhDj39VQuLW7QF09sPXx9ll5oL
 sK0Pd+7yOOU4c0qfGQU9xiPCoKuHQPh5ZwN631KjFpXMNtSxpR3oVbCQfXEOkWgTHXAh
 Q8RcHE8wW7nJr6IBMmnZYwBAPkM3IXuf8B5OyqKgVd2j/87SHzzdt6HNB6jeu3DDn9PA
 DPHg==
X-Gm-Message-State: AOAM5335eqLul/FNO60b+iJcr+ACg+EdSl0mZoe/DDk5VUcwCETvRYCx
 eDIztPWrQqBDjiTG77y6brZ1PcHGiVyEZWUG
X-Google-Smtp-Source: ABdhPJyKCzvnqIb6tohesJ0gelpfiIcS0unXwX7e6GizSq1a1XfpPd2Mi9HI4atX1fEo+zCo/QcfYg==
X-Received: by 2002:a63:e315:0:b0:3a9:efa0:18a with SMTP id
 f21-20020a63e315000000b003a9efa0018amr4566002pgh.33.1650646419405; 
 Fri, 22 Apr 2022 09:53:39 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 33/68] target/nios2: Hoist CPU_LOG_INT logging
Date: Fri, 22 Apr 2022 09:52:03 -0700
Message-Id: <20220422165238.1971496-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Message-Id: <20220421151735.31996-34-richard.henderson@linaro.org>
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


