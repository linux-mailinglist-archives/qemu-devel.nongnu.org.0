Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D5342CC32
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 22:56:10 +0200 (CEST)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1malIH-0005yd-Py
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 16:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDT-0007Mt-WB
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:12 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1malDR-000824-OE
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:51:11 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so3197106pjb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ur4NYkKvb4IwfCVRQ66xGSUcq2q0ktl5nOkYZP/fju8=;
 b=EKlg/FVFPlK1GTIJsbaQ9VQ4PjSq1na328JumULUD5CQvUDWkO6lS/pKUcycf+/DkV
 LHKQCng2TE6jDOSclKGcDjCJEf/tsJtZK39yk1SHv/nKXrigIaPnW+8SyINxtuj4s9ky
 +DWpnyAX41YHap/IvrLLGO16lJ52NVJUs4o+WtVnikKAhHHZqAhC+Xes/22ZxczMn35A
 cxrZpUoAqGF0hmXySTQoJYNrgdmYHPZ6vCl55E4m6yWACh4Ec5UnaRSpsjrMUBvsUqlc
 Vv5uriO3XS/w2Vt7oZn4iBgsmZFeZJ0K9v0c0Q7d+mK0Hf3Y3vQeqyM3AF/cyEMf4/61
 /Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ur4NYkKvb4IwfCVRQ66xGSUcq2q0ktl5nOkYZP/fju8=;
 b=GB3N69nHzaRtVbl7GWc6ES94cnNpx+v5GRj4HsyCiifCYE9t7JR4Wiv1ctpr+4kOXt
 09wywG+AIX0U8oSOAHnJUgey6BJdC/FFxFvivnLHcT4cwWt0Za2CFXAo8imH3WZJ/kTi
 h5wFnlxCfM80mEBnoVAEuzJ4XGpMGMPzSWb99aj6vUfJeA5aUhoej+9XNYJ0Ia7D6D7o
 HNEL9wvGs8nEVz5urLpCZP5FCWHvURoKPnZ2GRGoSxjKQIAkvZs1/vzV1CHuGAb5O3TA
 EvH8L27q83Gt+8PPodhIoh5QS2Ir9s5DCaFh8KLxCZg1MnU6CS8IMXJXIs3mFM+xb3su
 LZcA==
X-Gm-Message-State: AOAM530Z1I8PuzofYASvmWXUApSCFSf9Xpeo//UuYknSfcCVICb7Kkv1
 q/GhgLFjJZa9xV1vCX/R6U+gFNZ6nPOPTQ==
X-Google-Smtp-Source: ABdhPJyW2KgSayuZmm7yZy6oDSMPdIIbDLXGyjzoC53ygz9mVem7Zk/etyl/r6RCx1MwbuTKnUfAUA==
X-Received: by 2002:a17:90a:384a:: with SMTP id
 l10mr1678055pjf.168.1634158267047; 
 Wed, 13 Oct 2021 13:51:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t71sm383043pgc.29.2021.10.13.13.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 13:51:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/13] target/riscv: Move cpu_get_tb_cpu_state out of line
Date: Wed, 13 Oct 2021 13:50:52 -0700
Message-Id: <20211013205104.1031679-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013205104.1031679-1-richard.henderson@linaro.org>
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, zhiwei_liu@c-sky.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the function to cpu_helper.c, as it is large and growing.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        | 47 ++-------------------------------------
 target/riscv/cpu_helper.c | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9e55b2f5b1..7084efc452 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -413,51 +413,8 @@ static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
     return cpu->cfg.vlen >> (sew + 3 - lmul);
 }
 
-static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *pflags)
-{
-    uint32_t flags = 0;
-
-    *pc = env->pc;
-    *cs_base = 0;
-
-    if (riscv_has_ext(env, RVV)) {
-        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
-        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
-                    FIELD_EX64(env->vtype, VTYPE, VILL));
-        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
-                    FIELD_EX64(env->vtype, VTYPE, VSEW));
-        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
-                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
-        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
-    } else {
-        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
-    }
-
-#ifdef CONFIG_USER_ONLY
-    flags |= TB_FLAGS_MSTATUS_FS;
-#else
-    flags |= cpu_mmu_index(env, 0);
-    if (riscv_cpu_fp_enabled(env)) {
-        flags |= env->mstatus & MSTATUS_FS;
-    }
-
-    if (riscv_has_ext(env, RVH)) {
-        if (env->priv == PRV_M ||
-            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
-            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
-                get_field(env->hstatus, HSTATUS_HU))) {
-            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
-        }
-
-        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
-                           get_field(env->mstatus_hs, MSTATUS_FS));
-    }
-#endif
-
-    *pflags = flags;
-}
+void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *pflags);
 
 RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
                            target_ulong *ret_value,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d41d5cd27c..14d1d3cb72 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -35,6 +35,52 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *pflags)
+{
+    uint32_t flags = 0;
+
+    *pc = env->pc;
+    *cs_base = 0;
+
+    if (riscv_has_ext(env, RVV)) {
+        uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
+        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
+                    FIELD_EX64(env->vtype, VTYPE, VILL));
+        flags = FIELD_DP32(flags, TB_FLAGS, SEW,
+                    FIELD_EX64(env->vtype, VTYPE, VSEW));
+        flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
+                    FIELD_EX64(env->vtype, VTYPE, VLMUL));
+        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
+    } else {
+        flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
+    }
+
+#ifdef CONFIG_USER_ONLY
+    flags |= TB_FLAGS_MSTATUS_FS;
+#else
+    flags |= cpu_mmu_index(env, 0);
+    if (riscv_cpu_fp_enabled(env)) {
+        flags |= env->mstatus & MSTATUS_FS;
+    }
+
+    if (riscv_has_ext(env, RVH)) {
+        if (env->priv == PRV_M ||
+            (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
+            (env->priv == PRV_U && !riscv_cpu_virt_enabled(env) &&
+                get_field(env->hstatus, HSTATUS_HU))) {
+            flags = FIELD_DP32(flags, TB_FLAGS, HLSX, 1);
+        }
+
+        flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
+                           get_field(env->mstatus_hs, MSTATUS_FS));
+    }
+#endif
+
+    *pflags = flags;
+}
+
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
-- 
2.25.1


