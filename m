Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855082C1527
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:06:02 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khI65-0003un-FC
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpp-0006Qc-IR
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1khHpj-0007tp-Ft
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606160945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zKe5025jyXMqnHCYcS+WlyUvhYBc4ugtlIA1fx2KL6A=;
 b=U85Q2w7XkOF9j2tpLg0QEQDfmMFTmKLWxEm6QkO3UIrKJdC/OAx/1jk1YfQDiGVmu3xOjz
 H097VV8y4W5i3f8V54+30GnCz8zUm/eSYmm3FaTurRGcOx64dDZOQYGWNrEqbXx17TUzn6
 LK8I0RfKifDTNuZk9LzqG/HsYV07jEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-BQLPc2YDNDeXiTk83-MHPg-1; Mon, 23 Nov 2020 14:49:03 -0500
X-MC-Unique: BQLPc2YDNDeXiTk83-MHPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F5A480F040
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:49:02 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06DB15D9CC;
 Mon, 23 Nov 2020 19:48:58 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/19] qom: Don't ignore defval on UUID property
Date: Mon, 23 Nov 2020 14:48:13 -0500
Message-Id: <20201123194818.2773508-15-ehabkost@redhat.com>
In-Reply-To: <20201123194818.2773508-1-ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UUID properties were weird because the value of .defval was
completely ignored.  Fix this by setting the default value to
QLIT_QSTR("auto") on the default case, and actually using .defval
inside .set_default_value.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This is a new patch added in v3 of this series.

This is similar (but not completely the same) to changes that
were submitted as part of
"[PATCH v2 8/8] qom: Use qlit to represent property defaults".
---
 include/hw/qdev-properties-system.h |  9 +++------
 hw/core/qdev-properties-system.c    | 10 +++++-----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 6221da704e..834ca84904 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -63,14 +63,11 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pcie_link_width, \
                         PCIExpLinkWidth)
 
+#define UUID_VALUE_AUTO        "auto"
+
 #define DEFINE_PROP_UUID(_name, _state, _field) \
     DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID, \
-                /*                                               \
-                 * Note that set_default_uuid_auto() currently   \
-                 * ignores the actual value value of .defval,    \
-                 * we just need it to not be not QTYPE_NONE      \
-                 */                                              \
-                .defval = QLIT_QNULL)
+                .defval = QLIT_QSTR(UUID_VALUE_AUTO))
 
 #define DEFINE_PROP_AUDIODEV(_n, _s, _f) \
     DEFINE_PROP(_n, _s, _f, qdev_prop_audiodev, QEMUSoundCard)
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 6071f672a4..117c540254 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -15,6 +15,7 @@
 #include "hw/qdev-properties-system.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
+#include "qapi/qmp/qstring.h"
 #include "qapi/qapi-types-block.h"
 #include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-types-migration.h"
@@ -1059,8 +1060,6 @@ static void get_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
     visit_type_str(v, name, &p, errp);
 }
 
-#define UUID_VALUE_AUTO        "auto"
-
 static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
                     Error **errp)
 {
@@ -1080,10 +1079,11 @@ static void set_uuid(Object *obj, Visitor *v, const char *name, void *opaque,
     g_free(str);
 }
 
-static void set_default_uuid_auto(ObjectProperty *op, const Property *prop,
+static void set_default_uuid(ObjectProperty *op, const Property *prop,
                                   const QObject *defval)
 {
-    object_property_set_default_str(op, UUID_VALUE_AUTO);
+    QString *qs = qobject_to(QString, defval);
+    object_property_set_default_str(op, qstring_get_str(qs));
 }
 
 const PropertyInfo qdev_prop_uuid = {
@@ -1092,5 +1092,5 @@ const PropertyInfo qdev_prop_uuid = {
         "\" for random value",
     .get   = get_uuid,
     .set   = set_uuid,
-    .set_default_value = set_default_uuid_auto,
+    .set_default_value = set_default_uuid,
 };
-- 
2.28.0


