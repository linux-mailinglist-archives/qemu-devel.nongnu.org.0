Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEFE3C8A74
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:08:01 +0200 (CEST)
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jIe-0004v7-As
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3jHN-0002uy-Ly
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:06:41 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3jHL-0000qU-KM
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:06:41 -0400
Received: by mail-pf1-x42a.google.com with SMTP id d12so2759300pfj.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EpDxd7UvP7T4oZGwdvqqavAoeBFhuX87JU5frFZXsCM=;
 b=VjjN0DBpArHL/qDBnOYo9BSOtZiDDvYLGXBtpe7xLIOBE/3osT6Ds7dGfquHujyYqX
 ks+DN9CmWuGkDv4qiJ8booMbKo2bYL3Xqi3P3pXcTMKRcpKtsT+lRDlrqDMJNQ7505JB
 IUgyUdDQigUhrRzREGniNAxsXQlLcNACOzCb0+VdL5NVxlS288edWm3hW9uZ8gdBr/s0
 HlT7iV3j3FOj+aK/iF8vt7IWEqF2CfqKjRT9gSvPvY5Tdi7u6USwWwr5iu76k0UPSKMw
 6HmVfbU68RmDpAQ5V74V6T6PFD9k5vftFcDWHZEGh+uaZVEJ7trwX46i0n9/SdHnTjj5
 QcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EpDxd7UvP7T4oZGwdvqqavAoeBFhuX87JU5frFZXsCM=;
 b=iTZOIKUYVJ9g38TIWyXvnX0CVCUDOuiJ4muU0cdZ7viFmg5mte/xpRG9xYhAF94Brl
 qUFffRdmsVPV8eyT0Kny+ivH7izKH246RsDlIHiHt/cem/lQqOS410rAa+VZHF0PuitV
 QApeuH2tTDc/tCps21UBUhSE8Qst1sT2U31jtnhZaiBQWGIg0/Yi/0PBQzxzir9eY2JF
 S7qrIlWgtuDm6Rj8CdyZajAaC0axjHCvGCpkdXbN0V2SpxilWcPr1/RiZdFb5WJRFFkF
 IYFf9nd5vislt6XYu5/jS6zNksQojAVwHk3Ck0bNTEJgXVJYi/EedKTe4prUXyaLKlPC
 Dkaw==
X-Gm-Message-State: AOAM531ZuTJGugbNq2KWLTSQ6h5SyxnqOae542y5i4Em1VPG9sUxETp/
 6soh4+fIx65DpjSNATDawkpWfOgGr9dA3w==
X-Google-Smtp-Source: ABdhPJw3gf6V7zhox0DnI4j0xYgfYKztamVchN1lX3rePPCq5xRtBO7/+3ZzUfo9/7h4pMXJ2ozcQg==
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id
 g15-20020a056a0023cfb02902d5302edc77mr11531588pfc.63.1626285998313; 
 Wed, 14 Jul 2021 11:06:38 -0700 (PDT)
Received: from localhost.localdomain ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id d1sm2853521pju.16.2021.07.14.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:06:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/arm: Add sve-default-vector-length cpu property
Date: Wed, 14 Jul 2021 11:06:35 -0700
Message-Id: <20210714180635.1648966-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714180635.1648966-1-richard.henderson@linaro.org>
References: <20210714180635.1648966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mirror the behavour of /proc/sys/abi/sve_default_vector_length
under the real linux kernel.  We have no way of passing along
a real default across exec like the kernel can, but this is a
decent way of adjusting the startup vector length of a process.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/482
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   |  5 +++++
 target/arm/cpu.c   | 14 ++++++++++--
 target/arm/cpu64.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 52e99344c5..ffd82edaef 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1006,6 +1006,11 @@ struct ARMCPU {
     /* Used to set the maximum vector length the cpu will support.  */
     uint32_t sve_max_vq;
 
+#ifdef CONFIG_USER_ONLY
+    /* Used to set the default vector length at process start. */
+    uint32_t sve_default_vq;
+#endif
+
     /*
      * In sve_vq_map each set bit is a supported vector length of
      * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9cddfd6a44..b5a2c9eb45 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -201,7 +201,8 @@ static void arm_cpu_reset(DeviceState *dev)
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
+            env->vfp.zcr_el[1] =
+                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
         }
         /*
          * Enable TBI0 but not TBI1.
@@ -1051,7 +1052,16 @@ static void arm_cpu_initfn(Object *obj)
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+# ifdef TARGET_AARCH64
+    /*
+     * The linux kernel defaults to 512-bit vectors, when sve is supported.
+     * See documentation for /proc/sys/abi/sve_default_vector_length, and
+     * our corresponding sve-default-vector-length cpu property.
+     */
+    cpu->sve_default_vq = 4;
+# endif
+#else
     /* Our inbound IRQ and FIQ lines */
     if (kvm_enabled()) {
         /* VIRQ and VFIQ are unused with KVM but we add them to maintain
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c7a1626bec..0e44a4f154 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -559,6 +559,52 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     cpu->isar.id_aa64pfr0 = t;
 }
 
+#ifdef CONFIG_USER_ONLY
+/* Mirror linux /proc/sys/abi/sve_default_vector_length. */
+static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
+                                            const char *name, void *opaque,
+                                            Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t default_len, default_vq, remainder;
+
+    if (!visit_type_uint32(v, name, &default_len, errp)) {
+        return;
+    }
+
+    default_vq = default_len / 128;
+    remainder = default_len % 128;
+
+    /*
+     * Note that the 512 max comes from include/uapi/asm/sve_context.h
+     * and is the maximum architectural width of ZCR_ELx.LEN.
+     */
+    if (remainder || default_vq < 1 || default_vq > 512) {
+        error_setg(errp, "cannot set sve-default-vector-length");
+        if (remainder) {
+            error_append_hint(errp, "Vector length not a multiple of 128\n");
+        } else if (default_vq < 1) {
+            error_append_hint(errp, "Vector length smaller than 128\n");
+        } else {
+            error_append_hint(errp, "Vector length larger than 65536\n");
+        }
+        return;
+    }
+
+    cpu->sve_default_vq = default_vq;
+}
+
+static void cpu_arm_get_sve_default_vec_len(Object *obj, Visitor *v,
+                                            const char *name, void *opaque,
+                                            Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint32_t value = cpu->sve_default_vq * 128;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+#endif
+
 void aarch64_add_sve_properties(Object *obj)
 {
     uint32_t vq;
@@ -571,6 +617,13 @@ void aarch64_add_sve_properties(Object *obj)
         object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
                             cpu_arm_set_sve_vq, NULL, NULL);
     }
+
+#ifdef CONFIG_USER_ONLY
+    /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
+    object_property_add(obj, "sve-default-vector-length", "uint32",
+                        cpu_arm_get_sve_default_vec_len,
+                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
+#endif
 }
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
-- 
2.25.1


