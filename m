Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00902DB008
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:28:18 +0100 (CET)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCFN-0008Np-Vo
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:28:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8a-00084t-3D
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8W-0002M1-IV
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRCfPedBk4Own4o7Ut7+tXl1eblLj2ZVSS0ceKc9Uqk=;
 b=IAsMiXbJkQOflOQH97rDzjrNdRLw6lW3q/M1mSCLmCc40ML2gIm3DFq0pFBoYKswKXonKt
 0PgWpi40DvOSVBoN/mBK8jdvy6TNzG+bXFK8Pk/uX+bn5YQpeECHXMvSeWuOgMxnkPHMJ6
 oY11RHaHXcWbM6sex/nicc12zgvsD4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-Lh2DMMnbMCODKetjkVBJhw-1; Tue, 15 Dec 2020 10:21:07 -0500
X-MC-Unique: Lh2DMMnbMCODKetjkVBJhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 003368797DD;
 Tue, 15 Dec 2020 15:19:51 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8EC7100239A;
 Tue, 15 Dec 2020 15:19:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/25] arm/virt: Register most properties as class properties
Date: Tue, 15 Dec 2020 10:19:22 -0500
Message-Id: <20201215151942.3125089-6-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Class properties make QOM introspection simpler and easier, as
they don't require an object to be instantiated.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201111183823.283752-6-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/virt.c | 76 +++++++++++++++++++++++++++------------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 556592012e..6a37d07ee0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2490,6 +2490,47 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "acpi",
         "Enable ACPI");
+    object_class_property_add_bool(oc, "secure", virt_get_secure,
+                                   virt_set_secure);
+    object_class_property_set_description(oc, "secure",
+                                                "Set on/off to enable/disable the ARM "
+                                                "Security Extensions (TrustZone)");
+
+    object_class_property_add_bool(oc, "virtualization", virt_get_virt,
+                                   virt_set_virt);
+    object_class_property_set_description(oc, "virtualization",
+                                          "Set on/off to enable/disable emulating a "
+                                          "guest CPU which implements the ARM "
+                                          "Virtualization Extensions");
+
+    object_class_property_add_bool(oc, "highmem", virt_get_highmem,
+                                   virt_set_highmem);
+    object_class_property_set_description(oc, "highmem",
+                                          "Set on/off to enable/disable using "
+                                          "physical address space above 32 bits");
+
+    object_class_property_add_str(oc, "gic-version", virt_get_gic_version,
+                                  virt_set_gic_version);
+    object_class_property_set_description(oc, "gic-version",
+                                          "Set GIC version. "
+                                          "Valid values are 2, 3, host and max");
+
+    object_class_property_add_str(oc, "iommu", virt_get_iommu, virt_set_iommu);
+    object_class_property_set_description(oc, "iommu",
+                                          "Set the IOMMU type. "
+                                          "Valid values are none and smmuv3");
+
+    object_class_property_add_bool(oc, "ras", virt_get_ras,
+                                   virt_set_ras);
+    object_class_property_set_description(oc, "ras",
+                                          "Set on/off to enable/disable reporting host memory errors "
+                                          "to a KVM guest using ACPI and guest external abort exceptions");
+
+    object_class_property_add_bool(oc, "mte", virt_get_mte, virt_set_mte);
+    object_class_property_set_description(oc, "mte",
+                                          "Set on/off to enable/disable emulating a "
+                                          "guest CPU which implements the ARM "
+                                          "Memory Tagging Extension");
 }
 
 static void virt_instance_init(Object *obj)
@@ -2502,34 +2543,13 @@ static void virt_instance_init(Object *obj)
      * boot UEFI blobs which assume no TrustZone support.
      */
     vms->secure = false;
-    object_property_add_bool(obj, "secure", virt_get_secure,
-                             virt_set_secure);
-    object_property_set_description(obj, "secure",
-                                    "Set on/off to enable/disable the ARM "
-                                    "Security Extensions (TrustZone)");
 
     /* EL2 is also disabled by default, for similar reasons */
     vms->virt = false;
-    object_property_add_bool(obj, "virtualization", virt_get_virt,
-                             virt_set_virt);
-    object_property_set_description(obj, "virtualization",
-                                    "Set on/off to enable/disable emulating a "
-                                    "guest CPU which implements the ARM "
-                                    "Virtualization Extensions");
 
     /* High memory is enabled by default */
     vms->highmem = true;
-    object_property_add_bool(obj, "highmem", virt_get_highmem,
-                             virt_set_highmem);
-    object_property_set_description(obj, "highmem",
-                                    "Set on/off to enable/disable using "
-                                    "physical address space above 32 bits");
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
-    object_property_add_str(obj, "gic-version", virt_get_gic_version,
-                        virt_set_gic_version);
-    object_property_set_description(obj, "gic-version",
-                                    "Set GIC version. "
-                                    "Valid values are 2, 3, host and max");
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
 
@@ -2547,26 +2567,12 @@ static void virt_instance_init(Object *obj)
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-    object_property_add_str(obj, "iommu", virt_get_iommu, virt_set_iommu);
-    object_property_set_description(obj, "iommu",
-                                    "Set the IOMMU type. "
-                                    "Valid values are none and smmuv3");
 
     /* Default disallows RAS instantiation */
     vms->ras = false;
-    object_property_add_bool(obj, "ras", virt_get_ras,
-                             virt_set_ras);
-    object_property_set_description(obj, "ras",
-                                    "Set on/off to enable/disable reporting host memory errors "
-                                    "to a KVM guest using ACPI and guest external abort exceptions");
 
     /* MTE is disabled by default.  */
     vms->mte = false;
-    object_property_add_bool(obj, "mte", virt_get_mte, virt_set_mte);
-    object_property_set_description(obj, "mte",
-                                    "Set on/off to enable/disable emulating a "
-                                    "guest CPU which implements the ARM "
-                                    "Memory Tagging Extension");
 
     vms->irqmap = a15irqmap;
 
-- 
2.28.0


