Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DCD6DE403
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:36:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIqV-0000vF-5R; Tue, 11 Apr 2023 14:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmIq3-0000Ej-QR
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:35:36 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmIq1-0008HQ-TP
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 14:35:31 -0400
Received: by mail-oi1-x230.google.com with SMTP id bb20so1188781oib.12
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 11:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681238127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qEsTxGvLvsUaZXsQ/JW6z6RCxq/TKEsXbTivyDouRwQ=;
 b=J1zQJTTQhX5oEECV3T0YZI+Hyko57DxUmEUmu7Obd15YA0pO8h0dw+2J5Dt+9Bs4aG
 koGOU8/fRXwr5MLe30j7G1sXY9OkXBgs10NfNoR8RnE1JMEl4hc4XxLqXQNzTGHmUv5b
 QV50s8hU1kteKFqSTazMeXWQ+WNr+jzi070K8QDufsR152MXkCTyBTHPpqO3VGaai2De
 DWCKIFy7ObhrLl7tQLmAfG4HwryglRZT/PpRTqGfv3X6RCT+me4MSuPpF4XuuoUZ9OeJ
 QPHoFP59KquOK46IiwjI6bKWO+Ee+BzCF7akpRCCju/82vy4Htm4mxjpad4gjJZUqM6A
 KTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681238127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEsTxGvLvsUaZXsQ/JW6z6RCxq/TKEsXbTivyDouRwQ=;
 b=OAiD6K76921yTI1XSS8Q1x/eZ/3A1V+5Hoyuci2abKg/JJbXuhNJZnIwaQ9NCVyGZK
 OrB7CDgNKrglO6YB3745HFqz9KE4IUlLM3F7p6EB6AAkLdHwbt2FBNMorANNTP64syAx
 e4pZ5dtxMEBntzi/I0rITVNAtBmxSBtTZbs7iArtNUngYvm5LYAa3wU+N5ZF8K6dlCon
 uoH2Gi63qLgmQXN/F7encHpzHR+eH8/lUR/ceoFEP0cJeeYBK/m94vjlCimnPR3BBpUG
 5RP0bi9hVRZWFoReb6qbBHhTDv6gS9tlB3Hs9KBYCXbZ5uJLFrO6gzx0cTCxyx4dolrY
 VliA==
X-Gm-Message-State: AAQBX9eCq2BM21HZ8fUMHHNdWjdshrf7i22o1HaCbchl6on1drbO9jTp
 OQDpOHOfXrzvoEZEsMGUSoJUMWeItyUVrhTFJ1M=
X-Google-Smtp-Source: AKy350bVRkmc/kqmtqimEBbMaaTgddaN/izUdDY3kuaEXejrV1Pv0MIZM6s7URi5d+wO4p/B4u0T6g==
X-Received: by 2002:a05:6808:1416:b0:389:7ffe:5059 with SMTP id
 w22-20020a056808141600b003897ffe5059mr1947978oiv.58.1681238127317; 
 Tue, 11 Apr 2023 11:35:27 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 4-20020a4a1404000000b005413e617935sm6149983ood.15.2023.04.11.11.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 11:35:26 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 3/3] target/riscv: add TYPE_RISCV_DYNAMIC_CPU
Date: Tue, 11 Apr 2023 15:35:11 -0300
Message-Id: <20230411183511.189632-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411183511.189632-1-dbarboza@ventanamicro.com>
References: <20230411183511.189632-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x230.google.com
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

This new abstract type will be used to differentiate between static and
non-static CPUs in query-cpu-definitions.

All generic CPUs were changed to be of this type. Named CPUs are kept as
TYPE_RISCV_CPU and will still be considered static.

This is the output of query-cpu-definitions after this change for the
riscv64 target:

$ ./build/qemu-system-riscv64 -S -M virt -display none -qmp stdio
{"QMP": {"version": (...)}
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
{"name": "sifive-u54", "typename": "sifive-u54-riscv-cpu", "static": true, "deprecated": false}
]}

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h        |  2 +-
 target/riscv/cpu.c            | 20 ++++++++++++++++----
 target/riscv/riscv-qmp-cmds.c |  4 ++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b9318e0783..b29090ad86 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -23,6 +23,7 @@
 #include "qom/object.h"
 
 #define TYPE_RISCV_CPU "riscv-cpu"
+#define TYPE_RISCV_DYNAMIC_CPU "riscv-dynamic-cpu"
 
 #define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
 #define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
@@ -66,5 +67,4 @@ struct RISCVCPUClass {
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
 };
-
 #endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index fab38859ec..56f2b345cf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1788,6 +1788,13 @@ void riscv_cpu_list(void)
         .instance_init = initfn            \
     }
 
+#define DEFINE_DYNAMIC_CPU(type_name, initfn) \
+    {                                         \
+        .name = type_name,                    \
+        .parent = TYPE_RISCV_DYNAMIC_CPU,     \
+        .instance_init = initfn               \
+    }
+
 static const TypeInfo riscv_cpu_type_infos[] = {
     {
         .name = TYPE_RISCV_CPU,
@@ -1799,23 +1806,28 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_size = sizeof(RISCVCPUClass),
         .class_init = riscv_cpu_class_init,
     },
-    DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+    {
+        .name = TYPE_RISCV_DYNAMIC_CPU,
+        .parent = TYPE_RISCV_CPU,
+        .abstract = true,
+    },
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
 #if defined(CONFIG_KVM)
     DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
 #if defined(TARGET_RISCV32)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE32,   rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rv32_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rv32_sifive_u_cpu_init),
 #elif defined(TARGET_RISCV64)
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           rv64_base_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE64,   rv64_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rv64_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
-    DEFINE_CPU(TYPE_RISCV_CPU_BASE128,          rv128_base_cpu_init),
+    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 128677add9..5ecff1afb3 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -33,11 +33,15 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
     CpuDefinitionInfoList **cpu_list = user_data;
     CpuDefinitionInfo *info = g_malloc0(sizeof(*info));
     const char *typename = object_class_get_name(oc);
+    ObjectClass *dyn_class;
 
     info->name = g_strndup(typename,
                            strlen(typename) - strlen("-" TYPE_RISCV_CPU));
     info->q_typename = g_strdup(typename);
 
+    dyn_class = object_class_dynamic_cast(oc, TYPE_RISCV_DYNAMIC_CPU);
+    info->q_static = dyn_class == NULL;
+
     QAPI_LIST_PREPEND(*cpu_list, info);
 }
 
-- 
2.39.2


