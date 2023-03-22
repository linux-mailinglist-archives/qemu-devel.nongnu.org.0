Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C426C5A60
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:31:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf70Y-0006xu-Mt; Wed, 22 Mar 2023 18:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf70W-0006xO-2D
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:32:36 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6zD-0007I1-1o
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:32:35 -0400
Received: by mail-vs1-xe36.google.com with SMTP id by13so17461512vsb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lhOTnXrxuQLKT+w/ef/X7o/kHZhLWiXdaDt1ZzYraaw=;
 b=Kr7aeig2grZ+mrvAmTu00/BPo3jcvEC+yCweRbjL4t63EFmwzxqlp7fdjhayEVkbHx
 zznNhD2YVfiruekK1QCd5xB/gcdLz0Gdzary8+nIgLoDW0ni+0vRv8ynmi+NwXJy9Nyc
 Zwn5E2BBDc2A9q6wR87G/CsoA8QobmMIaidTz6Dm1QwtiFWUxGG00Debkohb6Yc6cL5p
 pHrklfWVk1MpGagIpsgJO5xjll2o2Z3elCLAwBPfHr7r7VYv6w4v1D9EOcgo77THEUhG
 cs4bbHazFyqZvA6bZbOc2VdDzljaoX6G/NC69a6tFBbOl2dTTimVfIRuFcl4UwGDPj0/
 oD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lhOTnXrxuQLKT+w/ef/X7o/kHZhLWiXdaDt1ZzYraaw=;
 b=rTj24QVfXBHY/Xzig8CjO3SeI/STnHnNIfFv8ldrSXwuMENkXYjSK2RlG3fbsaowAk
 qHOXXou6BIgY1LOsuHmIcymXFn2huy2s9NZ/SeZJjsDwHKvhJlQr94DGgpKAmGTeju74
 dgbaj6+mPXST9EW3MXutDQDRPNAAhFmC9u0OfG0wcuaktUpNOU2PUyHdrskOOvu3Y+Ql
 4hISlJpqIh09u6MzGxtXnGI3Tid/cwR25KlNM1o/lGYM4FbSZq43CXocfdollhwkXOoU
 b/DwOrn68gXk4KtFX+m8qYLwwnahpLbc61XsdC7B8xCTOpCqglXSOHBC+RWILNsEzFaf
 AJCQ==
X-Gm-Message-State: AO0yUKWBRG+rn32Gcko0w0GRueGWLh5lXexaOY5uMh4pygk8aIy6EGAH
 +ZSjpn2guHAdB+IcaunB6Jxb/OVTDEfuKe5DVYY=
X-Google-Smtp-Source: AKy350aoCDFj2C9BOm2BzokJv1fFhJ9K83iCjOJdTwUQLjv0+1I4Hn4HDXVJnpjhpVOd7aPIkVO9/A==
X-Received: by 2002:a05:6870:d207:b0:178:e1f2:7f2a with SMTP id
 g7-20020a056870d20700b00178e1f27f2amr966523oac.24.1679523656353; 
 Wed, 22 Mar 2023 15:20:56 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:55 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 11/25] target/riscv/cpu.c: set cpu config in
 set_misa()
Date: Wed, 22 Mar 2023 19:19:50 -0300
Message-Id: <20230322222004.357013-12-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-vs1-xe36.google.com
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
 target/riscv/cpu.c | 43 ++++++++++++++++++++++++++++++++-----------
 target/riscv/cpu.h |  4 ++--
 2 files changed, 34 insertions(+), 13 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 36c55abda0..df5c0bda70 100644
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
@@ -408,9 +437,6 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     env->priv_ver = PRIV_VERSION_1_11_0;
 
     cpu->cfg.ext_g = true;
-    cpu->cfg.ext_c = true;
-    cpu->cfg.ext_u = true;
-    cpu->cfg.ext_s = true;
     cpu->cfg.ext_icsr = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
@@ -472,8 +498,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
     CPURISCVState *env = &cpu->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -492,7 +516,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -510,7 +533,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(obj);
     env->priv_ver = PRIV_VERSION_1_11_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -529,7 +551,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
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


