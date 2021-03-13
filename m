Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903F339ABF
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 02:15:53 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKssh-0007lN-NY
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 20:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKse8-0007St-0t
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:48 -0500
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:43909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKse0-0003W7-Q3
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 20:00:47 -0500
Received: by mail-qk1-x72e.google.com with SMTP id b130so26277412qkc.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 17:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0taJkB4Fi6zr+Y5YPiFcKq9feU/8Hh2LxD7KqyF6Ng=;
 b=OE4VoXoTlJ+QCJtywr+QwMnlrg3ZkLDbfEve1JlrEeWenJ6gO/gAKJuHT6EXgUZDTk
 Sdz3+zCcrMjKxHlTHetb3pyxoZXQOpJCvDoDThVljhBDY+TlrQpoLzvZ43NxXbL+lIXi
 BpVipYU0NqBWGZWZjJcDk1GAY0ru+a1QTfJbGATOp70abxB04ru0OZfB2yIaqQ7LGf2R
 y/eaiDF286hp/daiwjPGOSGh7vrmWfOHrvCs4cBV3TC7CBsSxMc4/43A7XEpmXaVOksI
 azMlLVKWdf3mI0Kd+vRfNm8KJAyp5uRj+FkS3nwrYQDq+dW3EmwavZbuPhaEcWaSfq5s
 6K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0taJkB4Fi6zr+Y5YPiFcKq9feU/8Hh2LxD7KqyF6Ng=;
 b=tycMt9l0vVIE09yviJy7ll0A6R060nqgcXJt7BVY6YSff9f1h5XjtxO9+p/3SIkXl3
 rqnwOTajh1CmMANFSCBhcNXq+aTlm9i5BYwX43E6AUilaPXUCwRytzry7lvxvALhKsnI
 /5mMmt/TsVQUPZ5mrypBLrvJaRPnuEY26jLRFoJ3eF+SBVUSPrBPMdmgjF+h7UHmLrFK
 pNU/egriKbol0OsIRuBmOuYx7/5C2xoG+/LLN7Erfu47W9r62ABb05HJo4D1FRiCBgrM
 ClI8h8Pwr7pSyJjLMOiBU5cCL/P/NSydDfJFJeq3hy95M+6xH5HUNWdvz7J8M2GQWw+Q
 up4g==
X-Gm-Message-State: AOAM530r4rZHbj88/VB/v+HUoE2RFypbfrJfl1wrUFIb5WQg86zFdq3Y
 TZHthDAa28yCNf461892bSxI0XXR/Ckp1AyQ
X-Google-Smtp-Source: ABdhPJylvDABJkWJ67kUOfzN8jq4uJGposil8XRnlWoDP8JtMPWmHEbbIXOsH8esQc+S+XQTi1dtRQ==
X-Received: by 2002:a37:6888:: with SMTP id
 d130mr15136116qkc.368.1615597239400; 
 Fri, 12 Mar 2021 17:00:39 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id l129sm5602078qkd.76.2021.03.12.17.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 17:00:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Date: Fri, 12 Mar 2021 19:00:18 -0600
Message-Id: <20210313010018.819153-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313010018.819153-1-richard.henderson@linaro.org>
References: <20210313010018.819153-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that hflags was updated correctly whenever we change
cpu state that is used by hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         |  5 +++++
 target/ppc/helper_regs.c | 29 +++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2f8d7fa13c..7ee5c9a66e 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2424,6 +2424,10 @@ void cpu_write_xer(CPUPPCState *env, target_ulong xer);
  */
 #define is_book3s_arch2x(ctx) (!!((ctx)->insns_flags & PPC_SEGMENT_64B))
 
+#ifdef CONFIG_DEBUG_TCG
+void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *flags);
+#else
 static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
@@ -2431,6 +2435,7 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
     *cs_base = 0;
     *flags = env->hflags;
 }
+#endif
 
 void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception);
 void QEMU_NORETURN raise_exception_ra(CPUPPCState *env, uint32_t exception,
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index b28037ca24..9df1098fec 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -43,7 +43,7 @@ void hreg_swap_gpr_tgpr(CPUPPCState *env)
     env->tgpr[3] = tmp;
 }
 
-void hreg_compute_hflags(CPUPPCState *env)
+static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
 {
     target_ulong msr = env->msr;
     uint32_t ppc_flags = env->flags;
@@ -147,9 +147,34 @@ void hreg_compute_hflags(CPUPPCState *env)
     hflags |= dmmu_idx << HFLAGS_DMMU_IDX;
 #endif
 
-    env->hflags = hflags | (msr & msr_mask);
+    return hflags | (msr & msr_mask);
 }
 
+void hreg_compute_hflags(CPUPPCState *env)
+{
+    env->hflags = hreg_compute_hflags_value(env);
+}
+
+#ifdef CONFIG_DEBUG_TCG
+void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *flags)
+{
+    uint32_t hflags_current = env->hflags;
+    uint32_t hflags_rebuilt;
+
+    *pc = env->nip;
+    *cs_base = 0;
+    *flags = hflags_current;
+
+    hflags_rebuilt = hreg_compute_hflags_value(env);
+    if (unlikely(hflags_current != hflags_rebuilt)) {
+        cpu_abort(env_cpu(env),
+                  "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)\n",
+                  hflags_current, hflags_rebuilt);
+    }
+}
+#endif
+
 void cpu_interrupt_exittb(CPUState *cs)
 {
     if (!kvm_enabled()) {
-- 
2.25.1


