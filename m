Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A33514F6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:01:11 +0200 (CEST)
Received: from localhost ([::1]:37234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwwg-0006hb-Gx
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrZ-0001jM-8k
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:53 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:36821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrX-0002yh-Bf
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:52 -0400
Received: by mail-oi1-x234.google.com with SMTP id c16so1683343oib.3
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OpEDkbIB7gVmSFeUBZiFRPGe0lGXnIYEfiFDB8srwo=;
 b=CYVY4YuydGCWk0nJSlP1qJfy9o6yJBcE3EDK9jEIsAXofVhlRpOD2LhyrO+Bp/yjsy
 ngm18JleIuDltQgCDFeFMG1RMq1hraG4/9RbFTIJ8Yypz+BoGgs8eXFcCtiw4/vT4KNU
 11h7sAGIYB0jrQ0VGx03UDyvuiv6n5rmFwQWrboO0KvGCtLjDjCDAmb/wi6upGxuvxOk
 Eq7PGSdHM8g6oUnO/C9J0GcB+tC9Gld4Sc3aQX6vQdSBgqv7HCPte1tVPT2HBPCpqNAo
 4BHwd2e98+MothDGRxtYeBNbzXa7GMwN47vU7JR+6GGeDbTfsVUgX315EWoaABegdoGo
 +gXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OpEDkbIB7gVmSFeUBZiFRPGe0lGXnIYEfiFDB8srwo=;
 b=ppfAYPoBlHrpuycbxwe4njk3Jhjjbvk752bCNOUDnJJ/wTUTYQWLqE2goKBRVCZU2W
 76+raev5IBW6bbYY4Gbgu4YBT84TM89tYdhwkx4Wpej3GXUMj9BSgWOQTbtiKkI6TJ6+
 klNdXHYpPOc50g8eUQeXEa5jwb3NGqomSVu0kGN4i8Ab9J+XHBowIeY9nB4gK9goNoCj
 dLhgLeAZ1ZxUlAh5FAYTunW902WxBcFaHzzNuutMK9BgAl9wMXuzGKx+2MM8TSujVcuG
 S11+rtP5tCUWtn2keweuapeksCIThVjY/vt7Ojal57S4NboMhvNjr35mCBrv9MbmddBj
 U4KQ==
X-Gm-Message-State: AOAM530T8VroBoMCtfvaRMRA1UycfnTfxX7KvAz6l2hgQnhqfF96pzNq
 2mQbN8UZCML+/Kf9p2PK+d7bbsE2+EIo8UY=
X-Google-Smtp-Source: ABdhPJyjuGoajchkp6IaQLkRx33S6JPBejJ0IW2DVez2jVK4o3LvBBOyXsBqMUx2gShSUitFGQssJA==
X-Received: by 2002:aca:df44:: with SMTP id w65mr5696005oig.36.1617281749967; 
 Thu, 01 Apr 2021 05:55:49 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:49 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 3/6] target/arm/kvm: Add an option to turn on/off
 el2 support
Date: Thu,  1 Apr 2021 12:55:35 +0000
Message-Id: <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds an el2=[on/off] option to enable/disable el2(nested virtualization)
support in KVM guest vCPU.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/cpu.c   | 11 ++++++++++
 target/arm/cpu.h   |  4 ++++
 target/arm/cpu64.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408..30cc330f50 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1349,6 +1349,17 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
                 return;
             }
         }
+
+        /*
+         * Currently, vCPU feature 'el2' only supported in KVM mode.
+         */
+        if (kvm_enabled()) {
+            arm_cpu_el2_finalize(cpu, &local_err);
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                return;
+            }
+        }
     }
 
     if (kvm_enabled()) {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 193a49ec7f..19fa9cfbfd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -203,10 +203,12 @@ typedef struct {
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -1058,6 +1060,7 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_add_sve_properties(Object *obj);
+void aarch64_add_el2_properties(Object *obj);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
@@ -1089,6 +1092,7 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
 static inline void aarch64_add_sve_properties(Object *obj) { }
+static inline void aarch64_add_el2_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9..3f3f2c5495 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -603,6 +603,58 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
+void arm_cpu_el2_finalize(ARMCPU *cpu, Error **errp)
+{
+    if (cpu->has_el2) {
+        if (!kvm_enabled() || !kvm_arm_el2_supported()) {
+            error_setg(errp, "'el2' cannot be enabled on this host");
+            return;
+        }
+    }
+
+    if (cpu->has_el2) {
+        set_feature(&cpu->env, ARM_FEATURE_EL2);
+    } else {
+        unset_feature(&cpu->env, ARM_FEATURE_EL2);
+    }
+}
+
+static bool arm_get_el2(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    return cpu->has_el2;
+}
+
+static void arm_set_el2(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (value) {
+        if (!kvm_enabled() || !kvm_arm_el2_supported()) {
+            error_setg(errp, "'el2' cannot be enabled on this host");
+            return;
+        }
+        set_feature(&cpu->env, ARM_FEATURE_EL2);
+    } else {
+        unset_feature(&cpu->env, ARM_FEATURE_EL2);
+    }
+
+    cpu->has_el2 = value;
+}
+
+void aarch64_add_el2_properties(Object *obj)
+{
+    /*
+     * vCPU feature 'el2' is only available in KVM mode, and is
+     * disabled by default to keep in line with that in TCG mode.
+     */
+    ARM_CPU(obj)->has_el2 = false;
+    object_property_add_bool(obj, "el2", arm_get_el2, arm_set_el2);
+    object_property_set_description(obj, "el2", "Set off to disable "
+                                    "nested virtulization.");
+}
+
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
  * otherwise, a CPU with as many features enabled as our emulation supports.
  * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
-- 
2.17.1


