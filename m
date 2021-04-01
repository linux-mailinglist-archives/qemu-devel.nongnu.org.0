Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C933514FB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:05:05 +0200 (CEST)
Received: from localhost ([::1]:48364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRx0S-0002vK-5F
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrb-0001nX-FQ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:55 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:41919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrY-0002zy-9p
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:55 -0400
Received: by mail-oi1-x22d.google.com with SMTP id z15so1652355oic.8
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOQB26mZhLmXCQu+JfKJIpuDxvkGsibNUVfx4FrnidQ=;
 b=KEvABx0NXKVvdh/cTK6KT1oo5zefKnn3hc69TWi2rxtInPtUacKaYNk3KgfhtWfjeo
 T4hCRoMYyjI2dGOe3OC37nXT2yKt8gTN8ewT+BjAqHOBfGsEinutKx3SNXezLAT0wO5K
 x11QqEEBzG5DSKKkNUnXZoifcye78z/7qtA++R4W51qS9Sgzc9Opq83NeFJ8BI4ijXFp
 waTiFea9FnnYxoEtL23AehWyXbDZnNd413K4o2vca32gnjZ+kxy1gAc96mBv+F20bMnn
 pAgjWwMgEB/vR2jYWj0f+PjF60b5zWNvbQZxbixcob4cw0S3K7O9IjLdkPLn5CJ2DkQn
 OewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOQB26mZhLmXCQu+JfKJIpuDxvkGsibNUVfx4FrnidQ=;
 b=RJ/cYM8n2fRw0U94tPZAxv9Ie0kf5/Yw5MLRd0bpppwYtJH6iprNO6Rje7RawrarqP
 THTT/2RwD3SnvH9/vT03K8b9rpfX/XgBYvDFmwkeUMVLnNQB33COa1QfqopUKp6OcbWD
 htHnQKjBmzrptRJT0dFVttE7oKce7NxVBzH/BzkxHs/HTD2bCXHMLJ+y846Uk7Bz0UGD
 htysV8040n0xiVWS6pCBFXZpvtkPOaU5hy1BaPYfUXMYY+qEKSpHlflTrnpbIW41E5Zz
 sgENniEdmOEhjLntWUY0TQsPhiVYDpNzEiboRinmSmw4De49crPmqoL1gYoUT4OArsLL
 u5wA==
X-Gm-Message-State: AOAM532HvIMDmXXe9UYDtpIsbKU0YPYQFXZQIGGX2r0+LS4rauRruo2Z
 f7sfnbRY8qCUTOlGaC2tpaBNaGFYv4/WrW0=
X-Google-Smtp-Source: ABdhPJxI/uw6rbji0Wl5bpHt1oA9wrU1QLTCRJ5Nd+hBlIOxas0NY1cKepceiGfY8WNhVaQnin+Mow==
X-Received: by 2002:aca:4c48:: with SMTP id z69mr6220512oia.61.1617281750888; 
 Thu, 01 Apr 2021 05:55:50 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:50 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 4/6] hw/intc/arm_gicv3: Enable support for setting
 vGIC maintenance IRQ
Date: Thu,  1 Apr 2021 12:55:36 +0000
Message-Id: <49a4944e2f148c56938380b981afe154b7a8b7ee.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281290.git.haibo.xu@linaro.org>
References: <cover.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x22d.google.com
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


