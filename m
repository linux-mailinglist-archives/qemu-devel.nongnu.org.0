Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CE41CA2C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:33:10 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcW5-0002CV-91
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVcOF-00085J-VV
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:25:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mVcOE-00082T-3w
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:25:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632932700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1us62Ecx6MKJ9XWYlMG8Ik/3GR9FxwrYw6887eI2h74=;
 b=ebR65Z7Bmx6jE87ERi40TaWhUav+jV6sShvOtjcZtkNXpShR9/lDMfTt/ALBicXO4LmuIY
 ey+oSvkVdFchj3bc3SpByYmBT7H0FWreekqlylR4D6UWT8haAR7+Ir5Eqm/QdQqHewqRDv
 AehSaXWm+oSIqTQGION8lSJJRy0roEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-dZIIx9fiOKClKQpsP2rZFw-1; Wed, 29 Sep 2021 12:24:54 -0400
X-MC-Unique: dZIIx9fiOKClKQpsP2rZFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B277A40C1
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 16:24:53 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38E4A19C59;
 Wed, 29 Sep 2021 16:24:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] qapi: Include qom-path in MEMORY_DEVICE_SIZE_CHANGE
 qapi events
Date: Wed, 29 Sep 2021 18:24:44 +0200
Message-Id: <20210929162445.64060-3-david@redhat.com>
In-Reply-To: <20210929162445.64060-1-david@redhat.com>
References: <20210929162445.64060-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

As we might not always have a device id, it is impossible to always
match MEMORY_DEVICE_SIZE_CHANGE events to an actual device. Let's
include the qom-path in the event, which allows for reliable mapping of
events to devices.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem-pci.c | 5 ++++-
 qapi/machine.json          | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index 7e384b7397..be2383b0c5 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -87,9 +87,12 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
     VirtIOMEMPCI *pci_mem = container_of(notifier, VirtIOMEMPCI,
                                          size_change_notifier);
     DeviceState *dev = DEVICE(pci_mem);
+    char *qom_path = object_get_canonical_path(OBJECT(dev));
     const uint64_t * const size_p = data;
 
-    qapi_event_send_memory_device_size_change(!!dev->id, dev->id, *size_p);
+    qapi_event_send_memory_device_size_change(!!dev->id, dev->id, *size_p,
+                                              qom_path);
+    g_free(qom_path);
 }
 
 static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
diff --git a/qapi/machine.json b/qapi/machine.json
index 32d47f4e35..8258b9ce3a 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1279,8 +1279,11 @@
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
@@ -1293,7 +1296,7 @@
 #
 ##
 { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
-  'data': { '*id': 'str', 'size': 'size' } }
+  'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
 
 
 ##
-- 
2.31.1


