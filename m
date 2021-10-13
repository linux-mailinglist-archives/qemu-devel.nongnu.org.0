Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC0242BD57
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:42:23 +0200 (CEST)
Received: from localhost ([::1]:34878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mabiI-0002eR-NO
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabed-0004AG-1s
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mabeb-00012c-1h
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 06:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634121512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G7w77GdrliKMKTab+xhACViP4y5ZTEa223HCQBn7oDw=;
 b=ctsTDAE+a8URbKnYKrRDIkEPg91T7S4nmwwfQLbGMMs7L3sLKOHSokn4Je25vB1fArPy6M
 FftwUJ/Qdaz2OIdmyzfmDUvZTUL+ewBGDj5tJm3GjVJJAxk1UGGhr3w/WT+nhiQ/mCM7oA
 INPeeZdE5JfWaKN2bj3j3kcULHDIGOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-0PNp_IzHPjO9VogSL7ZcPg-1; Wed, 13 Oct 2021 06:38:31 -0400
X-MC-Unique: 0PNp_IzHPjO9VogSL7ZcPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FD1E10A8E02;
 Wed, 13 Oct 2021 10:38:30 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CF6F5D9D5;
 Wed, 13 Oct 2021 10:37:48 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 09/15] vhost: Respect reserved memslots for memory devices
 when realizing a vhost device
Date: Wed, 13 Oct 2021 12:33:24 +0200
Message-Id: <20211013103330.26869-10-david@redhat.com>
In-Reply-To: <20211013103330.26869-1-david@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make sure that the current reservations can be fulfilled, otherwise we
might run out of memslots later when memory devices start actually using
the reserved memslots and crash.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/vhost.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 49a1074097..b3fa814393 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -23,6 +23,7 @@
 #include "standard-headers/linux/vhost_types.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio-access.h"
+#include "hw/mem/memory-device.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file-types.h"
 #include "sysemu/dma.h"
@@ -1319,7 +1320,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    Error **errp)
 {
     uint64_t features;
-    int i, r, n_initialized_vqs = 0;
+    int i, r, reserved_slots, n_initialized_vqs = 0;
 
     hdev->vdev = NULL;
     hdev->migration_blocker = NULL;
@@ -1415,9 +1416,11 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
     memory_listener_register(&hdev->memory_listener, &address_space_memory);
     QLIST_INSERT_HEAD(&vhost_devices, hdev, entry);
 
-    if (used_memslots > hdev->vhost_ops->vhost_backend_memslots_limit(hdev)) {
+    reserved_slots = memory_devices_get_reserved_memslots();
+    if (used_memslots + reserved_slots >
+        hdev->vhost_ops->vhost_backend_memslots_limit(hdev)) {
         error_setg(errp, "vhost backend memory slots limit is less"
-                   " than current number of present memory slots");
+                   " than current number of used and reserved memory slots");
         r = -EINVAL;
         goto fail_busyloop;
     }
-- 
2.31.1


