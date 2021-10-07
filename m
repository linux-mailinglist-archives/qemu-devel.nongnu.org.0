Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E9E4259FF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:53:06 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXZp-0003zQ-BV
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUP-0003xt-1E
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:29 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUM-0006oY-0f
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:28 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so5698775pjb.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VoTqH6Ab5qBEn7dsfX9wElPM3ZHRNrhLAk52+sFWkc=;
 b=eBQQOqNftwHqu7X5uxZNh0hwBp0OUBPlFDCWlOwhFQupCe/caqnUDDO54hhZuZCG3S
 OYPqgDFXW2VH1P3BTMP5mT0cluf9QDueLoiHHh/aKaxgrA8LiJLL9+7Te8ijuL1rg8is
 efcIuT+Lhw4iiLPM9+6r0YxM0xPB/uV79I9GAfHzrxQzgRMkyGJ0Ghzjc9z0HDrJBKjy
 HCAx8nv4ZXiYEwFSWn6ELFPhnTcnzlzU/P0UpmdkMV6Yz145F0Q9ZitwuL4NpmmmrWST
 cS/whTVJht0+tLAF4szG0Bae8LWIxyC/C/qCbGiwH4iwaOenknPXIlgTeLpXxUYXr0nr
 PKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VoTqH6Ab5qBEn7dsfX9wElPM3ZHRNrhLAk52+sFWkc=;
 b=roeOqHpn+Y3XR3tbCfuGWfK1Q2sBMDr298b9vLVgHmS7YCt51B/1ujAEL3Wy6H7ekA
 ULkg55BLpHed2EIMhqdud4BYqf/KNCmayX15rRMOfte0zbzecm5PBjCTGupCdbE25Ief
 7WRR5TvAna3wLWmNQn512YvHlULi/kwhpI4PW4Kh15QyUtB+2zc72kCeyLSndYItUs43
 lp4ZxbIH+8nonA3OjYZc4rshRoRw8J4Twk63LzN1vYFDJhJVF741N/5PtfeTg6e/Kj7Q
 h0h/FGoPmVpIxiDoroaY6a8nWM5PFuf4FDUJgxo0OryMXxSQdYuPhioFUVd92clIyv4R
 XTFA==
X-Gm-Message-State: AOAM531TY6MW8VGcTFAlnkHUxkoTg5B32iap1k/DV8uff/MP3Luw4gLy
 iW/bxh/VZhI1af7OuL44OMJM1yWylUb3yw==
X-Google-Smtp-Source: ABdhPJxSjHVfKxv8XGQnOl0bpLPZfNZscuS3WaVSt2+AirRs1YodUeHenly5TU63BBT9muSnBfTvHw==
X-Received: by 2002:a17:90a:e613:: with SMTP id
 j19mr6993264pjy.102.1633628844623; 
 Thu, 07 Oct 2021 10:47:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] target/riscv: Move cpu_get_tb_cpu_state out of line
Date: Thu,  7 Oct 2021 10:47:10 -0700
Message-Id: <20211007174722.929993-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the function to cpu_helper.c, as it is large and growing.

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


