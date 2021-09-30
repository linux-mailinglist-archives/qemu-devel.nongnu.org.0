Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A46C41DD15
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:14:36 +0200 (CEST)
Received: from localhost ([::1]:55010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxlb-00023X-6m
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxg1-0003vm-Oe
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:08:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxfy-00014N-KZ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:08:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id v127so4927256wme.5
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CUxXorZNxQAdKT8A1/Ktghlcu3rez/M4pWH0J3djKc4=;
 b=RVUmwGf0uFpw2U1R324ergOkAxMjXIOqXxnFcVD+6N4DdIM/jP9POWrgdLcxHFwDId
 /iKwpvpukf3UgYNxjU6mAWSdMRl3dtG1o/sq/c37l8n9/rIkINgY/lvqwr0GaAJYK0ut
 oQgonw009paAIcYfmm5dzrDS6ZIy4lzNWAFQQBzfKImj5/STqAH5cJYEi4pF+Wh1QMZI
 kks4kilKSTg0vpvnOFgEH+rYlSHIdaq4a0tcDihM+aZvIhcZTBD3LI2aNHv26EGSKJxx
 GYODdh9EillpzUvebPb9kmXtK7yGy3S/i9Y97Quoohsx/fJTrwR7y4zXYGzLmWbw/TM5
 dWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUxXorZNxQAdKT8A1/Ktghlcu3rez/M4pWH0J3djKc4=;
 b=cXZQhXMkaY/PnjnD5hQM4cOBmAxMXA9ySG5416Ln0iOmrdaIqb/xeQ6EUfE/i1WFU2
 iRbOE8UJNOO9z53XcyKFNslbystORS8fD3LSI8Y0RTjaucpku5PiLNnsQwl0JsW33K4x
 kjOi8ZSOTIPNSpnYPOJk2VpiOtmb0rcuwzSmFYTlczHIhz4Qdb2qKxDCuopjsruHui4T
 Mzjvlz+F/n3yUNS5kJp7cmjmPL3xcEjgGHNZHbpirKTPUQIuYIaVgNh+zO+bmAxPMPfk
 EYtE9Fd+Ib+biKh+7cZb8Dpj2a/YkzYnNrpLJl+le/g1ZGSDraIohURBuDJyuddA7eoF
 jrKg==
X-Gm-Message-State: AOAM5334ZH+cH1DevPGHtalMNugF67w0tBd/pozCRmswBuw9sYoolIC/
 oHoBDQWH9hAII1zAheeDuSEV7Q==
X-Google-Smtp-Source: ABdhPJzSmwZDsufq3njwh6pq0k/ahnSwOdtrX+5IhH/YlL8PYeBC+p9jVCUuGJYn8ewvvNUIPhl3jw==
X-Received: by 2002:a05:600c:358d:: with SMTP id
 p13mr5952591wmq.71.1633014525346; 
 Thu, 30 Sep 2021 08:08:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o26sm5085942wmc.17.2021.09.30.08.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:08:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/intc/arm_gicv3: Move checking of redist-region-count
 to arm_gicv3_common_realize
Date: Thu, 30 Sep 2021 16:08:40 +0100
Message-Id: <20210930150842.3810-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930150842.3810-1-peter.maydell@linaro.org>
References: <20210930150842.3810-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv3 devices have an array property redist-region-count.
Currently we check this for errors (bad values) in
gicv3_init_irqs_and_mmio(), just before we use it.  Move this error
checking to the arm_gicv3_common_realize() function, where we
sanity-check all of the other base-class properties. (This will
always be before gicv3_init_irqs_and_mmio() is called, because
that function is called in the subclass realize methods, after
they have called the parent-class realize.)

The motivation for this refactor is:
 * we would like to use the redist_region_count[] values in
   arm_gicv3_common_realize() in a subsequent patch, so we need
   to have already done the sanity-checking first
 * this removes the only use of the Error** argument to
   gicv3_init_irqs_and_mmio(), so we can remove some error-handling
   boilerplate

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_common.h |  2 +-
 hw/intc/arm_gicv3.c                |  6 +-----
 hw/intc/arm_gicv3_common.c         | 26 +++++++++++++-------------
 hw/intc/arm_gicv3_kvm.c            |  6 +-----
 4 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index aa4f0d67703..cb2b0d0ad45 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -306,6 +306,6 @@ struct ARMGICv3CommonClass {
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops, Error **errp);
+                              const MemoryRegionOps *ops);
 
 #endif
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 3f24707838c..bcf54a5f0a5 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -393,11 +393,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
 
     gicv3_init_cpuif(s);
 }
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 223db16feca..8e47809398b 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -250,22 +250,11 @@ static const VMStateDescription vmstate_gicv3 = {
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
-                              const MemoryRegionOps *ops, Error **errp)
+                              const MemoryRegionOps *ops)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
-    int rdist_capacity = 0;
     int i;
 
-    for (i = 0; i < s->nb_redist_regions; i++) {
-        rdist_capacity += s->redist_region_count[i];
-    }
-    if (rdist_capacity < s->num_cpu) {
-        error_setg(errp, "Capacity of the redist regions(%d) "
-                   "is less than number of vcpus(%d)",
-                   rdist_capacity, s->num_cpu);
-        return;
-    }
-
     /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
      * GPIO array layout is thus:
      *  [0..N-1] spi
@@ -308,7 +297,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
-    int i;
+    int i, rdist_capacity;
 
     /* revision property is actually reserved and currently used only in order
      * to keep the interface compatible with GICv2 code, avoiding extra
@@ -350,6 +339,17 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    rdist_capacity = 0;
+    for (i = 0; i < s->nb_redist_regions; i++) {
+        rdist_capacity += s->redist_region_count[i];
+    }
+    if (rdist_capacity < s->num_cpu) {
+        error_setg(errp, "Capacity of the redist regions(%d) "
+                   "is less than number of vcpus(%d)",
+                   rdist_capacity, s->num_cpu);
+        return;
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 5c09f00dec2..ab58c73306d 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -787,11 +787,7 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
+    gicv3_init_irqs_and_mmio(s, kvm_arm_gicv3_set_irq, NULL);
 
     for (i = 0; i < s->num_cpu; i++) {
         ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
-- 
2.20.1


