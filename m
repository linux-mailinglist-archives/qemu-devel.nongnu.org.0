Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9883D41A5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 22:37:17 +0200 (CEST)
Received: from localhost ([::1]:59358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m71v3-0006FH-1U
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 16:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rm-0000Bg-Ir
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rk-0008DS-Jd
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so10648443pjb.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 13:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0quSyCi9kfxfY1A8lHcxgbeKm6SRDXR67Drrk/c6Yu4=;
 b=OSBpaMGhhw746qwKkwIKUkAMur1lohlJaZND/Y3xNGl44Pt8+895w4JiI49WzIElO3
 rHZNxaR26h2dIjY9RmkoiJobIwUH7EJRRcEBZMedr2dyhMeKRMYPCAvQowBWdTbvbauJ
 o8YdebP8hT9iIKEHdv7RPhbjCPdMHvcAY8B+Cgnbh2lzb1aTgSdCOoO/I9N6x3tF6kTC
 opQdLvwFNjzmcPIo/FILP0nCwByPwZYXRKW5EMEZbDkm+AMPNwCib1IAGfE+fSncfk1C
 +PFkksP+N5zrp3jAcG5ZB7mjXkJiNS97GanzulD8s4oWPhvDv2+TnqIfT60a0xicq+F4
 7QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0quSyCi9kfxfY1A8lHcxgbeKm6SRDXR67Drrk/c6Yu4=;
 b=bBxYmKWA82EoYEe3gk9JBT+blUN0xhka+ZCMxzZm2zPaureHYx8N1Wr+kwCatWPOYL
 cA0Es1Kqiv6iaonimqH+alAyeihGUcaFf9UQjrwOA4DPRYsvc93gdWEYqkWS3OSszpzX
 wnXf/zz7BB/Z43tAwtzrv5EIV2H75fRBN9ojpqpxUb9sfItyk6qkB75UqmSvyTkpHY0P
 ZYccSsqYGPNhmyBw9eX5J9vJIfr538mW32V17CIoRCJLq+6WVv4fyXiLdYwXgwhsRjuz
 dYzlC/CMzfbPdQROh5yMmRP+99/tMo2L2TFN5A8yrFQ/tVnfO4blEX4BHux9HkihDwOh
 hOfg==
X-Gm-Message-State: AOAM530Z4Ax57bZu24TfqxJK195Ns6k9yf3rTfU01OwvU2IrDQl7s6WP
 QdI+BdN5fXBQ0/Sm0s5krmJmP+mvahkWmQ==
X-Google-Smtp-Source: ABdhPJyDLxOdipI/kHzlbg2aSUmOcENeqnGiddN4p8LLAmF2Y/siaUvVQwzed8UyfSJw0vyRNxg4WA==
X-Received: by 2002:a17:90a:e453:: with SMTP id
 jp19mr15421410pjb.19.1627072431283; 
 Fri, 23 Jul 2021 13:33:51 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v23sm6904754pje.33.2021.07.23.13.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu property
Date: Fri, 23 Jul 2021 10:33:44 -1000
Message-Id: <20210723203344.968563-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723203344.968563-1-richard.henderson@linaro.org>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mirror the behavour of /proc/sys/abi/sve_default_vector_length
under the real linux kernel.  We have no way of passing along
a real default across exec like the kernel can, but this is a
decent way of adjusting the startup vector length of a process.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/482
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/cpu-features.rst | 11 ++++++
 target/arm/cpu.h                 |  5 +++
 target/arm/cpu.c                 | 14 ++++++--
 target/arm/cpu64.c               | 60 ++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index c455442eaf..4ff36cc83f 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -376,3 +376,14 @@ verbose command lines.  However, the recommended way to select vector
 lengths is to explicitly enable each desired length.  Therefore only
 example's (1), (4), and (6) exhibit recommended uses of the properties.
 
+SVE User-mode Default Vector Length Property
+--------------------------------------------
+
+For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
+defined to mirror the Linux kernel parameter file
+`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
+is in units of bytes and must be between 16 and 8192.  
+If not specified, the default vector length is 64.
+
+If the default length is larger than the maximum vector length enabled
+with `sve<N>` properties, the actual vector length will be reduced.
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be9a4dceae..9f0a5f84d5 100644
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
index 752b15bb79..2866dd7658 100644
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
index c7a1626bec..c690318a9b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -559,6 +559,59 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     cpu->isar.id_aa64pfr0 = t;
 }
 
+#ifdef CONFIG_USER_ONLY
+/* Mirror linux /proc/sys/abi/sve_default_vector_length. */
+static void cpu_arm_set_sve_default_vec_len(Object *obj, Visitor *v,
+                                            const char *name, void *opaque,
+                                            Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    int32_t default_len, default_vq, remainder;
+
+    if (!visit_type_int32(v, name, &default_len, errp)) {
+        return;
+    }
+
+    /* Undocumented, but the kernel allows -1 to indicate "maximum". */
+    if (default_len == -1) {
+        cpu->sve_default_vq = ARM_MAX_VQ;
+        return;
+    }
+
+    default_vq = default_len / 16;
+    remainder = default_len % 16;
+
+    /*
+     * Note that the 512 max comes from include/uapi/asm/sve_context.h
+     * and is the maximum architectural width of ZCR_ELx.LEN.
+     */
+    if (remainder || default_vq < 1 || default_vq > 512) {
+        error_setg(errp, "cannot set sve-default-vector-length");
+        if (remainder) {
+            error_append_hint(errp, "Vector length not a multiple of 16\n");
+        } else if (default_vq < 1) {
+            error_append_hint(errp, "Vector length smaller than 16\n");
+        } else {
+            error_append_hint(errp, "Vector length larger than %d\n",
+                              512 * 16);
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
+    int32_t value = cpu->sve_default_vq * 16;
+
+    visit_type_int32(v, name, &value, errp);
+}
+#endif
+
 void aarch64_add_sve_properties(Object *obj)
 {
     uint32_t vq;
@@ -571,6 +624,13 @@ void aarch64_add_sve_properties(Object *obj)
         object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
                             cpu_arm_set_sve_vq, NULL, NULL);
     }
+
+#ifdef CONFIG_USER_ONLY
+    /* Mirror linux /proc/sys/abi/sve_default_vector_length. */
+    object_property_add(obj, "sve-default-vector-length", "int32",
+                        cpu_arm_get_sve_default_vec_len,
+                        cpu_arm_set_sve_default_vec_len, NULL, NULL);
+#endif
 }
 
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
-- 
2.25.1


