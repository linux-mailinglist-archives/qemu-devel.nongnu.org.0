Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED24C985B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:27:58 +0100 (CET)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAyL-0006Er-OT
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXo-0001af-TH
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:32 -0500
Received: from [2607:f8b0:4864:20::1030] (port=51162
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXm-00058e-Li
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id m22so98184pja.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9XzP0Qdi4Dwon2uYf1rT0B5JmvyAHM7fMnwSPwWhfEg=;
 b=TVgPdqVnswIrr+3Oh4dzWDjU73hk9Cntt8I038CtNvhinGqnrIGJJnAkPM6hyCYJ0J
 CKnsH9cB3yaZSGdavfqbnegpaHteBtDECRuNpVvHydCResx76O2GJU04s4dGuMOmDUoA
 7roIXEHkhHc397/azXchYoQ84X6TZ2sNFiFEXbyzUyMj7OgWz4KoTkOln5aUiWDbTfmO
 VJ8ovXxD2cP4W7PXaKh7pjJzzjuCcZMXTL4YaK9fVArYrNdl+MP9HjIOSKBJntgxKUZ2
 /zleOYoF8Zal6hq0oYwHp4AtWpzoxmU/EFFzy2qWbZtlx9ce+ACUfTYKF1t9vA4B4IOl
 Apng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9XzP0Qdi4Dwon2uYf1rT0B5JmvyAHM7fMnwSPwWhfEg=;
 b=x8ivIf/K/w5eSI3inrzxmKHeX4AtjXTbGS3MRhSUiKkGEVvkWXVagqBm6j857KewiQ
 wDM189tCUoe9NZg7xM1vUgNYvIppYurIBHIZntXcO/wuuBQjh+20vgnl5nXYqecnrKIg
 lPg/z9HbWGyHEQ1SB7artkCQ80zng5n6a+duznM9qpIUmQHws4rCacu+XAdhv2km3d2V
 4c2Vkpm5AAABSibSDILpAmYcsunGnxnqQlz3NrBNri7lozynKNU9HZGFLFyTHP6MMVx0
 3uJ2RL2j0K6TejTgu1ajxVt1fGNBKvB3HW691Wzeqo78sfvl1lsIlllUhhPu9ZnLvn5l
 Pp1g==
X-Gm-Message-State: AOAM531LuulZXD8OxXkZ11zRPeMTzI/638P4cO4xEAD2e8+0or5ne6u6
 dHd0uAT8vmgRFUg34k8XgA/whSRiBvyrgA==
X-Google-Smtp-Source: ABdhPJxyjagQLMI/MNqdlmS+2O5CP6/OBHBHGEEabdpE8VcyABDicVIiRgOsGWdGDB/8ZdHNndVdNg==
X-Received: by 2002:a17:90a:a892:b0:1be:f420:bd1e with SMTP id
 h18-20020a17090aa89200b001bef420bd1emr894449pjq.58.1646172029383; 
 Tue, 01 Mar 2022 14:00:29 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/18] target/arm: Provide cpu property for controling
 FEAT_LPA2
Date: Tue,  1 Mar 2022 11:59:57 -1000
Message-Id: <20220301215958.157011-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG, allow
the feature to be disabled from -cpu max.

Since this kernel bug is present in the Fedora 31 image that
we test in avocado, disable lpa2 on the command-line.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  5 ++++-
 target/arm/cpu.c            |  6 ++++++
 target/arm/cpu64.c          | 24 ++++++++++++++++++++++++
 tests/avocado/boot_linux.py |  2 ++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24d9fff170..4aa70ceca1 100644
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
index e251f0df4b..e2747e7d86 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1391,6 +1391,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
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
index 2fdc16bf18..eb44c05822 100644
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
index ab19146d1e..ee584d2fdf 100644
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


