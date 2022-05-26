Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC1F534D11
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 12:12:55 +0200 (CEST)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuAUA-0006ES-AK
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 06:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANa-0007Wz-MO
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:06:12 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nuANZ-0000tw-6J
 for qemu-devel@nongnu.org; Thu, 26 May 2022 06:06:06 -0400
Received: by mail-pl1-x633.google.com with SMTP id w3so1029985plp.13
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LdhJ+CzqwO9act42e+Xaxnx8iyy+fkBBxBLgmWQJtgQ=;
 b=Vh4rBeHncB9dp6KVTnDRxwLLBVmQbFdHpi/+2q4Ho19sQqiIjD3rebIK8ASzTS4Nvw
 b/sJAARUR/WPMz9Ew3pDmuJV/cMub7Y7xNADQFeevkAajP3fffxeEotvNtv/PbKNCYD7
 YVv0OrQLi09Y/tKJ2Y/rZY0neqQtMaKePk1LJqqe5+qRg69zurkJECDJUDdckT8WgOl4
 6H/khiFcSasnlDdFYtqnkHC5Ji9yFR9cVPQgWlJVe2CvKNe+ZzGGxZqQVOP8+VHyWOET
 CEW3eS+nQ/UTjPhG+S5ZV1HFP7MARV5Zw3nMwWmKKpcPGlhmlp5rAEHbAvgaKzF20wRY
 GJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LdhJ+CzqwO9act42e+Xaxnx8iyy+fkBBxBLgmWQJtgQ=;
 b=Ezk1s6JMTouTv7TIMNoTUxVOnHpAHu8cxexu8LmnOaI9skvAyCT1nTRc1pAHL7q8VB
 /w4LtdjlfnFoXbc4lVhKBA5vKML1VDqogZuj+3uYl4Di7JIHBaYHNLi0Wp4288LOGbc9
 gIW402A/XUSEmUwMApAEZPN6WQhvm7OsjcHhJ4Cu7S6APBuB8zE4hu3hULorXtqAak8A
 muMzmKhuixQCGVqYpgiFqrKAym2ekAWxp3O3g1cmeEX4KlgbDyCNIAaw8J9s7/BZDEbK
 Y3Q8pimoIrLyGh5KVSQhTUYCkk2FI+WBdvGBVAvLYibSGgOCCJjFGM84ZZ1f7xxi61Ti
 MvLA==
X-Gm-Message-State: AOAM532gZJZ3tSdamUsKo/0DphAGDk/IhbJndk2eFud17UfVJq4K0hmV
 uPwlmvEQVT/5gK7//EJnxt1xXw==
X-Google-Smtp-Source: ABdhPJyR2+IC2JnyWqD1D91aE7QlZAaCwEjL0+eFJWq7DkRJX9QBRE2B0bQNh44Ll3zXdLI0HI7wDQ==
X-Received: by 2002:a17:902:bf04:b0:149:c5a5:5323 with SMTP id
 bi4-20020a170902bf0400b00149c5a55323mr37265235plb.97.1653559563812; 
 Thu, 26 May 2022 03:06:03 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.94.60])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa793ba000000b0050dc76281e5sm1020126pff.191.2022.05.26.03.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 03:06:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 4/4] target/riscv: Force disable extensions if priv spec
 version does not match
Date: Thu, 26 May 2022 15:35:36 +0530
Message-Id: <20220526100536.49672-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526100536.49672-1-apatel@ventanamicro.com>
References: <20220526100536.49672-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x633.google.com
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

Fixes: a775398be2e ("target/riscv: Add isa extenstion strings to the
device tree")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 56 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 51 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b086eb25da..e6e878ceb3 100644
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
+    struct isa_ext_data isa_edata_arr[] = {
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
@@ -541,6 +579,16 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         set_priv_version(env, priv_version);
     }
 
+    /* Force disable extensions if priv spec version does not match */
+    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
+        if (*isa_edata_arr[i].enabled &&
+            (env->priv_ver < isa_edata_arr[i].min_version)) {
+            *isa_edata_arr[i].enabled = false;
+            warn_report("privilege spec version does not match for %s extension",
+                        isa_edata_arr[i].name);
+        }
+    }
+
     if (cpu->cfg.mmu) {
         riscv_set_feature(env, RISCV_FEATURE_MMU);
     }
@@ -1005,8 +1053,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_props(dc, riscv_cpu_properties);
 }
 
-#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
-
 static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
 {
     char *old = *isa_str;
@@ -1064,7 +1110,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
     };
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
-        if (isa_edata_arr[i].enabled) {
+        if (*isa_edata_arr[i].enabled) {
             new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
             g_free(old);
             old = new;
-- 
2.34.1


