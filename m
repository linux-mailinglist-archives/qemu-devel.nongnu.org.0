Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79C866A144
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:56:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGOEa-0001DO-P9; Fri, 13 Jan 2023 12:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGOEN-00010G-TK
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:52:43 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGOEM-0001YT-2G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:52:43 -0500
Received: by mail-oi1-x22c.google.com with SMTP id h185so18272439oif.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOI8/iNH0q6l/+yMdTICroh3zdczF3J2qooInPAT9oE=;
 b=RVBiQun9XRl8KInbmhhawpk6XxxloM0jX+ADLqXprtKLR0Ih7x0dkeRU2B9BRHmvXr
 wDrS8gBiLOBkbiXnXoqZoTeSeW+cPxchsT8LgaWwMte274DKv7NFBBadIB9IEyPK+2+j
 Zj3xi/3p20H/93sIhLBht7CiBNLG3u8+WIjPbPRsCg3ZVDHLB4oQnuVQiBYhRMLvTa9k
 oSm2tmMeGh4kOpAAQc48R/zo8lc0kBoqByqqhyicoP6StyxShiqAv4qtAF/otYtj9q86
 ptSy2DzIOnPo2v25ZoOCB2EtN1AeUUFzrmaBlYSPkPQKFY3n0/4t1VNJDlhDyigLnKTv
 zg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOI8/iNH0q6l/+yMdTICroh3zdczF3J2qooInPAT9oE=;
 b=12MSEEZW9P29ws9uxVg3s+tX7jkLJRuLDYQUwJY/LL8SUNwsdaSSQ9buTGNzKG+pJu
 komXe23DGSz1jy5f7uX7NTvuGDm472gQASjY/EWCn4MAjkMfJ8fsSzk9oQDpFQa41D2n
 uv6e4xTneLFwx9FegjlVQIJc3RteqyvHoiLi7khswNghk6skZ5WqIeZ5z7+FWElXoKEA
 5HrodbuB9ruxBYUJ2miZpE8hErz8JtI7I2cP4kTwJ0jX/2RtZ1LFYYw8E4WbROIy41bj
 CfWcTItHccSgCdCVZ2Y2DWg0XZG0QYTY5mGG33h6P7UfVVZJDeK4i4nIi2LBiqFpQeRe
 A8AQ==
X-Gm-Message-State: AFqh2koubJ+FyXmDWPhQMbUnY1z0V5PnDlRvpvcaS7Vew+/y17PFKi3R
 NYgGwxJ4HK4jwn22hd9Zgc9HUNJiVlJ5Ksi9+GI=
X-Google-Smtp-Source: AMrXdXs6o9QIBwQamHhUW5EiVMXRubpJdXKLlkWI2pkOP4cu61snHCusURQIa0jtCdPFh5aA3zFXcA==
X-Received: by 2002:a05:6808:238f:b0:360:d951:28bf with SMTP id
 bp15-20020a056808238f00b00360d95128bfmr7025696oib.19.1673632359407; 
 Fri, 13 Jan 2023 09:52:39 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 2-20020aca0702000000b00363ea5be014sm9549276oih.3.2023.01.13.09.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:52:38 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/2] target/riscv/cpu: set cpu->cfg in register_cpu_props()
Date: Fri, 13 Jan 2023 14:52:29 -0300
Message-Id: <20230113175230.473975-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113175230.473975-1-dbarboza@ventanamicro.com>
References: <20230113175230.473975-1-dbarboza@ventanamicro.com>
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

There is an informal contract between the cpu_init() functions and
riscv_cpu_realize(): if cpu->env.misa_ext is zero, assume that the
default settings were loaded via register_cpu_props() and do validations
to set env.misa_ext. If it's not zero, skip this whole process and
assume that the board somehow did everything.

At this moment, all SiFive CPUs are setting a non-zero misa_ext during
their cpu_init() and skipping a good chunk of riscv_cpu_realize().  This
causes problems when the code being skipped in riscv_cpu_realize()
contains fixes or assumptions that affects all CPUs, meaning that SiFive
CPUs are missing out.

To allow this code to not be skipped anymore, all the cpu->cfg.ext_*
attributes needs to be set during cpu_init() time. At this moment this
is being done in register_cpu_props(). The SiFive boards are setting
their own extensions during cpu_init() though, meaning that they don't
want all the defaults from register_cpu_props().

Let's move the contract between *_cpu_init() and riscv_cpu_realize() to
register_cpu_props(). Inside this function we'll check if
cpu->env.misa_ext was set and, if that's the case, set all relevant
cpu->cfg.ext_* attributes, and only that. Leave the 'misa_ext' = 0 case
as is today, i.e. loading all the defaults from riscv_cpu_extensions[].

register_cpu_props() can then be called by all the cpu_init() functions,
including the SiFive ones. This will make all CPUs behave more in line
with what riscv_cpu_realize() expects.

This will also make the cpu_init() functions even more alike, but at this
moment we would need some design changes in how we're initializing
extensions/attributes (e.g. some CPUs are setting cfg options after
register_cpu_props(), so we can't simply add the function to a common
post_init() hook)  to make a common cpu_init() code across all CPUs.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 40 ++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h |  4 ++++
 2 files changed, 44 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a2e6238bd7..e682102c2a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -256,6 +256,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -265,6 +266,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -299,6 +301,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
 {
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
 }
 
@@ -308,6 +311,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -318,6 +322,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu = false;
     cpu->cfg.epmp = true;
@@ -329,6 +334,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
     RISCVCPU *cpu = RISCV_CPU(obj);
 
     set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVC | RVU);
+    register_cpu_props(DEVICE(obj));
     set_priv_version(env, PRIV_VERSION_1_10_0);
     cpu->cfg.mmu = false;
 }
@@ -1083,10 +1089,44 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/*
+ * Register CPU props based on env.misa_ext. If a non-zero
+ * value was set, register only the required cpu->cfg.ext_*
+ * properties and leave. env.misa_ext = 0 means that we want
+ * all the default properties to be registered.
+ */
 static void register_cpu_props(DeviceState *dev)
 {
+    RISCVCPU *cpu = RISCV_CPU(OBJECT(dev));
+    uint32_t misa_ext = cpu->env.misa_ext;
     Property *prop;
 
+    /*
+     * If misa_ext is not zero, set cfg properties now to
+     * allow them to be read during riscv_cpu_realize()
+     * later on.
+     */
+    if (cpu->env.misa_ext != 0) {
+        cpu->cfg.ext_i = misa_ext & RVI;
+        cpu->cfg.ext_e = misa_ext & RVE;
+        cpu->cfg.ext_m = misa_ext & RVM;
+        cpu->cfg.ext_a = misa_ext & RVA;
+        cpu->cfg.ext_f = misa_ext & RVF;
+        cpu->cfg.ext_d = misa_ext & RVD;
+        cpu->cfg.ext_v = misa_ext & RVV;
+        cpu->cfg.ext_c = misa_ext & RVC;
+        cpu->cfg.ext_s = misa_ext & RVS;
+        cpu->cfg.ext_u = misa_ext & RVU;
+        cpu->cfg.ext_h = misa_ext & RVH;
+        cpu->cfg.ext_j = misa_ext & RVJ;
+
+        /*
+         * We don't want to set the default riscv_cpu_extensions
+         * in this case.
+         */
+        return;
+    }
+
     for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
         qdev_property_add_static(dev, prop);
     }
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 61a9a40958..bcf0826753 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -63,6 +63,10 @@
 
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
+/*
+ * Consider updating register_cpu_props() when adding
+ * new MISA bits here.
+ */
 #define RVI RV('I')
 #define RVE RV('E') /* E and I are mutually exclusive */
 #define RVM RV('M')
-- 
2.39.0


