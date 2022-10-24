Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6735C60990E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 06:07:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omoYI-0000MF-Ls; Sun, 23 Oct 2022 23:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoYG-0000Ik-Cs
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 23:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoYE-0000mi-TQ
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 23:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMkXncs52ndySHJgm8eoiBON5a8d4PMnIToe0RlC2vU=;
 b=gIdFlINO3tmEOk6toq/PF1RuYZOHI+AJ1zRLlavJblCBOUTcK4iTUe4azZ/9OwhYHtwTEX
 3HntDub8nk1da3Q85j5zjo1LKXxrVOhTvvKrTd36lo+osozPgveX0S21aStyU6rHBOGTwY
 5uHWkTcIVfnXX+tt9RbGH0nrOkUUpPE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-a7AEOR_zPwizzJDOJaXiXA-1; Sun, 23 Oct 2022 23:54:53 -0400
X-MC-Unique: a7AEOR_zPwizzJDOJaXiXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DA58185A794;
 Mon, 24 Oct 2022 03:54:53 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 178F840C6E16;
 Mon, 24 Oct 2022 03:54:49 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 7/7] hw/arm/virt: Add properties to disable high memory
 regions
Date: Mon, 24 Oct 2022 11:54:16 +0800
Message-Id: <20221024035416.34068-8-gshan@redhat.com>
In-Reply-To: <20221024035416.34068-1-gshan@redhat.com>
References: <20221024035416.34068-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

These 3 high memory regions are usually enabled by default, but
they may be not used. For example, VIRT_HIGH_GIC_REDIST2 isn't
needed by GICv2. This leads to waste in the PA space.

Add properties to allow users selectively disable them if needed:
"highmem-redists", "highmem-ecam", "highmem-mmio".

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 docs/system/arm/virt.rst | 12 ++++++++
 hw/arm/virt.c            | 64 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 4454706392..a1668a969d 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -98,6 +98,18 @@ compact-highmem
   Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
   The default is ``on`` for machine types later than ``virt-7.2``.
 
+highmem-redists
+  Set ``on``/``off`` to enable/disable the high memry region for GICv3/4
+  redistributor. The default is ``on``.
+
+highmem-ecam
+  Set ``on``/``off`` to enable/disable the high memry region for PCI ECAM.
+  The default is ``on`` for machine types later than ``virt-3.0``.
+
+highmem-mmio
+  Set ``on``/``off`` to enable/disable the high memry region for PCI MMIO.
+  The default is ``on``.
+
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
   Valid values are:
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 11b5685432..afafc2d1b8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2371,6 +2371,49 @@ static void virt_set_compact_highmem(Object *obj, bool value, Error **errp)
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
@@ -2996,6 +3039,27 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable compact "
                                           "layout for high memory regions");
 
+    object_class_property_add_bool(oc, "highmem-redists",
+                                   virt_get_highmem_redists,
+                                   virt_set_highmem_redists);
+    object_class_property_set_description(oc, "highmem-redists",
+                                          "Set on/off to enable/disable high "
+                                          "memory region for GICv3/4 redistributor");
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


