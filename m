Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D456BFC8E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:06:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdco0-0005JU-2Q; Sat, 18 Mar 2023 16:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnw-0005Iv-17
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:28 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcnu-0007Ar-8c
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:27 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 o26-20020a4ad49a000000b0053964a84b0fso687926oos.7
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NAmDeC6RM/ZUTD0Fb3vBxdXraVyIqMtfH28cw/JTV1Y=;
 b=g1ZBAPi8slwtVf48qRRka0G5ELfKoiJXWd//4lpIl7roLFUQbt8Sh+d8JmMnGKodNo
 EhNrWrLEHWDsUj6y2m8LLq2C+NF0i4eElHDpOdmH3ccqrSlcqDXmp+OmuDLrcFZFmEgK
 rbryWEszQuZtCeIS35LnUkCSNvb0/iX1KTznaix5/7WJeKgoFV54jaPd2gKKssB59J18
 DEL/9sXB1lm1QULuE+gXjGiyy2lHJR31ysWnFOMQh0HAZUDNIXtRz92kmNZhQnAA5YnC
 TvlUZyv3eSqadmOFvQHaInsqgHQdE8G3Ey3S4EaciClXSkJQhPKMi6rm6Ndwgn257+5r
 +Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NAmDeC6RM/ZUTD0Fb3vBxdXraVyIqMtfH28cw/JTV1Y=;
 b=R5P7sKy7NoNqCRXOawloXwtKA/u+sh0YkcfCb07drPqz9baFh3X/RYdhQp7uUy8meR
 grI6N4bvhitub5xrzfUSWxH6EBXFcs9knXscTeqPXnNscDUOODrGOThsgeXO/tLVCKVt
 EONna3dmZV7LCoLPi4LdiL3a5USnQI4Yx1dCiPfy+LGG0fQ1AzCJATbaE72AJk55b5VD
 CyHXUlWC/c8Q4cjhVvPOlOzh0rP9j/FXaeJ/uZgc3b89SH202GXujg7By3hhLLfH8jMU
 cPuheOUnPjy3G0ZgFJc8PzqsH8pkj2SFm/bc8nFhVY8jjuK482NJvE+0Niq0i8QyGSbA
 Kq1w==
X-Gm-Message-State: AO0yUKX0k9TVk9s1m+vy1pyx+X5zCAm7/mghXwSIA8/omtHLIDJBTlcx
 QGd0i23RE38JWoUuzwy4M+7r7E+rCBJ75lUMs74=
X-Google-Smtp-Source: AK7set9Mm2hpo3IhEKP+XLn7PdWZi+Kce62AXQyNsl+PcILAQJVaTXFwVKjVH2f2Mbvl6hhLDwbezA==
X-Received: by 2002:a4a:9e81:0:b0:525:810e:8b75 with SMTP id
 u1-20020a4a9e81000000b00525810e8b75mr1408374ook.1.1679169924869; 
 Sat, 18 Mar 2023 13:05:24 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 15/26] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
Date: Sat, 18 Mar 2023 17:04:25 -0300
Message-Id: <20230318200436.299464-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc30.google.com
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

We can set all RVG related extensions during realize time, before
validate_set_extensions() itself. Put it in a separated function so the
validate function already uses the updated state.

Note that we're adding an extra constraint: ext_zfinx is a blocker for
F, which is a requirement to enable G. If zfinx is enabled we'll have to
error out.

Note that we're setting both cfg->ext_N and env->misa_ext bits, instead
of just setting cfg->ext_N. The intention here is to start syncing all
misa_ext operations with its cpu->cfg flags, in preparation to allow for
the validate function to operate using a misa_ext. This doesn't make any
difference for the current code state, but will be a requirement for
write_misa() later on.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 66 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 48ad7372b9..110b52712c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -281,6 +281,42 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     return ext;
 }
 
+static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    RISCVCPUConfig *cfg = &cpu->cfg;
+
+    if (cpu->cfg.ext_zfinx) {
+        error_setg(errp, "Unable to enable G: Zfinx is enabled, "
+                         "so F can not be enabled");
+        return;
+    }
+
+    if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
+          cfg->ext_f && cfg->ext_d &&
+          cfg->ext_icsr && cfg->ext_ifencei)) {
+
+        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
+        cfg->ext_i = true;
+        env->misa_ext |= RVI;
+
+        cfg->ext_m = true;
+        env->misa_ext |= RVM;
+
+        cfg->ext_a = true;
+        env->misa_ext |= RVA;
+
+        cfg->ext_f = true;
+        env->misa_ext |= RVF;
+
+        cfg->ext_d = true;
+        env->misa_ext |= RVD;
+
+        cfg->ext_icsr = true;
+        cfg->ext_ifencei = true;
+    }
+}
+
 static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
                                        uint32_t misa_ext)
 {
@@ -1036,21 +1072,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                            cpu->cfg.ext_d &&
-                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
-        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_i = true;
-        cpu->cfg.ext_m = true;
-        cpu->cfg.ext_a = true;
-        cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
-        cpu->cfg.ext_icsr = true;
-        cpu->cfg.ext_ifencei = true;
-    }
-
     if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
@@ -1293,6 +1314,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+    CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1313,6 +1335,20 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (cpu->cfg.ext_g) {
+        riscv_cpu_enable_g(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
+
+        /*
+         * Sync env->misa_ext_mask with the new
+         * env->misa_ext val.
+         */
+        env->misa_ext_mask = env->misa_ext;
+    }
+
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
-- 
2.39.2


