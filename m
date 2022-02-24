Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FD14C2D91
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:50:16 +0100 (CET)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEVb-000216-D5
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNESU-0008Oy-Fz
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:47:02 -0500
Received: from [2a00:1450:4864:20::42c] (port=33359
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNESS-0003L7-64
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:47:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j17so3199387wrc.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 05:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9UHNCjXxwniph4J7IDL2/iBxmRwpFGPlNbQbqU9SSjg=;
 b=mh0s0YvLyvnYI/Cx5eBsbnHG7mtk2x8dujsTIIsQeGF5BqT60HeNLbUC4JERqrRGxw
 2eXcTxVvKCjiUNfiXY8v7OlHVpwTXtlMDqip6iqR9B2ZEbuiIsqtz0GVsn91HeyDakOu
 Z0bDAEDrQx+xATDam8tCrKNR6kxA9EGFeY/w0Af4avXBOWx4qMg/Hi1oYannb9NnisEM
 AGXZ+e3PXA+GdPKjyxGttYBx+FyNgKhaArxAjct4lBKhvmV7vUpC0DRGAus6/1HuanUW
 518JcIdpHEzDtB32PICU3XEowN5DvQ4AvegmFLVy6eUq25PVd/u9osADSjIWvSxHbSIQ
 zQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9UHNCjXxwniph4J7IDL2/iBxmRwpFGPlNbQbqU9SSjg=;
 b=4KVoZKaEJWSw5CDT4MEBIppolmrFoR5a9HVUWKYR2LhF41GJONxZwq8HuaLzSwASdw
 SpA695p0atnYcwmMYMTEpcmtZC1v15CGOCuB0rlqGFbQkM9pUGJKPKAlw7c84iLvbaek
 MqFzQEURVetj6+7Y2RgKQap/IDyhAsLJD2j3q+IE3qFPI/Q/bD7vtiLMZDim7s+4usmm
 nkigSYxHukxBpgPYuJMU/4fRXqJwgrgclgWz3LUsiHIW05qF0eAMKMTJipa8hfS+yHZN
 /PgxSk2bqs0rC+0KGv4ez354FOH1H3UdSVtjiM0rSQ8Xf5bKOUjaer6N66EyXKZZoNMg
 ThgQ==
X-Gm-Message-State: AOAM532esemY9Z+kUGL+ZHGwl16WFAyJ+dk9jarlM64Z+K5zqrjtNvjU
 GdLo4BZnvdS3lbcw6mjaKtvyoQ==
X-Google-Smtp-Source: ABdhPJxWk1fViIyBxb3v6ohGWN0G3pk0DoQOAYCpDRkzXRmbWkK4+KRn1T/Sshc+X5gFZ3st06ezxg==
X-Received: by 2002:adf:90a4:0:b0:1e3:52c5:66c9 with SMTP id
 i33-20020adf90a4000000b001e352c566c9mr2356444wri.223.1645710417171; 
 Thu, 24 Feb 2022 05:46:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j12sm2806474wrs.1.2022.02.24.05.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:46:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Report KVM's actual PSCI version to guest in dtb
Date: Thu, 24 Feb 2022 13:46:54 +0000
Message-Id: <20220224134655.1207865-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we're using KVM, the PSCI implementation is provided by the
kernel, but QEMU has to tell the guest about it via the device tree.
Currently we look at the KVM_CAP_ARM_PSCI_0_2 capability to determine
if the kernel is providing at least PSCI 0.2, but if the kernel
provides a newer version than that we will still only tell the guest
it has PSCI 0.2.  (This is fairly harmless; it just means the guest
won't use newer parts of the PSCI API.)

The kernel exposes the specific PSCI version it is implementing via
the ONE_REG API; use this to report in the dtb that the PSCI
implementation is 1.0-compatible if appropriate.  (The device tree
binding currently only distinguishes "pre-0.2", "0.2-compatible" and
"1.0-compatible".)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: 20220213035753.34577-1-akihiko.odaki@gmail.com
("[PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0")
though note that to compile on arm hosts you'll need the
bugfix to that patch from which I describe in a reply to it.

 target/arm/kvm-consts.h |  1 +
 hw/arm/boot.c           |  5 ++---
 target/arm/kvm64.c      | 12 ++++++++++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index e770921ddc2..faacf96fdc7 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -95,6 +95,7 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 
 #define QEMU_PSCI_VERSION_0_1                     0x00001
 #define QEMU_PSCI_VERSION_0_2                     0x00002
+#define QEMU_PSCI_VERSION_1_0                     0x10000
 #define QEMU_PSCI_VERSION_1_1                     0x10001
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0eeef94ceb5..a47f38dfc90 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -488,9 +488,8 @@ static void fdt_add_psci_node(void *fdt)
     }
 
     qemu_fdt_add_subnode(fdt, "/psci");
-    if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2 ||
-        armcpu->psci_version == QEMU_PSCI_VERSION_1_1) {
-        if (armcpu->psci_version == QEMU_PSCI_VERSION_0_2) {
+    if (armcpu->psci_version >= QEMU_PSCI_VERSION_0_2) {
+        if (armcpu->psci_version < QEMU_PSCI_VERSION_1_0) {
             const char comp[] = "arm,psci-0.2\0arm,psci";
             qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
         } else {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 64d48bfb19d..ccadfbbe72b 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -849,6 +849,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     uint64_t mpidr;
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
+    uint64_t psciver;
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
         !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
@@ -904,6 +905,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
+    /*
+     * KVM reports the exact PSCI version it is implementing via a
+     * special sysreg. If it is present, use its contents to determine
+     * what to report to the guest in the dtb (it is the PSCI version,
+     * in the same 15-bits major 16-bits minor format that PSCI_VERSION
+     * returns).
+     */
+    if (!kvm_get_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver)) {
+        cpu->psci_version = psciver;
+    }
+
     /*
      * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
      * Currently KVM has its own idea about MPIDR assignment, so we
-- 
2.25.1


