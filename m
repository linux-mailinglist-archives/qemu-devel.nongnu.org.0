Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C37647250
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:56:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IIu-0000fK-Sg; Thu, 08 Dec 2022 09:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3IId-0000bI-1W
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:55:01 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1p3IIR-0006N1-6J
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:54:58 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 v62-20020a4a7c41000000b004a0a214dfbaso245620ooc.9
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U8vgUbFelgGls6PbHLNSofzwoctCRctuGTp/hKu617E=;
 b=YKeAVOfVP6Y1w2LUkIzaH1qZm0pGS8FwebxxWwZd/HogU9hvoipnLBLsxSzS4Ndqwj
 m/13HUdSIn5arU5ZT9kcJ4lCZriynS/zL+O7jPDqrhekMk7eacb1Mm8yf3hYK8cdgOfr
 BFfVoCu3Q5ksIkT4qiRlvFohZvm9lu+q11rq3Xfd5wYNrTe6YH/SKdxgmwn0VHjhtcsL
 FFN27iuQhWZODv0qnRKjiOkqHlGcpxCq4UpBs68JELCK/nFPtYD6/SsWrw6RwKjr0qQU
 KYCsL+8ACXQCgfaXSbV0nAD1noNVrPvoWFULflUn9ZJeoV2d06bajt7IO+1wLuXjBdfd
 qw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U8vgUbFelgGls6PbHLNSofzwoctCRctuGTp/hKu617E=;
 b=b/0vY1oA9dcqVyD1hGintDvci4qn0waxJVg0lYwFuyhdBcNLxkCDCYGe4J2ddfCsJs
 lBGY9T1PzRm2xhuS6B/48cbpi8JVlXIoru+l5dKJMFuOVHiy1IuSdd8w9YcvGMwMutIZ
 gKcODRw3RAZeR1iTkgm2DIjCb1yVpKoKdRau1OFa703KwgpBnCWY3lUnRmXDP2ZND8v4
 zgYnE5qMG3BHTAU5DonOkeQdIkYkw6aCpNgyTJbT54Zk9S9H8hmiyrPLA4LvYrIoNijw
 07ZVM3a0zmXooqZC77MNSJud/sh7dEJpvjb3kfR0EnCtb5uMeOwiMus15kHotNtjpvbX
 8igw==
X-Gm-Message-State: ANoB5pmPCt3Ti9wmkKVqj7DJ9K3G1PVyDf94mgGZHCPf6W1W2IrZdHsv
 Nj9OikfH2bfE0Rv+7P3+UJshX969qkHWi7BeAuI=
X-Google-Smtp-Source: AA0mqf79NLWhTUmanSKI7zEmHY25h0ymWVqtxZjNg94xlEG8zvj/gNQpLWRgRYzE+f+1JZ5l0MvLew==
X-Received: by 2002:a4a:c188:0:b0:49f:8720:d5b2 with SMTP id
 w8-20020a4ac188000000b0049f8720d5b2mr1160037oop.8.1670511283868; 
 Thu, 08 Dec 2022 06:54:43 -0800 (PST)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 b14-20020a4ae20e000000b004968311a31asm10044225oot.39.2022.12.08.06.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 06:54:42 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 3/3] target/riscv: kvm: Support selecting VCPU extensions
Date: Thu,  8 Dec 2022 20:24:11 +0530
Message-Id: <20221208145411.122799-4-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221208145411.122799-1-mchitale@ventanamicro.com>
References: <20221208145411.122799-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oo1-xc2e.google.com
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

Set the state of each ISA extension on the vcpu depending on what
is set in the CPU property and what is allowed by KVM for that extension.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c       | 11 ++++-
 target/riscv/kvm.c       | 88 ++++++++++++++++++++++++++++++++++------
 target/riscv/kvm_riscv.h |  2 +-
 3 files changed, 87 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8c8f085a80..4b2c1dadf4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1205,10 +1205,19 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str)
 {
     char *old = *isa_str;
     char *new = *isa_str;
-    int i;
+    int i, offset;
 
     for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
         if (isa_ext_is_enabled(cpu, &isa_edata_arr[i])) {
+            offset = isa_edata_arr[i].ext_enable_offset;
+            if (kvm_enabled() && !kvm_riscv_ext_supported(offset)) {
+#ifndef CONFIG_USER_ONLY
+                info_report("disabling %s extension for hart %d as kvm does "
+                            "not support it", isa_edata_arr[i].name,
+                            (int)cpu->env.mhartid);
+#endif
+                continue;
+            }
             if (isa_edata_arr[i].multi_letter) {
                 if (cpu->cfg.short_isa_string) {
                     continue;
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 30f21453d6..79029ad328 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -42,6 +42,29 @@
 #include "migration/migration.h"
 #include "sysemu/runstate.h"
 
+struct isa_ext_info {
+    const char *name;
+    target_ulong misa_bit;
+    int ext_enable_offset;
+};
+
+#define ISA_EXT_DATA_ENTRY(_name, _bit, _prop) \
+    {#_name, _bit, offsetof(struct RISCVCPUConfig, _prop)}
+
+static const struct isa_ext_info isa_info_arr[] = {
+    ISA_EXT_DATA_ENTRY(a, RVA, ext_a),
+    ISA_EXT_DATA_ENTRY(c, RVC, ext_c),
+    ISA_EXT_DATA_ENTRY(d, RVD, ext_d),
+    ISA_EXT_DATA_ENTRY(f, RVF, ext_f),
+    ISA_EXT_DATA_ENTRY(h, RVH, ext_h),
+    ISA_EXT_DATA_ENTRY(i, RVI, ext_i),
+    ISA_EXT_DATA_ENTRY(m, RVM, ext_m),
+    ISA_EXT_DATA_ENTRY(svpbmt, 0, ext_svpbmt),
+    ISA_EXT_DATA_ENTRY(sstc, 0, ext_sstc),
+    ISA_EXT_DATA_ENTRY(svinval, 0, ext_svinval),
+    ISA_EXT_DATA_ENTRY(zihintpause, 0, ext_zihintpause),
+};
+
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
                                  uint64_t idx)
 {
@@ -394,25 +417,66 @@ void kvm_arch_init_irq_routing(KVMState *s)
 {
 }
 
+bool kvm_riscv_ext_supported(int offset)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(isa_info_arr); ++i) {
+        if (isa_info_arr[i].ext_enable_offset == offset) {
+            return true;
+        }
+    }
+    return false;
+}
+
+static void kvm_riscv_set_isa_ext(CPUState *cs, CPURISCVState *env)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    unsigned long isa_ext_out;
+    bool *ext_state;
+    uint64_t id;
+    int i, ret;
+
+    env->misa_ext = 0;
+    for (i = 0; i < ARRAY_SIZE(isa_info_arr); i++) {
+        ext_state = (void *)&cpu->cfg + isa_info_arr[i].ext_enable_offset;
+        id = kvm_riscv_reg_id(env, KVM_REG_RISCV_ISA_EXT, i);
+        ret = kvm_get_one_reg(cs, id, &isa_ext_out);
+        if (ret) {
+            warn_report("Disabling ext %s due to failure %d",
+                        isa_info_arr[i].name, ret);
+            *ext_state = false;
+            continue;
+        }
+        if (isa_ext_out != (*ext_state)) {
+            isa_ext_out = *ext_state;
+            ret = kvm_set_one_reg(cs, id, &isa_ext_out);
+            if (ret) {
+                warn_report("Could not %s ext %s due to failure %d",
+                            (isa_ext_out ? "enable" : "disable"),
+                            isa_info_arr[i].name, ret);
+                *ext_state = !isa_ext_out;
+            }
+        }
+        /*
+         * If the single letter extension is supported by KVM then set
+         * the corresponding misa bit for the guest vcpu.
+         */
+        if (isa_info_arr[i].misa_bit && (*ext_state)) {
+            env->misa_ext |= isa_info_arr[i].misa_bit;
+        }
+    }
+}
+
 int kvm_arch_init_vcpu(CPUState *cs)
 {
-    int ret = 0;
-    target_ulong isa;
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
-    uint64_t id;
 
     qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
 
-    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG,
-                          KVM_REG_RISCV_CONFIG_REG(isa));
-    ret = kvm_get_one_reg(cs, id, &isa);
-    if (ret) {
-        return ret;
-    }
-    env->misa_ext = isa;
-
-    return ret;
+    kvm_riscv_set_isa_ext(cs, env);
+    return 0;
 }
 
 int kvm_arch_msi_data_to_gsi(uint32_t data)
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index ed281bdce0..bdcccc0da4 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -21,5 +21,5 @@
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
 void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
-
+bool kvm_riscv_ext_supported(int offset);
 #endif
-- 
2.34.1


