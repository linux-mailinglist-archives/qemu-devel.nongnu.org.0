Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356F71D9AD3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:11:24 +0200 (CEST)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3tr-0007Bs-8J
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f8-0001TH-EO
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:10 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22075
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f1-0003WQ-UO
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/i9JBEq4R0ji+yEYdPYchsyzsw8pPQ6/iN1V5cSMeM=;
 b=XKyIeaYfMtHRdjal+k8E8P5dzZ0guiR2gp9Ps+Wxv3TJxcstJS4clINyTD7mShB6kM5FDO
 1+YdvdfntMnpBQektQ2JzpX4BozVetIgYPUSMDTdad0mZXZ+K/clPIpuh6pFrTS2+Olx1/
 TZdCmqeLDVgHy5FgYSPemDyNe3m4uLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-QtZ_pYn-Or-WVSKb8FOM8w-1; Tue, 19 May 2020 10:56:01 -0400
X-MC-Unique: QtZ_pYn-Or-WVSKb8FOM8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A7C6107ACCA
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:56:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AB386442A;
 Tue, 19 May 2020 14:56:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 559A41135229; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 44/55] qdev: Drop qdev_realize() support for null bus
Date: Tue, 19 May 2020 16:55:40 +0200
Message-Id: <20200519145551.22836-45-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

The "null @bus means main system bus" convenience feature is no longer
used.  Drop it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/qdev.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 8a9e8155d4..323b6328c8 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -408,8 +408,7 @@ void qdev_init_nofail(DeviceState *dev)
 /*
  * Realize @dev.
  * @dev must not be plugged into a bus.
- * Plug @dev into @bus if non-null, else into the main system bus.
- * This takes a reference to @dev.
+ * Plug @dev into @bus.  This takes a reference to @dev.
  * If @dev has no QOM parent, make one up, taking another reference.
  * On success, return true.
  * On failure, store an error through @errp and return false.
@@ -419,18 +418,7 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
     Error *err = NULL;
 
     assert(!dev->realized && !dev->parent_bus);
-
-    if (!bus) {
-        /*
-         * Assert that the device really is a SysBusDevice before we
-         * put it onto the sysbus.  Non-sysbus devices which aren't
-         * being put onto a bus should be realized with
-         * object_property_set_bool(OBJECT(dev), true, "realized",
-         * errp);
-         */
-        g_assert(object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE));
-        bus = sysbus_get_default();
-    }
+    assert(bus);
 
     qdev_set_parent_bus(dev, bus);
 
-- 
2.21.1


