Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B96C5A5A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7Mt-0008S0-Mb; Wed, 22 Mar 2023 18:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Mp-0008Rr-Qw
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:55:39 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Mo-00032P-5d
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:55:39 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 w21-20020a9d6755000000b00698853a52c7so11235540otm.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7gzbVQ+ppMikngAzfGlNY7kDwQC9s27/btZylqBq0w=;
 b=HysYjz3wuKQT4ZzoYWO8m2n82/fzZOMKlMmFjZRDOxrowvPAXBzaT7C8AteF1amyeo
 +eR8eGuIoDfzv1K5GdgJg1lYoTkE6/FBi69AYoPe08b2qyu3PwOaURfJUjrigDYEFNB7
 7CPuwVmmcmCmvGP5fd4/VaiAPpfSO2wz5R5CEXWaxHKaQi+kcJqHvr3KxqH4BhK4U0ME
 8uYP0nVKavhD3rY4FcsOHFtJClPIHMeQSnSOvG5OoOIQ2Bh3642WWAPuIuT7OhKk03j2
 8NvcjDwZj1DaZA2lt3XnG6AGxjZmIUsf3dAtcCpVFd9Nlwu9Rz1QOb7gwEMPAP1WJYL6
 yq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525736;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7gzbVQ+ppMikngAzfGlNY7kDwQC9s27/btZylqBq0w=;
 b=7e5z0ZwMCriMD+9kaXUhjwELQRnrKHD5i3u6AfNiFKQHEpc511r85fNeikuSgb4dQm
 vz77LWc4kg9CjfT5NrPMJnEJzm4GoRkgOGy3Jiuve9wwdNS187VA19YDPS2lmW2tq1wY
 xsagOLu0UWH7VGD3nx4ebRTZ+zui2E5BFTMIQ8Y/iz/w+4+pR9r+Pn/+rFXLfipfn5+S
 vXju08CYIEeRgddWrBciYEMCeUSRtjH0H2OvLVzNfI7KYmS+pHCF5TIJxgUnyxu8Zija
 4ApQIi+cjCwe7/6az5l1OCz4upyAA1JA+vyHFabsiDU9IuvL2o4T+VLrvwD3CESdnYoU
 vmVw==
X-Gm-Message-State: AO0yUKXnox6OCPKTg7yGc81iyLsN7Fv2MB4oire8ImQouDiujW384xit
 vWhkqryDgcHzqzMfTelKuc1jy2jVBZ/jOqXgUBw=
X-Google-Smtp-Source: AK7set8Rci+4Zziva8pkgbEbFocl3I5HxGYQTchwWOj+2+piowF6woJL6ZNT3oUcSltv3OcQ01cWtA==
X-Received: by 2002:a05:6870:6129:b0:17a:b715:ab9a with SMTP id
 s41-20020a056870612900b0017ab715ab9amr792528oae.50.1679523625642; 
 Wed, 22 Mar 2023 15:20:25 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:25 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 01/25] target/riscv/cpu.c: add
 riscv_cpu_validate_v()
Date: Wed, 22 Mar 2023 19:19:40 -0300
Message-Id: <20230322222004.357013-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32e.google.com
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
end of riscv_cpu_validate_set_extensions(). Let's put it in its own
function and do it earlier.

We'll move it out of riscv_cpu_validate_set_extensions() in the near future,
but for now this is enough to clean the code a bit.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
---
 target/riscv/cpu.c | 86 ++++++++++++++++++++++++++--------------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1e97473af2..18591aa53a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -802,6 +802,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
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
  * cpu->cfg accordingly, doing a set_misa() in the end.
@@ -809,6 +849,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
     uint32_t ext = 0;
 
     /* Do some ISA extension error checking */
@@ -939,6 +980,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         }
     }
 
+    if (cpu->cfg.ext_v) {
+        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -993,44 +1042,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         ext |= RVH;
     }
     if (cpu->cfg.ext_v) {
-        int vext_version = VEXT_VERSION_1_00_0;
         ext |= RVV;
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
     }
     if (cpu->cfg.ext_j) {
         ext |= RVJ;
-- 
2.39.2


