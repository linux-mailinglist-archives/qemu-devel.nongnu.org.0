Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AAA1E7FAF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 16:07:32 +0200 (CEST)
Received: from localhost ([::1]:51342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeffX-0006z5-Vm
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 10:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKS-0002sj-0P
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:44 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43015
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jefKL-00075U-PB
 for qemu-devel@nongnu.org; Fri, 29 May 2020 09:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590759936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ly1pwAQSlqOFXa63u6MJ9+cn1/cIRAgA/pUievJl0iM=;
 b=UPHq1IEZnU8ZJ+zz3MDBCqUsf68jbpGMDwZM/0R0e8vRE+u0HlovoBY16e5kerVaOdGUO6
 dkH3IuG109FahCqYWisuNBzw1FbLgyf/jQ/YdbodEU/2c4vxzxaES3+rxuc/EwkhYPutKo
 4ZIxFtdyYxif11lQQVVOlN0nbsx7q78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-8qO6IpWWMrilFZ2ruz-bmg-1; Fri, 29 May 2020 09:45:34 -0400
X-MC-Unique: 8qO6IpWWMrilFZ2ruz-bmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F6D5835B45
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 242A55C1D0
 for <qemu-devel@nongnu.org>; Fri, 29 May 2020 13:45:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 82E631135241; Fri, 29 May 2020 15:45:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/58] qdev: Drop qdev_realize() support for null bus
Date: Fri, 29 May 2020 15:45:11 +0200
Message-Id: <20200529134523.8477-47-armbru@redhat.com>
In-Reply-To: <20200529134523.8477-1-armbru@redhat.com>
References: <20200529134523.8477-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:27:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "null @bus means main system bus" convenience feature is no longer
used.  Drop it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/qdev.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index a1fdebb3aa..78a06db76e 100644
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
2.21.3


