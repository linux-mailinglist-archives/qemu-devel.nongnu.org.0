Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643AC1FA2A9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:19:44 +0200 (CEST)
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwW7-0008U0-Aa
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvud-0003Uw-U5
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20715
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuZ-0000ht-Ek
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/MjLwpRHMbOqMoFFEVUaukXqnDS4yHry2twS+dsjR0=;
 b=J/tq9s9KP+27p/wS5tUcxHdSNJ6OTh3TQ4U90426eTIzZSC1vYDYEPRYMK6rM4MWzVwHiu
 lJjYkM2dDr6VJrumpsMzLSvS4mgxACMVvGSLaDS6PNhAcT0oTnfi+hdRVjAXl0pisYkR9F
 KTfEV2KWdHuuO4I27GthXSm3+HUIsQ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-1rznzfYxODCKT2JoQxa9lA-1; Mon, 15 Jun 2020 16:40:51 -0400
X-MC-Unique: 1rznzfYxODCKT2JoQxa9lA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC0305AED2
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DE237FE92;
 Mon, 15 Jun 2020 20:40:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E717B1132D83; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 56/84] qdev: qdev_create(), qdev_try_create() are now unused,
 drop
Date: Mon, 15 Jun 2020 22:39:40 +0200
Message-Id: <20200615204008.3069956-57-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:38:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-31-armbru@redhat.com>
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
index 4768244f31..a1fdebb3aa 100644
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
index b63ad91d34..481a590f72 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3778,7 +3778,7 @@ static const TypeInfo migration_type = {
     .name = TYPE_MIGRATION,
     /*
      * NOTE: TYPE_MIGRATION is not really a device, as the object is
-     * not created using qdev_create(), it is not attached to the qdev
+     * not created using qdev_new(), it is not attached to the qdev
      * device tree, and it is never realized.
      *
      * TODO: Make this TYPE_OBJECT once QOM provides something like
-- 
2.26.2


