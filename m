Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF002B10AC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 22:53:03 +0100 (CET)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdKWc-00068L-8H
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 16:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKPA-0005yB-1e
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kdKP7-0003Hk-LM
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 16:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605217515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xRQE+h84RpMU/EfoXCBgVLENx+SzpU+pjO6YsvFZjlk=;
 b=GfLO6tkLRePieGET4vndSeubWbENF18gqbKXPdpvmH0JqMgFDlCjst41q14s67FKIARkTu
 CsQmJ05OQpWaCoN5VhaS7ImW4BVng685UD84gti1Mqz638/oM+opgvIsfFnk6AT/pZ9HWf
 r9Fi0YjWN2z/eHCPEsGwwL323BBI/AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-jnArBD9MMEaBrWCIn80qiA-1; Thu, 12 Nov 2020 16:45:14 -0500
X-MC-Unique: jnArBD9MMEaBrWCIn80qiA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B2F803F41;
 Thu, 12 Nov 2020 21:45:12 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1EFE55795;
 Thu, 12 Nov 2020 21:45:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/53] qdev: Move UUID property to qdev-properties-system.c
Date: Thu, 12 Nov 2020 16:43:11 -0500
Message-Id: <20201112214350.872250-15-ehabkost@redhat.com>
In-Reply-To: <20201112214350.872250-1-ehabkost@redhat.com>
References: <20201112214350.872250-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only softmmu code uses DEFINE_PROP_UUID, and it currently depends
on error_set_from_qdev_prop_error().  Move it to
qdev-properties-system.c to get out of our way when refactoring
the qdev property system.

We can eventually move it back to the core property system later,
after removing usage of error_set_from_qdev_prop_error().

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in series v2
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org
---
 hw/core/qdev-properties-system.c | 57 ++++++++++++++++++++++++++++++++
 hw/core/qdev-properties.c        | 57 --------------------------------
 2 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index fca1b694ca..35515886a9 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -21,6 +21,7 @@
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
 #include "qemu/units.h"
+#include "qemu/uuid.h"
 #include "qemu/error-report.h"
 #include "qdev-prop-internal.h"
 
@@ -1105,3 +1106,59 @@ const PropertyInfo qdev_prop_pcie_link_width = {
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


