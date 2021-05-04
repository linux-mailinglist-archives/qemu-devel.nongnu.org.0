Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACBC3725BB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:17:23 +0200 (CEST)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoMz-0005Vv-GS
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo08-0005KM-HP; Tue, 04 May 2021 01:53:44 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo04-0004o5-K3; Tue, 04 May 2021 01:53:43 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK6f1gz9sXS; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=sCuff11fEliXRuJdwQKxzTDCAkDLJs5IHy1UGt0Z4sk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GWWgbX9NvZERlsoa7sLo19BqB0OCR7TupQZfWJJVJZ8V662dD4eV8bCrG/v2GViXG
 ZUytIdDmkKbADSwhNDjfRaDzHMNivUYYBhdAcA4irFo6lUUZt5lXoLSbZ+SoQoW+op
 RpIkhdpqrP4vmAE7MDMvroObBAvb1eIkCNcqK1UQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 19/46] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Date: Tue,  4 May 2021 15:52:45 +1000
Message-Id: <20210504055312.306823-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Verify that hflags was updated correctly whenever we change
cpu state that is used by hflags.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-11-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
@@ -155,8 +155,33 @@ void hreg_compute_hflags(CPUPPCState *env)
     hflags |= dmmu_idx << HFLAGS_DMMU_IDX;
 #endif
 
-    env->hflags = hflags | (msr & msr_mask);
+    return hflags | (msr & msr_mask);
+}
+
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
 }
+#endif
 
 void cpu_interrupt_exittb(CPUState *cs)
 {
-- 
2.31.1


