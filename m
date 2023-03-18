Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFAD6BFCA2
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:08:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcnn-00058u-0i; Sat, 18 Mar 2023 16:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnl-00058M-H6
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:17 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnj-00078p-Kt
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:17 -0400
Received: by mail-oi1-x22c.google.com with SMTP id bj30so6210260oib.6
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1KnuQqgygOO2YMozmY3X/7U/lNxPcvXX1UiChgZSKA=;
 b=hjZh7rTZtQIZVIHUBfIPc912pyH2Dc0tOetguubjLwRe51bM+20fnYLO31Q1jEmHR1
 w3y2+bpo+YStOevc4JygemuqGOPAusFQGXodrngwH62wIXV90fN3k8cuQuOcV5EQTck8
 6dBPjhsMYT50YaDW2YJIJqXiSZqoQVDaUlsGWgg+vj9eBZCaWwHm14e5xlMLkoXq7SWC
 oWWYWcD/AQJZlOdpglRdp6XZCgOBmoE9M2jdgjrAfxKuSYgkZdSz9u+Jus331PUsBsyq
 MJsiPGeVNOzfqd6vVYVfYpp2Gg3337OZuO++yIjTFc/1DR+IyK6RH8GpsTiwGp6NBfPJ
 JrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1KnuQqgygOO2YMozmY3X/7U/lNxPcvXX1UiChgZSKA=;
 b=6z1ZFgjknvjLtBAhY+7ee1OFyaSkCDhZ/aaF5mzAt1YCyADL/ChWDYNy8nbKl9ov67
 KNlh/E9D0hHGI+JltK9vYo4HlPkQp5QfFbDQi3SlyJ5fhL83eT9IYy2kEsKwD1rUFH7k
 /fscPTdxt/iPx7f0/GxOA3mkCV4CFejNCqN8wN5X32cOsDw9XJo5ETs+TVSPRlbqoK/y
 BNlAq8CyC55K15GTbgrHF2UjtxiNCDwrZcaXzWoF15GSK2dTBZ9S6uf2NNlE4hCqWBRL
 LQxOob/elH6rFLH/hqV/WXgaMvOI9L3ZpiC6fOLig7On/C9BZR7JkAG+yM/pcvDi/S0N
 XzmQ==
X-Gm-Message-State: AO0yUKUsVnhshRuOINuM4wd3V+Sdee8Jt5VQV/k/NclEfF3YFBROT7IC
 vQo22PnSzkzG+ZDWAU+lI5XPDTAXxMKXyiI2G6Q=
X-Google-Smtp-Source: AK7set8sPkCFNqGo4nkKMg1p+rOJH6O2m4R+Q2KzyFIghiXp8kej9lssz90yYg3+p30U3leLIRyfDA==
X-Received: by 2002:aca:f1d6:0:b0:386:ea71:9c99 with SMTP id
 p205-20020acaf1d6000000b00386ea719c99mr1155885oih.25.1679169913796; 
 Sat, 18 Mar 2023 13:05:13 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 11/26] target/riscv/cpu.c: set cpu config in
 set_misa()
Date: Sat, 18 Mar 2023 17:04:21 -0300
Message-Id: <20230318200436.299464-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

set_misa() is setting all 'misa' related env states and nothing else.
But other functions, namely riscv_cpu_validate_set_extensions(), uses
the config object to do its job.

This creates a need to set the single letter extensions in the cfg
object to keep both in sync. At this moment this is being done by
register_cpu_props(), forcing every CPU to do a call to this function.

Let's beef up set_misa() and make the function do the sync for us. This
will relieve named CPUs to having to call register_cpu_props(), which
will then be redesigned to a more specialized role next.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++--------
 target/riscv/cpu.h |  4 ++--
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 36c55abda0..7841676473 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -236,8 +236,40 @@ const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 
 static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
 {
+    RISCVCPU *cpu;
+
     env->misa_mxl_max = env->misa_mxl = mxl;
     env->misa_ext_mask = env->misa_ext = ext;
+
+    /*
+     * ext = 0 will only be a thing during cpu_init() functions
+     * as a way of setting an extension-agnostic CPU. We do
+     * not support clearing misa_ext* and the ext_N flags in
+     * RISCVCPUConfig in regular circunstances.
+     */
+    if (ext == 0) {
+        return;
+    }
+
+    /*
+     * We can't use riscv_cpu_cfg() in this case because it is
+     * a read-only inline and we're going to change the values
+     * of cpu->cfg.
+     */
+    cpu = env_archcpu(env);
+
+    cpu->cfg.ext_i = ext & RVI;
+    cpu->cfg.ext_e = ext & RVE;
+    cpu->cfg.ext_m = ext & RVM;
+    cpu->cfg.ext_a = ext & RVA;
+    cpu->cfg.ext_f = ext & RVF;
+    cpu->cfg.ext_d = ext & RVD;
+    cpu->cfg.ext_v = ext & RVV;
+    cpu->cfg.ext_c = ext & RVC;
+    cpu->cfg.ext_s = ext & RVS;
+    cpu->cfg.ext_u = ext & RVU;
+    cpu->cfg.ext_h = ext & RVH;
+    cpu->cfg.ext_j = ext & RVJ;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -340,7 +372,6 @@ static void riscv_any_cpu_init(Object *obj)
 #endif
 
     env->priv_ver = PRIV_VERSION_LATEST;
-    register_cpu_props(obj);
 
     /* inherited from parent obj via riscv_cpu_init() */
     cpu->cfg.ext_ifencei = true;
@@ -368,7 +399,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
@@ -387,7 +417,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -472,8 +501,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -492,7 +519,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -510,7 +536,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_11_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -529,7 +554,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 76f81c6b68..ebe0fff668 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -66,8 +66,8 @@
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 /*
- * Consider updating register_cpu_props() when adding
- * new MISA bits here.
+ * Consider updating set_misa() when adding new
+ * MISA bits here.
  */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
-- 
2.39.2


