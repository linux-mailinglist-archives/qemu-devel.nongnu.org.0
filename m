Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249F4331AC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:58:59 +0200 (CEST)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mckxV-0006P5-SZ
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mckw2-000509-NG
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:57:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mckvt-0000Vk-CR
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 04:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634633835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r9foGDEPZpWJThBJc9dhCRizyj84epqzWlj7srPNA3w=;
 b=QrcZnIPd4F3KREm+5vur5ZVYwAfronP+7UihAwy3G8qGkFicVX2J4zDAeE1yKwnUQ41HcO
 tQeBW09/yBjoKP/rCSdrzaCImTJiAoOZdM4aarSohSiJl3VjrOKSVrqhMe4nONB0eZIRz8
 odrxCARi4WFy1x+5Mrc4NDVGVy8Q3Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-NW6Afuj5MV6zXA_D3CUY0g-1; Tue, 19 Oct 2021 04:57:14 -0400
X-MC-Unique: NW6Afuj5MV6zXA_D3CUY0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B890618125C0;
 Tue, 19 Oct 2021 08:57:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF005D6D5;
 Tue, 19 Oct 2021 08:57:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D603111380A7; Tue, 19 Oct 2021 10:57:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] monitor: Fix find_device_state() for IDs containing slashes
Date: Tue, 19 Oct 2021 10:57:11 +0200
Message-Id: <20211019085711.86377-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: damien.hedde@greensocs.com, pbonzini@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recent commit 6952026120 "monitor: Tidy up find_device_state()"
assumed the function's argument is "the device's ID or QOM path" (as
documented for device_del).  It's actually either an absolute QOM
path, or a QOM path relative to /machine/peripheral/.  Such a relative
path is a device ID when it doesn't contain a slash.  When it does,
the function now always fails.  Broke iotest 200, which uses relative
path "vda/virtio-backend".

It fails because object_resolve_path_component() resolves just one
component, not a relative path.

The obvious function to resolve relative paths is
object_resolve_path().  It picks a parent automatically.  Too much
magic, we want to specify the parent.  Create new
object_resolve_path_at() for that, and use it in find_device_state().

Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qom/object.h   | 12 ++++++++++++
 qom/object.c           | 11 +++++++++++
 softmmu/qdev-monitor.c |  8 +-------
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index faae0d841f..fae096f51c 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1543,6 +1543,18 @@ Object *object_resolve_path(const char *path, bool *ambiguous);
 Object *object_resolve_path_type(const char *path, const char *typename,
                                  bool *ambiguous);
 
+/**
+ * object_resolve_path_at:
+ * @parent: the object in which to resolve the path
+ * @path: the path to resolve
+ *
+ * This is like object_resolve_path(), except paths not starting with
+ * a slash are relative to @parent.
+ *
+ * Returns: The resolved object or NULL on path lookup failure.
+ */
+Object *object_resolve_path_at(Object *parent, const char *path);
+
 /**
  * object_resolve_path_component:
  * @parent: the object in which to resolve the path
diff --git a/qom/object.c b/qom/object.c
index 6be710bc40..4f0677cca9 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2144,6 +2144,17 @@ Object *object_resolve_path(const char *path, bool *ambiguous)
     return object_resolve_path_type(path, TYPE_OBJECT, ambiguous);
 }
 
+Object *object_resolve_path_at(Object *parent, const char *path)
+{
+    g_auto(GStrv) parts = g_strsplit(path, "/", 0);
+
+    if (*path == '/') {
+        return object_resolve_abs_path(object_get_root(), parts + 1,
+                                       TYPE_OBJECT);
+    }
+    return object_resolve_abs_path(parent, parts, TYPE_OBJECT);
+}
+
 typedef struct StringProperty
 {
     char *(*get)(Object *, Error **);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 89c473cb22..e8a1c7e52a 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -865,15 +865,9 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp)
 
 static DeviceState *find_device_state(const char *id, Error **errp)
 {
-    Object *obj;
+    Object *obj = object_resolve_path_at(qdev_get_peripheral(), id);
     DeviceState *dev;
 
-    if (id[0] == '/') {
-        obj = object_resolve_path(id, NULL);
-    } else {
-        obj = object_resolve_path_component(qdev_get_peripheral(), id);
-    }
-
     if (!obj) {
         error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
                   "Device '%s' not found", id);
-- 
2.31.1


