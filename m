Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361CF6CB1F2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 00:51:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgvfE-0005Qj-0p; Mon, 27 Mar 2023 18:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvf7-0005Q6-GE
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:01 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgvf4-0007Pc-TW
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 18:50:01 -0400
Received: by mail-oi1-x22c.google.com with SMTP id r16so7540233oij.5
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 15:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679957397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEqQoxZLH7dYfKrcPIHz/K3/m7SkKVG1VdgDo1LivtE=;
 b=jN18pdl25Mdi/VjxzLmido0rBQ/x9xPTyb5CN3iYJZpYBvnSKTAK87QV8Gil+Tvti2
 YSonmCuIrOEztc8pRmjuTWOpZkIgYLbuDesusyBM/ewdLQFOxotkNR475haJ6vOFqSet
 QNpmzO+g0liQDcuF0NR1yoOAP3mJdqJ1U2InmPqwOCw3G1Nr/BXwdFF4+JMLIDlJxmWT
 JNjq+oEq+Ieg/qQ0dwnzoXVJ5M4eM684VL5Ctzq61fYS8YTY32BU0AC65xixhqVicaGS
 X53g5jBV2Ls1K7yAei1Anq/v2QTNs6O411T7QDCDLOWhZC0ArhO57P4tDtK88pio7AHk
 I2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679957397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pEqQoxZLH7dYfKrcPIHz/K3/m7SkKVG1VdgDo1LivtE=;
 b=HI1rnnez7iy22psC114UGgSPwHampn/fF48BjqgHniyimoKLis7ZBE+iSs8nvnPzrC
 RrivoGLgxxNcCtjXuaPg684KA4GgdKg5cxJ0/877Aubj8RfusgEHG6TylasG7oMXb/8p
 7Qp1svoGZuy1QQhVQnvT0SMtJ7pLsRIpiqlDZzOdTF299kcLHcwaHx4HKVyDxjOr6Jy8
 qNhYCQsNNOD7GXq4zyTyopDzdPuS40bQ4PS6EZU5EpQwlUvXVZkRFKds0pCzbVVhmCeZ
 ZlNWMdQERqoDBD78aA0LU/ZmJgE+lBzRGBkIRM2t4t+7bPYTEM2pOUgJ8fNF0ucOX9Lt
 fErw==
X-Gm-Message-State: AO0yUKVe0heyrtvsFyAO66m7LtmFnkEKm63rgbss8jiIW65iZUuKApzV
 tElsu+ueiwMsweGEtmUwIl7dVfO/oOaqY10dxsA=
X-Google-Smtp-Source: AK7set98bF1o1QWkZ4BgLZH/boBdhCn4PPuiiyyQK3yOnxGThQtY6LnAlUAlwSVR4XCBhXLltYuPNA==
X-Received: by 2002:a05:6808:1495:b0:387:4984:ea6b with SMTP id
 e21-20020a056808149500b003874984ea6bmr12039625oiw.12.1679957397253; 
 Mon, 27 Mar 2023 15:49:57 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 s9-20020a4a9689000000b005255e556399sm11985361ooi.43.2023.03.27.15.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 15:49:56 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 03/19] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Date: Mon, 27 Mar 2023 19:49:18 -0300
Message-Id: <20230327224934.363314-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327224934.363314-1-dbarboza@ventanamicro.com>
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
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

Ever since RISCVCPUConfig got introduced users are able to set CPU extensions
in the command line. User settings are reflected in the cpu->cfg object
for later use. These properties are used in the target/riscv/cpu.c code,
most notably in riscv_cpu_validate_set_extensions(), where most of our
realize time validations are made.

And then there's env->misa_ext, the field where the MISA extensions are
set, that is read everywhere else. We need to keep env->misa_ext updated
with cpu->cfg settings, since our validations rely on it, forcing us to
make register_cpu_props() write cpu->cfg.ext_N flags to cover for named
CPUs that aren't used named properties but also needs to go through the
same validation steps. Failing to so will make those name CPUs fail
validation (see c66ffcd5358b for more info). Not only that, but we also
need to sync env->misa_ext with cpu->cfg again during realize() time to
catch any change the user might have done, since the rest of the code
relies on that.

Making cpu->cfg.ext_N and env->misa_ext reflect each other is not
needed. What we want is a way for users to enable/disable MISA extensions,
and there's nothing stopping us from letting the user write env->misa_ext
directly. Here are the artifacts that will enable us to do that:

- RISCVCPUMisaExtConfig will declare each MISA property;

- cpu_set_misa_ext_cfg() is the setter for each property. We'll write
  env->misa_ext and env->misa_ext_mask with the appropriate misa_bit;
  cutting off cpu->cfg.ext_N from the logic;

- cpu_get_misa_ext_cfg() is a getter that will retrieve the current val
  of the property based on env->misa_ext;

- riscv_cpu_add_misa_properties() will be called in register_cpu_props()
  to init all MISA properties from the misa_ext_cfgs[] array.

With this infrastructure we'll start to get rid of each cpu->cfg.ext_N
attribute in the next patches.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 21c0c637e4..45a73f3079 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1394,6 +1394,69 @@ static void riscv_cpu_init(Object *obj)
 #endif /* CONFIG_USER_ONLY */
 }
 
+typedef struct RISCVCPUMisaExtConfig {
+    const char *name;
+    const char *description;
+    target_ulong misa_bit;
+    bool enabled;
+} RISCVCPUMisaExtConfig;
+
+static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->misa_bit;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    if (value) {
+        env->misa_ext |= misa_bit;
+        env->misa_ext_mask |= misa_bit;
+    } else {
+        env->misa_ext &= ~misa_bit;
+        env->misa_ext_mask &= ~misa_bit;
+    }
+}
+
+static void cpu_get_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    const RISCVCPUMisaExtConfig *misa_ext_cfg = opaque;
+    target_ulong misa_bit = misa_ext_cfg->misa_bit;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+    CPURISCVState *env = &cpu->env;
+    bool value;
+
+    value = env->misa_ext & misa_bit;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {};
+
+static void riscv_cpu_add_misa_properties(Object *cpu_obj)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
+        const RISCVCPUMisaExtConfig *misa_cfg = &misa_ext_cfgs[i];
+
+        object_property_add(cpu_obj, misa_cfg->name, "bool",
+                            cpu_get_misa_ext_cfg,
+                            cpu_set_misa_ext_cfg,
+                            NULL, (void *)misa_cfg);
+        object_property_set_description(cpu_obj, misa_cfg->name,
+                                        misa_cfg->description);
+        object_property_set_bool(cpu_obj, misa_cfg->name,
+                                 misa_cfg->enabled, NULL);
+    }
+}
+
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
     DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
@@ -1531,6 +1594,8 @@ static void register_cpu_props(Object *obj)
         return;
     }
 
+    riscv_cpu_add_misa_properties(obj);
+
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
-- 
2.39.2


