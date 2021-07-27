Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A493D73DF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:58:08 +0200 (CEST)
Received: from localhost ([::1]:35426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Kml-0005K4-5X
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdD-000222-Mi
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8KdB-0004xe-BV
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:15 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 a80-20020a1c98530000b0290245467f26a4so2037206wme.0
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N9dYo5ad6/rKm1aRyMj/Du1njF1OBu0NBfHeO+RkrEo=;
 b=SrWhUrPCTLU1HHnoQE6GfmvT5z0K3186N3Z/7rSEAGsZCKim950mc5BjK87rwkPEIo
 d5xp5h8nz+H7JeAmXJUxJuveKI+Ep5L+lfx6DyKo55nRPHPjVHwEv5T8QzjhmM9u3tDx
 466f0hJMUhw3+3ATsmjNlihB177ztJxZOaEcrspNLK7lSjY0J5XDYgWhdjjYuOBOV39z
 2trTUKY1M98TwyihAfqY8RDT7qX5QCbEqLV4yorM9tQ9MuSDahIoQa1W5jFi5pH8HNlt
 QKqDZCviiJDkdlxCAY8iJT4uKJPnlUBcUhss4ubjQjo7T/pHg0Wy8P19DAwY++nVQODd
 iBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9dYo5ad6/rKm1aRyMj/Du1njF1OBu0NBfHeO+RkrEo=;
 b=kGikMXh7KmKmUbGFovcO+jpwkFabD33vE7DlhHmjKtJctv4izbPOjY618IldQNdpCg
 YVTGBezP15kLmYn7THB4MdewbfhErKPvw0ADoygtUhcOXHZZpN1wZsi10tPwnKjyFn/g
 KT2wyHhtWVMOz7/oBzTnblE4x3c9Oe+AHPHCa7iUHwHOT+Nv5/5GcN2E9ENU3tmu2Jyt
 QtNs7x51DvV4jXk4t47EU17guaauXBfXgsgv0qFav3XxIAaVOFXGgZ9fd47zW+nrkCyr
 AlrArEeI0r+MKGINwV6bLDuzkFZ9FQ9FrgxPDhNGobTp8b7C9zmmeYOe5Joil8QQ4Akl
 CoGw==
X-Gm-Message-State: AOAM531Z8BJbv/XZf9aQNDmRtKahCxmfAIrhBEu7n7KRZS1xDiAmIo8G
 kcZT1KTJmPKmi4/2VU7K0DMTXiC132ACvA==
X-Google-Smtp-Source: ABdhPJzyIvjJcv1f8CA87MuC4zTIWT+L8fo5e8vHFF1XkB86GGQfcsTg9YCih1lg5ac0exyiXmPn2g==
X-Received: by 2002:a05:600c:33a2:: with SMTP id
 o34mr3395585wmp.157.1627382891940; 
 Tue, 27 Jul 2021 03:48:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/14] target/arm: Add sve-default-vector-length cpu property
Date: Tue, 27 Jul 2021 11:47:59 +0100
Message-Id: <20210727104801.29728-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Mirror the behavour of /proc/sys/abi/sve_default_vector_length
under the real linux kernel.  We have no way of passing along
a real default across exec like the kernel can, but this is a
decent way of adjusting the startup vector length of a process.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/482
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210723203344.968563-4-richard.henderson@linaro.org
[PMM: tweaked docs formatting, document -1 special-case,
 added fixup patch from RTH mentioning QEMU's maximum veclen.]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/cpu-features.rst | 15 ++++++++
 target/arm/cpu.h                 |  5 +++
 target/arm/cpu.c                 | 14 ++++++--
 target/arm/cpu64.c               | 60 ++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index c455442eaf5..11dce5c6037 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -376,3 +376,18 @@ verbose command lines.  However, the recommended way to select vector
 lengths is to explicitly enable each desired length.  Therefore only
 example's (1), (4), and (6) exhibit recommended uses of the properties.
 
+SVE User-mode Default Vector Length Property
+--------------------------------------------
+
+For qemu-aarch64, the cpu property ``sve-default-vector-length=N`` is
+defined to mirror the Linux kernel parameter file
+``/proc/sys/abi/sve_default_vector_length``.  The default length, ``N``,
+is in units of bytes and must be between 16 and 8192.
+If not specified, the default vector length is 64.
+
+If the default length is larger than the maximum vector length enabled,
+the actual vector length will be reduced.  Note that the maximum vector
+length supported by QEMU is 256.
+
+If this property is set to ``-1`` then the default vector length
+is set to the maximum possible length.
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be9a4dceae1..9f0a5f84d50 100644
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
index 752b15bb797..2866dd76588 100644
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
index c7a1626bec2..c690318a9b6 100644
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
2.20.1


