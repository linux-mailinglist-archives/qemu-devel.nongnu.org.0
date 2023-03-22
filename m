Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984DF6C5A3D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7Lz-0008Pa-La; Wed, 22 Mar 2023 18:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Lx-0008PQ-N4
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:54:45 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf7Lw-0002fV-3Y
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:54:45 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-541a05e4124so365274497b3.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679525682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rcAexEYtF86dx9H3aCYgqZNeqV7rAFhGmvGaHEeB5c=;
 b=daDbt7s3HSpJr0G04HrX2on4jYjmhKM0Uotzc4XVthyOHoDNgKjuFcjP2a6uilsH25
 DJBB6EsVRerIfphpNxZQaDDHVOawU394EeCbQGWQXkaGua8F7kRQgrR1LkvIZgNgeOET
 jhhylDD2U98i1CFADRe9XzMYkqymqGKgxgSatnIi+a7aslbpCpQeXzqOgf36Db/p83gL
 q6U/9etOD9clwMtkzJQho+K7/KQzCSv0BzZUqL7Fz0ktSZS/5hXAIj0lvuVYFnSfUOLA
 xJi7fkXKoOlJhkvfDwAyJ9llO7zxTo8GUNZ9KrdXWFwRnOKAVSeZdMkTKDhwDXMajbsE
 Z/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rcAexEYtF86dx9H3aCYgqZNeqV7rAFhGmvGaHEeB5c=;
 b=aQq4nFVDJgK6rwZ6SeyQpCRbldYupjjiCHAFrfqEwwbQzOqsJDepT6SW8ztIe46lHo
 6WGjv9KpENuEVamWTUkR9JDFFi8KaDJEyLjZ4ifgT109UhaBI33VOpxoeKLXdF74kKZ4
 8czH4sgwf+oHPD0tPipWC+dUtt1RAwzTSFo+AerB+Q4qu1+/DPuMnPPTj0oI9TITkhq8
 0IfzgFic7O3mQX65uni3QueFaIV+/y4lbY2tVvwiyVI2cAXS6lmVpJeZJMamAiuqNC0Q
 hgJk7ADVH4OBO496PwU0BeYNDMICbQivIG+C/Z+A1YhY095TtfHHIuO6h1Xfn3QrAOiM
 aQxg==
X-Gm-Message-State: AO0yUKWS5xfNFBw/8ZrJmCoiIM361dRyI7nWBLi/2GqSxA9j0eSEnNRJ
 10h8WKb7GYws7p/TugemQ3Cc+6IJQFQA171eZeQ=
X-Google-Smtp-Source: AK7set/sPJdx0Lisr+uqjMCse44C3PbllnOWnOveC8yLV4SsGpHyTaEFd7EJMWX2K2foMDUnfeRGsg==
X-Received: by 2002:a05:6870:6129:b0:17a:b715:ab9a with SMTP id
 s41-20020a056870612900b0017ab715ab9amr794447oae.50.1679523671714; 
 Wed, 22 Mar 2023 15:21:11 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:11 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 16/25] target/riscv/cpu.c: add
 riscv_cpu_validate_misa_ext()
Date: Wed, 22 Mar 2023 19:19:55 -0300
Message-Id: <20230322222004.357013-17-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112a.google.com
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
index a7bad518be..f9710dd786 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1016,6 +1016,43 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
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
@@ -1063,35 +1100,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1111,11 +1119,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1340,6 +1343,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         env->misa_ext_mask = env->misa_ext;
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


