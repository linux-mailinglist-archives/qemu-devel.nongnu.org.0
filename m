Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1096E8DED
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:22:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQTq-00085O-Pq; Thu, 20 Apr 2023 05:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTa-0007wD-O0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:14 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ppQTY-00070U-Sc
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:21:14 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6a60630574aso624274a34.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681982471; x=1684574471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7xzMVD+0CBLNj31VHPyt0b4kweWZ6J3mzAMMEwrf1A=;
 b=MJi6TOiLf0nduvwapevov+NellJUQ7/y66xlDH6MNIPNJ7kcpfknq9meoWXD9xhUMD
 BGHCGpXBH70Fpq9RqeqxW9ItcP9YV46+n6UZ/e7WJo1dJKEX/XEOwaPayOW+gizOge51
 zAi6A+rMK8IQNlW7RgwPQrJ/xo1C5nW2nqIa4Zs3UZNHwdA4fN/U7xvXzH9563xB0owy
 RJtN8k3/kKd0GrB74lgde9IZWA2jhXtsU1aXog9Aa3JFGro/uNrRg894njtYDgVMtvxl
 ZKoOmKCT0jQ3s0M9HJjJ2wbw0XsZ85yVQqzzYLXGwhj76kSSQEdPJu+R4aVElTaDIEIN
 D1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982471; x=1684574471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7xzMVD+0CBLNj31VHPyt0b4kweWZ6J3mzAMMEwrf1A=;
 b=KeEX+M7oXaHVPqWveo093X/ae85apk0hG0CB/au/Th9uRfzdz5dyXvsCggpSfI6cR7
 odcBPRRVRxG992tXTs8EMxC2qLmi8Q8vp/TWN4tSgv9HySGHjP/cwnz4HC8dI1fLEjW2
 07auNb9uo93tG+jCjX3MKq4DZUKllS0Q4UZcYAMhzYsGNUPOuFq6Ow/yJwkXessMBIYM
 GECw2z0k9Vk2YW3oAZSkazGDKzIYWTjTWL2tQqww9U2pa8lk8zT6zV/JaTojyQORX3yw
 828xdVItByqMcotuQvOO2ffel6nNwuaKpsn6qYgKjRb9PPcyUPg/77lTmiavW8ImKsSI
 4raQ==
X-Gm-Message-State: AAQBX9fg0dg3kss3A3g9uO+ZsubVfMHh7GZG2o3zkIGjCkQNhxGNfsso
 5QXb0ZQXQo0HmNtkSSPKZF/pwMr1tTVidTf6DSw=
X-Google-Smtp-Source: AKy350Zolg2FNoF6IkrJPYMwLoJS6Fbj2NevOgfOjNNHp2xkrLT9n8NiDfosBrDQpfsDL2YVTazlpw==
X-Received: by 2002:a05:6870:970c:b0:17f:ee0f:b03a with SMTP id
 n12-20020a056870970c00b0017fee0fb03amr883914oaq.34.1681982470942; 
 Thu, 20 Apr 2023 02:21:10 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a056870e74100b0017280f7d653sm529668oak.35.2023.04.20.02.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 02:21:10 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH RESEND v7 01/12] target/riscv/cpu.c: add riscv_cpu_validate_v()
Date: Thu, 20 Apr 2023 06:20:49 -0300
Message-Id: <20230420092100.177464-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420092100.177464-1-dbarboza@ventanamicro.com>
References: <20230420092100.177464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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

The RVV verification will error out if fails and it's being done at the
end of riscv_cpu_validate_set_extensions(), after we've already set some
extensions that are dependent on RVV.  Let's put it in its own function
and do it earlier.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 89 +++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index befa64528f..feca13aefb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -797,6 +797,46 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
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
@@ -804,6 +844,7 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
+    Error *local_err = NULL;
 
     /* Do some ISA extension error checking */
     if (riscv_has_ext(env, RVG) &&
@@ -872,8 +913,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
 
@@ -1008,46 +1055,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
2.40.0


