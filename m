Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F001D9AEF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:15:02 +0200 (CEST)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3xL-000754-PV
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3fB-0001eM-T8
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30343
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f3-0003X3-If
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2/D9HQyEWFFsXaVzSmExR1GrJdEIzWSHSdUrtb9lnU=;
 b=D2h0QxrbFaDRtME8a2Mwt85MVYzi0dTZ8z2Ac9O/9Br8IwwMjgf8+u1UOFcSpV7+mYuW0b
 lwDzbRLVLYRlgtGHsZxLjjGaAMllZS+xVis1I67T3MIaOVkQAPaCfXzd5n8EvK5UfGL5eX
 vU/FSb4frEYKASeWE6Kyxntv5iSWuzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-hIpydOPcO9qiLphkwItZ8g-1; Tue, 19 May 2020 10:56:02 -0400
X-MC-Unique: hIpydOPcO9qiLphkwItZ8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7173A800D24
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:56:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F6DF5799C;
 Tue, 19 May 2020 14:56:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79E521135235; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 54/55] qdev: qdev_init_nofail() is now unused, drop
Date: Tue, 19 May 2020 16:55:50 +0200
Message-Id: <20200519145551.22836-55-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 include/hw/qdev-core.h |  3 +--
 hw/core/qdev.c         | 29 -----------------------------
 2 files changed, 1 insertion(+), 31 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index ef6137b6a8..7dc10be46f 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -57,7 +57,7 @@ typedef void (*BusUnrealize)(BusState *bus);
  * After successful realization, setting static properties will fail.
  *
  * As an interim step, the #DeviceState:realized property can also be
- * set with qdev_realize() or qdev_init_nofail().
+ * set with qdev_realize().
  * In the future, devices will propagate this state change to their children
  * and along busses they expose.
  * The point in time will be deferred to machine creation, so that values
@@ -322,7 +322,6 @@ compat_props_add(GPtrArray *arr,
 
 DeviceState *qdev_new(const char *name);
 DeviceState *qdev_try_new(const char *name);
-void qdev_init_nofail(DeviceState *dev);
 bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp);
 bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
 void qdev_unrealize(DeviceState *dev);
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0662bbc812..ab36d3e975 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -376,35 +376,6 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
     qdev_unrealize(dev);
 }
 
-/*
- * Realize @dev.
- * Device properties should be set before calling this function.  IRQs
- * and MMIO regions should be connected/mapped after calling this
- * function.
- * On failure, report an error with error_report() and terminate the
- * program.  This is okay during machine creation.  Don't use for
- * hotplug, because there callers need to recover from failure.
- * Exception: if you know the device's init() callback can't fail,
- * then qdev_init_nofail() can't fail either, and is therefore usable
- * even then.  But relying on the device implementation that way is
- * somewhat unclean, and best avoided.
- */
-void qdev_init_nofail(DeviceState *dev)
-{
-    Error *err = NULL;
-
-    assert(!dev->realized);
-
-    object_ref(OBJECT(dev));
-    object_property_set_bool(OBJECT(dev), true, "realized", &err);
-    if (err) {
-        error_reportf_err(err, "Initialization of device %s failed: ",
-                          object_get_typename(OBJECT(dev)));
-        exit(1);
-    }
-    object_unref(OBJECT(dev));
-}
-
 /*
  * Realize @dev.
  * @dev must not be plugged into a bus.
-- 
2.21.1


