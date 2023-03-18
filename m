Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C046BFCA4
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcng-00055n-Ta; Sat, 18 Mar 2023 16:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnf-00055W-Iy
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:11 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnd-000776-NG
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:11 -0400
Received: by mail-oi1-x22a.google.com with SMTP id bo10so6201352oib.11
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LxDIouyTmW6CIiqQuxLm5ivPOp4dewieXsHrUESWZw=;
 b=PNeFx6YszROUxSpeYcRIeowUfrJZGyq7HS5A5ZXEqDJeNcHE94/yeEWaoyX+Z9ggaF
 oyM21vySe+lRJ3hYQtGzGlCtFLb1NkSM5Q0SYhCPtF+R5634Y/S36E9g+J9/9CCLorPk
 DvdihUPzu/yihmDsvQobMVi02Ap9zNuv84y0laEpOV/DZkzMVs6vx75yrbtLKwuE7YvF
 nj9AO+3CD6VUH/CKEWD8CAVlS3g9ekWXjZOu9/Qpt21zgENHKeNMz+I68+GOpq49M8wv
 QtWQaW3ritMsnUUEy3hyTLgF7EPH/ByNQKXGesUNEF4nIrR9iPWrloVxCial7DYYIpEv
 xSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1LxDIouyTmW6CIiqQuxLm5ivPOp4dewieXsHrUESWZw=;
 b=uWnvKAmicDfowi4vNqY+dy7kyPGMq13FjLqtYfCQiJfVRwxoaSQ7sbSpcDmnanGdfj
 OfgzhwZPmuo7GJHqEGUN5TKXl25GLGzWkgbP9sDOgAUPRqgF3NGzAQR9JIWPHBO9xe5p
 3LcDte3y9fFgnCLZPfgYtjTzcXK+AIfdxGdZq4b08oS+DHiGZVwqC8urNHPHXVNqtugT
 mX/dBEHmd6A+IWsV6dCPgmvB/0TBVAdIGGP151UKDvq5BvyM38yjozB46Z6btnNRgsZR
 3FpKQqOerLYQqyCkisX2okD2t9Fi9ydMqNyzngZWRHD+e8O2Ihs0vQi1vHIo9SeZySyj
 IW9A==
X-Gm-Message-State: AO0yUKU1oQu194J14IjNdHc7CdCyqVOEuWowm5NejUYeuAKWEpBh7uS6
 GvOPnddggUpX5/Kza59gzBdeKwp63Zk29fJdMKo=
X-Google-Smtp-Source: AK7set8duhfLZ/7ldizpc8ek5za9JIE0Dr69AgYcpyqcc4AIMfXozffST5Ndkz6qMgCsc1Fa37gv7g==
X-Received: by 2002:a05:6808:68c:b0:386:c2a5:1fd3 with SMTP id
 k12-20020a056808068c00b00386c2a51fd3mr4493203oig.14.1679169908376; 
 Sat, 18 Mar 2023 13:05:08 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:08 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 09/26] target/riscv/cpu.c: remove cfg setup from
 riscv_cpu_init()
Date: Sat, 18 Mar 2023 17:04:19 -0300
Message-Id: <20230318200436.299464-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
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
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fef55d7d79..c7b6e7b84b 100644
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
@@ -340,6 +341,12 @@ static void riscv_any_cpu_init(Object *obj)
 
     env->priv_ver = PRIV_VERSION_LATEST;
     register_cpu_props(obj);
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.ext_icsr = true;
+    cpu->cfg.mmu = true;
+    cpu->cfg.pmp = true;
 }
 
 #if defined(TARGET_RISCV64)
@@ -358,13 +365,20 @@ static void rv64_base_cpu_init(Object *obj)
 
 static void rv64_sifive_u_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
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
@@ -375,10 +389,14 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
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
@@ -411,6 +429,10 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_SV39);
 #endif
+
+    /* inherited from parent obj via riscv_cpu_init() */
+    cpu->cfg.ext_ifencei = true;
+    cpu->cfg.pmp = true;
 }
 
 static void rv128_base_cpu_init(Object *obj)
@@ -447,7 +469,8 @@ static void rv32_base_cpu_init(Object *obj)
 
 static void rv32_sifive_u_cpu_init(Object *obj)
 {
-    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
 
     register_cpu_props(obj);
@@ -455,6 +478,12 @@ static void rv32_sifive_u_cpu_init(Object *obj)
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
@@ -465,10 +494,14 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
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
@@ -479,11 +512,15 @@ static void rv32_ibex_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     register_cpu_props(obj);
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
@@ -494,10 +531,14 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     register_cpu_props(obj);
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
 
@@ -1384,11 +1425,6 @@ static void riscv_cpu_init(Object *obj)
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


