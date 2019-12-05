Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B439114653
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 18:54:25 +0100 (CET)
Received: from localhost ([::1]:58826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icvKZ-00065V-LW
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 12:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45183)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDG-0007bG-IP
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icvDD-0003Xc-UF
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:46:50 -0500
Received: from relay.sw.ru ([185.231.240.75]:48264)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvDA-0003S2-7W
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 12:46:46 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icvD6-00013M-Nt; Thu, 05 Dec 2019 20:46:40 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 06/21] qdev-monitor: well form error hint helpers
Date: Thu,  5 Dec 2019 20:46:20 +0300
Message-Id: <20191205174635.18758-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205174635.18758-1-vsementsov@virtuozzo.com>
References: <20191205174635.18758-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, vsementsov@virtuozzo.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 armbru@redhat.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make qbus_list_bus and qbus_list_dev hint append helpers well formed:
switch errp paramter to Error *const * type, as it has uncommon
behavior: not change the pointer to return error, but operate on
already existent error object.
Rename functions to be error_append_*_hint.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qdev-monitor.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index 29ed73e56a..3465a1e2d0 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -328,7 +328,8 @@ static Object *qdev_get_peripheral_anon(void)
     return dev;
 }
 
-static void qbus_list_bus(DeviceState *dev, Error **errp)
+static void qbus_error_append_bus_list_hint(DeviceState *dev,
+                                            Error *const *errp)
 {
     BusState *child;
     const char *sep = " ";
@@ -342,7 +343,8 @@ static void qbus_list_bus(DeviceState *dev, Error **errp)
     error_append_hint(errp, "\n");
 }
 
-static void qbus_list_dev(BusState *bus, Error **errp)
+static void qbus_error_append_dev_list_hint(BusState *bus,
+                                            Error *const *errp)
 {
     BusChild *kid;
     const char *sep = " ";
@@ -500,7 +502,7 @@ static BusState *qbus_find(const char *path, Error **errp)
         if (!dev) {
             error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
                       "Device '%s' not found", elem);
-            qbus_list_dev(bus, errp);
+            qbus_error_append_dev_list_hint(bus, errp);
             return NULL;
         }
 
@@ -518,7 +520,7 @@ static BusState *qbus_find(const char *path, Error **errp)
             if (dev->num_child_bus) {
                 error_setg(errp, "Device '%s' has multiple child buses",
                            elem);
-                qbus_list_bus(dev, errp);
+                qbus_error_append_bus_list_hint(dev, errp);
             } else {
                 error_setg(errp, "Device '%s' has no child bus", elem);
             }
@@ -534,7 +536,7 @@ static BusState *qbus_find(const char *path, Error **errp)
         bus = qbus_find_bus(dev, elem);
         if (!bus) {
             error_setg(errp, "Bus '%s' not found", elem);
-            qbus_list_bus(dev, errp);
+            qbus_error_append_bus_list_hint(dev, errp);
             return NULL;
         }
     }
-- 
2.21.0


