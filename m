Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E36DC999
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 18:54:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plulX-0003rj-RE; Mon, 10 Apr 2023 12:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulV-0003rB-Rw
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:13 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulT-0007Io-Ki
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:13 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-18447b9a633so3924956fac.7
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681145590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8S9VXdeC8xdVFGVtSrYNnF6V/UoWhvL4Al8I8wZ8h/E=;
 b=beiqwl4LcSryXdjQpwOh9PCkZcaScvlnf0fMPxFzTFsIEdbO8+CDo/FSVSGdPVZeVv
 Yy/YRQB5wMXLI6pNCxwv7Fq9MUn5ytBh+3BApzcCRBdJWlPN5G0FrlbLYAqTjjIMy3Sr
 GA6NhbHPzfMZ+ALxMVqGzNzQWcaPMwV+teT4ImOH7RqBI9RsS6CuVY/XXn8MG/rvFUUL
 ZdxWacBc3Urlc/CjFEy10NzQ64MYirEFJSxnYg6eqqTXOnu3AS3pxww3SBL5DKP+psie
 qXqkLLnPnimmbcJvyq2o/OO2LRnYQ0iihcJDYm4hbMoxsDq7195pIVEzRXkYeFXzcPkj
 79dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681145590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8S9VXdeC8xdVFGVtSrYNnF6V/UoWhvL4Al8I8wZ8h/E=;
 b=t73ctkY9+Kc+r6IdBGW7uN/MrlUlIAfi38VwD3ZCJ2PEmMMX1gDJQQU29NNAE8wVT3
 fGyI+GChuEi967kCPgd8L1GM6eM7PeM8pOJQmJN8xL+oheHnUvP9Wrp+u6gcY3RwqpHO
 4O/7Huazy34ZThZGxYMdr7fhIxRIvXDmAMbN3MzhiGvMmyqHggzTQ8ZIWLCrA2oG1hI9
 pl7ahHe33X7kWbNQtD9vAEdkdqPNG5UAyJs3PLVKLcdg6FFN4AFYdEpOC8ZUTqHJV+tm
 1xwQWHk2DVVqCHg25eSWbqgf4HawnqGB+DjYri5Fpl+rUhcL0dsrldh4mYZtzkQbP4Pn
 rlpw==
X-Gm-Message-State: AAQBX9c47xLZyEqg+oaB1KYDLiauXWltYVFAhCCafHFcsYfENaccU1Or
 3KamD9mEJZU+wE6Uk/ui3YVLX9IVONmnlvc+Mrw=
X-Google-Smtp-Source: AKy350aOUpQEWptmcihM4jdTKcKdEFZESR8foSz3hqe71QjvrUCXxVhyPe3uROnNv/i22cSFg+aubg==
X-Received: by 2002:a05:6870:4191:b0:17e:a87f:1eac with SMTP id
 y17-20020a056870419100b0017ea87f1eacmr9923480oac.21.1681145590703; 
 Mon, 10 Apr 2023 09:53:10 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 zq36-20020a0568718ea400b0017f647294f5sm4191896oab.16.2023.04.10.09.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 09:53:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 4/4] target/riscv: make generic cpus not static
Date: Mon, 10 Apr 2023 13:52:51 -0300
Message-Id: <20230410165251.99107-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410165251.99107-1-dbarboza@ventanamicro.com>
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
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
 target/riscv/cpu.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 30a1e74ea6..cc881ef040 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -340,6 +340,13 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 }
 #endif
 
+static void riscv_generic_cpu_class_init(ObjectClass *c, void *data)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
+
+    mcc->static_model = false;
+}
+
 static void riscv_any_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
@@ -1779,6 +1786,14 @@ void riscv_cpu_list(void)
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
@@ -1790,23 +1805,27 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_size = sizeof(RISCVCPUClass),
         .class_init = riscv_cpu_class_init,
     },
-    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_ANY, riscv_any_cpu_init,
+                            riscv_generic_cpu_class_init),
 #if defined(CONFIG_KVM)
     DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
 #if defined(TARGET_RISCV32)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE32, rv32_base_cpu_init,
+                            riscv_generic_cpu_class_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE64, rv64_base_cpu_init,
+                            riscv_generic_cpu_class_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
+    DEFINE_CPU_WITH_CLASSFN(TYPE_RISCV_CPU_BASE128, rv128_base_cpu_init,
+                            riscv_generic_cpu_class_init),
 #endif
 };
 
-- 
2.39.2


