Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870573EA91B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 19:05:49 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEE9M-0002O3-Hj
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 13:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxx-0007wk-P5
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:54:01 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:37767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mEDxq-00065D-Sm
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:54:01 -0400
Received: by mail-qv1-xf32.google.com with SMTP id js7so3505075qvb.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 09:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kyjpq/o+nyGQCVVXepRD7yL60Hllj+cbnk5hSa+ob8U=;
 b=LPPb53qfW5CrHK29wAv3kd9TlWYA0+BrAZeghHdqquKi4DmCkrhqa58y4Wa3daQHQd
 mlXZ9fIgacLxuv1sfOOdEC/P3qiJkABZKCs7mxKgA4JNr2bukgBPkKDeikpbW9ri+lhK
 WYXuZsE67EkXlFo96SxQvFJ0s2kg53en1f3VdB6RFDpoO6FLQfwSy7kGp/x24zUqgGMC
 JpTpQX/Vrfh6wN9f7exVPe5lrHFhHg/rCrYJOvu0f1uNxFY+QPK1uaLAtU6lKn7+98Ss
 GA3pCnPs6W3Sm+M4Cg9ypZ21W1ZBN+IX1tt4e2+4O6nVCGKqjq3oKgTaeNGsFIHYKCGp
 Zicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kyjpq/o+nyGQCVVXepRD7yL60Hllj+cbnk5hSa+ob8U=;
 b=F/YetPqEaom21bEiRSMIJXxSWA+lNMSCjJDk2NZgdejUH6fImIgmmIBuRYFaGXQTBM
 nnyFTK60gdB6Z0nGafW5MbaXRh/qu35EjrKlS3/T/XZ8V5wDc8RCYI6p+ClmN/zLHSp5
 cEksI+bTSSGJwVViERoXe/KokyjnUFB/is22xttXEokBOD21kB65yUqMr+rWYy6uJFya
 SNBUTML2dmZI60pFOp+rn65LIORutxMMcHAkYUAM4C7IvAVi+QfaWRkQnXNEaVG71WMk
 ySB6yWgQ8yahJ3YZYr9y0psCVtM1t8TqsXsSusKJrjyiAS0tQgIxjH9QU0E/pZ05P9Rh
 2oIA==
X-Gm-Message-State: AOAM530+knAS95gcvFRWexljGwyeU1ash0Ovro3N6p6T9U5TlYNwhmX+
 8LhL66SpQdTSMwCmsPvLklibcw==
X-Google-Smtp-Source: ABdhPJzJI72sl+euIhdQGwBzzeRDUqJ4s5tmRAYByD/DCTlvVmE/V5FJPZsARav3XkoMAmvXaElmYQ==
X-Received: by 2002:a0c:fe6a:: with SMTP id b10mr4896533qvv.6.1628787233247;
 Thu, 12 Aug 2021 09:53:53 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id c69sm1714864qkg.1.2021.08.12.09.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 09:53:53 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v8 09/10] hw/arm/virt: add ITS support in virt GIC
Date: Thu, 12 Aug 2021 12:53:40 -0400
Message-Id: <20210812165341.40784-10-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210812165341.40784-1-shashi.mallela@linaro.org>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qv1-xf32.google.com
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included creation of ITS as part of virt platform GIC
initialization. This Emulated ITS model now co-exists with kvm
ITS and is enabled in absence of kvm irq kernel support in a
platform.

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 28 ++++++++++++++++++++++++++--
 include/hw/arm/virt.h |  2 ++
 target/arm/kvm_arm.h  |  4 ++--
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0b..3cea2aa039 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -583,6 +583,12 @@ static void create_its(VirtMachineState *vms)
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
@@ -620,7 +626,7 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
-static void create_gic(VirtMachineState *vms)
+static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
     /* We create a standalone GIC */
@@ -654,6 +660,14 @@ static void create_gic(VirtMachineState *vms)
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
@@ -2043,7 +2057,7 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
-    create_gic(vms);
+    create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
 
@@ -2746,6 +2760,12 @@ static void virt_instance_init(Object *obj)
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
@@ -2790,6 +2810,10 @@ type_init(machvirt_machine_init);
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    /* qemu ITS was introduced with 6.2 */
+    vmc->no_tcg_its = true;
 }
 DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c46699..b461b8d261 100644
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
index 34f8daa377..0613454975 100644
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
 
-- 
2.27.0


