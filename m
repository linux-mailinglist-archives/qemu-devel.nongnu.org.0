Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213C9285EE1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 14:16:18 +0200 (CEST)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ8Mj-0004Ws-1g
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 08:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ84V-0001n3-Fo
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ84R-0001mF-CL
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602071841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xudVhDJCcMtA8YjfA06jzSmAzA2xquxEpsgiDd4Fkyo=;
 b=WYZi5gTHnw3Liuisp05fLWNc5VzI1vFegIIoOd4Pk/TP8xq/MCxU01m9Ku4kD631rkTCMW
 jsuv+fQl/Ezne2QscB3VRh30Pp87X4CogXk21EOKoHNYsoR51jX33K3I72abyb0SOTYd5n
 2KhT/VBx/FVUwshslRPqV6ZvQilrDFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-r5vfvhMfNVylM3M6boxyBA-1; Wed, 07 Oct 2020 07:57:17 -0400
X-MC-Unique: r5vfvhMfNVylM3M6boxyBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B45910BBEC3;
 Wed,  7 Oct 2020 11:57:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A0EC60BEC;
 Wed,  7 Oct 2020 11:57:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/17] device-core: use RCU for list of children of a bus
Date: Wed,  7 Oct 2020 07:56:54 -0400
Message-Id: <20201007115700.707938-12-pbonzini@redhat.com>
In-Reply-To: <20201007115700.707938-1-pbonzini@redhat.com>
References: <20201007115700.707938-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This fixes the race between device emulation code that tries to find
a child device to dispatch the request to (e.g a scsi disk),
and hotplug of a new device to that bus.

Note that this doesn't convert all the readers of the list
but only these that might go over that list without BQL held.

This is a very small first step to make this code thread safe.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200913160259.32145-5-mlevitsk@redhat.com>
[Use RCU_READ_LOCK_GUARD in more places, adjust testcase now that
 the delay in DEVICE_DELETED due to RCU is more consistent. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201006123904.610658-9-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/bus.c          | 28 +++++++++++++++++-----------
 hw/core/qdev.c         | 37 +++++++++++++++++++++++--------------
 hw/scsi/scsi-bus.c     | 12 +++++++++---
 hw/scsi/virtio-scsi.c  |  6 +++++-
 include/hw/qdev-core.h |  9 +++++++++
 5 files changed, 63 insertions(+), 29 deletions(-)

diff --git a/hw/core/bus.c b/hw/core/bus.c
index 6b987b6946..a0483859ae 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -49,12 +49,14 @@ int qbus_walk_children(BusState *bus,
         }
     }
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-        err = qdev_walk_children(kid->child,
-                                 pre_devfn, pre_busfn,
-                                 post_devfn, post_busfn, opaque);
-        if (err < 0) {
-            return err;
+    WITH_RCU_READ_LOCK_GUARD() {
+        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
+            err = qdev_walk_children(kid->child,
+                                     pre_devfn, pre_busfn,
+                                     post_devfn, post_busfn, opaque);
+            if (err < 0) {
+                return err;
+            }
         }
     }
 
@@ -90,8 +92,10 @@ static void bus_reset_child_foreach(Object *obj, ResettableChildCallback cb,
     BusState *bus = BUS(obj);
     BusChild *kid;
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-        cb(OBJECT(kid->child), opaque, type);
+    WITH_RCU_READ_LOCK_GUARD() {
+        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
+            cb(OBJECT(kid->child), opaque, type);
+        }
     }
 }
 
@@ -194,9 +198,11 @@ static void bus_set_realized(Object *obj, bool value, Error **errp)
 
         /* TODO: recursive realization */
     } else if (!value && bus->realized) {
-        QTAILQ_FOREACH(kid, &bus->children, sibling) {
-            DeviceState *dev = kid->child;
-            qdev_unrealize(dev);
+        WITH_RCU_READ_LOCK_GUARD() {
+            QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
+                DeviceState *dev = kid->child;
+                qdev_unrealize(dev);
+            }
         }
         if (bc->unrealize) {
             bc->unrealize(bus);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 74db78df36..59e5e710b7 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -51,6 +51,12 @@ const VMStateDescription *qdev_get_vmsd(DeviceState *dev)
     return dc->vmsd;
 }
 
+static void bus_free_bus_child(BusChild *kid)
+{
+    object_unref(OBJECT(kid->child));
+    g_free(kid);
+}
+
 static void bus_remove_child(BusState *bus, DeviceState *child)
 {
     BusChild *kid;
@@ -60,15 +66,16 @@ static void bus_remove_child(BusState *bus, DeviceState *child)
             char name[32];
 
             snprintf(name, sizeof(name), "child[%d]", kid->index);
-            QTAILQ_REMOVE(&bus->children, kid, sibling);
+            QTAILQ_REMOVE_RCU(&bus->children, kid, sibling);
 
             bus->num_children--;
 
             /* This gives back ownership of kid->child back to us.  */
             object_property_del(OBJECT(bus), name);
-            object_unref(OBJECT(kid->child));
-            g_free(kid);
-            return;
+
+            /* free the bus kid, when it is safe to do so*/
+            call_rcu(kid, bus_free_bus_child, rcu);
+            break;
         }
     }
 }
@@ -83,7 +90,7 @@ static void bus_add_child(BusState *bus, DeviceState *child)
     kid->child = child;
     object_ref(OBJECT(kid->child));
 
-    QTAILQ_INSERT_HEAD(&bus->children, kid, sibling);
+    QTAILQ_INSERT_HEAD_RCU(&bus->children, kid, sibling);
 
     /* This transfers ownership of kid->child to the property.  */
     snprintf(name, sizeof(name), "child[%d]", kid->index);
@@ -672,17 +679,19 @@ DeviceState *qdev_find_recursive(BusState *bus, const char *id)
     DeviceState *ret;
     BusState *child;
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-        DeviceState *dev = kid->child;
+    WITH_RCU_READ_LOCK_GUARD() {
+        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
+            DeviceState *dev = kid->child;
 
-        if (dev->id && strcmp(dev->id, id) == 0) {
-            return dev;
-        }
+            if (dev->id && strcmp(dev->id, id) == 0) {
+                return dev;
+            }
 
-        QLIST_FOREACH(child, &dev->child_bus, sibling) {
-            ret = qdev_find_recursive(child, id);
-            if (ret) {
-                return ret;
+            QLIST_FOREACH(child, &dev->child_bus, sibling) {
+                ret = qdev_find_recursive(child, id);
+                if (ret) {
+                    return ret;
+                }
             }
         }
     }
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 6b1ed7ae9a..4cf1f404b4 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -400,7 +400,10 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
     id = r->req.dev->id;
     found_lun0 = false;
     n = 0;
-    QTAILQ_FOREACH(kid, &r->req.bus->qbus.children, sibling) {
+
+    RCU_READ_LOCK_GUARD();
+
+    QTAILQ_FOREACH_RCU(kid, &r->req.bus->qbus.children, sibling) {
         DeviceState *qdev = kid->child;
         SCSIDevice *dev = SCSI_DEVICE(qdev);
 
@@ -421,7 +424,7 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
     memset(r->buf, 0, len);
     stl_be_p(&r->buf[0], n);
     i = found_lun0 ? 8 : 16;
-    QTAILQ_FOREACH(kid, &r->req.bus->qbus.children, sibling) {
+    QTAILQ_FOREACH_RCU(kid, &r->req.bus->qbus.children, sibling) {
         DeviceState *qdev = kid->child;
         SCSIDevice *dev = SCSI_DEVICE(qdev);
 
@@ -430,6 +433,7 @@ static bool scsi_target_emulate_report_luns(SCSITargetReq *r)
             i += 8;
         }
     }
+
     assert(i == n + 8);
     r->len = len;
     return true;
@@ -1572,7 +1576,8 @@ SCSIDevice *scsi_device_find(SCSIBus *bus, int channel, int id, int lun)
     BusChild *kid;
     SCSIDevice *target_dev = NULL;
 
-    QTAILQ_FOREACH(kid, &bus->qbus.children, sibling) {
+    RCU_READ_LOCK_GUARD();
+    QTAILQ_FOREACH_RCU(kid, &bus->qbus.children, sibling) {
         DeviceState *qdev = kid->child;
         SCSIDevice *dev = SCSI_DEVICE(qdev);
 
@@ -1591,6 +1596,7 @@ SCSIDevice *scsi_device_find(SCSIBus *bus, int channel, int id, int lun)
             }
         }
     }
+
     return target_dev;
 }
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 3a71ea7097..971afbb217 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -367,12 +367,16 @@ static int virtio_scsi_do_tmf(VirtIOSCSI *s, VirtIOSCSIReq *req)
     case VIRTIO_SCSI_T_TMF_I_T_NEXUS_RESET:
         target = req->req.tmf.lun[1];
         s->resetting++;
-        QTAILQ_FOREACH(kid, &s->bus.qbus.children, sibling) {
+
+        rcu_read_lock();
+        QTAILQ_FOREACH_RCU(kid, &s->bus.qbus.children, sibling) {
              d = SCSI_DEVICE(kid->child);
              if (d->channel == 0 && d->id == target) {
                 qdev_reset_all(&d->qdev);
              }
         }
+        rcu_read_unlock();
+
         s->resetting--;
         break;
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 14d476c587..2c6307e3ed 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -3,6 +3,8 @@
 
 #include "qemu/queue.h"
 #include "qemu/bitmap.h"
+#include "qemu/rcu.h"
+#include "qemu/rcu_queue.h"
 #include "qom/object.h"
 #include "hw/hotplug.h"
 #include "hw/resettable.h"
@@ -238,6 +240,7 @@ struct BusClass {
 };
 
 typedef struct BusChild {
+    struct rcu_head rcu;
     DeviceState *child;
     int index;
     QTAILQ_ENTRY(BusChild) sibling;
@@ -258,6 +261,12 @@ struct BusState {
     int max_index;
     bool realized;
     int num_children;
+
+    /*
+     * children is a RCU QTAILQ, thus readers must use RCU to access it,
+     * and writers must hold the big qemu lock
+     */
+
     QTAILQ_HEAD(, BusChild) children;
     QLIST_ENTRY(BusState) sibling;
     ResettableState reset;
-- 
2.26.2



