Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A96CF41F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 22:11:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phc6v-0006Su-AP; Wed, 29 Mar 2023 16:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6t-0006Qm-Bo
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:31 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6r-0007oi-HF
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:31 -0400
Received: by mail-oi1-x22a.google.com with SMTP id q27so11811314oiw.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EIIlw0ncNCgaw7mUOc1O7mXJzdXX4xQn2w71xZ8Nxhs=;
 b=jmT3Ks2bTqCa8W4zN3x2tlhO5zWWfFYZpCnRvSh2/EpruWi/gxUx6UF9MBShk5It+O
 tLUsAqkXqSOTYn1ktQv3U1ZP9XCKHoW7P0lUXvysmxA8WpNi26yH3InSy+t2mNtQkwBT
 bcNGEjVkH7CI5FDnC3g89OON+gQZwGaclof9Saj7EWnID+birXvf2fFFjNCj02cPDQ9S
 hwQMHe9VlPa9bRX6c44h/H1y6yvBcGtlyujfU5tU3ZeZK4tXDtL39jufDou/obHfwdTw
 B0mLpRaTGrzEv6JCJrHX8l8zkF1ioLijRCjZxaDbwQ10I46EOFPwpbJyebwr8j4NKQvd
 D7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EIIlw0ncNCgaw7mUOc1O7mXJzdXX4xQn2w71xZ8Nxhs=;
 b=wxmLY2pLO1ynIKER7Ejc9dwj8GGro7uRNnykjvc7BnTtFClWQ7atWms1J5aBi8hXr4
 oPceT9mGmdjEJu50AbvyepAsPzDKcIONcM2Jvhf+9hhk0kznrLnIJY0rt+8umpXw17PG
 4y4jbkj1w2HxzmzQeJKmo52lwJSbEYFtDZOGTh2pQVoejIRfH3GzlbRUhEWcjheysuaO
 9Z5/njMGnVDAPrXAmUazDC9KuO20afNW8fP+bGrNJjwKosmNvBCwfDqKR+6epXDGBvRV
 A3TsDiLqZh3aucTo85CPEUhcFyDfGbvOymwzhkxypZNCdhPgGebZ41mkKDSc9p8PjAmS
 LL1Q==
X-Gm-Message-State: AO0yUKVltdGzZUfAUOSMZNGtdNQ6o0PDUVgoFr3mnEq9+/1vxRNgm/HE
 vMAMRaYeU29Qa2u/C/FF7LHqFAx6+mKV4JFZefM=
X-Google-Smtp-Source: AK7set8jbVHucPkxzwCTz952d/u/VkNVt+ofeNBBkc3M4zc6kaQ7BO4aLGloH/PJztM4g0Pd7LhUEw==
X-Received: by 2002:a05:6808:6190:b0:384:23da:6e73 with SMTP id
 dn16-20020a056808619000b0038423da6e73mr8014256oib.47.1680120568483; 
 Wed, 29 Mar 2023 13:09:28 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 8/9] target/riscv/cpu.c: remove cfg setup from
 riscv_cpu_init()
Date: Wed, 29 Mar 2023 17:08:55 -0300
Message-Id: <20230329200856.658733-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have 4 config settings being done in riscv_cpu_init(): ext_ifencei,
ext_icsr, mmu and pmp. This is also the constructor of the "riscv-cpu"
device, which happens to be the parent device of every RISC-V cpu.

The result is that these 4 configs are being set every time, and every
other CPU should always account for them. CPUs such as sifive_e need to
disable settings that aren't enabled simply because the parent class
happens to be enabling it.

Moving all configurations from the parent class to each CPU will
centralize the config of each CPU into its own init(), which is clearer
than having to account to whatever happens to be set in the parent
device. These settings are also being set in register_cpu_props() when
no 'misa_ext' is set, so for these CPUs we don't need changes. Named
CPUs will receive all cfgs that the parent were setting into their
init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 59 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 331272c8a0..4aa119b9bc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -325,7 +325,8 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 
 static void riscv_any_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
 #if defined(TARGET_RISCV32)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #elif defined(TARGET_RISCV64)
@@ -339,6 +340,12 @@ static void riscv_any_cpu_init(Object *obj)
 #endif
 
     env->priv_ver = PRIV_VERSION_LATEST;
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 }
 
 #if defined(TARGET_RISCV64)
@@ -357,12 +364,19 @@ static void rv64_base_cpu_init(Object *obj)
 
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv64_sifive_e_cpu_init(Object *obj)
@@ -372,10 +386,14 @@ static void rv64_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv64_thead_c906_cpu_init(Object *obj)
@@ -403,6 +421,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_SV39);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.pmp = true;
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -439,12 +460,19 @@ static void rv32_base_cpu_init(Object *obj)
 
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv32_sifive_e_cpu_init(Object *obj)
@@ -454,10 +482,14 @@ static void rv32_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv32_ibex_cpu_init(Object *obj)
@@ -467,11 +499,15 @@ static void rv32_ibex_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_11_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
     cpu->cfg.epmp = true;
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv32_imafcu_nommu_cpu_init(Object *obj)
@@ -481,10 +517,14 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     env->priv_ver = PRIV_VERSION_1_10_0;
-    cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.pmp = true;
 }
 #endif
 
@@ -1343,11 +1383,6 @@ static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    cpu->cfg.ext_ifencei = true;
-    cpu->cfg.ext_icsr = true;
-    cpu->cfg.mmu = true;
-    cpu->cfg.pmp = true;
-
     cpu_set_cpustate_pointers(cpu);
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


