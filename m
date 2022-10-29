Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6CD612640
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 00:45:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oouYW-0003ce-UH; Sat, 29 Oct 2022 18:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYT-0003b8-LV
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYP-0002cl-Tl
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+8BCOW2xiaV/ZfnQi+93bBxcE6R0VCNfmqFtGEt06Q0=;
 b=NtwzUo/R+nvYz+5pon0aanyGKKRNAwPKmL15t6MGW8p7drAXaROqsEeuXtYvsdncWZTFkf
 xp2drwHueWwgUWXs4kUYDGsnfC6P7+5t/0w8NzXo9f0JxpssNqA5JjK/r+SnHi3JCSVmy+
 HlKzDYL9SnZJdV6glHWmtPBk0OfNMvI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-qnyW5t_ePeyqNZhefR0Fjg-1; Sat, 29 Oct 2022 18:43:43 -0400
X-MC-Unique: qnyW5t_ePeyqNZhefR0Fjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C534029AB3F4;
 Sat, 29 Oct 2022 22:43:42 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73A4C2024CB7;
 Sat, 29 Oct 2022 22:43:39 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v7 6/7] hw/arm/virt: Add 'compact-highmem' property
Date: Sun, 30 Oct 2022 06:43:06 +0800
Message-Id: <20221029224307.138822-7-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
References: <20221029224307.138822-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
---
 docs/system/arm/virt.rst |  4 ++++
 hw/arm/virt.c            | 32 ++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h    |  1 +
 3 files changed, 37 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 20442ea2c1..4454706392 100644
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
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3b4c995f80..020a95cfa2 100644
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
@@ -2351,6 +2357,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
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
@@ -2969,6 +2989,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
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
@@ -3053,6 +3080,7 @@ static void virt_instance_init(Object *obj)
 
     /* High memory is enabled by default */
     vms->highmem = true;
+    vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
@@ -3122,8 +3150,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
 
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
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 709f623741..c7dd59d7f1 100644
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
-- 
2.23.0


