Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA16E4AAD
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 16:04:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPQ6-000610-9D; Mon, 17 Apr 2023 10:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPV-0004Xp-1C
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:00:53 -0400
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPS-0003GI-Qi
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:00:48 -0400
Received: by mail-oo1-xc2a.google.com with SMTP id
 m20-20020a4ae3d4000000b00538c0ec9567so3758404oov.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 07:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740045; x=1684332045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B9RqWisOWEV3iFXKyP/p1DxzybhrkeUZ+i62ea1L+xs=;
 b=hBwc2LOHIakwCvs+SN6QPMuW632RyS3ZBOtk0x+Zq0MP1SHnjiQ6bCxdF586sFB+vi
 5ifZsfDtrFyhT5wSat3MPw21i/xNs3Z+no0YXsvpBZawqBzBBu1wzK9lc0qVZD8rRM6j
 Yb1H98GFZFIBgspcVENWNKeDsbMAINOWQadYedwIe98LE6uyZEtn4VpQCEvpyNlKnkE/
 1i96YuKctA9v1y3lkVh32DRd1SSKAO7JrDoINyZs4LEF59FEUL+HKMcnMMN/Bfhs1lHY
 4pcKJ6InHs1RFGQlFFTH9MjHw/0JPtvS7YWILlTznB5dAno3evfte845/F5BjpcYW8kM
 +lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740045; x=1684332045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B9RqWisOWEV3iFXKyP/p1DxzybhrkeUZ+i62ea1L+xs=;
 b=fd5RFJAwrwQX2nifdOJv0Q3EJqkPEpUS0gDnuK3SlUBUmL42eqZOPASRdwPToIGK+K
 wLCOuAi661vfY/AnVfV1ENYcOrz10g5NUECeSQn3T5D9XpLg3TWFef27zZ/nyvYiI0hc
 t7repPOqj0+joKb1RP9T9vq2gFirCdUlzKemS0qxZOQBL20UDXWVkYpBNiCu0GdFOcKj
 +O69nd5PoV5A9lzGlDPqpHrCPLFd1BIOv8ZCCib4guyLXtdBz1MlFrYvqC5hMYALg27E
 6lPtjHolRt+Wuy5fpyWOcKO5IDmDh3Nuj0g9JBPQDAd6dF2IOp9wmvYD2/XqTnx/1E4a
 D85g==
X-Gm-Message-State: AAQBX9fVTEfxmiq9rK+Lmmx3YVN7GQh+WMHm8mNmrBB6gnryxqa0d/oM
 1+MzixvxEww03sT6gzXU1OOVsmxcEstrqDC4O8w=
X-Google-Smtp-Source: AKy350bmNjo6elMSgdiOmerMQJMTZTLMUclH5o/gFe+d4VMhMgrwHJ3pz+9tMkMUita6jwJcqfW9oA==
X-Received: by 2002:a4a:37c5:0:b0:546:46df:349c with SMTP id
 r188-20020a4a37c5000000b0054646df349cmr2086075oor.0.1681740045139; 
 Mon, 17 Apr 2023 07:00:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 07/12] target/riscv/cpu.c: add priv_spec
 validate/disable_exts helpers
Date: Mon, 17 Apr 2023 11:00:08 -0300
Message-Id: <20230417140013.58893-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
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

We're doing env->priv_spec validation and assignment at the start of
riscv_cpu_realize(), which is fine, but then we're doing a force disable
on extensions that aren't compatible with the priv version.

This second step is being done too early. The disabled extensions might be
re-enabled again in riscv_cpu_validate_set_extensions() by accident. A
better place to put this code is at the end of
riscv_cpu_validate_set_extensions() after all the validations are
completed.

Add a new helper, riscv_cpu_disable_priv_spec_isa_exts(), to disable the
extesions after the validation is done. While we're at it, create a
riscv_cpu_validate_priv_spec() helper to host all env->priv_spec related
validation to unclog riscv_cpu_realize a bit.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 91 ++++++++++++++++++++++++++++------------------
 1 file changed, 56 insertions(+), 35 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9bb0e6b180..c928925544 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -827,6 +827,52 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
     env->vext_ver = vext_version;
 }
 
+static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    int priv_version = -1;
+
+    if (cpu->cfg.priv_spec) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version = PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+            priv_version = PRIV_VERSION_1_11_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
+            priv_version = PRIV_VERSION_1_10_0;
+        } else {
+            error_setg(errp,
+                       "Unsupported privilege spec version '%s'",
+                       cpu->cfg.priv_spec);
+            return;
+        }
+
+        env->priv_ver = priv_version;
+    }
+}
+
+static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+    int i;
+
+    /* Force disable extensions if priv spec version does not match */
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
+            (env->priv_ver < isa_edata_arr[i].min_version)) {
+            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
+#ifndef CONFIG_USER_ONLY
+            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
+                        " because privilege spec version does not match",
+                        isa_edata_arr[i].name, env->mhartid);
+#else
+            warn_report("disabling %s extension because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name);
+#endif
+        }
+    }
+}
+
 /*
  * Check consistency between chosen extensions while setting
  * cpu->cfg accordingly.
@@ -1045,6 +1091,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zksed = true;
         cpu->cfg.ext_zksh = true;
     }
+
+    /*
+     * Disable isa extensions based on priv spec after we
+     * validated and set everything we need.
+     */
+    riscv_cpu_disable_priv_spec_isa_exts(cpu);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -1144,7 +1196,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int i, priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1153,23 +1204,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
-            priv_version = PRIV_VERSION_1_12_0;
-        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
-            priv_version = PRIV_VERSION_1_11_0;
-        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
-            priv_version = PRIV_VERSION_1_10_0;
-        } else {
-            error_setg(errp,
-                       "Unsupported privilege spec version '%s'",
-                       cpu->cfg.priv_spec);
-            return;
-        }
-    }
-
-    if (priv_version >= PRIV_VERSION_1_10_0) {
-        env->priv_ver = priv_version;
+    riscv_cpu_validate_priv_spec(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
 
     riscv_cpu_validate_misa_priv(env, &local_err);
@@ -1178,23 +1216,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    /* Force disable extensions if priv spec version does not match */
-    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&
-            (env->priv_ver < isa_edata_arr[i].min_version)) {
-            isa_ext_update_enabled(cpu, &isa_edata_arr[i], false);
-#ifndef CONFIG_USER_ONLY
-            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
-                        " because privilege spec version does not match",
-                        isa_edata_arr[i].name, env->mhartid);
-#else
-            warn_report("disabling %s extension because "
-                        "privilege spec version does not match",
-                        isa_edata_arr[i].name);
-#endif
-        }
-    }
-
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
          * Enhanced PMP should only be available
-- 
2.39.2


