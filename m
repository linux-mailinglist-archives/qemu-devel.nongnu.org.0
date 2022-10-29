Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A5612643
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 00:45:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oouYX-0003dd-M9; Sat, 29 Oct 2022 18:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYV-0003bc-42
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:43:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouYS-0002ct-Ec
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxTt9Gxq0jWOkHdY3SXW7lKxUK5PTB2+BQzqSAJTA8U=;
 b=Bao2czbYmyedxkn7GyoaDQsRNWSJo4hslH7EfL6PNKrYppMJKxY2hX1S0JaN0UNTljAB+j
 TMUSSm9xo22VBXlaJZ4VVPlIopT/LqsHqb7Qtk2I65ndNFJrcJoa6CHQd3qYA8+YFQTVF0
 7dtHgTlTVB7wtXKxwb/NYRbtrMYSX3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-ptANUzQqPiypKDrnWfcMcw-1; Sat, 29 Oct 2022 18:43:47 -0400
X-MC-Unique: ptANUzQqPiypKDrnWfcMcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3EE5833AEC;
 Sat, 29 Oct 2022 22:43:46 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6334F2024CB7;
 Sat, 29 Oct 2022 22:43:43 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v7 7/7] hw/arm/virt: Add properties to disable high memory
 regions
Date: Sun, 30 Oct 2022 06:43:07 +0800
Message-Id: <20221029224307.138822-8-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
References: <20221029224307.138822-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The 3 high memory regions are usually enabled by default, but they may
be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't needed by GICv2.
This leads to waste in the PA space.

Add properties ("highmem-redists", "highmem-ecam", "highmem-mmio") to
allow users selectively disable them if needed. After that, the high
memory region for GICv3 or GICv4 redistributor can be disabled by user,
the number of maximal supported CPUs needs to be calculated based on
'vms->highmem_redists'. The follow-up error message is also improved
to indicate if the high memory region for GICv3 and GICv4 has been
enabled or not.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 docs/system/arm/virt.rst | 13 +++++++
 hw/arm/virt.c            | 75 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 4454706392..188a4f211f 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -98,6 +98,19 @@ compact-highmem
   Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
   The default is ``on`` for machine types later than ``virt-7.2``.
 
+highmem-redists
+  Set ``on``/``off`` to enable/disable the high memory region for GICv3 or
+  GICv4 redistributor. The default is ``on``. Setting this to ``off`` will
+  limit the maximum number of CPUs when GICv3 or GICv4 is used.
+
+highmem-ecam
+  Set ``on``/``off`` to enable/disable the high memory region for PCI ECAM.
+  The default is ``on`` for machine types later than ``virt-3.0``.
+
+highmem-mmio
+  Set ``on``/``off`` to enable/disable the high memory region for PCI MMIO.
+  The default is ``on``.
+
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
   Valid values are:
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 020a95cfa2..65cff7add1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2095,14 +2095,20 @@ static void machvirt_init(MachineState *machine)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         virt_max_cpus = GIC_NCPU;
     } else {
-        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
-            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST);
+        if (vms->highmem_redists) {
+            virt_max_cpus += virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
+        }
     }
 
     if (max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
                      max_cpus, virt_max_cpus);
+        if (vms->gic_version != VIRT_GIC_VERSION_2 && !vms->highmem_redists) {
+            error_printf("Try 'highmem-redists=on' for more CPUs\n");
+        }
+
         exit(1);
     }
 
@@ -2371,6 +2377,49 @@ static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
     vms->highmem_compact = value;
 }
 
+static bool virt_get_highmem_redists(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_redists;
+}
+
+static void virt_set_highmem_redists(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_redists = value;
+}
+
+static bool virt_get_highmem_ecam(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_ecam;
+}
+
+static void virt_set_highmem_ecam(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_ecam = value;
+}
+
+static bool virt_get_highmem_mmio(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->highmem_mmio;
+}
+
+static void virt_set_highmem_mmio(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->highmem_mmio = value;
+}
+
+
 static bool virt_get_its(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -2996,6 +3045,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable compact "
                                           "layout for high memory regions");
 
+    object_class_property_add_bool(oc, "highmem-redists",
+                                   virt_get_highmem_redists,
+                                   virt_set_highmem_redists);
+    object_class_property_set_description(oc, "highmem-redists",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for GICv3 or GICv4 "
+                                          "redistributor");
+
+    object_class_property_add_bool(oc, "highmem-ecam",
+                                   virt_get_highmem_ecam,
+                                   virt_set_highmem_ecam);
+    object_class_property_set_description(oc, "highmem-ecam",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for PCI ECAM");
+
+    object_class_property_add_bool(oc, "highmem-mmio",
+                                   virt_get_highmem_mmio,
+                                   virt_set_highmem_mmio);
+    object_class_property_set_description(oc, "highmem-mmio",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for PCI MMIO");
+
     object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
                                   virt_set_gic_version);
     object_class_property_set_description(oc, "gic-version",
-- 
2.23.0


