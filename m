Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48540285464
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 00:18:59 +0200 (CEST)
Received: from localhost ([::1]:33888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPvIQ-0006eo-B5
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 18:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9Y-0006ep-2L
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9V-0006O1-T7
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQPKxH+xyKblM5N24NT1ykX8A0kYnSIEW2cQbV0qbko=;
 b=hiyqSu2FFA16PNfoNE9WXPlokq2olb/jUAbWu2/0LFY1itXWvZyGDrwdgXkxLN3mhozZDM
 gAIseGZ4jv/p7/Jyd6BQbyuOobgRGegCJwlexm5tIbRcjI770T1HQH66wyNuJYifNnMr3K
 +e7rnfVbNqzOXAVuqWqmhkVdebcGE2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-csjWj25vMQesuXSafKVjLA-1; Tue, 06 Oct 2020 18:09:43 -0400
X-MC-Unique: csjWj25vMQesuXSafKVjLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D31BD393B4;
 Tue,  6 Oct 2020 22:09:41 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B9436EF44;
 Tue,  6 Oct 2020 22:09:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 04/21] hw/core/qdev-properties: Export enum-related functions
Date: Tue,  6 Oct 2020 18:09:13 -0400
Message-Id: <20201006220930.908275-5-ehabkost@redhat.com>
In-Reply-To: <20201006220930.908275-1-ehabkost@redhat.com>
References: <20201006220930.908275-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We are going to split this file and reuse these static functions.
Add the local "qdev-prop-internal.h" header declaring them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200930164949.1425294-6-philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-prop-internal.h | 19 ++++++++++++
 hw/core/qdev-properties.c    | 58 +++++++++++++++++++-----------------
 2 files changed, 49 insertions(+), 28 deletions(-)
 create mode 100644 hw/core/qdev-prop-internal.h

diff --git a/hw/core/qdev-prop-internal.h b/hw/core/qdev-prop-internal.h
new file mode 100644
index 0000000000..2a8c9a306a
--- /dev/null
+++ b/hw/core/qdev-prop-internal.h
@@ -0,0 +1,19 @@
+/*
+ * qdev property parsing
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CORE_QDEV_PROP_INTERNAL_H
+#define HW_CORE_QDEV_PROP_INTERNAL_H
+
+void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp);
+void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp);
+
+void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
+                                          const Property *prop);
+
+#endif
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 071fd5864a..76417d0936 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -18,6 +18,7 @@
 #include "qemu/uuid.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
+#include "qdev-prop-internal.h"
 
 void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
                                   Error **errp)
@@ -53,8 +54,8 @@ void *qdev_get_prop_ptr(DeviceState *dev, Property *prop)
     return ptr;
 }
 
-static void get_enum(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
+void qdev_propinfo_get_enum(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
@@ -63,8 +64,8 @@ static void get_enum(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
 }
 
-static void set_enum(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
+void qdev_propinfo_set_enum(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
     Property *prop = opaque;
@@ -78,7 +79,8 @@ static void set_enum(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_enum(v, prop->name, ptr, prop->info->enum_table, errp);
 }
 
-static void set_default_value_enum(ObjectProperty *op, const Property *prop)
+void qdev_propinfo_set_default_value_enum(ObjectProperty *op,
+                                          const Property *prop)
 {
     object_property_set_default_str(op,
         qapi_enum_lookup(prop->info->enum_table, prop->defval.i));
@@ -669,9 +671,9 @@ const PropertyInfo qdev_prop_on_off_auto = {
     .name = "OnOffAuto",
     .description = "on/off/auto",
     .enum_table = &OnOffAuto_lookup,
-    .get = get_enum,
-    .set = set_enum,
-    .set_default_value = set_default_value_enum,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- lost tick policy --- */
@@ -681,9 +683,9 @@ QEMU_BUILD_BUG_ON(sizeof(LostTickPolicy) != sizeof(int));
 const PropertyInfo qdev_prop_losttickpolicy = {
     .name  = "LostTickPolicy",
     .enum_table  = &LostTickPolicy_lookup,
-    .get   = get_enum,
-    .set   = set_enum,
-    .set_default_value = set_default_value_enum,
+    .get   = qdev_propinfo_get_enum,
+    .set   = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- Block device error handling policy --- */
@@ -695,9 +697,9 @@ const PropertyInfo qdev_prop_blockdev_on_error = {
     .description = "Error handling policy, "
                    "report/ignore/enospc/stop/auto",
     .enum_table = &BlockdevOnError_lookup,
-    .get = get_enum,
-    .set = set_enum,
-    .set_default_value = set_default_value_enum,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- BIOS CHS translation */
@@ -709,9 +711,9 @@ const PropertyInfo qdev_prop_bios_chs_trans = {
     .description = "Logical CHS translation algorithm, "
                    "auto/none/lba/large/rechs",
     .enum_table = &BiosAtaTranslation_lookup,
-    .get = get_enum,
-    .set = set_enum,
-    .set_default_value = set_default_value_enum,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- FDC default drive types */
@@ -721,9 +723,9 @@ const PropertyInfo qdev_prop_fdc_drive_type = {
     .description = "FDC drive type, "
                    "144/288/120/none/auto",
     .enum_table = &FloppyDriveType_lookup,
-    .get = get_enum,
-    .set = set_enum,
-    .set_default_value = set_default_value_enum,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- MultiFDCompression --- */
@@ -733,9 +735,9 @@ const PropertyInfo qdev_prop_multifd_compression = {
     .description = "multifd_compression values, "
                    "none/zlib/zstd",
     .enum_table = &MultiFDCompression_lookup,
-    .get = get_enum,
-    .set = set_enum,
-    .set_default_value = set_default_value_enum,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- pci address --- */
@@ -1416,9 +1418,9 @@ const PropertyInfo qdev_prop_off_auto_pcibar = {
     .name = "OffAutoPCIBAR",
     .description = "off/auto/bar0/bar1/bar2/bar3/bar4/bar5",
     .enum_table = &OffAutoPCIBAR_lookup,
-    .get = get_enum,
-    .set = set_enum,
-    .set_default_value = set_default_value_enum,
+    .get = qdev_propinfo_get_enum,
+    .set = qdev_propinfo_set_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- PCIELinkSpeed 2_5/5/8/16 -- */
@@ -1495,7 +1497,7 @@ const PropertyInfo qdev_prop_pcie_link_speed = {
     .enum_table = &PCIELinkSpeed_lookup,
     .get = get_prop_pcielinkspeed,
     .set = set_prop_pcielinkspeed,
-    .set_default_value = set_default_value_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
 /* --- PCIELinkWidth 1/2/4/8/12/16/32 -- */
@@ -1590,5 +1592,5 @@ const PropertyInfo qdev_prop_pcie_link_width = {
     .enum_table = &PCIELinkWidth_lookup,
     .get = get_prop_pcielinkwidth,
     .set = set_prop_pcielinkwidth,
-    .set_default_value = set_default_value_enum,
+    .set_default_value = qdev_propinfo_set_default_value_enum,
 };
-- 
2.26.2


