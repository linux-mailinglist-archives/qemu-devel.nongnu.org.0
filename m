Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C197D2DC25B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 15:38:59 +0100 (CET)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpXxC-0004SU-R3
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 09:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kpXZ5-0002rq-Ui
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:14:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1kpXZ3-000777-4I
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 09:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608128040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vcu+ud6Jx88YTX9bP9X6wUv3DhVLS/+Y302WetMxVDk=;
 b=VXyTzp5EZSqFHYzu2XW624GyQKS6oZUzMTVd9yI8gzG/YddYL83eHsGCGCeJOl0hZCasSF
 r1PmXWA2wEfrqKAzd1g6D5Tk/WizZC/7zSlUVDRsytTOjiDu1bUEcWzBNPPD5fylWM7AjU
 oaCGvzf4SV2KvCcWSIazCvHESlK8BuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-B5hs7VbqMCG_clmvo5X--Q-1; Wed, 16 Dec 2020 09:13:59 -0500
X-MC-Unique: B5hs7VbqMCG_clmvo5X--Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BCC11927801;
 Wed, 16 Dec 2020 14:13:57 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFDF160C15;
 Wed, 16 Dec 2020 14:13:54 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/10] vfio: Disable only uncoordinated discards
Date: Wed, 16 Dec 2020 15:12:00 +0100
Message-Id: <20201216141200.118742-11-david@redhat.com>
In-Reply-To: <20201216141200.118742-1-david@redhat.com>
References: <20201216141200.118742-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Marek Kedzierski <mkedzier@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We support coordinated discarding of RAM using the RamDiscardMgr. Let's
unlock support for coordinated discards, keeping uncoordinated discards
(e.g., via virtio-balloon) disabled.

This unlocks virtio-mem + vfio. Note that vfio used via "nvme://" by the
block layer has to be implemented/unlocked separately. For now,
virtio-mem only supports x86-64 - spapr IOMMUs are not tested/affected.

Note: The block size of a virtio-mem device has to be set to sane sizes,
depending on the maximum hotplug size - to not run out of vfio mappings.
The default virtio-mem block size is usually in the range of a couple of
MBs. The maximum number of mapping is 64k, shared with other users.
Assume you want to hotplug 256GB using virtio-mem - the block size would
have to be set to at least 8 MiB (resulting in 32768 separate mappings).

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
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
 hw/vfio/common.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 57c83a2f14..3ce5e26bab 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1974,8 +1974,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
      * new memory, it will not yet set ram_block_discard_set_required() and
      * therefore, neither stops us here or deals with the sudden memory
      * consumption of inflated memory.
+     *
+     * We do support discarding of memory coordinated via the RamDiscardMgr.
      */
-    ret = ram_block_discard_disable(true);
+    ret = ram_block_uncoordinated_discard_disable(true);
     if (ret) {
         error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
         return ret;
@@ -2155,7 +2157,7 @@ close_fd_exit:
     close(fd);
 
 put_space_exit:
-    ram_block_discard_disable(false);
+    ram_block_uncoordinated_discard_disable(false);
     vfio_put_address_space(space);
 
     return ret;
@@ -2277,7 +2279,7 @@ void vfio_put_group(VFIOGroup *group)
     }
 
     if (!group->ram_block_discard_allowed) {
-        ram_block_discard_disable(false);
+        ram_block_uncoordinated_discard_disable(false);
     }
     vfio_kvm_device_del_group(group);
     vfio_disconnect_container(group);
@@ -2331,7 +2333,7 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 
         if (!group->ram_block_discard_allowed) {
             group->ram_block_discard_allowed = true;
-            ram_block_discard_disable(false);
+            ram_block_uncoordinated_discard_disable(false);
         }
     }
 
-- 
2.29.2


