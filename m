Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0F6C5AAB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:41:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf71u-000757-B0; Wed, 22 Mar 2023 18:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf71s-00074z-5l
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:34:00 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf71j-0007OE-Po
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:33:59 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5418d54d77bso363655057b3.12
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679524390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADt/jKeQIFnLBYxR5tPJNl8bZeJArajSApuG78AxbMA=;
 b=WW0BWkSXm5wAQ2XpEIKJXU87fA4KmWOtQaZchgRzi2zbyQvPfXN4mQip+V+9GzR7TQ
 DqziE1fX61yA3+cl8MKQahIr2lNHJTJ/Cbej0B5XKTEeVNwQfverDQiqg+JJM0+uaEaf
 wOZMVxibiO+3Yv5K4el1CZzgQbbxnLjGJx2OQEs+7Fr7gFj36ML6FSHHCeTyIqJ9HyR+
 UkLaNKJTgiuRk+kcgzmvkh8mofyhoL9z/NATQEGoj/c7iYI23AZq9H1W4zKXUAPYD3LP
 TdEMeWr3CQ9KnerzRIaU3+/pe6mX0g6sy2r7QzDKJYPNTBASngQtAqfIGMooAmifXOk5
 6Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679524390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADt/jKeQIFnLBYxR5tPJNl8bZeJArajSApuG78AxbMA=;
 b=FBw9QNdCzIof5Im17DdOyfT1U1qi9TP3QFRXwbjBZXhsGBoVJbC/SWq80HpsKJ6CYL
 OVl5zf74eyDvfsPUPaI3bHZJhfM1TaVBfsdKhUxxVMHlMJairGvlpsKZtAjWnjOmkS2f
 fU0XgFbnv/vEZkDIyUOHNt0pd1kvRS/YrcP/BfOo66+eSxuDVmtTZt0TCVdStEE8oUjZ
 evgN18mAeL8wWcx56+8TsOl1A2xUXMlXuqzTsITjKmvO0aG/V9ygW5iynYhuGWwI29Aa
 +pgweWT8CpbtcoHHcxmnzgmyos5mgsDe2TJ7UE2htSoAxFHxg4oibVjaaoM/WM5pyrTk
 Ci4A==
X-Gm-Message-State: AAQBX9e1oe9Sb2ST6hIzNcuGlmCelVOuOkrUPugqWOpA2C1sQsAWJB66
 ZcMEQmzmmaMlsfDCTJEzqi1HtAmwKK6kdHdCR/w=
X-Google-Smtp-Source: AK7set+AgrGvhJBvxnyRlSPOPa1DgU7o/ZJ2Xno/P28y18PqR0t/YF/WSZy21pH55ElzsGODTFzbWA==
X-Received: by 2002:a05:6870:ecaa:b0:17b:2054:38f0 with SMTP id
 eo42-20020a056870ecaa00b0017b205438f0mr884271oab.25.1679523668565; 
 Wed, 22 Mar 2023 15:21:08 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:07 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 15/25] target/riscv/cpu.c: split RVG code from
 validate_set_extensions()
Date: Wed, 22 Mar 2023 19:19:54 -0300
Message-Id: <20230322222004.357013-16-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Note that we're setting both cfg->ext_N and env->misa_ext bits, instead
of just setting cfg->ext_N. The intention here is to start syncing all
misa_ext operations with its cpu->cfg flags, in preparation to allow for
the validate function to operate using a misa_ext. This doesn't make any
difference for the current code state, but will be a requirement for
write_misa() later on.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 60 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f41888baa0..a7bad518be 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -281,6 +281,36 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     return ext;
 }
 
+static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
+{
+    CPURISCVState *env = &cpu->env;
+    RISCVCPUConfig *cfg = &cpu->cfg;
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
@@ -1033,21 +1063,6 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
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
@@ -1290,6 +1305,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPUState *cs = CPU(dev);
     RISCVCPU *cpu = RISCV_CPU(dev);
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
+    CPURISCVState *env = &cpu->env;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -1310,6 +1326,20 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


