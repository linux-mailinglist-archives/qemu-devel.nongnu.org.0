Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4B6CF119
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 19:31:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phZby-0004MO-MC; Wed, 29 Mar 2023 13:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbw-0004Lj-Lc
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:24 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phZbv-00015Q-0G
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 13:29:24 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 cm7-20020a056830650700b006a11f365d13so7298633otb.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680110961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7EVk/VkhakcSe8kgeF6aRQZj95GOW/QFPr93wO4Hgw=;
 b=Y4KNkqjI5rs8GnHlIc3Mh2gAmxqLZZFEvJrLBff9Uzd5xZxIp4Dz+kw1QSW/EfnJQG
 f21NzZTMK8vR90zk04rwjQcddSQ3fv6LheYu8e/OqhgIPTn/gbCMIMmUrTu56L4g/Umy
 6nH+yCCYJY5q14JfeFceAq/RFqzSJZ1JNO8A1O+H22ytg1NCmbdfPXyebGIqykYsIYKL
 qfh43kvnYpcFFeBm/VSEwk5TVVOXxInW0ZwYTZUDAGZPb07vHa7+guiWRmPOXB5GIxqi
 6VlNKi0dWpvGG4q0uuoQWquof0lhny9jCofMhis88g8+tkL2kNv9/7dOLZziPBj9fl/q
 Y7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110961;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7EVk/VkhakcSe8kgeF6aRQZj95GOW/QFPr93wO4Hgw=;
 b=FlCSWaIMCjTN6k14qDN/VNNrjBFj0wATwqKxEO5ooOXzPAIzWAlkVtB/TWNOcs0xZP
 jQ6k6e/NkK8A7OBxAswFmggHICrY0ZUWxU3H4nXQsHqMJR/QDTItuysDgJ5ZlMu4i1vo
 7ol8FCClzrnUho9kG1zAVvs7W8MP/RoHOx7U4avmREv0Dr+qRZDxxa4sU3ZnJIKlrmJ1
 GE66rwnJEGsHQcRELhzxAUrrAUb1msWFqjMbjXcRnPYviU2gOCau2aj3d6yzrE/jjrMS
 gn+wcU6mZsISQgZqOz9vguwoTz7G3bClufrJERUeNBQs5ydO/dcrLEA5koNuLFx79rZR
 FUew==
X-Gm-Message-State: AO0yUKVanY0NVT4C/EUJf9PsW6GgnlLAOyQLZ3CYFgcqVfL39QLuPHKJ
 XgkOXiFjKhFfT9qN+C6iHN3GljCwJB00SBzQ2is=
X-Google-Smtp-Source: AKy350ZyA5hi5cjinAwQIp/QhsBq6C9sJncanjF4umKdufgUvWErXGZsyMz3wCDPmUjtWWpFr/b7gg==
X-Received: by 2002:a9d:4f0a:0:b0:69f:aa08:e57e with SMTP id
 d10-20020a9d4f0a000000b0069faa08e57emr10509295otl.16.1680110961525; 
 Wed, 29 Mar 2023 10:29:21 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 v41-20020a4a8c6c000000b0052532296449sm13866192ooj.20.2023.03.29.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 10:29:21 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 04/20] target/riscv: introduce
 riscv_cpu_add_misa_properties()
Date: Wed, 29 Mar 2023 14:28:47 -0300
Message-Id: <20230329172903.636383-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329172903.636383-1-dbarboza@ventanamicro.com>
References: <20230329172903.636383-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
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
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5ae9440aee..d7763ecfa9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1393,6 +1393,69 @@ static void riscv_cpu_init(Object *obj)
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
@@ -1530,6 +1593,8 @@ static void register_cpu_props(Object *obj)
         return;
     }
 
+    riscv_cpu_add_misa_properties(obj);
+
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
-- 
2.39.2


