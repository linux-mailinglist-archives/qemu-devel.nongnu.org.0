Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F401D7039
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 07:15:42 +0200 (CEST)
Received: from localhost ([::1]:51414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaY7p-00025Y-IZ
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 01:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwp-0008Qd-TI
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:04:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50480
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jaXwm-0004M3-Pm
 for qemu-devel@nongnu.org; Mon, 18 May 2020 01:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589778256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R5E6uW3t84il5PgRddNK0eX2QICClvdmWrIitYIgusE=;
 b=WjfiDAHc5CqfkcX1VSZf29vUAWXuQxYMffYNFT15Hci3302FWPXgc1khWMWh2vJeaevO4b
 do9Il3ZBvA4J8eDfEW3wz1sW4CbDpgewj72SCnUIrUIubmKChOSba+ae6f7WfxLXhQQhGU
 8H9VHfNTsnj/vMQ9oc9N/FG3blvKXWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-rGikMu1cPNWD6X9AkDMFQA-1; Mon, 18 May 2020 01:04:14 -0400
X-MC-Unique: rGikMu1cPNWD6X9AkDMFQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0BDC872FF4
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 05:04:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F1845D9DC;
 Mon, 18 May 2020 05:04:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 85D2E11358D5; Mon, 18 May 2020 07:04:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/24] qdev: Assert onboard devices all get realized properly
Date: Mon, 18 May 2020 07:04:08 +0200
Message-Id: <20200518050408.4579-25-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-1-armbru@redhat.com>
References: <20200518050408.4579-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/17 22:52:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

This would have caught some of the bugs I just fixed.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/qdev.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 0df995eb94..fe2dea8968 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -429,6 +429,19 @@ void qdev_init_nofail(DeviceState *dev)
     object_unref(OBJECT(dev));
 }
 
+static int qdev_assert_realized_properly(Object *obj, void *opaque)
+{
+    DeviceState *dev = DEVICE(object_dynamic_cast(obj, TYPE_DEVICE));
+    DeviceClass *dc;
+
+    if (dev) {
+        dc = DEVICE_GET_CLASS(dev);
+        assert(dev->realized);
+        assert(dev->parent_bus || !dc->bus_type);
+    }
+    return 0;
+}
+
 void qdev_machine_creation_done(void)
 {
     /*
@@ -436,6 +449,9 @@ void qdev_machine_creation_done(void)
      * only create hotpluggable devices
      */
     qdev_hotplug = true;
+
+    object_child_foreach_recursive(object_get_root(),
+                                   qdev_assert_realized_properly, NULL);
 }
 
 bool qdev_machine_modified(void)
-- 
2.21.1


