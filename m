Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1662E6CF419
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 22:11:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phc6a-0006JP-G7; Wed, 29 Mar 2023 16:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6Y-0006Fm-7V
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:10 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6W-0007nu-AL
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:09 -0400
Received: by mail-oi1-x22c.google.com with SMTP id f17so12527441oiw.10
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 13:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gd8YfeDLqtnsOXHA+AJ6ejp6SdNe/hfDrQLtit29++Q=;
 b=CFXRvJLdz6XMD1rN0m/2sN8NUAD4Ck/ZmdTOwKbcFq64lx+oknFgUGCyNnTpFBYKif
 qEci+tsRGw1OPQw88ZDiZBE7KqhSv3RXk1eFMIH86SgCMKLb2ayL8/VBcHGBwwHl/kN5
 7tdY4u+X2GG1M7rnu42pL31YoT6anSAo2wd36lOZ0Em+Ry7LoDKwXL+GFYJ0V0fC9DDe
 ZzGM8JKw9bbqq1IIAijQnMlpT8+tculEnrdqnvAzh+PKc5k/zsWlKgOxsRdXOpcu7GC4
 D0BFgPDUaBqPHfXoHKAhXa8hFWARel3PRe2jDuO3vhr8pqrEMDyCfzFQEgau9vjBlTtd
 YxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gd8YfeDLqtnsOXHA+AJ6ejp6SdNe/hfDrQLtit29++Q=;
 b=TbqVLIsveX4dMLFoM+TaLfNuSDjnTUVcQ2HOIc/XMSfazShLRKidgfYmR7jjCKBhC9
 Qp7aoEm0GNtvmy19LxxL3tftuCG3DJL4u8WSvwDWTJy+W8ArsKAlM7Zk8U1xcv6FR2U4
 NAas5sx7Z/pMlF7LeEi2/v+LE2QR5j/+ghttqUBx//NAEuUHJgviOwbd9l0eolzwNL1L
 jsNlNUImpzbpTca6AhwaE7bxxO1gKfIFcpT5HD4bJvGQwSOZvevIljBlWNhOm+e7vojb
 zhUbipMNlT0YHOEe1cdeN6200zModIQqucJQ9RFTU1rx0yxS6I1sUtntujwldh7yM4GU
 5Z+w==
X-Gm-Message-State: AAQBX9ccK4jeI3lrhmJde6vni6VWEzV6kvlg9ttnn4LLbw4zfNbb6Zve
 2UF/eUUPy2lv1yAW0LFo4c1BzO4R4i16U8NFVbs=
X-Google-Smtp-Source: AKy350Y43FXZv+BoboOF+0UDCqau5ujSnh4rZWwfPEfMmVQ8LtbLo9JsZMlD3NHIrjCIxscPDMZ/ew==
X-Received: by 2002:a05:6808:1a06:b0:389:21:9483 with SMTP id
 bk6-20020a0568081a0600b0038900219483mr8877066oib.59.1680120546894; 
 Wed, 29 Mar 2023 13:09:06 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 1/9] target/riscv/cpu.c: add riscv_cpu_validate_v()
Date: Wed, 29 Mar 2023 17:08:48 -0300
Message-Id: <20230329200856.658733-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329200856.658733-1-dbarboza@ventanamicro.com>
References: <20230329200856.658733-1-dbarboza@ventanamicro.com>
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

The RVV verification will error out if fails and it's being done at the
end of riscv_cpu_validate_set_extensions(), after we've already set some
extensions that are dependent on RVV.  Let's put it in its own function
and do it earlier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 89 +++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d8568a024c..610e55cb04 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -790,6 +790,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     }
 }
 
+static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
+                                 Error **errp)
+{
+    int vext_version = VEXT_VERSION_1_00_0;
+
+    if (!is_power_of_2(cfg->vlen)) {
+        error_setg(errp, "Vector extension VLEN must be power of 2");
+        return;
+    }
+    if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
+        error_setg(errp,
+                   "Vector extension implementation only supports VLEN "
+                   "in the range [128, %d]", RV_VLEN_MAX);
+        return;
+    }
+    if (!is_power_of_2(cfg->elen)) {
+        error_setg(errp, "Vector extension ELEN must be power of 2");
+        return;
+    }
+    if (cfg->elen > 64 || cfg->elen < 8) {
+        error_setg(errp,
+                   "Vector extension implementation only supports ELEN "
+                   "in the range [8, 64]");
+        return;
+    }
+    if (cfg->vext_spec) {
+        if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
+            vext_version = VEXT_VERSION_1_00_0;
+        } else {
+            error_setg(errp, "Unsupported vector spec version '%s'",
+                       cfg->vext_spec);
+            return;
+        }
+    } else {
+        qemu_log("vector version is not specified, "
+                 "use the default value v1.0\n");
+    }
+    set_vext_version(env, vext_version);
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -797,6 +837,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
 
     /* Do some ISA extension error checking */
     if (riscv_has_ext(env, RVG) &&
@@ -865,8 +906,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* The V vector extension depends on the Zve64d extension */
     if (riscv_has_ext(env, RVV)) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /* The V vector extension depends on the Zve64d extension */
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -947,46 +994,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksed = true;
         cpu->cfg.ext_zksh = true;
     }
-
-    if (riscv_has_ext(env, RVV)) {
-        int vext_version = VEXT_VERSION_1_00_0;
-        if (!is_power_of_2(cpu->cfg.vlen)) {
-            error_setg(errp,
-                       "Vector extension VLEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
-            error_setg(errp,
-                       "Vector extension implementation only supports VLEN "
-                       "in the range [128, %d]", RV_VLEN_MAX);
-            return;
-        }
-        if (!is_power_of_2(cpu->cfg.elen)) {
-            error_setg(errp,
-                       "Vector extension ELEN must be power of 2");
-            return;
-        }
-        if (cpu->cfg.elen > 64 || cpu->cfg.elen < 8) {
-            error_setg(errp,
-                       "Vector extension implementation only supports ELEN "
-                       "in the range [8, 64]");
-            return;
-        }
-        if (cpu->cfg.vext_spec) {
-            if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
-                vext_version = VEXT_VERSION_1_00_0;
-            } else {
-                error_setg(errp,
-                           "Unsupported vector spec version '%s'",
-                           cpu->cfg.vext_spec);
-                return;
-            }
-        } else {
-            qemu_log("vector version is not specified, "
-                     "use the default value v1.0\n");
-        }
-        set_vext_version(env, vext_version);
-    }
 }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.39.2


