Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7644265C5F3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:19:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrm-0000dH-J6; Tue, 03 Jan 2023 13:18:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClri-0000T4-Bz
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:22 -0500
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClrg-0005M8-FS
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:18:22 -0500
Received: by mail-qv1-xf2d.google.com with SMTP id df17so18377971qvb.3
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dszATuIwttfYWieXQT1KqRjch1JsKTu3HotiKgzPAys=;
 b=T5+n9k2FQJzUZULUbO95btcHJVlelh3ru58N3xgxXMV/N+unjgy/1B1cRgFvPbVLJe
 1lG02X/xSvaO2QIa1QYLAeInrLmeTUh0EQHPlY2X7psLLlZTAgTDTqgWaKPWF9FvoVy/
 nO3aAFvimz6qMbdjPJikZfVp6QT0IrLen/xIkSC1Kdl0Pd7rejlnyuXv5UQm7QCgfUUh
 8FJdroUULUvWDWY9LpjsDphgGc+hLy43SbzsBb7vp7cc5DEd7ip6k23PR6g6Scit3u7Q
 P0+dQzQ05XzppQNVKuKIGYZaE4djd1I+EyVigQMUJfiL04gi2Y2Y9UTFDJSb7gK/3/du
 /OVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dszATuIwttfYWieXQT1KqRjch1JsKTu3HotiKgzPAys=;
 b=Q3ou1MXQjOZoltSmumliMK+Ldcvt6AjMePzSRiHEqvPOl/9DmJYvwkzHnTWPFfuhIv
 MEtOFnhCm6P9eb5j/HS1BXBcogA3s3JecdUIsiqE8u9c2ctqt6Qr1u8FMv/lqLj1Vtqp
 mTy7Tvc/CJEauMbhXROwpCrRW3NeBrkNmgjFrb9VshQJ/rY0KhkfI4JUpVuU4csBkqaK
 Vv7LPLmwpfz0wUUoVlHNEE0QVqc9q2qSQk/Ca9uyy88YXYFUaMMwIULUbvTd3YLQkfS/
 TtwQqxz7H361v2KXRgZ8MgXXaMQFvwPuzaPa+BL/OcH1IPCuugHEGz5MdSELOQvF42VB
 IQvg==
X-Gm-Message-State: AFqh2krsj98taPgfcp7dXTNqVjrbNjdAIGjhqqWXNQVhlpAFS118Ldew
 Z6SDZWw/gSDmY6IJOCBmQKmq9vzKziV0W7VXbQw=
X-Google-Smtp-Source: AMrXdXt/wJli+wjdL9n3n3PAqNiLX5Gyy4VLyaFLh3OKOHK/M98qyOWJF+J69hYkJ3fnGfjtDSqOzQ==
X-Received: by 2002:a0c:db8a:0:b0:531:dd54:9ad5 with SMTP id
 m10-20020a0cdb8a000000b00531dd549ad5mr2425204qvk.0.1672769899423; 
 Tue, 03 Jan 2023 10:18:19 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:18:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 30/40] target/arm: Move feature bit propagation to class
 init
Date: Tue,  3 Jan 2023 10:16:36 -0800
Message-Id: <20230103181646.55711-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

With the introduction of aarch64_host_class_init, we have
enough feature bits set to do propagation early.  Move the
tcg consistency checks to class_late_init, after we have
populated all of the id registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 162 ++++++++++++++++++++++-------------------------
 1 file changed, 77 insertions(+), 85 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0824af601f..22a6ccaece 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1369,14 +1369,6 @@ static void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-    /* M profile implies PMSA. We have to do this here rather than
-     * in realize with the other feature-implication checks because
-     * we look at the PMSA bit to see if we should add some properties.
-     */
-    if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
-        set_feature(&cpu->env, ARM_FEATURE_PMSA);
-    }
-
     if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
         arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_reset_cbar_property);
@@ -1574,7 +1566,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     CPUARMState *env = &cpu->env;
     int pagebits;
     Error *local_err = NULL;
-    bool no_aa32 = false;
 
 #ifndef CONFIG_USER_ONLY
     /* The NVIC and M-profile CPU are two halves of a single piece of
@@ -1793,82 +1784,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.mvfr1 = u;
     }
 
-    /* Some features automatically imply others: */
-    if (arm_feature(env, ARM_FEATURE_V8)) {
-        if (arm_feature(env, ARM_FEATURE_M)) {
-            set_feature(env, ARM_FEATURE_V7);
-        } else {
-            set_feature(env, ARM_FEATURE_V7VE);
-        }
-    }
-
-    /*
-     * There exist AArch64 cpus without AArch32 support.  When KVM
-     * queries ID_ISAR0_EL1 on such a host, the value is UNKNOWN.
-     * Similarly, we cannot check ID_AA64PFR0 without AArch64 support.
-     * As a general principle, we also do not make ID register
-     * consistency checks anywhere unless using TCG, because only
-     * for TCG would a consistency-check failure be a QEMU bug.
-     */
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        no_aa32 = !cpu_isar_feature(aa64_aa32, cpu);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_V7VE)) {
-        /* v7 Virtualization Extensions. In real hardware this implies
-         * EL2 and also the presence of the Security Extensions.
-         * For QEMU, for backwards-compatibility we implement some
-         * CPUs or CPU configs which have no actual EL2 or EL3 but do
-         * include the various other features that V7VE implies.
-         * Presence of EL2 itself is ARM_FEATURE_EL2, and of the
-         * Security Extensions is ARM_FEATURE_EL3.
-         */
-        assert(!tcg_enabled() || no_aa32 ||
-               cpu_isar_feature(aa32_arm_div, cpu));
-        set_feature(env, ARM_FEATURE_LPAE);
-        set_feature(env, ARM_FEATURE_V7);
-    }
-    if (arm_feature(env, ARM_FEATURE_V7)) {
-        set_feature(env, ARM_FEATURE_VAPA);
-        set_feature(env, ARM_FEATURE_THUMB2);
-        set_feature(env, ARM_FEATURE_MPIDR);
-        if (!arm_feature(env, ARM_FEATURE_M)) {
-            set_feature(env, ARM_FEATURE_V6K);
-        } else {
-            set_feature(env, ARM_FEATURE_V6);
-        }
-
-        /* Always define VBAR for V7 CPUs even if it doesn't exist in
-         * non-EL3 configs. This is needed by some legacy boards.
-         */
-        set_feature(env, ARM_FEATURE_VBAR);
-    }
-    if (arm_feature(env, ARM_FEATURE_V6K)) {
-        set_feature(env, ARM_FEATURE_V6);
-        set_feature(env, ARM_FEATURE_MVFR);
-    }
-    if (arm_feature(env, ARM_FEATURE_V6)) {
-        set_feature(env, ARM_FEATURE_V5);
-        if (!arm_feature(env, ARM_FEATURE_M)) {
-            assert(!tcg_enabled() || no_aa32 ||
-                   cpu_isar_feature(aa32_jazelle, cpu));
-            set_feature(env, ARM_FEATURE_AUXCR);
-        }
-    }
-    if (arm_feature(env, ARM_FEATURE_V5)) {
-        set_feature(env, ARM_FEATURE_V4T);
-    }
-    if (arm_feature(env, ARM_FEATURE_LPAE)) {
-        set_feature(env, ARM_FEATURE_V7MP);
-    }
-    if (arm_feature(env, ARM_FEATURE_CBAR_RO)) {
-        set_feature(env, ARM_FEATURE_CBAR);
-    }
-    if (arm_feature(env, ARM_FEATURE_THUMB2) &&
-        !arm_feature(env, ARM_FEATURE_M)) {
-        set_feature(env, ARM_FEATURE_THUMB_DSP);
-    }
-
     /*
      * We rely on no XScale CPU having VFP so we can use the same bits in the
      * TB flags field for VECSTRIDE and XSCALE_CPAR.
@@ -2318,6 +2233,67 @@ static void arm_cpu_leaf_class_init(ObjectClass *oc, void *data)
     if (acc->info->class_init) {
         acc->info->class_init(acc);
     }
+
+    /* Some features automatically imply others: */
+    if (arm_class_feature(acc, ARM_FEATURE_V8)) {
+        if (arm_class_feature(acc, ARM_FEATURE_M)) {
+            set_class_feature(acc, ARM_FEATURE_V7);
+        } else {
+            set_class_feature(acc, ARM_FEATURE_V7VE);
+        }
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_V7VE)) {
+        /*
+         * v7 Virtualization Extensions. In real hardware this implies
+         * EL2 and also the presence of the Security Extensions.
+         * For QEMU, for backwards-compatibility we implement some
+         * CPUs or CPU configs which have no actual EL2 or EL3 but do
+         * include the various other features that V7VE implies.
+         */
+        set_class_feature(acc, ARM_FEATURE_LPAE);
+        set_class_feature(acc, ARM_FEATURE_V7);
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_V7)) {
+        set_class_feature(acc, ARM_FEATURE_VAPA);
+        set_class_feature(acc, ARM_FEATURE_THUMB2);
+        set_class_feature(acc, ARM_FEATURE_MPIDR);
+        if (!arm_class_feature(acc, ARM_FEATURE_M)) {
+            set_class_feature(acc, ARM_FEATURE_V6K);
+        } else {
+            set_class_feature(acc, ARM_FEATURE_V6);
+        }
+        /*
+         * Always define VBAR for V7 CPUs even if it doesn't exist in
+         * non-EL3 configs. This is needed by some legacy boards.
+         */
+        set_class_feature(acc, ARM_FEATURE_VBAR);
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_V6K)) {
+        set_class_feature(acc, ARM_FEATURE_V6);
+        set_class_feature(acc, ARM_FEATURE_MVFR);
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_V6)) {
+        set_class_feature(acc, ARM_FEATURE_V5);
+        if (!arm_class_feature(acc, ARM_FEATURE_M)) {
+            set_class_feature(acc, ARM_FEATURE_AUXCR);
+        }
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_V5)) {
+        set_class_feature(acc, ARM_FEATURE_V4T);
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_LPAE)) {
+        set_class_feature(acc, ARM_FEATURE_V7MP);
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_CBAR_RO)) {
+        set_class_feature(acc, ARM_FEATURE_CBAR);
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_THUMB2) &&
+        !arm_class_feature(acc, ARM_FEATURE_M)) {
+        set_class_feature(acc, ARM_FEATURE_THUMB_DSP);
+    }
+    if (arm_class_feature(acc, ARM_FEATURE_M)) {
+        set_class_feature(acc, ARM_FEATURE_PMSA);
+    }
 }
 
 static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
@@ -2329,6 +2305,22 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
             return false;
         }
     }
+
+    /* Run some consistency checks for TCG. */
+    if (tcg_enabled()) {
+        bool no_aa32 = arm_class_feature(acc, ARM_FEATURE_AARCH64) &&
+                       !class_isar_feature(aa64_aa32, acc);
+
+        if (!no_aa32) {
+            if (arm_class_feature(acc, ARM_FEATURE_V7VE)) {
+                assert(class_isar_feature(aa32_arm_div, acc));
+            }
+            if (arm_class_feature(acc, ARM_FEATURE_V6) &&
+                !arm_class_feature(acc, ARM_FEATURE_M)) {
+                assert(class_isar_feature(aa32_jazelle, acc));
+            }
+        }
+    }
     return true;
 }
 
-- 
2.34.1


