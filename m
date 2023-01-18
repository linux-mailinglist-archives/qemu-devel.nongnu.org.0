Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A496728B4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 20:49:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIEPT-0002eE-3e; Wed, 18 Jan 2023 14:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPR-0002cr-7i
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pIEPP-0000oN-Io
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 14:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674071262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jdbac7bWn14KYSrw8J1g3C+Lqe+SUOl94VtmVjU9v28=;
 b=MzwmtCsMuiPnTaLL0TIZZqK9GaqDBHpeKgSvOux7p7PD5lck53WMuR6Bdvwe8uqcH8+3UL
 4M7jaUOFilxE+gViz7m7fiASM+oyfziEEH5RWU3EKSA0vz9kNfKC4/+m23ntLvOkd+43Xw
 u5dQf8ffJIKPVC4uJiUQERcbDBwNT70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-Id5nqg6sM7uOvlY9V7-B4A-1; Wed, 18 Jan 2023 14:47:39 -0500
X-MC-Unique: Id5nqg6sM7uOvlY9V7-B4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0365183B3C6;
 Wed, 18 Jan 2023 19:47:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65BCB40C2064;
 Wed, 18 Jan 2023 19:47:38 +0000 (UTC)
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
Subject: [RFC 2/3] qdev: add IOThreadVirtQueueMappingList property type
Date: Wed, 18 Jan 2023 14:47:31 -0500
Message-Id: <20230118194732.1258208-3-stefanha@redhat.com>
In-Reply-To: <20230118194732.1258208-1-stefanha@redhat.com>
References: <20230118194732.1258208-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

virtio-blk and virtio-scsi devices will need a way to specify the
mapping between IOThreads and virtqueues. At the moment all virtqueues
are assigned to a single IOThread or the main loop. This single thread
can be a CPU bottleneck, so it is necessary to allow finer-grained
assignment to spread the load.

Introduce DEFINE_PROP_IOTHREAD_VQ_MAPPING_LIST() so devices can take a
parameter that maps virtqueues to IOThreads. The command-line syntax for
this new property is as follows:

  --device '{"driver":"foo","iothread-vq-mapping":[{"iothread":"iothread0","vqs":[0,1,2]},...]}'

IOThreads are specified by name and virtqueues are specified by 0-based
index.

It will be common to simply assign virtqueues round-robin across a set
of IOThreads. A convenient syntax that does not require specifying
individual virtqueue indices is available:

  --device '{"driver":"foo","iothread-vq-mapping":[{"iothread":"iothread0"},{"iothread":"iothread1"},...]}'

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/virtio.json                    | 30 ++++++++++++++++++
 include/hw/qdev-properties-system.h |  4 +++
 hw/core/qdev-properties-system.c    | 47 +++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index 019d2d1987..f8006bdf3e 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -952,3 +952,33 @@
   'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
   'returns': 'VirtioQueueElement',
   'features': [ 'unstable' ] }
+
+##
+# @IOThreadVirtQueueMapping:
+#
+# Describes the subset of virtqueues assigned to an IOThread.
+#
+# @iothread: the id of IOThread object
+# @vqs: an optional array of virtqueue indices that will be handled by this
+#       IOThread. When absent, virtqueues are assigned round-robin across all
+#       IOThreadVirtQueueMappings provided. Either all
+#       IOThreadVirtQueueMappings must have @vqs or none of them must have it.
+#
+# Since: 8.0
+#
+##
+
+{ 'struct': 'IOThreadVirtQueueMapping',
+  'data': { 'iothread': 'str', '*vqs': ['uint16'] } }
+
+##
+# @IOThreadVirtQueueMappings:
+#
+# IOThreadVirtQueueMapping list. This struct is not actually used but the
+# IOThreadVirtQueueMappingList type it generates is!
+#
+# Since: 8.0
+##
+
+{ 'struct': 'IOThreadVirtQueueMappings',
+  'data': { 'mappings': ['IOThreadVirtQueueMapping'] } }
diff --git a/include/hw/qdev-properties-system.h b/include/hw/qdev-properties-system.h
index 0ac327ae60..c526e502c8 100644
--- a/include/hw/qdev-properties-system.h
+++ b/include/hw/qdev-properties-system.h
@@ -22,6 +22,7 @@ extern const PropertyInfo qdev_prop_audiodev;
 extern const PropertyInfo qdev_prop_off_auto_pcibar;
 extern const PropertyInfo qdev_prop_pcie_link_speed;
 extern const PropertyInfo qdev_prop_pcie_link_width;
+extern const PropertyInfo qdev_prop_iothread_vq_mapping_list;
 
 #define DEFINE_PROP_PCI_DEVFN(_n, _s, _f, _d)                   \
     DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_pci_devfn, int32_t)
@@ -73,5 +74,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
 #define DEFINE_PROP_UUID_NODEFAULT(_name, _state, _field) \
     DEFINE_PROP(_name, _state, _field, qdev_prop_uuid, QemuUUID)
 
+#define DEFINE_PROP_IOTHREAD_VQ_MAPPING_LIST(_name, _state, _field) \
+    DEFINE_PROP(_name, _state, _field, qdev_prop_iothread_vq_mapping_list, \
+                IOThreadVirtQueueMappingList *)
 
 #endif
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 54a09fa9ac..9b41628d94 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -18,6 +18,7 @@
 #include "qapi/qapi-types-block.h"
 #include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-types-migration.h"
+#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/ctype.h"
 #include "qemu/cutils.h"
@@ -1117,3 +1118,49 @@ const PropertyInfo qdev_prop_uuid = {
     .set   = set_uuid,
     .set_default_value = set_default_uuid_auto,
 };
+
+/* --- IOThreadVirtQueueMappingList --- */
+
+static void get_iothread_vq_mapping_list(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+    IOThreadVirtQueueMappingList **prop_ptr =
+        object_field_prop_ptr(obj, opaque);
+    IOThreadVirtQueueMappingList *list = *prop_ptr;
+
+    visit_type_IOThreadVirtQueueMappingList(v, name, &list, errp);
+}
+
+static void set_iothread_vq_mapping_list(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+    IOThreadVirtQueueMappingList **prop_ptr =
+        object_field_prop_ptr(obj, opaque);
+    IOThreadVirtQueueMappingList *list;
+
+    if (!visit_type_IOThreadVirtQueueMappingList(v, name, &list, errp)) {
+        return;
+    }
+
+    qapi_free_IOThreadVirtQueueMappingList(*prop_ptr);
+    *prop_ptr = list;
+}
+
+static void release_iothread_vq_mapping_list(Object *obj,
+        const char *name, void *opaque)
+{
+    IOThreadVirtQueueMappingList **prop_ptr =
+        object_field_prop_ptr(obj, opaque);
+
+    qapi_free_IOThreadVirtQueueMappingList(*prop_ptr);
+    *prop_ptr = NULL;
+}
+
+const PropertyInfo qdev_prop_iothread_vq_mapping_list = {
+    .name = "IOThreadVirtQueueMappingList",
+    .description = "IOThread virtqueue mapping list [{\"iothread\":\"<id>\", "
+                   "\"vqs\":[1,2,3,...]},...]",
+    .get = get_iothread_vq_mapping_list,
+    .set = set_iothread_vq_mapping_list,
+    .release = release_iothread_vq_mapping_list,
+};
-- 
2.39.0


