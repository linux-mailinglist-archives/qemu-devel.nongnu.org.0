Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C756C5A11
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:10:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7HF-00084V-F4; Wed, 22 Mar 2023 18:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7HD-00084N-9A
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:49:51 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7HB-0001mX-L9
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:49:51 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-541a05e4124so365103657b3.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ce3V9rdPW4VRvOZyg4p6MJDnbIZ+yfMQOn2eHglZGRU=;
 b=Lo/TVAFCcRV/gHh8FUrLi+wjzE/dta+f+am1E0550J/Z4JF//O6fMUfpHoNZzo7kZ/
 voKME8hxG4liqsQ8MbHSq7J3tbmtcl5Efb0ykeFdTt5LnVeu7ozOEjnib5BXJMDM1SfY
 FeBKQNdO9lAAsXsiDTzlgzhoki5MS8kkjdjpvQIczSFLyI5uQ+q5aOB8v7UORVR5w5PB
 kR8y625fimWVyjkXgKu5YG8zS5O8LRwe5D9eJ/YZT9B7QmhiD5l3a5RbMr4nxBA+PWo5
 +qqqFhKDXrN+DM2mRigennMvirFd0ejHvOukxtpSkuYmq+R7zIgx5qZE4AtaV0xcvWkn
 kCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ce3V9rdPW4VRvOZyg4p6MJDnbIZ+yfMQOn2eHglZGRU=;
 b=dxxdxNFoPfgZX6Fqa8WkFndfSdDBWcGZ4PKfyF67SmnEHAY6j/y1JsQsVo0NL8MadZ
 D/GDLc0G2QxmgbnsiNe7weBcubkxQjiZhp7jUvYYGYfdONr77P7SbVyBclC4YTO2C+jo
 ZT8dxmkCTS7MUD7uIUpHsMcXdNE21LpTcEmhqkWo6u/d7dbnyPvJ/ejzW1bw93kdSOBz
 quWqRKggedRaYCbS0uvwikQitKIzSo6f0z/CL17qT+HdHbG0eVn7v6pPq51EghlWmSKX
 baO5XXUuz8pPel6LE8qLbflfzDdaY6bJDubixQm2YS/7eVuvajsGNrMYP6JuFctjC0IP
 Zm9Q==
X-Gm-Message-State: AAQBX9daCltuXKn9sNzaCYcW/MfM/rS17vb8UgA+TgBLA/GOZsE+hHq9
 qzlL80hrSU5qLegNL5dHIoPtveHBB+sww/sC2BA=
X-Google-Smtp-Source: AKy350YMt06WQpEfAaHpl48d+/MjpAYD+kj1PvO0MfU6C+zLr7QdQ/p9LmjOFrktC2sjNAH1HsQvzg==
X-Received: by 2002:a05:6870:1690:b0:177:bc4a:27da with SMTP id
 j16-20020a056870169000b00177bc4a27damr989000oae.18.1679523631814; 
 Wed, 22 Mar 2023 15:20:31 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:31 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 03/25] target/riscv/cpu.c: remove set_priv_version()
Date: Wed, 22 Mar 2023 19:19:42 -0300
Message-Id: <20230322222004.357013-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x1130.google.com
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

The setter is doing nothing special. Just set env->priv_ver directly.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2752efe1eb..18032dfd4e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -240,11 +240,6 @@ static void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext)
     env->misa_ext_mask = env->misa_ext = ext;
 }
 
-static void set_priv_version(CPURISCVState *env, int priv_ver)
-{
-    env->priv_ver = priv_ver;
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint8_t satp_mode_from_str(const char *satp_mode_str)
 {
@@ -343,7 +338,7 @@ static void riscv_any_cpu_init(Object *obj)
                                     VM_1_10_SV32 : VM_1_10_SV57);
 #endif
 
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
     register_cpu_props(obj);
 }
 
@@ -355,7 +350,7 @@ static void rv64_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -366,7 +361,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV39);
 #endif
@@ -379,7 +374,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -392,7 +387,7 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
 
     cpu->cfg.ext_g = true;
     cpu->cfg.ext_c = true;
@@ -431,7 +426,7 @@ static void rv128_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV128, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
 #endif
@@ -444,7 +439,7 @@ static void rv32_base_cpu_init(Object *obj)
     set_misa(env, MXL_RV32, 0);
     register_cpu_props(obj);
     /* Set latest version of privileged specification */
-    set_priv_version(env, PRIV_VERSION_1_12_0);
+    env->priv_ver = PRIV_VERSION_1_12_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -454,8 +449,9 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV32);
 #endif
@@ -468,7 +464,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -482,7 +478,7 @@ static void rv32_ibex_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    env->priv_ver = PRIV_VERSION_1_11_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -497,7 +493,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
     register_cpu_props(obj);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    env->priv_ver = PRIV_VERSION_1_10_0;
     cpu->cfg.mmu = false;
 #ifndef CONFIG_USER_ONLY
     set_satp_mode_max_supported(cpu, VM_1_10_MBARE);
@@ -1160,7 +1156,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (priv_version >= PRIV_VERSION_1_10_0) {
-        set_priv_version(env, priv_version);
+        env->priv_ver = priv_version;
     }
 
     /* Force disable extensions if priv spec version does not match */
-- 
2.39.2


