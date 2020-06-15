Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3721FA29E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:16:06 +0200 (CEST)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwSb-0003k9-CF
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuh-0003bB-CW
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:41:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37522
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvua-0000j5-54
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHJ1oRCAkhNB2DNfhMMTxnmNKNLrQDT6ZZDgeVIDGmw=;
 b=SjMBuZuKEhurB2K/C2D/dOFKyKF/0bk2l9+PCGbYh417MS0JORy9qoP8apJRIw5nKpAft7
 eoX/P6tRqOjU8Cngeu5M8rdEozWCeqyIstrByLrYSXa4/FLG5rXrIYtlzUl5HOreTuClnQ
 7vIV2A2E2mpgT5u+/qFSHLOo/okkGHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-HQJYBnUZM8eGGJD3vv4dOg-1; Mon, 15 Jun 2020 16:40:48 -0400
X-MC-Unique: HQJYBnUZM8eGGJD3vv4dOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6155E1091320
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 636D190337;
 Mon, 15 Jun 2020 20:40:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E39A41132D80; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 55/84] usb: Eliminate usb_try_create_simple()
Date: Mon, 15 Jun 2020 22:39:39 +0200
Message-Id: <20200615204008.3069956-56-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:04
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

usb_try_create_simple() is qdev_try_new() and qdev_realize_and_unref()
with more verbose error messages.  Of its two users, one ignores
errors, and the other asserts they are impossible.

Make them use qdev_try_new() and qdev_realize_and_unref() directly,
and eliminate usb_try_create_simple

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-30-armbru@redhat.com>
---
 hw/usb/bus.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 5c4d31614e..a81aee2051 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -318,35 +318,22 @@ USBDevice *usb_new(const char *name)
     return USB_DEVICE(qdev_new(name));
 }
 
+static USBDevice *usb_try_new(const char *name)
+{
+    return USB_DEVICE(qdev_try_new(name));
+}
+
 bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp)
 {
     return qdev_realize_and_unref(&dev->qdev, &bus->qbus, errp);
 }
 
-static USBDevice *usb_try_create_simple(USBBus *bus, const char *name,
-                                        Error **errp)
-{
-    Error *err = NULL;
-    DeviceState *dev;
-
-    dev = qdev_try_new(name);
-    if (!dev) {
-        error_setg(errp, "Failed to create USB device '%s'", name);
-        return NULL;
-    }
-    qdev_realize_and_unref(dev, &bus->qbus, &err);
-    if (err) {
-        error_propagate_prepend(errp, err,
-                                "Failed to initialize USB device '%s': ",
-                                name);
-        return NULL;
-    }
-    return USB_DEVICE(dev);
-}
-
 USBDevice *usb_create_simple(USBBus *bus, const char *name)
 {
-    return usb_try_create_simple(bus, name, &error_abort);
+    USBDevice *dev = usb_new(name);
+
+    usb_realize_and_unref(dev, bus, &error_abort);
+    return dev;
 }
 
 static void usb_fill_port(USBPort *port, void *opaque, int index,
@@ -426,6 +413,7 @@ void usb_claim_port(USBDevice *dev, Error **errp)
 {
     USBBus *bus = usb_bus_from_device(dev);
     USBPort *port;
+    USBDevice *hub;
 
     assert(dev->port == NULL);
 
@@ -443,7 +431,10 @@ void usb_claim_port(USBDevice *dev, Error **errp)
     } else {
         if (bus->nfree == 1 && strcmp(object_get_typename(OBJECT(dev)), "usb-hub") != 0) {
             /* Create a new hub and chain it on */
-            usb_try_create_simple(bus, "usb-hub", NULL);
+            hub = usb_try_new("usb-hub");
+            if (hub) {
+                usb_realize_and_unref(hub, bus, NULL);
+            }
         }
         if (bus->nfree == 0) {
             error_setg(errp, "tried to attach usb device %s to a bus "
-- 
2.26.2


