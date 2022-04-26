Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7A65107D8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:02:04 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQRn-0003xc-At
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmh-0002g7-OC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmf-0004Qy-3e
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:34 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so924417pjb.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/HOE2e7ynTg66W4PjhgIMT/dmI++JIVfa+aDY4ajpE=;
 b=jZo8gHt9xdzUUv+DnKPuKvyAS2J1XATQPZhmdZUykwJtZmClAZtaVvz42jRmX920+O
 +SONmM9l32HEfCrSEUJGgmcbNPCkYkEpUqb2lWgmT5kStaHju0Pl5N/JhKBBYzP7ANZ2
 dOhmEXezcDmZrjaxnvCjaNp/l0FPDGVNu4T25ckVPxWtFzF92JGVdwkSz/bxia0Zx7X5
 1Rg41JAYTLyQAxpSRj41X50UtvxPbl6TzRf6HbKCLQ8YPI4uXhslC9/zB/LsbjVSEyKA
 PzpXiN65ercIlD606+W5XBkYkikrkDluUN2SLCxbEdCJyqoiu+3KRpvu5QV1KVEhwNaJ
 oKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/HOE2e7ynTg66W4PjhgIMT/dmI++JIVfa+aDY4ajpE=;
 b=h/uC+VDpBMJO+uSaIadlRsX4Wp7oP7MkolBpQPRCxXq3sJYYBIFft95Bs9953jLqbI
 3PIWkalp2T3+VWzz27AFsCCZmaqJ0MVtuRezef4LjATE4AwBoWZe7S6OPINDoOv7ruqD
 mlU9IBf8e2Ar25/T4HuO8cr2rXxgcXozHqTDlB5nK/xAbnfhxKmQHuNkoqCnJEvKyLP5
 6pWnRm8xGmYot/WG4v6ZAbUPF6ZEGfvkVLDQwTIO2CJHOMNxyU8IjMu7+OjvxfyBuYa7
 6jMc+pO0yTkzJYByM3wNO/mj/0fkM6pwtLwwZ0f9oKQQeV+2zerQ1T3j/+3HL29E7xug
 /6OA==
X-Gm-Message-State: AOAM532RcMfxF8OtrpXvKzgU9OBj7VZC488L+emIdJLvwRKyCqO8E0I0
 SLeu8MMJlXK66x8l6eZijbSQR73jBvmQuQ==
X-Google-Smtp-Source: ABdhPJyKw6jRCuPRaBC6LPv4K8XM37woZDm0jWkI4MqkV3RaHsIJbXKuklx7mjXd4HJlw8h8JwvFHw==
X-Received: by 2002:a17:90b:4d8c:b0:1d2:a600:301f with SMTP id
 oj12-20020a17090b4d8c00b001d2a600301fmr38551961pjb.29.1650997170927; 
 Tue, 26 Apr 2022 11:19:30 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/68] target/nios2: Use hw/registerfields.h for CR_EXCEPTION
 fields
Date: Tue, 26 Apr 2022 11:18:24 -0700
Message-Id: <20220426181907.103691-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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


