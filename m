Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADAF4D049B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:53:28 +0100 (CET)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGbv-00064n-Un
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:53:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGWB-00023U-Hn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:33 -0500
Received: from [2a00:1450:4864:20::32c] (port=41695
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW7-0007mY-JY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so8803967wmf.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1uFtbkyoP6FALtVBSBQYa/7yZFXHFLiOSjVsvV63nhI=;
 b=fG5yZY+VnwRpA397cIx7pnc5BjEX5gBPH9M2iuLHOZluX4mGR0/Me/JtSHBvNeUSiR
 rN5B8GxlLDCDIQ/HC7MzjR/6MnsulksdOUSo1p/0EbnlAf/b/BqaHhYnQ2jiYVGuaXap
 keRmdr0O+dDejiCj4itSxR4VWZvaM7AH54fNr/zTHbF2pA3PYKcDA29D+Eyl1D2Kq+mk
 KdjxOUugeLnKTaLtS5oPcmX2KPPzu1r0hpbXKguiEQw9YLlB8fVNXQ0yjQqP98K1XMbr
 cahkOgJ3mWdIxplZBHXv+p1401gZEBk7B1dcjQD9tAkndMv5SIdxd//3Yrtr8/94vjVh
 8ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1uFtbkyoP6FALtVBSBQYa/7yZFXHFLiOSjVsvV63nhI=;
 b=HeG/K0l1i3w4CrR+7eR9FvY/5ZDM0ZWHWlXRxLCljDyLMznN6baVs6mAybqO3gyCJU
 +Od0nvO6TAYBdpXU79640VX/zx/K+A1HEZH8rB7FXIplkTzntfNu2z83X8bQ3XGvM3LS
 ue2cvTHRI+6YH0/3r7dp4eEVJkM96+/qZmmEwHY69x21PWM/K4WApBh+KJ6qmfr+CrzE
 KiVWGjZCjrhnSomvxdHsaw031qmYqizaDoLUV8MTNc9U0F8dAK0E2sJ0Pbi5gDiljxJE
 iIY8BvsiyS0iOhxEz6wLhPCFsVKcUXFUc0nPmwb3ouSn0KpmcGDA0tnO314o9VaWUVkc
 UzXw==
X-Gm-Message-State: AOAM530b4Guhp5HyMprY2wf+g1iYsQJ+kF9mO1fREVSdJ9AvEh/myyGe
 xiP27njQ+/SUc/sXmtSa01WCl212oQ4WbA==
X-Google-Smtp-Source: ABdhPJy6Um4FDFkGVrR7DkJc/y5E8+EyT7ifX5s4M9T9QFF7yZ8PnYPfLd8Rl8b9nnImApZLCeeIZQ==
X-Received: by 2002:a1c:ed0e:0:b0:380:fa8c:da99 with SMTP id
 l14-20020a1ced0e000000b00380fa8cda99mr9845859wmh.135.1646671646321; 
 Mon, 07 Mar 2022 08:47:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] target/arm: Provide cpu property for controling FEAT_LPA2
Date: Mon,  7 Mar 2022 16:47:08 +0000
Message-Id: <20220307164709.2503250-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG, allow
the feature to be disabled from -cpu max.

Since this kernel bug is present in the Fedora 31 image that
we test in avocado, disable lpa2 on the command-line.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h            |  5 ++++-
 target/arm/cpu.c            |  6 ++++++
 target/arm/cpu64.c          | 24 ++++++++++++++++++++++++
 tests/avocado/boot_linux.py |  2 ++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24d9fff1705..4aa70ceca12 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -204,10 +204,12 @@ typedef struct {
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -975,10 +977,11 @@ struct ARMCPU {
 
     /*
      * Intermediate values used during property parsing.
-     * Once finalized, the values should be read from ID_AA64ISAR1.
+     * Once finalized, the values should be read from ID_AA64*.
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7091684a16d..185d4e774d5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1392,6 +1392,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+
+        arm_cpu_lpa2_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
     if (kvm_enabled()) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2fdc16bf182..eb44c05822c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -688,6 +688,29 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+static Property arm_cpu_lpa2_property =
+    DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
+
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
+{
+    uint64_t t;
+
+    /*
+     * We only install the property for tcg -cpu max; this is the
+     * only situation in which the cpu field can be true.
+     */
+    if (!cpu->prop_lpa2) {
+        return;
+    }
+
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2);   /* 16k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);    /*  4k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 3); /* 16k stage2 w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 3);  /*  4k stage2 w/ LPA2 */
+    cpu->isar.id_aa64mmfr0 = t;
+}
+
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -897,6 +920,7 @@ static void aarch64_max_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
 static void aarch64_a64fx_initfn(Object *obj)
diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ab19146d1ee..ee584d2fdf2 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -79,6 +79,7 @@ def test_virt_tcg_gicv2(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -91,6 +92,7 @@ def test_virt_tcg_gicv3(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
-- 
2.25.1


