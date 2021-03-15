Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15333C64E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:03:24 +0100 (CET)
Received: from localhost ([::1]:54282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsUt-00043u-78
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEm-0007cR-FG
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:46 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:46897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLsEg-0001jd-Sj
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:46:44 -0400
Received: by mail-oi1-x230.google.com with SMTP id w125so6923798oib.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y0taJkB4Fi6zr+Y5YPiFcKq9feU/8Hh2LxD7KqyF6Ng=;
 b=EToQCmEglKGLCIQek2eYLJFGVeW6UfLBgvPpWrICLNXga8vzfTdPQF3j/FswnJV/GA
 3HPAPLyZ/XwgaaRYjzJkMiYtLaB7J8vVezodNITPCo+isEUFSdlh1sJ/JvKk3vd5aLxG
 fs936L8x2b11tFzExAETiOxMslHssMinNK8/tlpC1BITbnC8S1DYMSdHgK6wm0h8hqDQ
 ay/huJKycYYnLENEW17PrOWcYkAxsisfcDSYCAIBSVSoI5IXZbLNY+LJbFgRx346cwwv
 iVwG139tpRWOJAFrKzOPSKkLm1it6mgfft1dc7mp7ReN+e2GYqkKdZK26Zd2RvjNDxu8
 KouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y0taJkB4Fi6zr+Y5YPiFcKq9feU/8Hh2LxD7KqyF6Ng=;
 b=VNDkoIGBawgcnyGOsWvNhjRllvLtOaLhX4FTMYbxBKYnf/Qg+oSIOuQuWa4ELjG01T
 6yL9T+AUKJ6o07iVoIa5w+LZuMkXCWDbHgGCA0xHzjbwx6wV8s/v1DxdMVBiDwIbhrbL
 o2JM+90GLkSlzqOYC+h1/Cy1iATOILQA/zIvkMrTsI/8cjeSlv4t4t9y5fk4Qw16QlxY
 skCF9DOrudDZ7sE4UCCEc3taM8t5E+qpC88Ew9OfdwG2NTO4AvLzj4YrA5rDKI9seP6E
 epRqwKUxOG2fEKdLrTJH9l8sDV7YqxjJlgnawmtcOXBAG4fRi1Ddldff5a4/4q4MfNTi
 U5zw==
X-Gm-Message-State: AOAM5334md9XKowUzCEOb192EaKl0ddqQyyUewuVfJ/4RO52gKgGnvsm
 XXGj7VjVNvybw9MBOD71+on6oTt3mbT420RJ
X-Google-Smtp-Source: ABdhPJxtexKt61JjEr7BYGf5/ZPMmW69hOrIaXhFOoWpCYB8ViYZUqden6zjntZuPsEHpN7pLGUwzw==
X-Received: by 2002:aca:c38e:: with SMTP id t136mr355259oif.135.1615833997842; 
 Mon, 15 Mar 2021 11:46:37 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o25sm7519851otk.11.2021.03.15.11.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:46:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/17] target/ppc: Validate hflags with CONFIG_DEBUG_TCG
Date: Mon, 15 Mar 2021 12:46:15 -0600
Message-Id: <20210315184615.1985590-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315184615.1985590-1-richard.henderson@linaro.org>
References: <20210315184615.1985590-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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


