Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B046A982E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:15:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY5F7-0005FC-0M; Fri, 03 Mar 2023 08:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5F4-000572-Hi
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:14:34 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5F2-0008KH-Ib
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:14:34 -0500
Received: by mail-wm1-x335.google.com with SMTP id p26so1541028wmc.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 05:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677849271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q244UH1X0Qq28sL8qCMK3QrXi2ZbEVOh6RiT7mirFEc=;
 b=FhIF7bOK/8tqLWp8TpgHao5zAcw8FSDm53jEHCDrnet1VNq96HpP2XCtqUd3Q+7s4U
 jInpT2j3DenoQjbcbhBy9wjRmPKxaWXIF+HUNTj+B4Zrlix5sfgpFrKJCJN4Iy+LY/dT
 vlSLRCTToFFLacWA7BH57Z8uVjAiOxmNhg6f6+ZBoyatctAMqOjXvVfGdhZLCmwyz+dI
 4u/KXGlwstuQuY08hvJ1v7oIx61gMQ94v0LF81+EXaCG+NoZtotllOyKUzj6lrdOd+Lr
 KfiM4zFRGsIL8i3HdJfbDN6reM0QaSHr8q/69LgqNqSJeC32Pdh0LVRuBJQVf2wdc31C
 ulmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677849271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q244UH1X0Qq28sL8qCMK3QrXi2ZbEVOh6RiT7mirFEc=;
 b=shhwhd1b7uuYHDsyLY9SXgXGPE+m/4y3CAJs+xDZVaHSmD4OyYffZ08xiSkmQSXSsU
 eH/AXOutzMCVbcZuAsSX1/5F7prkPqSFIA/WMLdUFuwEVl9x5JOeaBAv6zQqYloJJsAu
 eQxatKHRZYYwmJ+JbzLUMifN2DhHiACP6W4Vn6zPQXgDjxJcKM9taNcbPJJ1H9BA+rVf
 /iWlM8QsNTs+N/TfuSO6TNRMUEWKrZdewZAFNthQfi2vyNoVoK/Cdtkb4fKSHInGpx/k
 y7ZvDrHzb2zoCCFKFzaUxPo9UW5dp3A4QZ02k76/F1vX8/fn4cTcfKgndFNtKK5uk86S
 bU2A==
X-Gm-Message-State: AO0yUKXMSAMIayxhFgI5GPImSNeg9A5v43k/Jwq5/1E21UEvoO/UkJqo
 7s7KuryeDsT6Vs0zjYVEFtFmOw==
X-Google-Smtp-Source: AK7set97Mn0O2StlUdYm3F5ghjiVUP/+9pUmncJscr9u5f+hbf6vADx5+XPbzmOg3tZGeFe/sp4qyg==
X-Received: by 2002:a05:600c:4687:b0:3e2:201a:5bcc with SMTP id
 p7-20020a05600c468700b003e2201a5bccmr1622369wmo.33.1677849271120; 
 Fri, 03 Mar 2023 05:14:31 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a056000110400b002ce3b31753fsm1103722wrw.26.2023.03.03.05.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 05:14:30 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Bin Meng <bmeng@tinylab.org>
Subject: [PATCH v11 1/5] riscv: Pass Object to register_cpu_props instead of
 DeviceState
Date: Fri,  3 Mar 2023 14:12:48 +0100
Message-Id: <20230303131252.892893-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303131252.892893-1-alexghiti@rivosinc.com>
References: <20230303131252.892893-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x335.google.com
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

One can extract the DeviceState pointer from the Object pointer, so pass
the Object for future commits to access other fields of Object.

No functional changes intended.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 target/riscv/cpu.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9eb748a283..5dc11d6670 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -213,7 +213,7 @@ static const char * const riscv_intr_names[] = {
     "reserved"
 };
 
-static void register_cpu_props(DeviceState *dev);
+static void register_cpu_props(Object *obj);
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
 {
@@ -251,7 +251,7 @@ static void riscv_any_cpu_init(Object *obj)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
     set_priv_version(env, PRIV_VERSION_1_12_0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 
 #if defined(TARGET_RISCV64)
@@ -260,7 +260,7 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -269,7 +269,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -279,7 +279,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -324,7 +324,7 @@ static void rv128_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV128, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -334,7 +334,7 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     /* Set latest version of privileged specification */
     set_priv_version(env, PRIV_VERSION_1_12_0);
 }
@@ -343,7 +343,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -353,7 +353,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -364,7 +364,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
     cpu->cfg.epmp = true;
@@ -376,7 +376,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -391,7 +391,7 @@ static void riscv_host_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, 0);
 #endif
-    register_cpu_props(DEVICE(obj));
+    register_cpu_props(obj);
 }
 #endif
 
@@ -1161,11 +1161,12 @@ static Property riscv_cpu_extensions[] = {
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
2.37.2


