Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8D6CC968
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:37:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDF1-0008J6-At; Tue, 28 Mar 2023 13:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEz-0008GR-ES
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:36:13 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEx-0005MC-PX
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:36:13 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-17786581fe1so13494372fac.10
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680024970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rUOwa3wbbfPfghjgjPGJgBy5tq7nZVthZ1BaaaPp4qs=;
 b=cXDHq3H3OD+VAcSM29Fqamh7NkMbqcAWuujIkQkWbHYT4vb9Pc1miWJZA4gtmDwRpw
 qHIlnuwNZAcaanbDNK0llMi2SGVuhtsEJAJJ33we8M5DqJzD3NirYBJHWC+HQd9TxC5w
 kJhYU95nUqPtdwyDm065Jqh38NlFVClSbDsjgwPJTfv3gLpdyS2mIYN5NHhjb9g4tSWh
 2Ok9dcXQ7GMQpzzetkCdJQgfkflltuG64rJ/Civs1Oj3FG2JF1zQMma4vEfey9//fgLs
 IDq1auz64FB1Ki6zbE4UIZRtxfrJEQBon2d1rUr2PCdzxmI+rzptN+eWNgfU40zH+XK4
 vBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rUOwa3wbbfPfghjgjPGJgBy5tq7nZVthZ1BaaaPp4qs=;
 b=zUkeaiZtwBI3/PUYYDx4JPvXAQaRG0LU05G8Jky8yr73CilLsSJclEoPcgPIdI7Ij9
 /uggN8s0+Xo/MEUBZ5aDneTIW5Z94fyQ1Set2WPBizZ3SO5pc3L6JNs2HFElhVfYLHUy
 EmDeEyeFMTgZAhIsEV9psJCu9ijfVz7Nq03woc7yInZ14slHT2j+WpOEgBxvnzEfkaiE
 ysGk7/yaYfegvdQytx6VcS34MbWMMT+HKvYPslZoWHUlLJlmaG0TbRo1HYHKzWd+3fK1
 c99dqckAdefjclEw1qfPgMxzFR+R+dbi00yo7b06Zxar4uDnqsxwtor/zcYchGDpH9Bj
 IuYQ==
X-Gm-Message-State: AAQBX9e9hvVVxjqIOZqh6UBaCfh3gIhVjk01M0UZBqTdAHY+iuEgFjcB
 02h8Q0jqpH8vL7MajpKwro+Aqh1qXyHlPkYzOhU=
X-Google-Smtp-Source: AK7set+uDUAHKa6j1wDxm8tRC9pSObQkJz+tEJMEl7owZWDg6dXvbPCZVvqxwHYbO7Za10Z9z+YAOQ==
X-Received: by 2002:a05:6870:3846:b0:17a:cfe4:3782 with SMTP id
 z6-20020a056870384600b0017acfe43782mr10571377oal.11.1680024970687; 
 Tue, 28 Mar 2023 10:36:10 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d6442000000b0069f0a85fa36sm11635654otl.57.2023.03.28.10.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:36:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 6/9] target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
Date: Tue, 28 Mar 2023 14:35:40 -0300
Message-Id: <20230328173543.431342-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328173543.431342-1-dbarboza@ventanamicro.com>
References: <20230328173543.431342-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
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

Let's remove more code that is open coded in riscv_cpu_realize() and put
it into a helper. Let's also add an error message instead of just
asserting out if env->misa_mxl_max != env->misa_mlx.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 50 ++++++++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a9042b190d..05878846f9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -867,6 +867,33 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
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
@@ -1135,7 +1162,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     RISCVCPU *cpu = RISCV_CPU(dev);
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
-    CPUClass *cc = CPU_CLASS(mcc);
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1144,6 +1170,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
@@ -1172,22 +1204,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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
2.39.2


