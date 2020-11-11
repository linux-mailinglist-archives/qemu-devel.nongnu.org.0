Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E92AF87E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 19:48:02 +0100 (CET)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcvA1-0001RW-WE
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 13:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv15-0000Kw-NI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kcv13-00083W-DO
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 13:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605119924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/3T9jwyO7+gzlJ0IX2u7iMLQEH5y1V/+ocQuhIaLuPI=;
 b=GcpmX8vdXOs1chc3Z7zV2izFojmTJshC1r+MFUbDVgG/NA7EBSNK4lXj5kPN2Z6gK9F2VC
 o53114jGjsluzA760E3zfl/NNvm1S+c2MGGzYbZLa+nWvSKwIyE+GYyt+sidSBgufD0H7g
 y7bnSAmk9/MnThLpE197Ep8UZxlb2XI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-FvkHv3zCN3-9ieHPcvAy-w-1; Wed, 11 Nov 2020 13:38:40 -0500
X-MC-Unique: FvkHv3zCN3-9ieHPcvAy-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33D491006C84;
 Wed, 11 Nov 2020 18:38:39 +0000 (UTC)
Received: from localhost (ovpn-114-68.rdu2.redhat.com [10.10.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D865575125;
 Wed, 11 Nov 2020 18:38:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] colo: Use class properties
Date: Wed, 11 Nov 2020 13:38:20 -0500
Message-Id: <20201111183823.283752-10-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-1-ehabkost@redhat.com>
References: <20201111183823.283752-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instance properties make introspection hard and are not shown by
"-object ...,help".  Convert them to class properties.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
This was originally submitted as part of the series:
Subject: [PATCH 00/12] qom: Make all -object types use only class properties
Message-Id: <20201009160122.1662082-1-ehabkost@redhat.com>
https://lore.kernel.org/qemu-devel/20201009160122.1662082-1-ehabkost@redhat.com
---
Cc: Zhang Chen <chen.zhang@intel.com>
Cc: Li Zhijian <lizhijian@cn.fujitsu.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
---
 net/colo-compare.c | 57 +++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 3a45d64175..017e82dd8b 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1375,6 +1375,35 @@ static void colo_compare_class_init(ObjectClass *oc, void *data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
 
+    object_class_property_add_str(oc, "primary_in",
+                                  compare_get_pri_indev, compare_set_pri_indev);
+    object_class_property_add_str(oc, "secondary_in",
+                                  compare_get_sec_indev, compare_set_sec_indev);
+    object_class_property_add_str(oc, "outdev",
+                                  compare_get_outdev, compare_set_outdev);
+    object_class_property_add_link(oc, "iothread", TYPE_IOTHREAD,
+                                  offsetof(CompareState, iothread),
+                                  object_property_allow_set_link,
+                                  OBJ_PROP_LINK_STRONG);
+    /* This parameter just for Xen COLO */
+    object_class_property_add_str(oc, "notify_dev",
+                                  compare_get_notify_dev, compare_set_notify_dev);
+
+    object_class_property_add(oc, "compare_timeout", "uint32",
+                              compare_get_timeout,
+                              compare_set_timeout, NULL, NULL);
+
+    object_class_property_add(oc, "expired_scan_cycle", "uint32",
+                              compare_get_expired_scan_cycle,
+                              compare_set_expired_scan_cycle, NULL, NULL);
+
+    object_class_property_add(oc, "max_queue_size", "uint32",
+                              get_max_queue_size,
+                              set_max_queue_size, NULL, NULL);
+
+    object_class_property_add_bool(oc, "vnet_hdr_support", compare_get_vnet_hdr,
+                                   compare_set_vnet_hdr);
+
     ucc->complete = colo_compare_complete;
 }
 
@@ -1382,35 +1411,7 @@ static void colo_compare_init(Object *obj)
 {
     CompareState *s = COLO_COMPARE(obj);
 
-    object_property_add_str(obj, "primary_in",
-                            compare_get_pri_indev, compare_set_pri_indev);
-    object_property_add_str(obj, "secondary_in",
-                            compare_get_sec_indev, compare_set_sec_indev);
-    object_property_add_str(obj, "outdev",
-                            compare_get_outdev, compare_set_outdev);
-    object_property_add_link(obj, "iothread", TYPE_IOTHREAD,
-                            (Object **)&s->iothread,
-                            object_property_allow_set_link,
-                            OBJ_PROP_LINK_STRONG);
-    /* This parameter just for Xen COLO */
-    object_property_add_str(obj, "notify_dev",
-                            compare_get_notify_dev, compare_set_notify_dev);
-
-    object_property_add(obj, "compare_timeout", "uint32",
-                        compare_get_timeout,
-                        compare_set_timeout, NULL, NULL);
-
-    object_property_add(obj, "expired_scan_cycle", "uint32",
-                        compare_get_expired_scan_cycle,
-                        compare_set_expired_scan_cycle, NULL, NULL);
-
-    object_property_add(obj, "max_queue_size", "uint32",
-                        get_max_queue_size,
-                        set_max_queue_size, NULL, NULL);
-
     s->vnet_hdr = false;
-    object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
-                             compare_set_vnet_hdr);
 }
 
 static void colo_compare_finalize(Object *obj)
-- 
2.28.0


