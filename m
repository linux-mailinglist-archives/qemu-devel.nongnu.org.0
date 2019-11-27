Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBF510B6A8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 20:24:53 +0100 (CET)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia2vk-00055L-Au
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 14:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia2rW-0003jK-BS
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:20:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia2rU-0000TX-Rg
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:20:29 -0500
Received: from relay.sw.ru ([185.231.240.75]:53452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia2rU-0000Px-K4
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 14:20:28 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia2rR-0003hu-HJ; Wed, 27 Nov 2019 22:20:25 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6] hw/core/qdev: cleanup Error ** variables
Date: Wed, 27 Nov 2019 22:20:25 +0300
Message-Id: <20191127192025.21594-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: vsementsov@virtuozzo.com, berrange@redhat.com, ehabkost@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename Error ** parameter in check_only_migratable to common errp.

In device_set_realized:

 - Move "if (local_err != NULL)" closer to error setters.

 - Drop 'Error **local_errp': it doesn't save any LoCs, but it's very
   unusual.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

v6: enhance grammar in comment [Eric]
    add r-b by Eric and Marc-André

 hw/core/qdev.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cf1ba28fe3..82d3ee590a 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -820,12 +820,12 @@ static bool device_get_realized(Object *obj, Error **errp)
     return dev->realized;
 }
 
-static bool check_only_migratable(Object *obj, Error **err)
+static bool check_only_migratable(Object *obj, Error **errp)
 {
     DeviceClass *dc = DEVICE_GET_CLASS(obj);
 
     if (!vmstate_check_only_migratable(dc->vmsd)) {
-        error_setg(err, "Device %s is not migratable, but "
+        error_setg(errp, "Device %s is not migratable, but "
                    "--only-migratable was specified",
                    object_get_typename(obj));
         return false;
@@ -874,10 +874,9 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
 
         if (dc->realize) {
             dc->realize(dev, &local_err);
-        }
-
-        if (local_err != NULL) {
-            goto fail;
+            if (local_err != NULL) {
+                goto fail;
+            }
         }
 
         DEVICE_LISTENER_CALL(realize, Forward, dev);
@@ -918,27 +917,26 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
        }
 
     } else if (!value && dev->realized) {
-        Error **local_errp = NULL;
+        /* We want local_err to track only the first error */
         QLIST_FOREACH(bus, &dev->child_bus, sibling) {
-            local_errp = local_err ? NULL : &local_err;
             object_property_set_bool(OBJECT(bus), false, "realized",
-                                     local_errp);
+                                     local_err ? NULL : &local_err);
         }
         if (qdev_get_vmsd(dev)) {
             vmstate_unregister(dev, qdev_get_vmsd(dev), dev);
         }
         if (dc->unrealize) {
-            local_errp = local_err ? NULL : &local_err;
-            dc->unrealize(dev, local_errp);
+            dc->unrealize(dev, local_err ? NULL : &local_err);
         }
         dev->pending_deleted_event = true;
         DEVICE_LISTENER_CALL(unrealize, Reverse, dev);
-    }
 
-    if (local_err != NULL) {
-        goto fail;
+        if (local_err != NULL) {
+            goto fail;
+        }
     }
 
+    assert(local_err == NULL);
     dev->realized = value;
     return;
 
@@ -976,7 +974,7 @@ static bool device_get_hotpluggable(Object *obj, Error **errp)
                                 qbus_is_hotpluggable(dev->parent_bus));
 }
 
-static bool device_get_hotplugged(Object *obj, Error **err)
+static bool device_get_hotplugged(Object *obj, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
 
-- 
2.21.0


