Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9644D200
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 07:50:13 +0100 (CET)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml3uW-0003b1-4K
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 01:50:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml3js-0000sh-CU
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:39:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml3jq-0008Ft-N8
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 01:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636612750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kWSUrwZ7tiWatmlaYo9vEoa+Sde7ZP+BgfRnQ7YbszA=;
 b=bBF0Zwct+wLE7xh+GU/d7Uff/vGibSEJE1iWo/59t0+e0SjuosXAMpSckqGtYFTmoT1wr1
 chOKMNZJgDrJ93aH+ZIwxAGtJfKIbj0sd97+G+dSglFrOTbfKf24jpvIaA6w7s1OSg33j+
 WDyqWElZ+Qef+c8oq+ku5Gsi4TSlNR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-lXBynJnOPEGbsygkvOH4MA-1; Thu, 11 Nov 2021 01:39:07 -0500
X-MC-Unique: lXBynJnOPEGbsygkvOH4MA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A1015720;
 Thu, 11 Nov 2021 06:39:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-246.pek2.redhat.com
 [10.72.13.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927FE608BA;
 Thu, 11 Nov 2021 06:38:56 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Subject: [PATCH 1/2] virtio: use virtio accessor to access packed descriptor
 flags
Date: Thu, 11 Nov 2021 14:38:53 +0800
Message-Id: <20211111063854.29060-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: eperezma@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to access packed descriptor flags via
address_space_{write|read}_cached(). When we hit the cache, memcpy()
is used which is not an atomic operation which may lead a wrong value
is read or wrote.

So this patch switches to use virito_{stw|lduw}_phys_cached() to make
sure the aceess is atomic.

Fixes: 86044b24e865f ("virtio: basic packed virtqueue support")
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index cc69a9b881..939bcbfeb9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -507,11 +507,9 @@ static void vring_packed_desc_read_flags(VirtIODevice *vdev,
                                          MemoryRegionCache *cache,
                                          int i)
 {
-    address_space_read_cached(cache,
-                              i * sizeof(VRingPackedDesc) +
-                              offsetof(VRingPackedDesc, flags),
-                              flags, sizeof(*flags));
-    virtio_tswap16s(vdev, flags);
+    hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
+
+    *flags = virtio_lduw_phys_cached(vdev, cache, off);
 }
 
 static void vring_packed_desc_read(VirtIODevice *vdev,
@@ -564,8 +562,7 @@ static void vring_packed_desc_write_flags(VirtIODevice *vdev,
 {
     hwaddr off = i * sizeof(VRingPackedDesc) + offsetof(VRingPackedDesc, flags);
 
-    virtio_tswap16s(vdev, &desc->flags);
-    address_space_write_cached(cache, off, &desc->flags, sizeof(desc->flags));
+    virtio_stw_phys_cached(vdev, cache, off, desc->flags);
     address_space_cache_invalidate(cache, off, sizeof(desc->flags));
 }
 
-- 
2.25.1


