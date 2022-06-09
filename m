Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F42C544205
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 05:36:33 +0200 (CEST)
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz8yF-0001H0-TT
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 23:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8tQ-0002zT-CG
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:32861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8tL-0006iy-P7
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 hv24-20020a17090ae41800b001e33eebdb5dso789632pjb.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 20:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wRea9+eFPHw+mOzVOom0mISeuT9mDtTJHqB/dWCNUqE=;
 b=i51B6OP35mxiOjB7E6O07yxDBBCHhmP0W5bn1JrUD2BzNePC+iI/YhWKd9Hoh5dpv5
 fhv46/MIrGQa6M7BmwUgEugUGXDodj7jtz70FsMYEKbeNOkIQ8l8P+cjxl2LPa2mXmcP
 nuNy/uLGQPs5bclbEGj8+vqvaCD63plrddbwIJ1kAN3WRktc9D+3pld4Rj7/k4T983Xw
 HhL6ihh6QJGrYPoM3MtOxyYkAlun0ZMYDnQlDFk0xevhz4Ji/RO1oUUOAJm6Rl8pd/mZ
 mUtAiUwwzcV/W6MmWGwHBm/oZanuCiDwT/4A36UuVMQ9IdW1h0Wu/xCxNu3/A08K1J8U
 60yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wRea9+eFPHw+mOzVOom0mISeuT9mDtTJHqB/dWCNUqE=;
 b=sbR+ZIKTmYReniTBZ+CZrIX1QC7K0gtlmi7xbdxqEVh/NBIX0PuYLBV04ZRiy9q8oV
 KU5gJ3269/Q0qnw3WWls7/VqIYgriO6Ya4A7/BwIg1YNRIG8UsN0DqGoP5tRdJDasEhE
 8KSIDKFLdemjDjdO0pDwzNRjstcK5NeNb4G1N1WnaFZTAsJmeoxzQjVN+RY2pwWkzfPW
 vKrlcwKIy7Kirlvk8LDFknA8PfM8rxu4JgK40E5Y/rQVLYCWvXt/uA+9Mwn65YBPRsGG
 vh42K2tJLpWEf1cs+Ca13eX1hY/Q/8xS5XH0SvSEfiLQN1XYVaCXsxz5IAcYvE8c0+pl
 yGhw==
X-Gm-Message-State: AOAM5308X9sIoL9ZxoE6VwNMnh4sI6zms6owHvp3oZz4jtJ6zKiCZ4M7
 XqQLS915/aau4i914ICo7F4JJw==
X-Google-Smtp-Source: ABdhPJz4e0CSe/BP6dTPkOVhgdWCCUziDF3jGInH5Xrod2X/ntJsYVKfQhTOUCCM15N62tBfNGg1Aw==
X-Received: by 2002:a17:902:f54b:b0:163:e2fd:10a5 with SMTP id
 h11-20020a170902f54b00b00163e2fd10a5mr37864230plf.28.1654745486442; 
 Wed, 08 Jun 2022 20:31:26 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.182.198.228])
 by smtp.gmail.com with ESMTPSA id
 ei13-20020a17090ae54d00b001e31c7aad6fsm15053964pjb.20.2022.06.08.20.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 20:31:25 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 4/4] target/riscv: Force disable extensions if priv spec
 version does not match
Date: Thu,  9 Jun 2022 09:00:11 +0530
Message-Id: <20220609033011.752714-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609033011.752714-1-apatel@ventanamicro.com>
References: <20220609033011.752714-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should disable extensions in riscv_cpu_realize() if minimum required
priv spec version is not satisfied. This also ensures that machines with
priv spec v1.11 (or lower) cannot enable H, V, and various multi-letter
extensions.

Fixes: a775398be2e9 ("target/riscv: Add isa extenstion strings to the device tree")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 57 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9f9c27a3f5..e7eb65d708 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -43,9 +43,13 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
 
 struct isa_ext_data {
     const char *name;
-    bool enabled;
+    int min_version;
+    bool *enabled;
 };
 
+#define ISA_EDATA_ENTRY(name, prop) {#name, PRIV_VERSION_1_10_0, &cpu->cfg.prop}
+#define ISA_EDATA_ENTRY2(name, min_ver, prop) {#name, min_ver, &cpu->cfg.prop}
+
 const char * const riscv_int_regnames[] = {
   "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
   "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
@@ -513,8 +517,42 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int priv_version = -1;
+    int i, priv_version = -1;
     Error *local_err = NULL;
+    const struct isa_ext_data isa_edata_arr[] = {
+        ISA_EDATA_ENTRY2(h, PRIV_VERSION_1_12_0, ext_h),
+        ISA_EDATA_ENTRY2(v, PRIV_VERSION_1_12_0, ext_v),
+        ISA_EDATA_ENTRY2(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
+        ISA_EDATA_ENTRY2(zifencei, PRIV_VERSION_1_10_0, ext_ifencei),
+        ISA_EDATA_ENTRY2(zfh, PRIV_VERSION_1_12_0, ext_zfh),
+        ISA_EDATA_ENTRY2(zfhmin, PRIV_VERSION_1_12_0, ext_zfhmin),
+        ISA_EDATA_ENTRY2(zfinx, PRIV_VERSION_1_12_0, ext_zfinx),
+        ISA_EDATA_ENTRY2(zdinx, PRIV_VERSION_1_12_0, ext_zdinx),
+        ISA_EDATA_ENTRY2(zba, PRIV_VERSION_1_12_0, ext_zba),
+        ISA_EDATA_ENTRY2(zbb, PRIV_VERSION_1_12_0, ext_zbb),
+        ISA_EDATA_ENTRY2(zbc, PRIV_VERSION_1_12_0, ext_zbc),
+        ISA_EDATA_ENTRY2(zbkb, PRIV_VERSION_1_12_0, ext_zbkb),
+        ISA_EDATA_ENTRY2(zbkc, PRIV_VERSION_1_12_0, ext_zbkc),
+        ISA_EDATA_ENTRY2(zbkx, PRIV_VERSION_1_12_0, ext_zbkx),
+        ISA_EDATA_ENTRY2(zbs, PRIV_VERSION_1_12_0, ext_zbs),
+        ISA_EDATA_ENTRY2(zk, PRIV_VERSION_1_12_0, ext_zk),
+        ISA_EDATA_ENTRY2(zkn, PRIV_VERSION_1_12_0, ext_zkn),
+        ISA_EDATA_ENTRY2(zknd, PRIV_VERSION_1_12_0, ext_zknd),
+        ISA_EDATA_ENTRY2(zkne, PRIV_VERSION_1_12_0, ext_zkne),
+        ISA_EDATA_ENTRY2(zknh, PRIV_VERSION_1_12_0, ext_zknh),
+        ISA_EDATA_ENTRY2(zkr, PRIV_VERSION_1_12_0, ext_zkr),
+        ISA_EDATA_ENTRY2(zks, PRIV_VERSION_1_12_0, ext_zks),
+        ISA_EDATA_ENTRY2(zksed, PRIV_VERSION_1_12_0, ext_zksed),
+        ISA_EDATA_ENTRY2(zksh, PRIV_VERSION_1_12_0, ext_zksh),
+        ISA_EDATA_ENTRY2(zkt, PRIV_VERSION_1_12_0, ext_zkt),
+        ISA_EDATA_ENTRY2(zve32f, PRIV_VERSION_1_12_0, ext_zve32f),
+        ISA_EDATA_ENTRY2(zve64f, PRIV_VERSION_1_12_0, ext_zve64f),
+        ISA_EDATA_ENTRY2(zhinx, PRIV_VERSION_1_12_0, ext_zhinx),
+        ISA_EDATA_ENTRY2(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
+        ISA_EDATA_ENTRY2(svinval, PRIV_VERSION_1_12_0, ext_svinval),
+        ISA_EDATA_ENTRY2(svnapot, PRIV_VERSION_1_12_0, ext_svnapot),
+        ISA_EDATA_ENTRY2(svpbmt, PRIV_VERSION_1_12_0, ext_svpbmt),
+    };
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -541,6 +579,17 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /* Force disable extensions if priv spec version does not match */
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (*isa_edata_arr[i].enabled &&
+            (env->priv_ver < isa_edata_arr[i].min_version)) {
+            *isa_edata_arr[i].enabled = false;
+            warn_report("disabling %s extension for hart 0x%lx because "
+                        "privilege spec version does not match",
+                        isa_edata_arr[i].name, (unsigned long)env->mhartid);
+        }
+    }
+
     if (cpu->cfg.mmu) {
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
@@ -1011,8 +1060,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
-
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 {
     char *old = *isa_str;
@@ -1071,7 +1118,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].enabled) {
+        if (*isa_edata_arr[i].enabled) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.34.1


