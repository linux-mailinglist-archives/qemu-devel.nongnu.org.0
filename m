Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A31D9AFF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:19:22 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb41Z-0007v1-Ec
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3fI-0001pm-Ez
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32495
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f4-0003YY-Kg
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JS0a/TFSV9pFKuTNcOzfOmUj2EbjQqjFJUJKu1W//k8=;
 b=gZ5MStioBpA9uLoLKnFpXqXd1WSC51L8rp/Pw8QDbBLpZuV/ULCtuq1n62cvhkwDknN/g9
 ORSARf+KI3ELTUz95mmgjuE1DXKbY94g0pocSb+LwVyU0h9zpvmU39umUvYmsUfvPpthel
 6iWHm1p4myhZBp8LjYJS5Q7IByOtqQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-lAKa347SOS-KKFUY25GAsQ-1; Tue, 19 May 2020 10:55:59 -0400
X-MC-Unique: lAKa347SOS-KKFUY25GAsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55BE380B720
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:55:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23ECB1C953;
 Tue, 19 May 2020 14:55:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 222EC11358DA; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/55] qdev: qdev_create(), qdev_try_create() are now unused,
 drop
Date: Tue, 19 May 2020 16:55:25 +0200
Message-Id: <20200519145551.22836-30-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/qdev-core.h |  2 --
 hw/core/qdev.c         | 48 ------------------------------------------
 hw/core/sysbus.c       |  1 -
 migration/migration.c  |  2 +-
 4 files changed, 1 insertion(+), 52 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index be6f7c4736..ef6137b6a8 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -320,8 +320,6 @@ compat_props_add(GPtrArray *arr,
 
 /*** Board API.  This should go away once we have a machine config file.  ***/
 
-DeviceState *qdev_create(BusState *bus, const char *name);
-DeviceState *qdev_try_create(BusState *bus, const char *name);
 DeviceState *qdev_new(const char *name);
 DeviceState *qdev_try_new(const char *name);
 void qdev_init_nofail(DeviceState *dev);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cb7efae487..8a9e8155d4 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -128,54 +128,6 @@ void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
     }
 }
 
-/* Create a new device.  This only initializes the device state
-   structure and allows properties to be set.  The device still needs
-   to be realized.  See qdev-core.h.  */
-DeviceState *qdev_create(BusState *bus, const char *name)
-{
-    DeviceState *dev;
-
-    dev = qdev_try_create(bus, name);
-    if (!dev) {
-        if (bus) {
-            error_report("Unknown device '%s' for bus '%s'", name,
-                         object_get_typename(OBJECT(bus)));
-        } else {
-            error_report("Unknown device '%s' for default sysbus", name);
-        }
-        abort();
-    }
-
-    return dev;
-}
-
-DeviceState *qdev_try_create(BusState *bus, const char *type)
-{
-    DeviceState *dev;
-
-    if (object_class_by_name(type) == NULL) {
-        return NULL;
-    }
-    dev = DEVICE(object_new(type));
-    if (!dev) {
-        return NULL;
-    }
-
-    if (!bus) {
-        /* Assert that the device really is a SysBusDevice before
-         * we put it onto the sysbus. Non-sysbus devices which aren't
-         * being put onto a bus should be created with object_new(TYPE_FOO),
-         * not qdev_create(NULL, TYPE_FOO).
-         */
-        g_assert(object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE));
-        bus = sysbus_get_default();
-    }
-
-    qdev_set_parent_bus(dev, bus);
-    object_unref(OBJECT(dev));
-    return dev;
-}
-
 /*
  * Create a device on the heap.
  * A type @name must exist.
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index b5db0d179f..7ff1b5f2de 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -325,7 +325,6 @@ static const TypeInfo sysbus_device_type_info = {
     .class_init = sysbus_device_class_init,
 };
 
-/* This is a nasty hack to allow passing a NULL bus to qdev_create.  */
 static BusState *main_system_bus;
 
 static void main_system_bus_create(void)
diff --git a/migration/migration.c b/migration/migration.c
index 0bb042a0f7..66c04caa18 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3774,7 +3774,7 @@ static const TypeInfo migration_type = {
     .name = TYPE_MIGRATION,
     /*
      * NOTE: TYPE_MIGRATION is not really a device, as the object is
-     * not created using qdev_create(), it is not attached to the qdev
+     * not created using qdev_new(), it is not attached to the qdev
      * device tree, and it is never realized.
      *
      * TODO: Make this TYPE_OBJECT once QOM provides something like
-- 
2.21.1


