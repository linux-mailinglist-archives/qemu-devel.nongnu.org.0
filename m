Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00ADD6DC6C9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 14:31:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plqfL-0007Q0-MG; Mon, 10 Apr 2023 08:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqey-0007I7-2c
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 08:30:13 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqet-000162-6Q
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 08:30:09 -0400
Received: by mail-oi1-x22c.google.com with SMTP id bl22so21003659oib.11
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681129805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8eN100PVmLq4Irfczq1tK9TJADhtWJGfBNp8oFnf+o=;
 b=jtXYKgf+GwxgzXxnxsueQlBrr2Z+i0D1XGTDZiZSPurucYJVdIBAlC8OM2nr5AH+qs
 zeaxvZQm9XpzIQj56PQDsYKwLICzg1hLk6BSJLC5Ab8yRjEQ9GDU7UA67sCTKAQYBGlc
 J59NH/fr3DylmkNbktwhgHn2B9yLaNU4S4tgAagvfVQf5s05xn7B8Ywcj8NmLPrr3hlp
 wLCVRKTCuzUsJDu5muwJbqpmTlLCuj48BaSuNdP8JSLv564sLlhzfTkZ+ptNextjOsEM
 4k25tRE+GEMFnxD8ws5cHCHhY+tJNQmhggSviTs7/ljBipL27FFTiisOeqf/kcMQr8XM
 PV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681129805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8eN100PVmLq4Irfczq1tK9TJADhtWJGfBNp8oFnf+o=;
 b=bIvsIuiuOuQEMCwWLpt/2qoqmKqJs8oILleBOy67rZhcZoE4rvdQLiBXmEZNXF0/83
 7fdFA7ck68vBBi1HlTRv0VMkCCFPuZAHWO+EWFGgFS0gEr+C7n6DS4mdkAYbFftAQ34I
 Tt2xaZgURur9rrCs8d3seoHtKRIMaSkU8E0zcqRob8Kjy486ILC4vEbd0oDs1/4l9GV4
 N60KlO30+7ejUuk28GDtBut/Oa5fABtOWfztoChsJ0R/Vn+zbyMcAGQXGHtLW3mVXKRV
 tj6St9X/gr4ft5Xd0xS0p62XB3ciIZtb9Jm9atsaZglBtM9S4YRLJY2/JzO5lbVbUTCx
 QWwQ==
X-Gm-Message-State: AAQBX9fC6AZk3b9Zl3qbkiENWUYRWOaTF+eHteA2sWRrFZbDE0++JkRo
 INf1pFKZ/8SYE8ZZYzTZKS/yezRkwpsfTn4azAE=
X-Google-Smtp-Source: AKy350alOk807TBHvhHO8UOElQ1z3yZ6e7+PjYJENPl4huS2NW6Flz+Jg9povlm39SIHbgfKNUeMWw==
X-Received: by 2002:aca:1715:0:b0:38b:79e1:3fda with SMTP id
 j21-20020aca1715000000b0038b79e13fdamr4282593oii.34.1681129804497; 
 Mon, 10 Apr 2023 05:30:04 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 o13-20020a056808124d00b00387160bcd46sm4297016oiv.46.2023.04.10.05.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 05:30:04 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 4/4] target/riscv: make generic cpus not static
Date: Mon, 10 Apr 2023 09:29:45 -0300
Message-Id: <20230410122945.77439-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410122945.77439-1-dbarboza@ventanamicro.com>
References: <20230410122945.77439-1-dbarboza@ventanamicro.com>
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

A CPU is declared static or not by changing the class attribute
'static'. For now the base class is defining every CPU as static via
riscv_cpu_class_init().

To change this setting for generic CPUs we'll need a different class
init for them. Then we'll ned a macro that allows us to set a different
.class_init implementation for the CPU. With all that we're now able to
set 'static' as false for the 'any', 'rv32', 'rv64' and 'x-rv128' CPUs.
For the riscv64 target:

$ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
{"QMP": {"version": (...) }
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}
{"execute": "query-cpu-definitions"}
{"return": [
{"name": "rv64", "typename": "rv64-riscv-cpu", "static": false, "deprecated": false},
{"name": "sifive-e51", "typename": "sifive-e51-riscv-cpu", "static": true, "deprecated": false},
{"name": "any", "typename": "any-riscv-cpu", "static": false, "deprecated": false},
{"name": "x-rv128", "typename": "x-rv128-riscv-cpu", "static": false, "deprecated": false},
{"name": "shakti-c", "typename": "shakti-c-riscv-cpu", "static": true, "deprecated": false},
{"name": "thead-c906", "typename": "thead-c906-riscv-cpu", "static": true, "deprecated": false},
{"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": true, "deprecated": false}]
}

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 30a1e74ea6..4a9624404c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -340,6 +340,13 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 }
 #endif
 
+static void riscv_any_cpu_class_init(ObjectClass *c, void *data)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
+
+    mcc->static_model = false;
+}
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -360,6 +367,13 @@ static void riscv_any_cpu_init(Object *obj)
 }
 
 #if defined(TARGET_RISCV64)
+static void rv64_base_cpu_class_init(ObjectClass *c, void *data)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
+
+    mcc->static_model = false;
+}
+
 static void rv64_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -430,6 +444,13 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 #endif
 }
 
+static void rv128_base_cpu_class_init(ObjectClass *c, void *data)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
+
+    mcc->static_model = false;
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -449,6 +470,13 @@ static void rv128_base_cpu_init(Object *obj)
 #endif
 }
 #else
+static void rv32_base_cpu_class_init(ObjectClass *c, void *data)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
+
+    mcc->static_model = false;
+}
+
 static void rv32_base_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -1779,6 +1807,14 @@ void riscv_cpu_list(void)
         .instance_init = initfn            \
     }
 
+#define DEFINE_CPU_WITH_CLASSFN(type_name, initfn, classfn) \
+    {                                      \
+        .name = type_name,                 \
+        .parent = TYPE_RISCV_CPU,          \
+        .instance_init = initfn,           \
+        .class_init = classfn              \
+    }
+
 static const TypeInfo riscv_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU,
@@ -1790,23 +1826,27 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_size = sizeof(RISCVCPUClass),
         .class_init = riscv_cpu_class_init,
     },
-    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_ANY, riscv_any_cpu_init,
+                            riscv_any_cpu_class_init),
 #if defined(CONFIG_KVM)
     DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
 #if defined(TARGET_RISCV32)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE32, rv32_base_cpu_init,
+                            rv32_base_cpu_class_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE64, rv64_base_cpu_init,
+                            rv64_base_cpu_class_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE128, rv128_base_cpu_init,
+                            rv128_base_cpu_class_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
 #endif
 };
 
-- 
2.39.2


