Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424D3215C6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:08:15 +0100 (CET)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEA0c-0007He-Ds
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9sg-0000xA-2A
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:00:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lE9sd-0001uP-SQ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 07:00:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613995199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFA42tresfvNuT4zr2Dtt7dL+z+012IfjADyVZJTHOI=;
 b=FiPI2D+RxHmNXlBnCPFANC8/X5GigQ3a7OLWGOFbvClXcp0Yg9+/+dt/ju3RXVBKBOITih
 ohB8OaA4BbQLHkd7wZNO3kO7xAsAGDzRzQH7uqpjzlXdHJr4RLkokNEt9t1ghPIJfl+cDB
 4Uf3dFH2BQXtUO1kcGf6OdCuoJiJkkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-IT-_QZWDO0G_qmVsXODE2g-1; Mon, 22 Feb 2021 06:59:57 -0500
X-MC-Unique: IT-_QZWDO0G_qmVsXODE2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CD791008303;
 Mon, 22 Feb 2021 11:59:56 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82C2119C45;
 Mon, 22 Feb 2021 11:59:41 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/12] vfio: Disable only uncoordinated discards for
 VFIO_TYPE1 iommus
Date: Mon, 22 Feb 2021 12:57:08 +0100
Message-Id: <20210222115708.7623-13-david@redhat.com>
In-Reply-To: <20210222115708.7623-1-david@redhat.com>
References: <20210222115708.7623-1-david@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We support coordinated discarding of RAM using the RamDiscardMgr for
the VFIO_TYPE1 iommus. Let's unlock support for coordinated discards,
keeping uncoordinated discards (e.g., via virtio-balloon) disabled if
possible.

This unlocks virtio-mem + vfio on x86-64. Note that vfio used via "nvme://"
by the block layer has to be implemented/unlocked separately. For now,
virtio-mem only supports x86-64; we don't restrict RamDiscardMgr to x86-64,
though: arm64 and s390x are supposed to work as well, and we'll test
once unlocking virtio-mem support. The spapr IOMMUs will need special
care, to be tackled later, e.g.., once supporting virtio-mem.

Note: The block size of a virtio-mem device has to be set to sane sizes,
depending on the maximum hotplug size - to not run out of vfio mappings.
The default virtio-mem block size is usually in the range of a couple of
MBs. The maximum number of mapping is 64k, shared with other users.
Assume you want to hotplug 256GB using virtio-mem - the block size would
have to be set to at least 8 MiB (resulting in 32768 separate mappings).

Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/vfio/common.c | 63 +++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 12 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 15ecd05a4b..d879b8ab92 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -135,6 +135,27 @@ static const char *index_to_str(VFIODevice *vbasedev, int index)
     }
 }
 
+static int vfio_ram_block_discard_disable(VFIOContainer *container, bool state)
+{
+    switch (container->iommu_type) {
+    case VFIO_TYPE1v2_IOMMU:
+    case VFIO_TYPE1_IOMMU:
+        /* We support coordinated discarding of RAM via the RamDiscardMgr. */
+        return ram_block_uncoordinated_discard_disable(state);
+    default:
+        /*
+         * VFIO_SPAPR_TCE_IOMMU most probably works just fine with
+         * RamDiscardMgr, however, it is completely untested.
+         *
+         * VFIO_SPAPR_TCE_v2_IOMMU with "DMA memory preregistering" does
+         * completely the opposite of managing mapping/pinning dynamically as
+         * required by RamDiscardMgr. We would have to special-case sections
+         * with a RamDiscardMgr.
+         */
+        return ram_block_discard_disable(state);
+    }
+}
+
 int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
                            int action, int fd, Error **errp)
 {
@@ -1979,15 +2000,25 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
      * new memory, it will not yet set ram_block_discard_set_required() and
      * therefore, neither stops us here or deals with the sudden memory
      * consumption of inflated memory.
+     *
+     * We do support discarding of memory coordinated via the RamDiscardMgr
+     * with some IOMMU types. vfio_ram_block_discard_disable() handles the
+     * details once we know which type of IOMMU we are using.
      */
-    ret = ram_block_discard_disable(true);
-    if (ret) {
-        error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
-        return ret;
-    }
 
     QLIST_FOREACH(container, &space->containers, next) {
         if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
+            ret = vfio_ram_block_discard_disable(container, true);
+            if (ret) {
+                error_setg_errno(errp, -ret,
+                                 "Cannot set discarding of RAM broken");
+                if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER,
+                          &container->fd)) {
+                    error_report("vfio: error disconnecting group %d from"
+                                 " container", group->groupid);
+                }
+                return ret;
+            }
             group->container = container;
             QLIST_INSERT_HEAD(&container->group_list, group, container_next);
             vfio_kvm_device_add_group(group);
@@ -2025,6 +2056,12 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         goto free_container_exit;
     }
 
+    ret = vfio_ram_block_discard_disable(container, true);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
+        goto free_container_exit;
+    }
+
     switch (container->iommu_type) {
     case VFIO_TYPE1v2_IOMMU:
     case VFIO_TYPE1_IOMMU:
@@ -2072,7 +2109,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
             if (ret) {
                 error_setg_errno(errp, errno, "failed to enable container");
                 ret = -errno;
-                goto free_container_exit;
+                goto enable_discards_exit;
             }
         } else {
             container->prereg_listener = vfio_prereg_listener;
@@ -2084,7 +2121,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                 ret = -1;
                 error_propagate_prepend(errp, container->error,
                     "RAM memory listener initialization failed: ");
-                goto free_container_exit;
+                goto enable_discards_exit;
             }
         }
 
@@ -2097,7 +2134,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
             if (v2) {
                 memory_listener_unregister(&container->prereg_listener);
             }
-            goto free_container_exit;
+            goto enable_discards_exit;
         }
 
         if (v2) {
@@ -2112,7 +2149,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
             if (ret) {
                 error_setg_errno(errp, -ret,
                                  "failed to remove existing window");
-                goto free_container_exit;
+                goto enable_discards_exit;
             }
         } else {
             /* The default table uses 4K pages */
@@ -2153,6 +2190,9 @@ listener_release_exit:
     vfio_kvm_device_del_group(group);
     vfio_listener_release(container);
 
+enable_discards_exit:
+    vfio_ram_block_discard_disable(container, false);
+
 free_container_exit:
     g_free(container);
 
@@ -2160,7 +2200,6 @@ close_fd_exit:
     close(fd);
 
 put_space_exit:
-    ram_block_discard_disable(false);
     vfio_put_address_space(space);
 
     return ret;
@@ -2282,7 +2321,7 @@ void vfio_put_group(VFIOGroup *group)
     }
 
     if (!group->ram_block_discard_allowed) {
-        ram_block_discard_disable(false);
+        vfio_ram_block_discard_disable(group->container, false);
     }
     vfio_kvm_device_del_group(group);
     vfio_disconnect_container(group);
@@ -2336,7 +2375,7 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 
         if (!group->ram_block_discard_allowed) {
             group->ram_block_discard_allowed = true;
-            ram_block_discard_disable(false);
+            vfio_ram_block_discard_disable(group->container, false);
         }
     }
 
-- 
2.29.2


