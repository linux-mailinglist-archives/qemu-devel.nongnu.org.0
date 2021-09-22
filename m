Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD14414A13
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:04:27 +0200 (CEST)
Received: from localhost ([::1]:32864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1vG-0007Nd-JQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT1ou-0003EA-0s
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mT1oi-0002A0-IN
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632315459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XmFCWLO1LyzDlx5FzRLyRbKONEj30nUSsJQTiZafeC8=;
 b=SUVfuf2PGsPJyv0ifFdBosmFFoHJuAwdc/Y5CxArVRoJSmr4BYkEqHd0ONdOzzo2fWp3BT
 zZRYIK0QopelQhhfK0MU0czfy4EGpYbZBRjfNTvzmjEw/lDOhc79MWvnOasZDO7V0y3oM9
 Jnp5k6Dze4IWdd4yV1YBgxq+ZO17Hys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-D1NQO96ION-1-5SdBdeCbA-1; Wed, 22 Sep 2021 08:57:38 -0400
X-MC-Unique: D1NQO96ION-1-5SdBdeCbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 661F010144FB
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:57:37 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46A935D9CA;
 Wed, 22 Sep 2021 12:57:35 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] monitor: Rate-limit MEMORY_DEVICE_SIZE_CHANGE qapi events
 per device
Date: Wed, 22 Sep 2021 14:57:34 +0200
Message-Id: <20210922125734.79712-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to rate-limit MEMORY_DEVICE_SIZE_CHANGE events per device,
otherwise we can lose some events for devices. As we might not always have
a device id, add the qom-path to the event and use that to rate-limit
per device.

This was noticed by starting a VM with two virtio-mem devices that each
have a requested size > 0. The Linux guest will initialize both devices
in parallel, resulting in losing MEMORY_DEVICE_SIZE_CHANGE events for
one of the devices.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Suggested-by: Markus Armbruster <armbru@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Follow up of:
    https://lkml.kernel.org/r/20210921102434.24273-1-david@redhat.com

v1 -> v2:
- Add the qom-path and use that identifier to rate-limit per device
- Rephrase subject/description

---
 hw/virtio/virtio-mem-pci.c | 3 ++-
 monitor/monitor.c          | 9 +++++++++
 qapi/machine.json          | 5 ++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index fa5395cd88..dd5085497f 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -87,6 +87,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
     VirtIOMEMPCI *pci_mem = container_of(notifier, VirtIOMEMPCI,
                                          size_change_notifier);
     DeviceState *dev = DEVICE(pci_mem);
+    const char * qom_path = object_get_canonical_path(OBJECT(dev));
     const uint64_t * const size_p = data;
     const char *id = NULL;
 
@@ -94,7 +95,7 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
         id = g_strdup(dev->id);
     }
 
-    qapi_event_send_memory_device_size_change(!!id, id, *size_p);
+    qapi_event_send_memory_device_size_change(!!id, id, *size_p, qom_path);
 }
 
 static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 46a171bca6..21c7a68758 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -474,6 +474,10 @@ static unsigned int qapi_event_throttle_hash(const void *key)
         hash += g_str_hash(qdict_get_str(evstate->data, "node-name"));
     }
 
+    if (evstate->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
+        hash += g_str_hash(qdict_get_str(evstate->data, "qom-path"));
+    }
+
     return hash;
 }
 
@@ -496,6 +500,11 @@ static gboolean qapi_event_throttle_equal(const void *a, const void *b)
                        qdict_get_str(evb->data, "node-name"));
     }
 
+    if (eva->event == QAPI_EVENT_MEMORY_DEVICE_SIZE_CHANGE) {
+        return !strcmp(qdict_get_str(eva->data, "qom-path"),
+                       qdict_get_str(evb->data, "qom-path"));
+    }
+
     return TRUE;
 }
 
diff --git a/qapi/machine.json b/qapi/machine.json
index 157712f006..2487c92f18 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1245,8 +1245,11 @@
 # action).
 #
 # @id: device's ID
+#
 # @size: the new size of memory that the device provides
 #
+# @qom-path: path to the device object in the QOM tree (since 6.2)
+#
 # Note: this event is rate-limited.
 #
 # Since: 5.1
@@ -1259,7 +1262,7 @@
 #
 ##
 { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
-  'data': { '*id': 'str', 'size': 'size' } }
+  'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
 
 
 ##
-- 
2.31.1


