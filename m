Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBAF6BFC9D
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:07:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcoL-0005j6-Cl; Sat, 18 Mar 2023 16:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoH-0005h5-HV
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:49 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoE-0007EC-DK
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:48 -0400
Received: by mail-oi1-x234.google.com with SMTP id c11so6226101oiw.2
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EFLUuRJqF7aZfFtz85gk12Q0/bYGZM+qfzoZdHewqiQ=;
 b=MwgDq068OkZ9/7JxkDP3L4+FmR+As4e1vU5Q40AHL8OsPnnx8o5Mq77YS9EDVWMBS5
 PnahRFu+5NXXrKCPhqyIGOuUZoHPvcxQDbNynspP0UpgZYURT5+1Bcd1I9vxYBM5S4G4
 hzk88hESWG13XdeQQHvY3t6GgHTt7KaPUrVVIj/oKtx5TZeVsTMXB94teOHWruOSutgL
 Ybz+7VUfait6TevYsVOAol3AhSjjlxy6l49CUDwDA0/dhsEF2BLnMjVDIjDOK80RFzJq
 F6b7xnBLdtR7DOj9cFv0jN6c7tYlfrTx5QvUOCfRknoyX9okKxMjhf/4qWRmIldcslZo
 sZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EFLUuRJqF7aZfFtz85gk12Q0/bYGZM+qfzoZdHewqiQ=;
 b=oETR2+YjrczH1bM8HwGVdfCAbHsUBbzQ5J6KdZ9OAf/EprGEWyloz4bcxRep6H1tRl
 AsPOMBCstOixjsjHGi0vYjApqWeuyqlv0ivWeLbGJ7ZeLvouJ7tvWHMhuRrnUfzRG2aa
 E9xPuPx3BTrjDTuO0ur90ObkBkP0oFJQCtkBgK3WTxkh846SqI78EMoUN8UD9wAvfGiS
 nMMYdOjEZOiJlBu8IbomcGBPmk8tX2rJpV7jfp9bv8/o5CpNH659iDcgBDufmX19Lcnu
 mR4tFJpmZ6ffskVcw+xtRwIczYKU6lTwVgpc3dprNIqb5flgsElNXlOdzGbtUDD0A5/6
 pCgg==
X-Gm-Message-State: AO0yUKU4QYblB3afdfKrOSC4a+bl+llNzQp1B1v3gWE69a8WeJlVPrVI
 CsnIIbeRhIL1lNpBtRcGPA8Cpedfvwpq9vH/AWw=
X-Google-Smtp-Source: AK7set/M3LDH9/T5dcC8fO7Ir9V3aTrLWzWAPH/XdzoPwLI9+54FS66QX/hqL+s1DzGD0jLMOyowsA==
X-Received: by 2002:a05:6808:2a8c:b0:383:ca99:c70e with SMTP id
 fc12-20020a0568082a8c00b00383ca99c70emr6245363oib.59.1679169945001; 
 Sat, 18 Mar 2023 13:05:45 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:44 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 22/26] target/riscv: use misa_ext val in
 riscv_cpu_validate_extensions()
Date: Sat, 18 Mar 2023 17:04:32 -0300
Message-Id: <20230318200436.299464-23-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
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

Similar to what we did with riscv_cpu_validate_misa_ext(), let's read
all MISA bits from a misa_ext val instead of reading from the cpu->cfg
object.

This will allow write_misa() to use riscv_cpu_validate_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 69fc0d17a5..e9172ec310 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1118,10 +1118,13 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 }
 
 /*
- * Check consistency between chosen extensions. No changes
- * in env->misa_ext are made.
+ * Check consistency between cpu->cfg extensions and a
+ * candidate misa_ext value. No changes in env->misa_ext
+ * are made.
  */
-static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_extensions(RISCVCPU *cpu,
+                                          uint32_t misa_ext,
+                                          Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1132,12 +1135,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (misa_ext & RVF && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
 
-    if ((cpu->cfg.ext_zawrs) && !cpu->cfg.ext_a) {
+    if ((cpu->cfg.ext_zawrs) && !(misa_ext & RVA)) {
         error_setg(errp, "Zawrs extension requires A extension");
         return;
     }
@@ -1146,13 +1149,13 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zfhmin = true;
     }
 
-    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfhmin && !(misa_ext & RVF)) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
 
     /* The V vector extension depends on the Zve64d extension */
-    if (cpu->cfg.ext_v) {
+    if (misa_ext & RVV) {
         cpu->cfg.ext_zve64d = true;
     }
 
@@ -1166,12 +1169,12 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !(misa_ext & RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !(misa_ext & RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -1204,7 +1207,7 @@ static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (misa_ext & RVF) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -1376,7 +1379,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_extensions(cpu, &local_err);
+    riscv_cpu_validate_extensions(cpu, env->misa_ext, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
-- 
2.39.2


