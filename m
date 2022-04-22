Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96C50BE6B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:14:18 +0200 (CEST)
Received: from localhost ([::1]:39460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwrJ-0001p1-AD
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXA-0001Fz-RD
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:28 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwX9-0007JX-30
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:28 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s137so7776059pgs.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/HOE2e7ynTg66W4PjhgIMT/dmI++JIVfa+aDY4ajpE=;
 b=ssZXYMh1ve7frWZzyUTARkk7q2gCDM1gavCwdmGWPwi2ZJ3kxoC6H+mgKt7Fifbotl
 UcKnthxiz9T5YSmm2kPjxwHPqzlJHEVd0rCobR8c1TcZOczaCJ1UzJrPoouX5nXIyREt
 2SNEHh2srkP5Td8Ry3GRTydPF5w18gX+kAbuhF+i8FHPUJx9+vVlgS7gvX/9lT4om1d0
 jfEO/sNAhYNr+4Bacyv3PVypjr2JK6v7KOtwtTZNvhxR11U5rBFZPuIvGjkUcEL5TKCl
 TiRQ506gt7tACMoJF2w99PbXvQTsvFk5V3xz97mUHSpB3cLlWsxYPhaFeKScE3bK/qUW
 ostw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/HOE2e7ynTg66W4PjhgIMT/dmI++JIVfa+aDY4ajpE=;
 b=x4QRZ/FuddfNRMeSf5VLbDYEqialbWoc/Wc3/t9k4OoxxGtgsk0l4fADdB4dfOIGLx
 /gIJS8BTXYqyVpRlagyDrdAbAKkkZIHvy0UkGvFY3aBhkn9XPxm35FENzH2GrEmhoc/c
 uOSGITOSbFuU3pcdYyvLLR34dBAKj6EDG2P4+y5DEM409Nrci754dgynUhgweLlgPd0X
 lHuGluvzUdW3gvkFfgfjtxTKYm4UiGDX0TPvnHKh7lTlvt/Z+tQ4tCmNAUYiwsSm8lR/
 Ojg0/FVe1anF3ERc11lU0M7pp6AuP4xbyMn1Vd+rFT4xoJXT+CLMGqVKgPpRxamjgeae
 bhww==
X-Gm-Message-State: AOAM531ctiEm1OuLo/3+yRqYE/u3la+RhwYlkF7hGWlmNR1TSM+c1h5V
 X+7L7uPI9m12mcqm5+ssZef3mGGLYVrM94p/
X-Google-Smtp-Source: ABdhPJz84U9PRC9Ne8CO5mRFY5E9DMQNPnUltxrgHdHk5kMIj6Pg0soMn8Q3hqahZdQAgSF35YqStw==
X-Received: by 2002:a62:a516:0:b0:505:722e:15d5 with SMTP id
 v22-20020a62a516000000b00505722e15d5mr5919547pfm.52.1650646405777; 
 Fri, 22 Apr 2022 09:53:25 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 25/68] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
Date: Fri, 22 Apr 2022 09:51:55 -0700
Message-Id: <20220422165238.1971496-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Use FIELD_DP32 instead of manual shifting and masking.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-26-richard.henderson@linaro.org>
---
 target/nios2/cpu.h    |  4 ++++
 target/nios2/helper.c | 37 ++++++++++++++++++++++---------------
 2 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 562dca8195..f8cd5dc218 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -105,6 +105,10 @@ FIELD(CR_STATUS, RSIE, 23, 1)
 #define CR_CPUID         5
 #define CR_CTL6          6
 #define CR_EXCEPTION     7
+
+FIELD(CR_EXCEPTION, CAUSE, 2, 5)
+FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
+
 #define CR_PTEADDR       8
 #define   CR_PTEADDR_PTBASE_SHIFT 22
 #define   CR_PTEADDR_PTBASE_MASK  (0x3FF << CR_PTEADDR_PTBASE_SHIFT)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 2e5f5b8b54..b30740824c 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -44,8 +44,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_IH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->regs[R_EA] = env->pc + 4;
         env->pc = cpu->exception_addr;
@@ -63,8 +64,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->ctrl[CR_STATUS] |= CR_STATUS_EH;
             env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                                 CR_EXCEPTION, CAUSE,
+                                                 cs->exception_index);
 
             env->ctrl[CR_TLBMISC] &= ~CR_TLBMISC_DBL;
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
@@ -78,8 +80,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->ctrl[CR_STATUS] |= CR_STATUS_EH;
             env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-            env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+            env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                                 CR_EXCEPTION, CAUSE,
+                                                 cs->exception_index);
 
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_DBL;
 
@@ -96,8 +99,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         if ((env->ctrl[CR_STATUS] & CR_STATUS_EH) == 0) {
             env->ctrl[CR_TLBMISC] |= CR_TLBMISC_WR;
@@ -120,8 +124,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -138,8 +143,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -163,8 +169,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->ctrl[CR_STATUS] |= CR_STATUS_EH;
         env->ctrl[CR_STATUS] &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->ctrl[CR_EXCEPTION] &= ~(0x1F << 2);
-        env->ctrl[CR_EXCEPTION] |= (cs->exception_index & 0x1F) << 2;
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
+                                             CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
 
         env->pc = cpu->exception_addr;
         break;
@@ -208,7 +215,7 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = EXCP_UNALIGN << 2;
+    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
     helper_raise_exception(env, EXCP_UNALIGN);
 }
 
-- 
2.34.1


