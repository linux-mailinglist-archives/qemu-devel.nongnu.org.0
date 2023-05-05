Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F46F7A79
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:15:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujsu-0006nJ-Bu; Thu, 04 May 2023 21:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujsq-0006Oz-Ha
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:16 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujso-0007MO-7U
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:16 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6434e263962so980528b3a.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248712; x=1685840712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kYPc3zJuRBU7p7Cv5AbI6Y/Hrunw54E5HI30VRK+2Y=;
 b=IF++k7cogYoTl11CLghfOkYPYUT1ws71FfU/YDWieSTsW/pDsf9mzkDDoinuS2uMfK
 4Fpx/oyYGJZMRpZ3Ty+VfaYXHOrUCxzR3eyMuE8TQ1GJ1f+ku3cVd817ivKGUgnsrxjK
 eN1XLDqAVcp3ioQTDvX4UvQOW6oCx01gd6oycLmRuhzJcaQuCZ4rmx/ZLnT20RHQYs6r
 Nbdphz6snpiJJSGzd1VvzRuX01c3EvEtvq+UjMNngS6biZyyKHjx9MhawEvesbcR6no8
 FlSVKUUekGsBieLaSZd68OCRoJtR+tCMzx/W3ksQ6XfGywMpWW4hiJNSaNfmI45Xjhbf
 SibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248712; x=1685840712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kYPc3zJuRBU7p7Cv5AbI6Y/Hrunw54E5HI30VRK+2Y=;
 b=d+BNPpv+g2Pc2jbiFKzmTejVM+VyCYZ2IBlBmSmwHBTrCMeAVF1zRjB0HRu8WVAhrm
 4IBjEIHxVzLjF6kRMPQGCsW47/std1Jeoehx5i7JLSJtvFzWhe2nl7Ad2qiJvfCbHMFv
 gnZHJXLWdmutShW4rEydTka9/Q/bKKg60EXmp3Osto0YJtf5ilyXzCWD3/2w/ngakdsw
 C0YgqEqWf5wZfppFRhROPSIpLvkb86W3EUUUWjbkIiL4tdSZI5H7eHL4vvrj7yyR2Myt
 Sv3gjQWFCfWOLO/yfK5iIPR8tebVkNwsjKaKPSzhJVbJe7rNQxL23v7Vnq64yma+Gh9c
 nICg==
X-Gm-Message-State: AC+VfDxdF3Tqey6xZ0ozi5ELHlDIlTZbB46MBodIFnqLUvGcNIdOaqao
 e6SUlqqiRbojZFHNQm1M5AGp0rcspcjDlw==
X-Google-Smtp-Source: ACHHUZ5MNwzSaAzROaKXzn8/h85Izgwju2j57NElKFZ4bYPY1ErB/xQEeCJzY/4s4dKioQ3H/ablZQ==
X-Received: by 2002:a17:902:b706:b0:1a8:1c9a:f68 with SMTP id
 d6-20020a170902b70600b001a81c9a0f68mr5511480pls.36.1683248712523; 
 Thu, 04 May 2023 18:05:12 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:12 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/89] target/riscv: sync env->misa_ext* with cpu->cfg in
 realize()
Date: Fri,  5 May 2023 11:01:45 +1000
Message-Id: <20230505010241.21812-34-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

When riscv_cpu_realize() starts we're guaranteed to have cpu->cfg.ext_N
properties updated. The same can't be said about env->misa_ext*, since
the user might enable/disable MISA extensions in the command line, and
env->misa_ext* won't caught these changes. The current solution is to
sync everything at the end of validate_set_extensions(), checking every
cpu->cfg.ext_N value to do a set_misa() in the end.

The last change we're making in the MISA cfg flags are in the G
extension logic, enabling IMAFG if cpu->cfg_ext.g is enabled. Otherwise
we're not making any changes in MISA bits ever since realize() starts.

There's no reason to postpone misa_ext updates until the end of the
validation. Let's do it earlier, during realize(), in a new helper
called riscv_cpu_sync_misa_cfg(). If cpu->cfg.ext_g is enabled, do it
again by updating env->misa_ext* directly.

This is a pre-requisite to allow riscv_cpu_validate_set_extensions() to
use riscv_has_ext() instead of cpu->cfg.ext_N to validate the MISA
extensions, which is our end goal here.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 94 +++++++++++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cb68916fce..66de3bb33f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -811,12 +811,11 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 
 /*
  * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly, doing a set_misa() in the end.
+ * cpu->cfg accordingly.
  */
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
-    uint32_t ext = 0;
 
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
@@ -831,6 +830,9 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
+
+        env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
+        env->misa_ext_mask = env->misa_ext;
     }
 
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
@@ -1022,39 +1024,8 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksh = true;
     }
 
-    if (cpu->cfg.ext_i) {
-        ext |= RVI;
-    }
-    if (cpu->cfg.ext_e) {
-        ext |= RVE;
-    }
-    if (cpu->cfg.ext_m) {
-        ext |= RVM;
-    }
-    if (cpu->cfg.ext_a) {
-        ext |= RVA;
-    }
-    if (cpu->cfg.ext_f) {
-        ext |= RVF;
-    }
-    if (cpu->cfg.ext_d) {
-        ext |= RVD;
-    }
-    if (cpu->cfg.ext_c) {
-        ext |= RVC;
-    }
-    if (cpu->cfg.ext_s) {
-        ext |= RVS;
-    }
-    if (cpu->cfg.ext_u) {
-        ext |= RVU;
-    }
-    if (cpu->cfg.ext_h) {
-        ext |= RVH;
-    }
     if (cpu->cfg.ext_v) {
         int vext_version = VEXT_VERSION_1_00_0;
-        ext |= RVV;
         if (!is_power_of_2(cpu->cfg.vlen)) {
             error_setg(errp,
                        "Vector extension VLEN must be power of 2");
@@ -1092,11 +1063,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
         set_vext_version(env, vext_version);
     }
-    if (cpu->cfg.ext_j) {
-        ext |= RVJ;
-    }
-
-    set_misa(env, env->misa_mxl, ext);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1181,6 +1147,50 @@ static void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
 #endif
 }
 
+static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
+{
+    uint32_t ext = 0;
+
+    if (riscv_cpu_cfg(env)->ext_i) {
+        ext |= RVI;
+    }
+    if (riscv_cpu_cfg(env)->ext_e) {
+        ext |= RVE;
+    }
+    if (riscv_cpu_cfg(env)->ext_m) {
+        ext |= RVM;
+    }
+    if (riscv_cpu_cfg(env)->ext_a) {
+        ext |= RVA;
+    }
+    if (riscv_cpu_cfg(env)->ext_f) {
+        ext |= RVF;
+    }
+    if (riscv_cpu_cfg(env)->ext_d) {
+        ext |= RVD;
+    }
+    if (riscv_cpu_cfg(env)->ext_c) {
+        ext |= RVC;
+    }
+    if (riscv_cpu_cfg(env)->ext_s) {
+        ext |= RVS;
+    }
+    if (riscv_cpu_cfg(env)->ext_u) {
+        ext |= RVU;
+    }
+    if (riscv_cpu_cfg(env)->ext_h) {
+        ext |= RVH;
+    }
+    if (riscv_cpu_cfg(env)->ext_v) {
+        ext |= RVV;
+    }
+    if (riscv_cpu_cfg(env)->ext_j) {
+        ext |= RVJ;
+    }
+
+    env->misa_ext = env->misa_ext_mask = ext;
+}
+
 static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -1216,6 +1226,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /*
+     * We can't be sure of whether we set defaults during cpu_init()
+     * or whether the user enabled/disabled some bits via cpu->cfg
+     * flags. Sync env->misa_ext with cpu->cfg now to allow us to
+     * use just env->misa_ext later.
+     */
+    riscv_cpu_sync_misa_cfg(env);
+
     /* Force disable extensions if priv spec version does not match */
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
-- 
2.40.0


