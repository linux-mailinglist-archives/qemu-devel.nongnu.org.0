Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0914424CF
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:38:33 +0100 (CET)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhou-00027J-Et
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhB1-0004DL-Eo; Mon, 01 Nov 2021 19:57:21 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAz-0006Ht-23; Mon, 01 Nov 2021 19:57:19 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bq14so6705638qkb.1;
 Mon, 01 Nov 2021 16:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ay5ik3l4Q4kO+evGvm42h0d8O0lgJgevFlOdJqbYfO0=;
 b=GCek7Mw69m5Pf2YEC4qmoTFLP++wl3MNOLlc8x8M1sJQmL+3CF1cjJ0Pj90y03uVm+
 iQUaMSwljDKfj2jW8QLyWQYG5xT8QMGpjZWpiMb52teVwKzPn7Wbc7fK1++o5wyq9bsW
 sZ4yXndSD4VtTvzBI3KyBJ0s4BGRs8EZT+Jp8eVA6gIH9hX9LyhK+UxvhTuZ2WnTOWn2
 NKHmVRrrXj2C7aD3Q49lH7SwCS3Nxd5iHiymsQCvji7hQHidOhiJ1XgfgFUf2UeZP2Sq
 S4ffYb4X2CowmHGYdYz6a6CS58Ekk2e827p8IoNpoeDcbOnYWgbKbHhHHE6vq2+9UmbJ
 rSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ay5ik3l4Q4kO+evGvm42h0d8O0lgJgevFlOdJqbYfO0=;
 b=EegpqdolyoMpby9/btcbN1900ySOUDYAvYpyj8nZ4eZJhc+Dj/g7DjwiVofI+eXWK8
 pLrsqI5hZyUDzJ6v8pggtZMXosT0aFL2Mv85f0lP9LppJepUYaVvrzzTfoy5a8T7OIi3
 er508U91K9F9V4+XybHV6oTY+UZUo0IUxdyJeioO4gFfA0BkzlM2bLbgSg+KDQPZhPJn
 amBNE1jQl9NvCpJ/KWNWX2mZGRjPUW+A3cUT/17DmVKUU26Jfw/5HVU5q19qLFLtG91j
 60hrJjkpBuwbZTnMXsKXSfo6EhrHdy8PUFh8LG2hjvA+AiibeOUPSXUU02cWzK77dcof
 gfIw==
X-Gm-Message-State: AOAM532PvNQWbJitH+96lR38exSdVey7Z3d1NyoYszKAwtH98MYEWSLu
 AYdn3UM+I4WX97iOWHFpwr9RAdem8/M=
X-Google-Smtp-Source: ABdhPJzmcHSCnJ0Vt3SJqA3gGXUEtDcw8+eBGD6gbR+w9xLFD64O/GWWLa/xAwrOLu+7lrkiCW8TGw==
X-Received: by 2002:a05:620a:414e:: with SMTP id
 k14mr26170412qko.400.1635811035787; 
 Mon, 01 Nov 2021 16:57:15 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/10] target/ppc: PMU: handle setting of PMCs while running
Date: Mon,  1 Nov 2021 20:56:38 -0300
Message-Id: <20211101235642.926773-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101235642.926773-1-danielhb413@gmail.com>
References: <20211101235642.926773-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The initial PMU support were made under the assumption that the counters
would be set before running the PMU and read after either freezing the
PMU manually or via a performance monitor alert.

Turns out that some EBB powerpc kernel tests set the counters after
unfreezing the counters. Setting a PMC value when the PMU is running
means that, at that moment, the baseline for calculating cycle
events needs to be updated. Updating this baseline means that we need
to update all the PMCs with their actual value at that moment. Any
existing counter negative timer needs to be discarded an a new one,
with the updated values, must be set again.

This patch does that via a new 'helper_store_pmc()' that is called in
the mtspr() callbacks of PMU counters.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c            | 12 ++++++------
 target/ppc/helper.h              |  1 +
 target/ppc/power8-pmu-regs.c.inc | 16 +++++++++++++++-
 target/ppc/power8-pmu.c          | 18 ++++++++++++++++++
 target/ppc/spr_tcg.h             |  1 +
 5 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e6f3ff9b96..33b4df3b99 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6832,27 +6832,27 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
                      KVM_REG_PPC_MMCRA, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC2, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC3, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC4, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC5, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC6, 0x00000000);
     spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index b8a89f02f4..373326203b 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(insns_inc, void, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index a92437b0c4..3406649130 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -212,13 +212,23 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
     spr_read_PMC14_ureg(ctx, gprn, sprn);
 }
 
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+
+    gen_icount_io_start(ctx);
+    gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
+
+    tcg_temp_free_i32(t_sprn);
+}
+
 void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     if (!spr_groupA_write_allowed(ctx)) {
         return;
     }
 
-    spr_write_ureg(ctx, sprn, gprn);
+    spr_write_PMC(ctx, sprn + 0x10, gprn);
 }
 
 void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
@@ -286,4 +296,8 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
 }
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 3751b6de55..d66266829f 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -336,4 +336,22 @@ void cpu_ppc_pmu_init(CPUPPCState *env)
     }
 }
 
+void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
+{
+    bool pmu_frozen = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
+
+    if (pmu_frozen) {
+        env->spr[sprn] = value;
+        return;
+    }
+
+    /*
+     * Update counters with the events counted so far, define
+     * the new value of the PMC and start a new cycle count
+     * session.
+     */
+    pmu_update_cycles(env);
+    env->spr[sprn] = value;
+    start_cycle_count_session(env);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index fdc6adfc31..aae57baf23 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -27,6 +27,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
-- 
2.31.1


