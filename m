Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00F6EABA3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:29:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqoL-0002Tl-JY; Fri, 21 Apr 2023 09:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnw-0002FP-9q
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:28:00 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppqnu-0003u5-F6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:27:59 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-541b69a8355so655986eaf.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682083677; x=1684675677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9G76Yn3Vxy1PuEW01LasjD65akRIwetzGF2RPX1SbQ=;
 b=liK86/4PpO5TZ6RG4jVQbDOBnRdYPC11M/RfY09kSvBB4ZoG5smHt6eHGyPYE42Mnk
 raQGkJ82qWN0H55xV+QGvSV0w6NX/GkJqBL5umQFJouWm7QvKbNyIpfjqmO7QMpuLHlO
 zHYgfn95FDq+Jl4UaxuLuLpMlQCXIrH+WvehnYoT4V3R8KYfP8utBKSDsg8wKtZyNMAb
 keqoS4YFTv0s2pQMnzE2V05YOh8IYOanFw41QK5aFmnJfzQ3GDGxj8slHkKtpFGS5h7i
 SLSnvPjR5vRnVxeo+bQwRIQuBlYsK0JGKgHRk+94mtM89wV5X+u5rJLyFLgLK7dge2lE
 46Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682083677; x=1684675677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h9G76Yn3Vxy1PuEW01LasjD65akRIwetzGF2RPX1SbQ=;
 b=lc9xe9kuvQoxPdMb1Q9quRLj+h/dpLJHiP+/DcyzDaK08pNtmwVE4iOP7HfrqNUeiL
 1HYVSwqyXMb2Lws29FLGQEfSSyQksnRub5cHIr2VByNW0pL5GJO2tiPEd6eiwHNRxyeq
 o1U+StlgjAgNTuWhCH3GGaS2USfNJ5iOoEvT1qCPWo0e24Z2w8+epwRRYsQ8UAIZzvd+
 9bavorYdaJsY85/RCi4PqRKVuAJeCr41IVMEgBf7TDdES/JGCCXOQomIgPO/85HjTAd2
 MWEiWNc1AMEIgqz8/7EMoc/deO+mdLEGCiur1njuM7v779nwK3FNnzCKYbAb++DX16Ci
 yahw==
X-Gm-Message-State: AAQBX9foCRfVoJHuZShJ1tzr2uoohkIP3Khv/c2JuV5lh/RYgDO63dqu
 ZNO8fz1eWdIUTXAitLfcjRmbnBFW9nHLG8vEvAs=
X-Google-Smtp-Source: AKy350blg5Sykj8EK0DE6glshQkFh+HwRcJRK4du6+KMJ6Kxk+n8Wl7tRPecMfS8P4iQYm0qmEbLMQ==
X-Received: by 2002:aca:1818:0:b0:38e:88b6:1808 with SMTP id
 h24-20020aca1818000000b0038e88b61808mr981655oih.5.1682083676533; 
 Fri, 21 Apr 2023 06:27:56 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 r84-20020acada57000000b003895430852dsm1623359oig.54.2023.04.21.06.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 06:27:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v8 08/11] target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
Date: Fri, 21 Apr 2023 10:27:24 -0300
Message-Id: <20230421132727.121462-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421132727.121462-1-dbarboza@ventanamicro.com>
References: <20230421132727.121462-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Let's remove more code that is open coded in riscv_cpu_realize() and put
it into a helper. Let's also add an error message instead of just
asserting out if env->misa_mxl_max != env->misa_mlx.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 50 ++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index c928925544..43635144bd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -873,6 +873,33 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
+{
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
+    CPUClass *cc = CPU_CLASS(mcc);
+    CPURISCVState *env = &cpu->env;
+
+    /* Validate that MISA_MXL is set properly. */
+    switch (env->misa_mxl_max) {
+#ifdef TARGET_RISCV64
+    case MXL_RV64:
+    case MXL_RV128:
+        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
+        break;
+#endif
+    case MXL_RV32:
+        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (env->misa_mxl_max != env->misa_mxl) {
+        error_setg(errp, "misa_mxl_max must be equal to misa_mxl");
+        return;
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -1195,7 +1222,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    CPUClass *cc = CPU_CLASS(mcc);
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1204,6 +1230,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    riscv_cpu_validate_misa_mxl(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     riscv_cpu_validate_priv_spec(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1232,22 +1264,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 #endif /* CONFIG_USER_ONLY */
 
-    /* Validate that MISA_MXL is set properly. */
-    switch (env->misa_mxl_max) {
-#ifdef TARGET_RISCV64
-    case MXL_RV64:
-    case MXL_RV128:
-        cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
-        break;
-#endif
-    case MXL_RV32:
-        cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
-        break;
-    default:
-        g_assert_not_reached();
-    }
-    assert(env->misa_mxl_max == env->misa_mxl);
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.40.0


