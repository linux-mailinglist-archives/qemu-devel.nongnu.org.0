Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D081F6B0A
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Nov 2019 20:07:00 +0100 (CET)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iTsY7-0003GP-49
	for lists+qemu-devel@lfdr.de; Sun, 10 Nov 2019 14:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iTsV3-0000Fb-G0
 for qemu-devel@nongnu.org; Sun, 10 Nov 2019 14:03:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1iTsV2-00037D-C3
 for qemu-devel@nongnu.org; Sun, 10 Nov 2019 14:03:49 -0500
Received: from relay.sw.ru ([185.231.240.75]:42178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iTsUz-00033h-7m; Sun, 10 Nov 2019 14:03:45 -0500
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1iTsUv-00076X-Qt; Sun, 10 Nov 2019 22:03:41 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v0 1/2] qdev-properties-system: extend set_pionter for
 unrealized devices
Date: Sun, 10 Nov 2019 22:03:09 +0300
Message-Id: <20191110190310.19799-2-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20191110190310.19799-1-dplotnikov@virtuozzo.com>
References: <20191110190310.19799-1-dplotnikov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 pbonzini@redhat.com, den@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some device's property can be changed if the device has been already
realized. For example, it could be "drive" property of a scsi disk device.

So far, set_pointer could operate only on a relized device. The patch
extends its interface for operation on an unrealized device.

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 hw/core/qdev-properties-system.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index ba412dd2ca..c534590dcd 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -38,9 +38,14 @@ static void get_pointer(Object *obj, Visitor *v, Property *prop,
 }
 
 static void set_pointer(Object *obj, Visitor *v, Property *prop,
-                        void (*parse)(DeviceState *dev, const char *str,
-                                      void **ptr, const char *propname,
-                                      Error **errp),
+                        void (*parse_realized)(DeviceState *dev,
+                                               const char *str, void **ptr,
+                                               const char *propname,
+                                               Error **errp),
+                        void (*parse_unrealized)(DeviceState *dev,
+                                                 const char *str, void **ptr,
+                                                 const char *propname,
+                                                 Error **errp),
                         const char *name, Error **errp)
 {
     DeviceState *dev = DEVICE(obj);
@@ -48,11 +53,6 @@ static void set_pointer(Object *obj, Visitor *v, Property *prop,
     void **ptr = qdev_get_prop_ptr(dev, prop);
     char *str;
 
-    if (dev->realized) {
-        qdev_prop_set_after_realize(dev, name, errp);
-        return;
-    }
-
     visit_type_str(v, name, &str, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -63,7 +63,17 @@ static void set_pointer(Object *obj, Visitor *v, Property *prop,
         *ptr = NULL;
         return;
     }
-    parse(dev, str, ptr, prop->name, errp);
+
+    if (dev->realized) {
+        if (parse_realized) {
+            parse_realized(dev, str, ptr, prop->name, errp);
+        } else {
+            qdev_prop_set_after_realize(dev, name, errp);
+        }
+    } else {
+        parse_unrealized(dev, str, ptr, prop->name, errp);
+    }
+
     g_free(str);
 }
 
@@ -178,13 +188,13 @@ static void get_drive(Object *obj, Visitor *v, const char *name, void *opaque,
 static void set_drive(Object *obj, Visitor *v, const char *name, void *opaque,
                       Error **errp)
 {
-    set_pointer(obj, v, opaque, parse_drive, name, errp);
+    set_pointer(obj, v, opaque, NULL, parse_drive, name, errp);
 }
 
 static void set_drive_iothread(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
-    set_pointer(obj, v, opaque, parse_drive_iothread, name, errp);
+    set_pointer(obj, v, opaque, NULL, parse_drive_iothread, name, errp);
 }
 
 const PropertyInfo qdev_prop_drive = {
-- 
2.17.0


