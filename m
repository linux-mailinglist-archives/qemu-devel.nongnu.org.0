Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A5C1FA2CE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 23:31:33 +0200 (CEST)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwhY-0002lS-4d
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 17:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkw1y-0006us-A1
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:48:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31237
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkw1v-0001rv-Ht
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592254110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0e3sCBixE+MmGnFw3jrOBEoz9KHSqBVghgVD9ytsP4=;
 b=hyr631A488iROC2hTbl+/HRzDuLhZBRLEy9Ruwx6mKWKHODQEbFdJjtNGcvGAI9YbIRWvK
 yhuVXS78LUuI08LZ0fqBT9CAN7OTb4at0cDZgYBx5K6KrMr7smzTB/4eL57pPxhSMf2yKp
 gESH215y5NuV7u+0Au0IEzGGFbzG92s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-D_pSxw3JPe-z33PKbOxs8w-1; Mon, 15 Jun 2020 16:48:29 -0400
X-MC-Unique: D_pSxw3JPe-z33PKbOxs8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DE7418585A4
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:48:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EA957CAB9;
 Mon, 15 Jun 2020 20:48:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6490E1131C05; Mon, 15 Jun 2020 22:40:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 80/84] qdev: Make qdev_realize() support bus-less devices
Date: Mon, 15 Jun 2020 22:40:04 +0200
Message-Id: <20200615204008.3069956-81-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So far, qdev_realize() supports only devices that plug into a bus:
argument @bus cannot be null.  Extend it to support bus-less devices,
too.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-55-armbru@redhat.com>
---
 hw/core/qdev.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 78a06db76e..50336168f2 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -408,7 +408,7 @@ void qdev_init_nofail(DeviceState *dev)
 /*
  * Realize @dev.
  * @dev must not be plugged into a bus.
- * Plug @dev into @bus.  This takes a reference to @dev.
+ * If @bus, plug @dev into @bus.  This takes a reference to @dev.
  * If @dev has no QOM parent, make one up, taking another reference.
  * On success, return true.
  * On failure, store an error through @errp and return false.
@@ -418,9 +418,12 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
     Error *err = NULL;
 
     assert(!dev->realized && !dev->parent_bus);
-    assert(bus);
 
-    qdev_set_parent_bus(dev, bus);
+    if (bus) {
+        qdev_set_parent_bus(dev, bus);
+    } else {
+        assert(!DEVICE_GET_CLASS(dev)->bus_type);
+    }
 
     object_property_set_bool(OBJECT(dev), true, "realized", &err);
     if (err) {
-- 
2.26.2


