Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077D6AD113
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIwl-0006jn-4w; Mon, 06 Mar 2023 17:04:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwh-0006fr-FD
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:39 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwf-0006rH-BM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:39 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a7so6827327pfx.10
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140276;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sw4cUZN+iUxpTBrMk/Qaqbs1F9cTtZOV/pb+ekV3IzM=;
 b=qSxz0nkjuOc455gdmKO0qRwkaZ3N2g4vvPYV8Sd6a7bDiHYKIyM9MvJ3cDvFBQDO1W
 sAz7Khc2tTDkRzdi/L/eV7xjwCGmazbco9S53SW65VemZmaBpX3FSp0Cax+/kWuN++bY
 kgnDR3YeJ/i4Bmauq0bx/yc9EHjQH9koadui0Hk/S1DYfMC7PUbizAPSStMWt4YIY3Kt
 eVN48EAGETTqqx/euf15Nv0x+VuHd6VRIL1F7265kWBwcTSNK4s1P5rUU+jgFksnojru
 HKfuQH+xT9heM30pVA1Zy9C4edvdVcFwYCRSh/FgueIuQvNmUJGRvXhKNU+cj11qa50I
 Pldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140276;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sw4cUZN+iUxpTBrMk/Qaqbs1F9cTtZOV/pb+ekV3IzM=;
 b=WfSp7ywOuMXCJx65bJYDAqTiGth88qqrikkHCbf/VgDU//qFzN89IJhe86v5kQTpOb
 0uhqqAPhMENIlL3ZCARVVC1oU6KuFJreiYwsMzhAw8JTk99x49WmsxPzFPzemu9Y3J/d
 NcD5CJ8BLPk5e5HMpq64kFuM8G4I1e5558AloRRBzRn61ZGMpoGzJNhgnTXX3SWyEMKU
 sC/XYrksq8iCkMIfhJWvF4EIVU5E11hUGvEkabg1HLmgQpoMnDOsoq7t7CrbBIWsbdup
 D2AJoLiEuzPXAv6JqWjZ10N1HtDj8DawWKjC6uXiIXeA1jzQltWQ82i8qJlptiPEpEta
 Yt+g==
X-Gm-Message-State: AO0yUKWpc/ROGLfwJuesI816YiM71OeyyP6NP8fN8/JV4WcoMnSC3FFS
 ejFk+QQ8z6BuL+RYsjaFUfLO1w==
X-Google-Smtp-Source: AK7set/pMtvob2aZ+iNQ8Va8andmCM/eNspCN6DL1C1uwp19BBXQ/T+89qhVTeQbskreQIOhGKHfTQ==
X-Received: by 2002:a62:1ad4:0:b0:5cf:4755:66d9 with SMTP id
 a203-20020a621ad4000000b005cf475566d9mr8515431pfa.24.1678140275846; 
 Mon, 06 Mar 2023 14:04:35 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 m19-20020aa79013000000b005d62cd8a3c9sm6694028pfo.71.2023.03.06.14.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:35 -0800 (PST)
Subject: [PULL 10/22] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Mon,  6 Mar 2023 14:02:47 -0800
Message-Id: <20230306220259.7748-11-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Frank Chang <frank.chang@sifive.com>, Andrew Jones <ajones@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=palmer@rivosinc.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Alexandre Ghiti <alexghiti@rivosinc.com>

One can extract the DeviceState pointer from the Object pointer, so pass
the Object for future commits to access other fields of Object.

No functional changes intended.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-ID: <20230303131252.892893-2-alexghiti@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0ad8f94a42..1c4d8aaa74 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -220,7 +220,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(DeviceState *dev);
+static void register_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -258,7 +258,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -267,7 +267,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -276,7 +276,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -286,7 +286,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -331,7 +331,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -341,7 +341,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -350,7 +350,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -360,7 +360,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -371,7 +371,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
     cpu->cfg.epmp = true;
@@ -383,7 +383,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -398,7 +398,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 #endif
 
@@ -1210,11 +1210,12 @@ static Property riscv_cpu_extensions[] = {
  * properties and leave. env.misa_ext = 0 means that we want
  * all the default properties to be registered.
  */
-static void register_cpu_props(DeviceState *dev)
+static void register_cpu_props(Object *obj)
 {
-    RISCVCPU *cpu = RISCV_CPU(OBJECT(dev));
+    RISCVCPU *cpu = RISCV_CPU(obj);
     uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
+    DeviceState *dev = DEVICE(obj);
 
     /*
      * If misa_ext is not zero, set cfg properties now to
-- 
2.39.2


