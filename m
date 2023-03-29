Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4B6CF126
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:32:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZdN-0005tN-Ss; Wed, 29 Mar 2023 13:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcj-0005Il-8v
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:18 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZcf-0001TV-E3
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:30:11 -0400
Received: by mail-oi1-x235.google.com with SMTP id r14so6487407oiw.12
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680111007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DCK9+Fvx11Wv+LWTSGDX6exvMcjzL7cA0frvLo56iDw=;
 b=ANZ0P6r760gaAJt9GANv4ZMTeyBLDIWNfhvp53uREhj6TfsQnTCa/WEgdseaAe8NVZ
 FMiclaVfQnVmyjp/SU5d+fAu6VYrW6JzA+m6uwA5DxHHGaekizdMHH2rjo2gqgqnbMsi
 HT/WgbFs4eka3O4ZOrcsd3pZtxoXtjNVHo9f5ss2iUS0JbJK4f/vSvnZtfPLxukgSl5Z
 GFS8w6q50IGNWvhlifCN57kcAlHK/WXs7Z1tSV4Uz/koZQyRa9AEth6EyNaIbwHtXy/S
 vmWUKMUTUry4K3j72pXteOk0RIgCUv/kjMewTFSYMZo3y3j30dCqWwIiro5sGlDmIz9T
 Z0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680111007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DCK9+Fvx11Wv+LWTSGDX6exvMcjzL7cA0frvLo56iDw=;
 b=qEAQ835X7XKXNGFTmlgjUHPBHZq0iqPKN0+L3eLnploiZGXI4YCCSRT80VNhZ/xMSm
 u1gMnbnJZvcIdmT27Z1CCIgwKyiA9p6IQf6VSweiao0WRCpdwzotQ/KOsMglFvvCpZXD
 B+kySJc3MlyMjehHhB11sSBNVOGawDXHllkOwW9F6Wd59HxYFzSDoi1i/1l+w556L/hp
 ZiFSobg/l3xPnjGLWLaeFvK4rAWXOg013k2s0/7bdmWv/tXfwN2xwe+rcHA7rDcweuGb
 YzBgphSW3CbP7kASbuQmt7MekJe5MJKBejAN9sw+w0wDyfJGr0pmk++CAj3vGyhIZdCb
 pO4Q==
X-Gm-Message-State: AAQBX9cxrv+07+wFhE7bFkJbWUSkEALG4yr1xcztylP7pNlB8gzKhLk2
 Ni0uDt9kTtx2r0i2A9wYQow31Rw+B4lIa7858RI=
X-Google-Smtp-Source: AKy350bVY08YXeAvU0IKDx4Po44dy2zGOG0wWyVkTLLbTcwKycv1Z+lrig+HaVvR56zxrVVpTT15gw==
X-Received: by 2002:a05:6808:10c:b0:389:1553:af86 with SMTP id
 b12-20020a056808010c00b003891553af86mr4976568oie.5.1680111007413; 
 Wed, 29 Mar 2023 10:30:07 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:30:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 20/20] target/riscv/cpu.c: redesign register_cpu_props()
Date: Wed, 29 Mar 2023 14:29:03 -0300
Message-Id: <20230329172903.636383-21-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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

The function is now a no-op for all cpu_init() callers that are setting
a non-zero misa value in set_misa(), since it's no longer used to sync
cpu->cfg props with env->misa_ext bits. Remove it in those cases.

While we're at it, rename the function to match what it's actually
doing: create user properties to set/remove CPU extensions. Make a note
that it will overwrite env->misa_ext with the defaults set by each user
property.

Update the MISA bits comment in cpu.h as well.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 41 ++++++++++-------------------------------
 target/riscv/cpu.h |  5 +----
 2 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6988ff443a..d8568a024c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -221,7 +221,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(Object *obj);
+static void riscv_cpu_add_user_properties(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -349,7 +349,6 @@ static void riscv_any_cpu_init(Object *obj)
 #endif
 
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -358,7 +357,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -370,7 +369,6 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
@@ -383,7 +381,6 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -429,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -442,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 #ifndef CONFIG_USER_ONLY
@@ -454,7 +451,6 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
@@ -467,7 +463,6 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -481,7 +476,6 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -496,7 +490,6 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
@@ -514,7 +507,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(obj);
+    riscv_cpu_add_user_properties(obj);
 }
 #endif
 
@@ -1508,30 +1501,16 @@ static Property riscv_cpu_extensions[] = {
 };
 
 /*
- * Register CPU props based on env.misa_ext. If a non-zero
- * value was set, register only the required cpu->cfg.ext_*
- * properties and leave. env.misa_ext = 0 means that we want
- * all the default properties to be registered.
+ * Add CPU properties with user-facing flags.
+ *
+ * This will overwrite existing env->misa_ext values with the
+ * defaults set via riscv_cpu_add_misa_properties().
  */
-static void register_cpu_props(Object *obj)
+static void riscv_cpu_add_user_properties(Object *obj)
 {
-    RISCVCPU *cpu = RISCV_CPU(obj);
     Property *prop;
     DeviceState *dev = DEVICE(obj);
 
-    /*
-     * If misa_ext is not zero, set cfg properties now to
-     * allow them to be read during riscv_cpu_realize()
-     * later on.
-     */
-    if (cpu->env.misa_ext != 0) {
-        /*
-         * We don't want to set the default riscv_cpu_extensions
-         * in this case.
-         */
-        return;
-    }
-
     riscv_cpu_add_misa_properties(obj);
 
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ce92e8393d..02f26130d5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -65,10 +65,7 @@
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
-/*
- * Consider updating register_cpu_props() when adding
- * new MISA bits here.
- */
+/* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
 #define RVM RV('M')
-- 
2.39.2


