Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FA16B9C4A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:55:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7rR-0006SK-R3; Tue, 14 Mar 2023 12:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rQ-0006OD-59
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:52 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7rO-000342-7J
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:51 -0400
Received: by mail-oi1-x231.google.com with SMTP id bh20so12248753oib.9
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKsj1Bf1nRdbbtRMBsx4PpI7751/nt1s+yAwKgnlL9Y=;
 b=KYPg9h1gRrjKz9XB1ZQSEY01UnVVZ6AmL7EjNk9tRNQl2gaPsPNYEg61A0QEO26y0G
 sL+FOZIP8GgS5F+qNYDjVWa8bQ04K7s1GjMRWswCgtu6QQ163igXqZ275e+d09xMCmu2
 jVEL8sMx4AF9OF990VwKxYh0bqlcNPGrKgD7DhvXEdXs6gs83sKPyxIdQppiOd1ZpNni
 KWBcziftfZE1/hydWh+pfZjgsLSjcBXO2uJO2aJXxz68p8AWpfgFOHPQx2PVoiD0qjWp
 3BOaZXVQ6I0FQWxWtPNB8cAATGwYi5n3OcDSn123Z25C82f9izfTEBKQmItEy6VNA2pq
 ji4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKsj1Bf1nRdbbtRMBsx4PpI7751/nt1s+yAwKgnlL9Y=;
 b=sMwMeM+Lm2xwXAHamPIGSC7yZOgiPlFf3dQrOJrCkxLglu+0mX/qY9JSBZBQqyO7ni
 g2XjnFxSIzxEpVdsg2EHwHKso2EOU6wdwnHu2BEO7ejrtAGIfSW/ov5fpojfcZfnzanC
 L/XAFf5WyQcF3JZdvF5Aainv/E4LDsjxzZRDgJizoWcgHEcfHfXn6n6PkG4viKmlfjz5
 VJFssCy/KheLBzlFzCnKetmcyGtFKKla+q9QYZ22DnLX7KORXvZxqRkEFyCFLl0eXbGw
 i9oiwEWCkxAC8oUr6zsyPlhs7vuX1ZqN4OoVQw2zlz9OHdzQrrFOuy9uF0muQnTYuNdW
 QzQw==
X-Gm-Message-State: AO0yUKVYsA7OSEhBRtm2D3YiwtmcZVlUzRD6FFjSe+2SWj+EkhrIWKIl
 CqjcVYoNIH+PrFgxv1kZVEMf8m1pjCzulz7UGgs=
X-Google-Smtp-Source: AK7set9GEHAlWeiCTzf1rD93I/oyui6zEhlsFeJsbTCrnK9NT+x8wJoMxEZLAZ+fik8ibsqxlLo2rw==
X-Received: by 2002:a54:4799:0:b0:386:9f86:cadd with SMTP id
 o25-20020a544799000000b003869f86caddmr223536oic.30.1678812648834; 
 Tue, 14 Mar 2023 09:50:48 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 18/26] target/risc/cpu.c: add
 riscv_cpu_validate_misa_ext()
Date: Tue, 14 Mar 2023 13:49:40 -0300
Message-Id: <20230314164948.539135-19-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x231.google.com
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

Even after taking RVG off from riscv_cpu_validate_set_extensions(), the
function is still doing too much. It is validating misa bits, then
validating named extensions, and if the validation succeeds it's doing
more changes in both cpu->cfg and MISA bits.

It works for the support we have today, since we'll error out during
realize() time. This is not enough to support write_misa() though - we
don't want to error out if userspace writes something odd in the CSR.

This patch starts splitting riscv_cpu_validate_set_extensions() into a
three step process: validate misa_ext, validate cpu->cfg, then commit
the configuration. This separation will allow us to use these functions
in write_misa() without having to worry about saving CPU state during
runtime because the function changed state but failed to validate.

riscv_cpu_validate_misa_ext() will host all validations related to misa
bits only. Validations using misa bits + name extensions will remain in
validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 77 ++++++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index af5a1e6a43..83b1b874ee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1025,6 +1025,43 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
     }
 }
 
+static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
+{
+    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "I and E extensions are incompatible");
+        return;
+    }
+
+    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "Either I or E extension must be set");
+        return;
+    }
+
+    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
+        error_setg(errp,
+                   "Setting S extension without U extension is illegal");
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+        error_setg(errp,
+                   "H depends on an I base integer ISA with 32 x registers");
+        return;
+    }
+
+    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
+        error_setg(errp, "H extension implicitly requires S-mode");
+        return;
+    }
+
+    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+        error_setg(errp, "D extension requires F extension");
+        return;
+    }
+}
+
 static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 {
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(cpu);
@@ -1072,35 +1109,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-        error_setg(errp,
-                   "I and E extensions are incompatible");
-        return;
-    }
-
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-        error_setg(errp,
-                   "Either I or E extension must be set");
-        return;
-    }
-
-    if (cpu->cfg.ext_s && !cpu->cfg.ext_u) {
-        error_setg(errp,
-                   "Setting S extension without U extension is illegal");
-        return;
-    }
-
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
-        error_setg(errp,
-                   "H depends on an I base integer ISA with 32 x registers");
-        return;
-    }
-
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_s) {
-        error_setg(errp, "H extension implicitly requires S-mode");
-        return;
-    }
-
     if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
@@ -1120,11 +1128,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
-        error_setg(errp, "D extension requires F extension");
-        return;
-    }
-
     /* The V vector extension depends on the Zve64d extension */
     if (cpu->cfg.ext_v) {
         cpu->cfg.ext_zve64d = true;
@@ -1338,6 +1341,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         riscv_set_G_virt_ext(cpu);
     }
 
+    riscv_cpu_validate_misa_ext(cpu, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


