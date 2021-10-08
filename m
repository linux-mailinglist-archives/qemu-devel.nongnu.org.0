Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EEC426BDA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 15:43:25 +0200 (CEST)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYq9k-0003pb-LZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 09:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq3f-0002EH-0w
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mYq3c-0002YM-6Y
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 09:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633700223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sf/4exwVB8odE4SDsH9exeq6Phn9Rlx8S3BjrRv5esE=;
 b=gcG/Rpvay3lD/qxgXlJzWaZpO7PvHZhhnoBI94DX0sBc490+Rnqgxkj9dYPRMOz9396Vkw
 TTN5/A07GtdfucM7XaaT6XFwhleZGEtR4eGZu/JuCD81nGq5XEjJJwLu7m7+27cVt9GFnx
 4mnDccmzKg5oTZR9eTn4TeXOTlavMqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-AAwSNiPCPx2D9jVs2wEokQ-1; Fri, 08 Oct 2021 09:37:02 -0400
X-MC-Unique: AAwSNiPCPx2D9jVs2wEokQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5385618D4538;
 Fri,  8 Oct 2021 13:35:55 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FEB319724;
 Fri,  8 Oct 2021 13:35:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] softmmu/qdev-monitor: add error handling in
 qdev_set_id
Date: Fri,  8 Oct 2021 15:34:36 +0200
Message-Id: <20211008133442.141332-10-kwolf@redhat.com>
In-Reply-To: <20211008133442.141332-1-kwolf@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, damien.hedde@greensocs.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 mst@redhat.com, libvir-list@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 lvivier@redhat.com, its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Hedde <damien.hedde@greensocs.com>

qdev_set_id() is mostly used when the user adds a device (using
-device cli option or device_add qmp command). This commit adds
an error parameter to handle the case where the given id is
already taken.

Also document the function and add a return value in order to
be able to capture success/failure: the function now returns the
id in case of success, or NULL in case of failure.

The commit modifies the 2 calling places (qdev-monitor and
xen-legacy-backend) to add the error object parameter.

Note that the id is, right now, guaranteed to be unique because
all ids came from the "device" QemuOptsList where the id is used
as key. This addition is a preparation for a future commit which
will relax the uniqueness.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/monitor/qdev.h      | 25 +++++++++++++++++++++++-
 hw/xen/xen-legacy-backend.c |  3 ++-
 softmmu/qdev-monitor.c      | 38 +++++++++++++++++++++++++++----------
 3 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 389287eb44..74e6c55a2b 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -9,6 +9,29 @@ void qmp_device_add(QDict *qdict, QObject **ret_data, Error **errp);
 
 int qdev_device_help(QemuOpts *opts);
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp);
-void qdev_set_id(DeviceState *dev, char *id);
+
+/**
+ * qdev_set_id: parent the device and set its id if provided.
+ * @dev: device to handle
+ * @id: id to be given to the device, or NULL.
+ *
+ * Returns: the id of the device in case of success; otherwise NULL.
+ *
+ * @dev must be unrealized, unparented and must not have an id.
+ *
+ * If @id is non-NULL, this function tries to setup @dev qom path as
+ * "/peripheral/id". If @id is already taken, it fails. If it succeeds,
+ * the id field of @dev is set to @id (@dev now owns the given @id
+ * parameter).
+ *
+ * If @id is NULL, this function generates a unique name and setups @dev
+ * qom path as "/peripheral-anon/name". This name is not set as the id
+ * of @dev.
+ *
+ * Upon success, it returns the id/name (generated or provided). The
+ * returned string is owned by the corresponding child property and must
+ * not be freed by the caller.
+ */
+const char *qdev_set_id(DeviceState *dev, char *id, Error **errp);
 
 #endif
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index be3cf4a195..085fd31ef7 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -276,7 +276,8 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     xendev = g_malloc0(ops->size);
     object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
     OBJECT(xendev)->free = g_free;
-    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev));
+    qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev),
+                &error_fatal);
     qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
     object_unref(OBJECT(xendev));
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 1207e57a46..feb15818e6 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -593,22 +593,34 @@ static BusState *qbus_find(const char *path, Error **errp)
 }
 
 /* Takes ownership of @id, will be freed when deleting the device */
-void qdev_set_id(DeviceState *dev, char *id)
+const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
 {
-    if (id) {
-        dev->id = id;
-    }
+    ObjectProperty *prop;
 
-    if (dev->id) {
-        object_property_add_child(qdev_get_peripheral(), dev->id,
-                                  OBJECT(dev));
+    assert(!dev->id && !dev->realized);
+
+    /*
+     * object_property_[try_]add_child() below will assert the device
+     * has no parent
+     */
+    if (id) {
+        prop = object_property_try_add_child(qdev_get_peripheral(), id,
+                                             OBJECT(dev), NULL);
+        if (prop) {
+            dev->id = id;
+        } else {
+            error_setg(errp, "Duplicate device ID '%s'", id);
+            return NULL;
+        }
     } else {
         static int anon_count;
         gchar *name = g_strdup_printf("device[%d]", anon_count++);
-        object_property_add_child(qdev_get_peripheral_anon(), name,
-                                  OBJECT(dev));
+        prop = object_property_add_child(qdev_get_peripheral_anon(), name,
+                                         OBJECT(dev));
         g_free(name);
     }
+
+    return prop->name;
 }
 
 DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
@@ -691,7 +703,13 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    qdev_set_id(dev, g_strdup(qemu_opts_id(opts)));
+    /*
+     * set dev's parent and register its id.
+     * If it fails it means the id is already taken.
+     */
+    if (!qdev_set_id(dev, g_strdup(qemu_opts_id(opts)), errp)) {
+        goto err_del_dev;
+    }
 
     /* set properties */
     if (qemu_opt_foreach(opts, set_property, dev, errp)) {
-- 
2.31.1


