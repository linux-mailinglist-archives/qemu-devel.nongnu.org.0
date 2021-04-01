Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A816B3513CF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:43:14 +0200 (CEST)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRunB-0000no-MW
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulK-00077i-Kw
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:18 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRulI-0002Pi-Ow
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:41:18 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so1681719otq.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOQB26mZhLmXCQu+JfKJIpuDxvkGsibNUVfx4FrnidQ=;
 b=cEOgnCkFngCcBDovQ0d30yVK1Z1NZCncTf6hUxqx3v+dJzXrrgNdqilRaZcnb7lYhQ
 pGEhtJbr2Pa2RfOKbURro47fhxQCJ8T0u4garYxmJ6nvucZGxofsfngTyIVFDVN6OQ/0
 gSR7jGHCY0c6kpn5Z8kj5/w1GgrQxKD8heymweLpFMqBYGT8fLDTz7OJjK8OdJ4s4OPy
 6dcneIdcNnh4JR+iRS/9dW7hgWE6fnWm6mb3toWlonb4/OccEDRFTugwquC56OyQ525n
 tgNTVK/hxgoJWC6TMYvSD5ZWXdNbzdgyNmVbNlRW+63mqr3VfU8hRIcl1ZEBotXWLc8t
 Ssqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOQB26mZhLmXCQu+JfKJIpuDxvkGsibNUVfx4FrnidQ=;
 b=YPaAgMpWShgV6r8MHFRKB6SDPSyQ42zIX8nUgyOn5rY5R5Apd0E8N+71U9Mza0B647
 I7XBdK2pmA2UnK8nNKNfFBsph7NJN0x3ttKONw60hB1r2Fusm3pREweNKxWyCCbG+u/A
 oHq/115lzzNdACsl4AXY6jyI1tMYwOKclGIrFjGkQoyxlegj1PsvgC7Pnucjh1pGOQJT
 RY2sWD0dmItjCfOZ8ZmRXDeOczJFtlddol5An05x30+sCQ+ojNAOJ+obh4P66SDi98VV
 DGzktDpoV9KXQHOIcov0T5XPg/iTqf0g3dz1RBbStuU/QaVQsmDoiJoGmx9s70E6ENeR
 /8Ww==
X-Gm-Message-State: AOAM532jJLFijYCSSQL62ljrI3kWuWKfbr8mtN88AEOlLalUjlLBs/8z
 8+/IBwFD/N0gzKYpLQ62xHwwOyv5P+zZeow=
X-Google-Smtp-Source: ABdhPJwYs1eecXUC/z4idu7BAViNNHUUt7TDSq1SMFoKiPJw0wYnfEv6zv0u5vNnKeVHGt6IvVOGKQ==
X-Received: by 2002:a9d:740a:: with SMTP id n10mr6385570otk.27.1617273675553; 
 Thu, 01 Apr 2021 03:41:15 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id a6sm1069066otq.79.2021.04.01.03.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:41:15 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 4/6] hw/intc/arm_gicv3: Enable support for setting vGIC
 maintenance IRQ
Date: Thu,  1 Apr 2021 10:40:56 +0000
Message-Id: <49a4944e2f148c56938380b981afe154b7a8b7ee.1617272690.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617272690.git.haibo.xu@linaro.org>
References: <cover.1617272690.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=haibo.xu@linaro.org; helo=mail-ot1-x32f.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the new VGIC KVM device attribute to set the maintenance IRQ.
This is fixed to use IRQ 25(PPI 9), as a platform decision matching
the arm64 SBSA recommendation.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c                      |  5 +++++
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 16 ++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 4 files changed, 23 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..92d46ebcfe 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -663,6 +663,11 @@ static void create_gic(VirtMachineState *vms)
             qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
         }
+
+        if (kvm_irqchip_in_kernel()) {
+            bool el2 = object_property_get_bool(OBJECT(first_cpu), "el2", NULL);
+            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions", el2);
+        }
     } else {
         if (!kvm_irqchip_in_kernel()) {
             qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 58ef65f589..3ac10c8e61 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -495,6 +495,7 @@ static Property arm_gicv3_common_properties[] = {
     DEFINE_PROP_UINT32("num-irq", GICv3State, num_irq, 32),
     DEFINE_PROP_UINT32("revision", GICv3State, revision, 3),
     DEFINE_PROP_BOOL("has-security-extensions", GICv3State, security_extn, 0),
+    DEFINE_PROP_BOOL("has-virtualization-extensions", GICv3State, virt_extn, 0),
     DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
                       redist_region_count, qdev_prop_uint32, uint32_t),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 65a4c880a3..1e1ca66e2c 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -826,6 +826,22 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
                       KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
 
+    if (s->virt_extn) {
+        bool maint_irq_allowed;
+        uint32_t maint_irq = 25;
+
+        maint_irq_allowed =
+            kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ, 0);
+        if (!maint_irq_allowed) {
+            error_setg(errp, "VGICv3 setting maintenance IRQ are not "
+                             "supported by this host kernel");
+            return;
+        }
+
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_MAINT_IRQ,
+                          0, &maint_irq, true, &error_abort);
+    }
+
     kvm_arm_register_device(&s->iomem_dist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd, 0);
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 91491a2f66..921ddc2c5f 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -220,6 +220,7 @@ struct GICv3State {
     uint32_t num_irq;
     uint32_t revision;
     bool security_extn;
+    bool virt_extn;
     bool irq_reset_nonsecure;
     bool gicd_no_migration_shift_bug;
 
-- 
2.17.1


