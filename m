Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05933A77D
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 19:21:38 +0100 (CET)
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLVMv-00034d-Cb
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 14:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1e-0002di-OV
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:38 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:42548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLV1U-0002Df-9W
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 13:59:38 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l13so7657806qtu.9
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0taJkB4Fi6zr+Y5YPiFcKq9feU/8Hh2LxD7KqyF6Ng=;
 b=WP0JpRHuD11UDt6ZWnIFTM2biYMr+AOGuVHDP6u04ioX8Ul9EMOi8UGAqQGRFyiXxt
 H16zPL3OdUgotfMPndSuJ9WPqWhUUHbxgI6pk64QmaEBa3GBTI/Zzz05C7oPgOuxDhzB
 g/LX2SZPYKcGmBHU4217DowmjNiBCpS7MbD5Ojw0HjCTPVXgxwwleBdcdWtqlccMacMa
 hNJhPYrwxc8UNO8Kp2YQliIpE7WrM88qlLT5PythSPzbUTBHTLwEQv0O8cwj9XGsPKO3
 W6FqEciJ63QHUZaM7/gGOQatXMhcXk+SLhY/w1YMIFH/147Gpf0oxN06GiV9/Lh+pGEv
 ntSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0taJkB4Fi6zr+Y5YPiFcKq9feU/8Hh2LxD7KqyF6Ng=;
 b=VrkGmLLl6TN6ulOqmtPddz9m6Jd7WK3erXDnIoCcP70skBjvQIUv9597FNnjGYS/fs
 +2QSSm3BLk49TIduXGIQerTmTVTFCibxex+yxnJXoVYFv+6wFBL0i/GRov02hShjFFrT
 kWdh411Nth32wMd7GDv0JOhDs7cQD+MAWcWwoRQ0vVaG0rXBhYv80RWZysSOBnpVpUck
 n6nRBUseJYsmLXPpriAqSvB9OCKuqGjUc+/DePLJXlFfMxLTa6NtJTmSCrPOyI92jNRg
 C9HU3rjVVcuD/CdAsXYu9u+nt7HbLXNKwcq0nrtRBP554gtUvq8ayyQRvHyEozmyeB9+
 XOnQ==
X-Gm-Message-State: AOAM530nshaHdb/ERlrcSH13KlXIVSR+u15UQe7M+b86JqvzkiBBuuQ/
 8JEZzwvn9hVmAAAtBpPfzEgOb4VFzhwJwxwO
X-Google-Smtp-Source: ABdhPJyJQKqgvK2YG6QIe2QW3W0J/hETEVZ8l/JQZL+xo8iZ2xOQ/PynOFTJInDbz1KgCowrxDZ5jA==
X-Received: by 2002:ac8:59d6:: with SMTP id f22mr6282495qtf.83.1615744767400; 
 Sun, 14 Mar 2021 10:59:27 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id c127sm10216240qkd.87.2021.03.14.10.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 10:59:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/16] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Date: Sun, 14 Mar 2021 11:59:06 -0600
Message-Id: <20210314175906.1733746-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314175906.1733746-1-richard.henderson@linaro.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


