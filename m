Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155232DB030
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:37:16 +0100 (CET)
Received: from localhost ([::1]:55712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCO3-0005hk-2i
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC94-000059-OU
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8z-0002S4-Dz
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhzHmeZ8d8JmAHXJmZPL71V2JaKWBUcbz7UHVNyz6dw=;
 b=Noj1fqaZj68RyPPn48CzlwQ4bnrGWHgR9cg+x76aVnW0Ktiqvxz+QYmpjxVZfYHpjgKMth
 cfMhAnecP94XFonXxY33vhttj1dZP6SYE1cw4jrZGzRqd073Ih1umdrEi3OKnie+9Dxfgk
 c2565yiO286eSXhcwV7db7+UtHuPoYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-ivsRxh5cNeO-9ZkNKZQe5g-1; Tue, 15 Dec 2020 10:21:34 -0500
X-MC-Unique: ivsRxh5cNeO-9ZkNKZQe5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30F538030D1;
 Tue, 15 Dec 2020 15:20:48 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D261660917;
 Tue, 15 Dec 2020 15:20:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 24/25] qdev: Move UUID property to qdev-properties-system.c
Date: Tue, 15 Dec 2020 10:19:41 -0500
Message-Id: <20201215151942.3125089-25-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only softmmu code uses DEFINE_PROP_UUID, and it currently depends
on error_set_from_qdev_prop_error().  Move it to
qdev-properties-system.c to get out of our way when refactoring
the qdev property system.

We can eventually move it back to the core property system later,
after removing usage of error_set_from_qdev_prop_error().

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201211220529.2290218-15-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c | 57 ++++++++++++++++++++++++++++++++
 hw/core/qdev-properties.c        | 57 --------------------------------
 2 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 5796ed2619..7a9a1d6404 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -21,6 +21,7 @@
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/units.h"
+#include "qemu/uuid.h"
 #include "qemu/error-report.h"
 #include "qdev-prop-internal.h"
 
@@ -1106,3 +1107,59 @@ const PropertyInfo qdev_prop_pcie_link_width = {
     .set = set_prop_pcielinkwidth,
     .set_default_value = qdev_propinfo_set_default_value_enum,
 };
+
+/* --- UUID --- */
+
+static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
+                     Error **errp)
+{
+    Property *prop = opaque;
+    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
+    char buffer[UUID_FMT_LEN + 1];
+    char *p = buffer;
+
+    qemu_uuid_unparse(uuid, buffer);
+
+    visit_type_str(v, name, &p, errp);
+}
+
+#define UUID_VALUE_AUTO        "auto"
+
+static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
+                    Error **errp)
+{
+    DeviceState *dev = DEVICE(obj);
+    Property *prop = opaque;
+    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
+    char *str;
+
+    if (dev->realized) {
+        qdev_prop_set_after_realize(dev, name, errp);
+        return;
+    }
+
+    if (!visit_type_str(v, name, &str, errp)) {
+        return;
+    }
+
+    if (!strcmp(str, UUID_VALUE_AUTO)) {
+        qemu_uuid_generate(uuid);
+    } else if (qemu_uuid_parse(str, uuid) < 0) {
+        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
+    }
+    g_free(str);
+}
+
+static void set_default_uuid_auto(ObjectProperty *op, const Property *prop)
+{
+    object_property_set_default_str(op, UUID_VALUE_AUTO);
+}
+
+const PropertyInfo qdev_prop_uuid = {
+    .name  = "str",
+    .description = "UUID (aka GUID) or \"" UUID_VALUE_AUTO
+        "\" for random value (default)",
+    .get   = get_uuid,
+    .set   = set_uuid,
+    .set_default_value = set_default_uuid_auto,
+};
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 765e916c23..a2eaa43831 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -6,7 +6,6 @@
 #include "qemu/ctype.h"
 #include "qemu/error-report.h"
 #include "qapi/visitor.h"
-#include "qemu/uuid.h"
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qdev-prop-internal.h"
@@ -544,62 +543,6 @@ const PropertyInfo qdev_prop_size32 = {
     .set_default_value = qdev_propinfo_set_default_value_uint,
 };
 
-/* --- UUID --- */
-
-static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
-                     Error **errp)
-{
-    Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
-    char buffer[UUID_FMT_LEN + 1];
-    char *p = buffer;
-
-    qemu_uuid_unparse(uuid, buffer);
-
-    visit_type_str(v, name, &p, errp);
-}
-
-#define UUID_VALUE_AUTO        "auto"
-
-static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
-                    Error **errp)
-{
-    DeviceState *dev = DEVICE(obj);
-    Property *prop = opaque;
-    QemuUUID *uuid = qdev_get_prop_ptr(obj, prop);
-    char *str;
-
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
-    if (!visit_type_str(v, name, &str, errp)) {
-        return;
-    }
-
-    if (!strcmp(str, UUID_VALUE_AUTO)) {
-        qemu_uuid_generate(uuid);
-    } else if (qemu_uuid_parse(str, uuid) < 0) {
-        error_set_from_qdev_prop_error(errp, EINVAL, obj, prop, str);
-    }
-    g_free(str);
-}
-
-static void set_default_uuid_auto(ObjectProperty *op, const Property *prop)
-{
-    object_property_set_default_str(op, UUID_VALUE_AUTO);
-}
-
-const PropertyInfo qdev_prop_uuid = {
-    .name  = "str",
-    .description = "UUID (aka GUID) or \"" UUID_VALUE_AUTO
-        "\" for random value (default)",
-    .get   = get_uuid,
-    .set   = set_uuid,
-    .set_default_value = set_default_uuid_auto,
-};
-
 /* --- support for array properties --- */
 
 /* Used as an opaque for the object properties we add for each
-- 
2.28.0


