Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720293513E1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:46:47 +0200 (CEST)
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuqc-0005fc-HK
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulJ-00075I-PU
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:17 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:40739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulI-0002Oq-0k
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:17 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 j20-20020a4ad6d40000b02901b66fe8acd6so442052oot.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OpEDkbIB7gVmSFeUBZiFRPGe0lGXnIYEfiFDB8srwo=;
 b=yBPfJBcTU5P/NHP0A4PrO7SZY2KygV9ZaEVBnzrf8K1c5UB1z/xjklQqOHpwTvF0Tk
 ykcZIBzEdbuDTc1a3tjRldR8upaIQytvmf5t1IvmCFLQacf8tywoXHMp1/qhrpZNx3qE
 i6acTlkhPmIGADG8dr4H7HbbjcB+sMbX1cNpfffavEMBeYKYWQ6QUI5jG37MI365Y0kV
 WSrXR9OwJ7EFeS6KlEMSz37smoOBqHunUEyQpnIJT0LP0TNRLDBC/D7UQ5njfNCH48Il
 ZkZTW4uPdCMDW+lZnTgvJZHpmAFWiMnMJiEM7IznJ5vKLPz3pIl5YEzEh47AUsyT/6Us
 oVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+OpEDkbIB7gVmSFeUBZiFRPGe0lGXnIYEfiFDB8srwo=;
 b=MWDjsQuppFJU6KEqBn/9EgytvCSp0cpsEppNU6R7fpO7nXvInXOr54JCz+84cvzoKx
 wX5Xopnz3W+R5v81Y8FTOjkS0tU3SXhuN+Ho3DkEsFN9EMGRaTKOku1Ps1TGu/oi9mgc
 AmcZiUOFYuDjLfnXDevAqydo8Ve/pT2+kDlw1lxYdHlMzEC9iKYSa4c5dN65l91VN9Sn
 x9iMrYIALtVm33Ho+JljsQdGkj8o6Twxc82J7lqI2fD+u2p8YsdL289TEsAiVSGXEJvq
 P+Bdun11GfkfJgMer/Ec6KjV8zDt4bwkH7vBBkRf0fx1QUaOTgA50+wNe6n2F3tWlghY
 IjtQ==
X-Gm-Message-State: AOAM533EOpqQVMckeVn/CvkmQf/vghfdZtXrgSG4VtQOtiLkS7uXNwNs
 SREHEGU+hdl2J7eY4r2UcGSRrIwA/EliWl8=
X-Google-Smtp-Source: ABdhPJwnqfleV3yNn00YUDMSqo+E1aObG4t41clRoBMUABZ2DghUoGbXWro4ya+EkOEtLTT77cNRMQ==
X-Received: by 2002:a4a:ca94:: with SMTP id x20mr6626942ooq.86.1617273674654; 
 Thu, 01 Apr 2021 03:41:14 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:14 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 3/6] target/arm/kvm: Add an option to turn on/off el2
 support
Date: Thu,  1 Apr 2021 10:40:55 +0000
Message-Id: <80d8bac17a21b41b36cde3eec6c9681b93f43d7c.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=haibo.xu@linaro.org; helo=mail-oo1-xc2c.google.com
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


