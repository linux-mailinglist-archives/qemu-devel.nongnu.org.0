Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CD64DBCF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ngu-0006i4-5A; Thu, 15 Dec 2022 07:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngq-0006eh-6I
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:20 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngo-00045b-9T
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1735112wmb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=43MiuXznHIayB9l6fFgVondZWwTBp4HePNm+IfE5j/Q=;
 b=DUxo+B7C0ZzrEa3QpfUB2L1W30dMLUvwg4jDL7+NYDvArVik7ZFtUCfUyBqhNkewSk
 QqPh4/7VDOiJF3B9j+g85Y+w2B0av4hzeHDTtMAASbShL2tmOmHqqvGg7ETNXFW5sY7K
 +NWEZbS/rXATZ9z6UsKqu0QC4jCgAETOLSwBVat5MCpDigYNPoeYFcPLK1E/nmXQIJvJ
 FCSlwZry4W1q9/y67tnnBuPa1foOX0dVvFlp4I4opFMY/IhHrP8lk6r+VwJp/m4Q3nBV
 QkDCprfyx43B23cGZoOLqVXeUz6IjCeincv57dqw63Oc+GtBSYOCZsnGRcKehbeLPwYf
 dxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43MiuXznHIayB9l6fFgVondZWwTBp4HePNm+IfE5j/Q=;
 b=W6PXhD1YJTV6iBatPSOmp9GcmS87O/ucY03AJSRXz1L1Qax+Bxzgn1X/lvN8Y7L+Cs
 NDjHSode38F2Yv3P8b4aXmqTaA7SZKJS5r4RAUQS515kaYpY0+PiunYy2hoQtkYfRLvn
 PzXLpvQ1wzcQw7CKpeSuzu5HQe1R+oBgHY64GN6pxLunN16l1hADJBuUXT25YimlUYpW
 nlmd5WtL1d2LOLB9sWS9ocGD6DKxixNCcN3MNhchPxooBbbvc1k5VDYzSBXFu61G27Ih
 2hhQs/RQp1Rl0eH6Yi8DicLbBZhcY6Fv86UhuQs1n089z66W8yzJDHTE0aMhMc7Q7O66
 G4Rw==
X-Gm-Message-State: ANoB5pmmNO7cPG7gitxalHpg0vw6NRUdBPZ14/Hd3788wTSQJxFne9vp
 yRNq93ZztYaw5cuMBA7EyaEsFl28YJ02LeC6
X-Google-Smtp-Source: AA0mqf4g6s5T5fdsFNO0zs7A/9h4wm0GNiuTBZZC8unojwhYVQnbcGuKRnM8bXIbEqkmgGhcODlr4g==
X-Received: by 2002:a7b:c00a:0:b0:3cf:cfcd:1f5 with SMTP id
 c10-20020a7bc00a000000b003cfcfcd01f5mr21553486wmb.38.1671108617532; 
 Thu, 15 Dec 2022 04:50:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/29] hw/arm/virt: Add 'compact-highmem' property
Date: Thu, 15 Dec 2022 12:49:46 +0000
Message-Id: <20221215125009.980128-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Gavin Shan <gshan@redhat.com>

After the improvement to high memory region address assignment is
applied, the memory layout can be changed, introducing possible
migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
is disabled or enabled when the optimization is applied or not, with
the following configuration. The configuration is only achievable by
modifying the source code until more properties are added to allow
users selectively disable those high memory regions.

  pa_bits              = 40;
  vms->highmem_redists = false;
  vms->highmem_ecam    = false;
  vms->highmem_mmio    = true;

  # qemu-system-aarch64 -accel kvm -cpu host    \
    -machine virt-7.2,compact-highmem={on, off} \
    -m 4G,maxmem=511G -monitor stdio

  Region             compact-highmem=off         compact-highmem=on
  ----------------------------------------------------------------
  MEM                [1GB         512GB]        [1GB         512GB]
  HIGH_GIC_REDISTS2  [512GB       512GB+64MB]   [disabled]
  HIGH_PCIE_ECAM     [512GB+256MB 512GB+512MB]  [disabled]
  HIGH_PCIE_MMIO     [disabled]                 [512GB       1TB]

In order to keep backwords compatibility, we need to disable the
optimization on machine, which is virt-7.1 or ealier than it. It
means the optimization is enabled by default from virt-7.2. Besides,
'compact-highmem' property is added so that the optimization can be
explicitly enabled or disabled on all machine types by users.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
Message-id: 20221029224307.138822-7-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst |  4 ++++
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c13..4454706392c 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -94,6 +94,10 @@ highmem
   address space above 32 bits. The default is ``on`` for machine types
   later than ``virt-2.12``.
 
+compact-highmem
+  Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
+  The default is ``on`` for machine types later than ``virt-7.2``.
+
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
   Valid values are:
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 709f6237412..c7dd59d7f1f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -125,6 +125,7 @@ struct VirtMachineClass {
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
+    bool no_highmem_compact;
     bool no_highmem_ecam;
     bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 807175707e7..3d1371c05c0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -174,6 +174,12 @@ static const MemMapEntry base_memmap[] = {
  * Note the extended_memmap is sized so that it eventually also includes the
  * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the last
  * index of base_memmap).
+ *
+ * The memory map for these Highmem IO Regions can be in legacy or compact
+ * layout, depending on 'compact-highmem' property. With legacy layout, the
+ * PA space for one specific region is always reserved, even if the region
+ * has been disabled or doesn't fit into the PA space. However, the PA space
+ * for the region won't be reserved in these circumstances with compact layout.
  */
 static MemMapEntry extended_memmap[] = {
     /* Additional 64 MB redist region (can contain up to 512 redistributors) */
@@ -2352,6 +2358,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
     vms->highmem = value;
 }
 
+static bool virt_get_compact_highmem(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_compact;
+}
+
+static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_compact = value;
+}
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2970,6 +2990,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable using "
                                           "physical address space above 32 bits");
 
+    object_class_property_add_bool(oc, "compact-highmem",
+                                   virt_get_compact_highmem,
+                                   virt_set_compact_highmem);
+    object_class_property_set_description(oc, "compact-highmem",
+                                          "Set on/off to enable/disable compact "
+                                          "layout for high memory regions");
+
     object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
@@ -3054,6 +3081,7 @@ static void virt_instance_init(Object *obj)
 
     /* High memory is enabled by default */
     vms->highmem = true;
+    vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
@@ -3123,8 +3151,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
 
 static void virt_machine_7_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_7_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
+    /* Compact layout for high memory regions was introduced with 7.2 */
+    vmc->no_highmem_compact = true;
 }
 DEFINE_VIRT_MACHINE(7, 1)
 
-- 
2.25.1


