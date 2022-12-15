Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0364DBF4
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:09:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhV-00076t-CA; Thu, 15 Dec 2022 07:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh4-0006pm-C0
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh2-000499-MS
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso1596532wms.4
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Sb8rZwHrNhrvr6X/OgCKlqVcv8NJTW1C2wl4Tbc0DMM=;
 b=Rkth8aY08hhwADcOuqNzvAxeLga+JfzOWSJWzc2RLTxZuWpHTu8wHgATffzxUgSQEU
 awFL8ZskKjI4H4C2HUZbasDEJfuAiPgV6uKilsubqJ0e7g9I4uP/qySVj8kFG9j9Y/Ng
 OjWYYeroQdAg8sr7uW0OqsKUlqlD+le9v3PR/odfHDQ/0y6uCVIXMU3v8cXvewFP5Cpn
 1i+BdfXTYCs3WJVWUbqtwooqPcYXFRh3/36Pp4LQSzxX12dOgYL1RzLN61zGnqRQW+md
 uLlTPPPYVynwLwcNs9XsWC8nPmRY2OW0fh9zKjfXyrzL1DAwtp+H9iWfisJq7rWe8owl
 b4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sb8rZwHrNhrvr6X/OgCKlqVcv8NJTW1C2wl4Tbc0DMM=;
 b=1QKim7yizhY7/VQZjQJTnQGvnQTbnUl96NYhic643i4jrAWO+AqrYaLRLU5FTc3Js5
 CF0pA+jLkhgoX8l2KNJE+zfEQNT9A8riB2kEURubA/WOwRhtv30ikMLbn9It9cPCmx12
 Le9igd+7JARBRcQeQzVrfPqwjraDGpRBj1EFkUy4OhSIAF01t8mN6+C4+qHPHux8ExP5
 Qix3fLczM+fAX3IVU8R496O1YihNItMlhnxUsdo7nP4VINZlCUzS/tqGJZHhSILHUUhl
 K1+SY/85VDjOMhvbaMnVeWF+GwCQhGac3rlwgELR0HhM8yLztcdA7IgOuSjdaPmLpe3o
 XQXQ==
X-Gm-Message-State: ANoB5pll5j4fied57hIaENYCsyH3JNzMMVgoE0HM6Zf7rp7I7Og0Yvaj
 MP+Cu1U+s1YsZst/vycBrFZ0+z9X4qWeuBgb
X-Google-Smtp-Source: AA0mqf6/piLY4iSF2+xc56MOaZAOYtocyvLiQpiJEu+zn8XdCrdZ+vaQ1frQzWi1SmB68aFKxoVL7A==
X-Received: by 2002:a05:600c:1d83:b0:3c7:a5:610c with SMTP id
 p3-20020a05600c1d8300b003c700a5610cmr21692970wms.16.1671108630031; 
 Thu, 15 Dec 2022 04:50:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/29] hw/intc: Convert TYPE_ARM_GIC_KVM to 3-phase reset
Date: Thu, 15 Dec 2022 12:50:00 +0000
Message-Id: <20221215125009.980128-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Now we have converted TYPE_ARM_GIC_COMMON, we can convert the
TYPE_ARM_GIC_KVM subclass to 3-phase reset.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221109161444.3397405-5-peter.maydell@linaro.org
---
 hw/intc/arm_gic_kvm.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 7d2a13273a4..1d588946bce 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -38,7 +38,7 @@ DECLARE_OBJ_CHECKERS(GICState, KVMARMGICClass,
 struct KVMARMGICClass {
     ARMGICCommonClass parent_class;
     DeviceRealize parent_realize;
-    void (*parent_reset)(DeviceState *dev);
+    ResettablePhases parent_phases;
 };
 
 void kvm_arm_gic_set_irq(uint32_t num_irq, int irq, int level)
@@ -473,12 +473,14 @@ static void kvm_arm_gic_get(GICState *s)
     }
 }
 
-static void kvm_arm_gic_reset(DeviceState *dev)
+static void kvm_arm_gic_reset_hold(Object *obj)
 {
-    GICState *s = ARM_GIC_COMMON(dev);
+    GICState *s = ARM_GIC_COMMON(obj);
     KVMARMGICClass *kgc = KVM_ARM_GIC_GET_CLASS(s);
 
-    kgc->parent_reset(dev);
+    if (kgc->parent_phases.hold) {
+        kgc->parent_phases.hold(obj);
+    }
 
     if (kvm_arm_gic_can_save_restore(s)) {
         kvm_arm_gic_put(s);
@@ -593,6 +595,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
 static void kvm_arm_gic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMGICCommonClass *agcc = ARM_GIC_COMMON_CLASS(klass);
     KVMARMGICClass *kgc = KVM_ARM_GIC_CLASS(klass);
 
@@ -600,7 +603,8 @@ static void kvm_arm_gic_class_init(ObjectClass *klass, void *data)
     agcc->post_load = kvm_arm_gic_put;
     device_class_set_parent_realize(dc, kvm_arm_gic_realize,
                                     &kgc->parent_realize);
-    device_class_set_parent_reset(dc, kvm_arm_gic_reset, &kgc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, kvm_arm_gic_reset_hold, NULL,
+                                       &kgc->parent_phases);
 }
 
 static const TypeInfo kvm_arm_gic_info = {
-- 
2.25.1


