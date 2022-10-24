Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DFE60ADE1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:39:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSS-0003HK-VL; Mon, 24 Oct 2022 09:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSL-0003Fg-T5
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:29 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSI-0003yT-MY
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id 78so8646386pgb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g+JyoE/JLPQZeDvC/7V0SYveT535zxxz5m5s4NFje60=;
 b=gtIS7NPX/CH5AArmdQ575TaDrS+TagyeuPxUGjWG9hjSWNnTXg49J2kMntCzXy8T23
 YBYueKWt299AwLLQaI80jy5rtkOE/BMSd13r3fALo31VD1sTUf6sN0YjSApnAzjV+C9S
 Eu0n+fbo1jX9bb3v+ErW72Su1tLVAAuwfxpPGHC6Zz1364bAFYkbog51zQvwBLjH05/X
 3iv/SaJJcQ6/EnT1dPhhuHdnQlUX27X+HdT+DemnooLyfbd81C1+4mnZK9u7NDvcy+vZ
 kJ1COG7CjbIfZlihXuP9oAYuz0Gfm9r+RkpkRPiBr4O+tGJI44wbtiEAF5fSl2s99oVh
 TrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+JyoE/JLPQZeDvC/7V0SYveT535zxxz5m5s4NFje60=;
 b=pC+dNsnvJTMHSLTYIjlhJ2zZoNBEPD+W5pe5C/Fv/9ffFXUOpvWOn3r9Lxv7YG3Np7
 q2CAweryzGxScnoHUswseRn/sHPSJHP5O8RgXgHLNIF4LZp3hoMH5TQ7SbcFD4BeXWDz
 Cn/nB5P9Aq+4aZImmaBfPQZIGPdx+luW5nxtUqUmazkAjZqQe6TUqGesVZLSa3LQJQNT
 h112YY1GrrckeBPk9tnShYwWymCncu4S2s+j01SbWMLlK8c/6KPDvawG8vI1wlO3Ux5V
 orJWaC43GO+AgdcZJutw3yBtswaW/Tjyz8ZdZQ0I1v6cMR/li7+7/mg1jDDpA7uqNsmr
 saew==
X-Gm-Message-State: ACrzQf0TaNDjYjBpsRXeGFq2QLmlNEDQFVqcEPI3QRWF4CRG5W6s2XsW
 gJK2u2N9DZgnv8o7cf+yWy4L/lNjmS89IA==
X-Google-Smtp-Source: AMsMyM6lhKSbRl4mUMJjwPbaNgF3V3R47MMhT42XscGFLpzTtaNUi6dWlZb3g2+MjjVWYDkpbwo/Fw==
X-Received: by 2002:a05:6a00:124e:b0:565:ba3c:58bf with SMTP id
 u14-20020a056a00124e00b00565ba3c58bfmr33565660pfi.82.1666617924717; 
 Mon, 24 Oct 2022 06:25:24 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/29] target/cris: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:35 +1000
Message-Id: <20221024132459.3229709-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/cpu.c       | 11 +++++++++++
 target/cris/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index 22f5c70f39..fb05dc6f9a 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -42,6 +42,15 @@ static vaddr cris_cpu_get_pc(CPUState *cs)
     return cpu->env.pc;
 }
 
+static void cris_restore_state_to_opc(CPUState *cs,
+                                      const TranslationBlock *tb,
+                                      const uint64_t *data)
+{
+    CRISCPU *cpu = CRIS_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
+
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
@@ -212,6 +221,7 @@ static const struct SysemuCPUOps cris_sysemu_ops = {
 
 static const struct TCGCPUOps crisv10_tcg_ops = {
     .initialize = cris_initialize_crisv10_tcg,
+    .restore_state_to_opc = cris_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = cris_cpu_tlb_fill,
@@ -222,6 +232,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
 
 static const struct TCGCPUOps crisv32_tcg_ops = {
     .initialize = cris_initialize_tcg,
+    .restore_state_to_opc = cris_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = cris_cpu_tlb_fill,
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 73385b0b3c..fbc3fd5865 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3392,9 +3392,3 @@ void cris_initialize_tcg(void)
                                        pregnames_v32[i]);
     }
 }
-
-void restore_state_to_opc(CPUCRISState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


