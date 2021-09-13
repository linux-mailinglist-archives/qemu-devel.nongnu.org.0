Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26440991F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 18:30:22 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoqb-0003tR-O0
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 12:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYt-00015S-D2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoYr-0008Dw-0V
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 12:12:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so15534852wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V9AmhBm8UfemdEFlMs0B1qq9zHvprzdkVNNmj5F+H8g=;
 b=RFvBPTt6PTMm7A1SeBXxYdVVAq/9moZeO0F4jQYQklYHHIxIjlekXgYCpBlPb0Tuxw
 nhntjgB6EPzQTALo2sHeD65uhEgVJPFawwu3F1JH1YFXhYkKokgocMkGROkdnYFkurMe
 fIxeuknqhMXiF8kGKO9ZDQEJyB3J5Zoj0FJQOrcbR7uV+QJ4YWXoLqfcHs+VW5zAUrHP
 MmEbIxa5uAEJUblfHUgsPg7sBtgFEvVW6OjxmUw8zDO4/uCa8m7eKp1KcEO1Yyk4zjM+
 ZsY18dKrIc7q2gI8JhBEqAwbVXgU68KhtHJ7EEEcIFKw+w5LgQmtzn3Uh72Neth04p3N
 No4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9AmhBm8UfemdEFlMs0B1qq9zHvprzdkVNNmj5F+H8g=;
 b=WsYyYOaemO5OZ0HfwQLGKziFEjlh9hWOKQRdj+SVE6TrBkaAOU3bftRqTzu0OZ/A4P
 HLayFMr1jOVDk1szqsRA1Pq6IFWlAgKqWqQK8MpTWI+Z8nD+M1KtmyJqUoFu3OcfckUG
 p72sl9j6tmFh7y+yhDnI6+M/DgGWjV6VEwPLzTb3VeARXsr0Bw700mAwgzcRtVvf36KX
 Nsy3m5yAWvBFIdO51kaZbR1e6p4UQTqUJdqukF3pluLnApLRRrNkrV2YQga6D6sLGiN0
 jjRDh9X1rdEYf7SjomCYihLOibU6ECp9qqFficM8aWzXM4L4i6hlo6+rbe342YN5aWYw
 DgDw==
X-Gm-Message-State: AOAM530xoeOPvO3Gg4/DypADIEpD3yfJzCmfTIXUDre+i8lTngGn7mOG
 hSWaDctYtpt0Bx96mr0O5lITdJTtTrgU1w==
X-Google-Smtp-Source: ABdhPJxPxWyrtOSgJqYg7QoG5alpvMr844UVJKIGtKoRd3Nmd7QpSotb7MwvCJoJqt8dKxXz/3qwVA==
X-Received: by 2002:adf:ed82:: with SMTP id c2mr5799163wro.203.1631549519558; 
 Mon, 13 Sep 2021 09:11:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y1sm7629265wmq.43.2021.09.13.09.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:11:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] hw/arm/virt: add ITS support in virt GIC
Date: Mon, 13 Sep 2021 17:11:37 +0100
Message-Id: <20210913161144.12347-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913161144.12347-1-peter.maydell@linaro.org>
References: <20210913161144.12347-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

From: Shashi Mallela <shashi.mallela@linaro.org>

Included creation of ITS as part of virt platform GIC
initialization. This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210910143951.92242-9-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h |  2 ++
 target/arm/kvm_arm.h  |  4 ++--
 hw/arm/virt.c         | 29 +++++++++++++++++++++++++++--
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c466996..b461b8d261d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -120,6 +120,7 @@ struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
     bool no_its;
+    bool no_tcg_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
@@ -141,6 +142,7 @@ struct VirtMachineState {
     bool highmem;
     bool highmem_ecam;
     bool its;
+    bool tcg_its;
     bool virt;
     bool ras;
     bool mte;
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 34f8daa3775..06134549759 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -525,8 +525,8 @@ static inline const char *its_class_name(void)
         /* KVM implementation requires this capability */
         return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
     } else {
-        /* Software emulation is not implemented yet */
-        return NULL;
+        /* Software emulation based model */
+        return "arm-gicv3-its";
     }
 }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73e9c6bb7cb..1d59f0e59f7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -584,6 +584,12 @@ static void create_its(VirtMachineState *vms)
     const char *itsclass = its_class_name();
     DeviceState *dev;
 
+    if (!strcmp(itsclass, "arm-gicv3-its")) {
+        if (!vms->tcg_its) {
+            itsclass = NULL;
+        }
+    }
+
     if (!itsclass) {
         /* Do nothing if not supported */
         return;
@@ -621,7 +627,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -655,6 +661,14 @@ static void create_gic(VirtMachineState *vms)
                              nb_redist_regions);
         qdev_prop_set_uint32(vms->gic, "redist-region-count[0]", redist0_count);
 
+        if (!kvm_irqchip_in_kernel()) {
+            if (vms->tcg_its) {
+                object_property_set_link(OBJECT(vms->gic), "sysmem",
+                                         OBJECT(mem), &error_fatal);
+                qdev_prop_set_bit(vms->gic, "has-lpi", true);
+            }
+        }
+
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
@@ -2039,7 +2053,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
@@ -2742,6 +2756,12 @@ static void virt_instance_init(Object *obj)
     } else {
         /* Default allows ITS instantiation */
         vms->its = true;
+
+        if (vmc->no_tcg_its) {
+            vms->tcg_its = false;
+        } else {
+            vms->tcg_its = true;
+        }
     }
 
     /* Default disallows iommu instantiation */
@@ -2791,8 +2811,13 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+
+    /* qemu ITS was introduced with 6.2 */
+    vmc->no_tcg_its = true;
 }
 DEFINE_VIRT_MACHINE(6, 1)
 
-- 
2.20.1


