Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7FC3E464D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:14:00 +0200 (CEST)
Received: from localhost ([::1]:49190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD56N-0005lR-3R
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53m-0002Md-2a; Mon, 09 Aug 2021 09:11:18 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:46047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53j-0001D3-I8; Mon, 09 Aug 2021 09:11:17 -0400
Received: by mail-qk1-x730.google.com with SMTP id bl17so10627945qkb.12;
 Mon, 09 Aug 2021 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+jnfSBZHVwqdOjJtuRbY7xF4jA+W8FAjf4sFirZsbXI=;
 b=m6yq0fks/rcSJuJ/eWp0wQhsbQNLXi09IqEq8uz1bIUrddlv9GeCsstphwBcMaVMJ6
 XVw/xJCb1Ycm8Q68pGV2nRfE2CQmF3VxpcSuZ4zXbnxH78MlWfvjmhswf6XSQ9NtCuQb
 4nCfuEd18uPZ8fdoUL08P6Yd7c4W0sFnIeO/tlVJGILlBd25Qz4R3G4fXKMpMypVbUCK
 0VPdBtnivRRotzZz8b/HAKQsQq5BvWR6UzVSBgPwBK63d7781nAOSSCwSNigkDe7pNgZ
 TdBabnB1ZiWEe4EbnxABK0CALPFq2FvL2xzcwccv8NdXLl5Qa1ZjHdp7PjrUhyMXbXwW
 bEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+jnfSBZHVwqdOjJtuRbY7xF4jA+W8FAjf4sFirZsbXI=;
 b=lq5LcU1KPYyOS1vCbJRcAo7uHdoqFLn67OaXqCchsN1baXRu6Qzk8+dgExHdBoplo6
 2cTOhLPZ+JxEEuM/1eG7W40eta+ffwWoYjOqjtyJA6rfgPrfAXBkgpMXOaRX8ceyUKil
 XnJ/2BgFt2EBOwhElPxRrH6k/JfsBMYXQ8iPwfuicrpvd7BM+EYieTBO2d5CeoTjCQzY
 KJ/OBjoOsEknmPRCXo1+erfDP3azdJUeoImva8YqLfY154Io08GfIkJRh2TxNtQLPsgr
 lUzUZOBwwyQDriAEkXevbqiZ8TblDLHQcl5ATg9pimSjbnoe0JrETybYLoXlMWbj5vil
 7v2w==
X-Gm-Message-State: AOAM531DaVW2AZ6EPljtoDzvrgY5If4P4mroL8eExRDAK2hespCRwpho
 hlfkCAdvgC3xOESokCpMliBTfgpnh/hdKg==
X-Google-Smtp-Source: ABdhPJwD/MArTgwz7cL446oXgpGC0kDTOZXvdXicHxsAKr+FmR+QiRvCj7gzNyWXbFSVALQflXoGQQ==
X-Received: by 2002:a37:8a44:: with SMTP id m65mr22772595qkd.72.1628514674080; 
 Mon, 09 Aug 2021 06:11:14 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/19] target/ppc: add exclusive user write function for PMU
 regs
Date: Mon,  9 Aug 2021 10:10:41 -0300
Message-Id: <20210809131057.1694145-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gustavo Romero <gromero@linux.ibm.com>

Similar to the previous patch, write read on PowerPC PMU regs
requires extra handling than the generic write ureg functions.

This patch adds a specific write function for user PMU SPRs,
spr_write_pmu_ureg(). MMCR0 and PMC1 are being treated before
write, all other registers will be default to what is done in
spr_write_ureg(), for now.

Since spr_write_pmu_ureg() needs to have a look in SPR_POWER_MMCR0
to validate if the write is valid or not, we're adding a 'spr'
array in DisasContext that points to env->spr.

CC: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c  | 26 +++++++++++++-------------
 target/ppc/spr_tcg.h   |  1 +
 target/ppc/translate.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d30aa0fe1e..71062809c8 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6868,47 +6868,47 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIAR, "USIAR",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USDAR, "USDAR",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
 }
@@ -6976,8 +6976,8 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_pmu_ureg, SPR_NOACCESS,
-                 &spr_read_pmu_ureg, &spr_write_ureg,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
+                 &spr_read_pmu_ureg, &spr_write_pmu_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
                  &spr_read_generic, SPR_NOACCESS,
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 84ecba220f..40b5de34b9 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -28,6 +28,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_read_pmu_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_read_pmu_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_write_pmu_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d3a4d42ff8..29b0a340a9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -176,6 +176,7 @@ struct DisasContext {
     bool tm_enabled;
     bool gtse;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
+    target_ulong *spr; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
     uint64_t insns_flags;
@@ -573,6 +574,46 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     gen_store_spr(sprn + 0x10, cpu_gpr[gprn]);
 }
+
+/* User special write access to PMU SPRs  */
+void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0, t1;
+    int effective_sprn = sprn + 0x10;
+
+    if (((ctx->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) == 0) {
+        /* Hypervisor Emulation Assistance interrupt */
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        return;
+    }
+
+    switch (effective_sprn) {
+    case SPR_POWER_MMCR0:
+        t0 = tcg_temp_new();
+        t1 = tcg_temp_new();
+
+        /*
+         * Filter out all bits but FC, PMAO, and PMAE, according
+         * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
+         * fourth paragraph.
+         */
+        tcg_gen_andi_tl(t0, cpu_gpr[gprn],
+                        MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE);
+        gen_load_spr(t1, SPR_POWER_MMCR0);
+        tcg_gen_andi_tl(t1, t1, ~(MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE));
+        /* Keep all other bits intact */
+        tcg_gen_or_tl(t1, t1, t0);
+        gen_store_spr(effective_sprn, t1);
+
+        tcg_temp_free(t0);
+        tcg_temp_free(t1);
+        break;
+    default:
+        gen_store_spr(effective_sprn, cpu_gpr[gprn]);
+        break;
+    }
+}
+
 #endif
 
 /* SPR common to all non-embedded PowerPC */
@@ -8563,6 +8604,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     uint32_t hflags = ctx->base.tb->flags;
 
     ctx->spr_cb = env->spr_cb;
+    ctx->spr = env->spr;
     ctx->pr = (hflags >> HFLAGS_PR) & 1;
     ctx->mem_idx = (hflags >> HFLAGS_DMMU_IDX) & 7;
     ctx->dr = (hflags >> HFLAGS_DR) & 1;
-- 
2.31.1


