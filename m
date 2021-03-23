Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6623468A2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:13:04 +0100 (CET)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmSd-0002f9-IL
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm10-0008Sg-Br
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:30 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:46934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOm0Z-0003jY-3t
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:30 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso20451231ott.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5llEtBaN+Bp+Z3OAO9T9usrgC5W2jq7W550GBWoLWU4=;
 b=f+4SLIlK04khUdqtpKdgOylbEzbKQqnG6KH+N83YeB4CmPDr4U5TqDH5IfwhVYvnsW
 KxhKmbLhpDbLYZu59zLY81L9CuP01dTWwneBrRhNp6LAVkLLIaCuUUub3Qo1m/ui+7Sx
 34dsh/qfy7cu04dFKmxmoj55naPkn23GaAC1rSP1dDzRYtzmVm/rrJKSBz9M+bV9EieZ
 b/Ns8cmAErc63z8gMp3oUPU7lgSbW5DMkZG4Miz4/SyMIf+A0YK7Bw7t8D6SExRIpreI
 pXVECIDqC+P7tw3Nae0vMGx8Vdx+s2VQ2u1J4Ct7vYln9yB9OVvqMqqMv/+rlubDant4
 H8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5llEtBaN+Bp+Z3OAO9T9usrgC5W2jq7W550GBWoLWU4=;
 b=E6vWkimweIkHAptUQEkvwwsPhiCo+0wrNU6+rXbd5OKkZvYyW8uMGuPBrjS8hn+/y6
 IRbD/oR26VsGrPLcr/eIGtXDkKfCqcRUNyCcFOf6DUWPraeudE7y1W5KM4CrrSIH+yll
 JYoyNmwt13TxJ/ru99vVyT+oIdAu9Ojq4UuYjKhWdqJFv8yA2cSUbSBURk1afmhonDR+
 n1PLUkLz30ifseu1WtFLrNpB7FJZn8tix5KCJMTcrJvYv3Kjg8pAA8FdfH2vILMvMpKt
 fyv1qatlwGXdpG+l1xkuaxz/iy+DzMljrq8lr5FUdKvt9enuhQOe5I/q04PUgC1Kc9J7
 BUgw==
X-Gm-Message-State: AOAM530P/6eBqjBG0IqRRZBhcgxBgONLHK+y8df899lnMATfIvPuwP4r
 y3PBJ8W9jgDFskBG/gqHlqLGKTqrLqXkT6CB
X-Google-Smtp-Source: ABdhPJxK3gxCzqG7eqRPLa77J2dN145bgSDggi+t4bi0E/rhgiNUFwwHpsy3joBrLdWoAEhP52c1Uw==
X-Received: by 2002:a9d:550b:: with SMTP id l11mr5327675oth.218.1616525037117; 
 Tue, 23 Mar 2021 11:43:57 -0700 (PDT)
Received: from localhost.localdomain (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id x23sm3902825ood.28.2021.03.23.11.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:43:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/10] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Date: Tue, 23 Mar 2021 12:43:40 -0600
Message-Id: <20210323184340.619757-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323184340.619757-1-richard.henderson@linaro.org>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
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
index 3d021f61f3..69fc9a2831 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2425,6 +2425,10 @@ void cpu_write_xer(CPUPPCState *env, target_ulong xer);
  */
 #define is_book3s_arch2x(ctx) (!!((ctx)->insns_flags & PPC_SEGMENT_64B))
 
+#ifdef CONFIG_DEBUG_TCG
+void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *flags);
+#else
 static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
@@ -2432,6 +2436,7 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
     *cs_base = 0;
     *flags = env->hflags;
 }
+#endif
 
 void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception);
 void QEMU_NORETURN raise_exception_ra(CPUPPCState *env, uint32_t exception,
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 5411a67e9a..3723872aa6 100644
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
@@ -155,9 +155,34 @@ void hreg_compute_hflags(CPUPPCState *env)
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


