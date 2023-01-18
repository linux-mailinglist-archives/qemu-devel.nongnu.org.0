Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCCB6728B6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 20:49:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIEPR-0002cg-Ee; Wed, 18 Jan 2023 14:47:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPP-0002bs-2w
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPN-0000nu-LL
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674071260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2aoHPelUbE36+eo9gQUruGzVlTIBas83/H+faoy6cM=;
 b=BCwP7gF4WsrOP7mIIpw6P1H+fs/dvnY42tX3A/K6YuBp+BxbIAQ8WCLxwOay3j/ULGNhdn
 sumziDSfQIFBC8EajvCeCz0Tj0tlH9fUNXrNt2Gc7BMpqNlHcCSC51JAI2zNMnv5WcQl6s
 0CmsHamDi/IZHh5FepI0pKTa57vZCBo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-ZB9Eg4pTPCaX3DDhzrN0cg-1; Wed, 18 Jan 2023 14:47:37 -0500
X-MC-Unique: ZB9Eg4pTPCaX3DDhzrN0cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C05E2101A52E;
 Wed, 18 Jan 2023 19:47:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4243F40C6EC4;
 Wed, 18 Jan 2023 19:47:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [RFC 1/3] qdev-properties: alias all object class properties
Date: Wed, 18 Jan 2023 14:47:30 -0500
Message-Id: <20230118194732.1258208-2-stefanha@redhat.com>
In-Reply-To: <20230118194732.1258208-1-stefanha@redhat.com>
References: <20230118194732.1258208-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

qdev_alias_all_properties() aliases a DeviceState's qdev properties onto
an Object. This is used for VirtioPCIProxy types so that --device
virtio-blk-pci has properties of its embedded --device virtio-blk-device
object.

Currently this function is implemented using qdev properties. Change the
function to use QOM object class properties instead. This works because
qdev properties create QOM object class properties, but it also catches
any QOM object class-only properties that have no qdev properties.

This change ensures that properties of devices are shown with --device
foo,\? even if they are QOM object class properties.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/core/qdev-properties.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b8761b5..fbf3969d3c 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -959,16 +959,18 @@ void device_class_set_props(DeviceClass *dc, Property *props)
 void qdev_alias_all_properties(DeviceState *target, Object *source)
 {
     ObjectClass *class;
-    Property *prop;
+    ObjectPropertyIterator iter;
+    ObjectProperty *prop;
 
     class = object_get_class(OBJECT(target));
-    do {
-        DeviceClass *dc = DEVICE_CLASS(class);
 
-        for (prop = dc->props_; prop && prop->name; prop++) {
-            object_property_add_alias(source, prop->name,
-                                      OBJECT(target), prop->name);
+    object_class_property_iter_init(&iter, class);
+    while ((prop = object_property_iter_next(&iter))) {
+        if (object_property_find(source, prop->name)) {
+            continue; /* skip duplicate properties */
         }
-        class = object_class_get_parent(class);
-    } while (class != object_class_by_name(TYPE_DEVICE));
+
+        object_property_add_alias(source, prop->name,
+                                  OBJECT(target), prop->name);
+    }
 }
-- 
2.39.0


