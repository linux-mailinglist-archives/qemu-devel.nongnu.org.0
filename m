Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54122195448
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 10:43:03 +0100 (CET)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHlW2-0007Ig-EL
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 05:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58535)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHlUY-0005X9-Tp
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHlUX-0000qf-T4
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:30 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:59668 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHlUX-0000d6-Hz
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:41:29 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 96FE8DFD26E2943A1E05;
 Fri, 27 Mar 2020 17:41:27 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 17:41:18 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 2/2] virtio-iommu: delete vqs in unrealize to fix memleak
Date: Fri, 27 Mar 2020 17:56:42 +0800
Message-ID: <20200327095642.18424-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200327095642.18424-1-pannengyuan@huawei.com>
References: <20200327095642.18424-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: Eric Auger <eric.auger@redhat.com>, euler.robot@huawei.com,
 Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

req_vq/event_vq forgot to free in unrealize. Fix that.
And aslo do clean 's->as_by_busptr' hash table in unrealize to fix another leak.

Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
---
Cc: Eric Auger <eric.auger@redhat.com>
---
v3->v1/v2:
- Aslo clean 's->as_by_busptr' hash table in unrealize.(Suggested by Stefano Garzarella)
---
 hw/virtio/virtio-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cee8083bc..694698fa0f 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -696,7 +696,10 @@ static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
     g_tree_destroy(s->domains);
     g_tree_destroy(s->endpoints);
 
+    virtio_delete_queue(s->req_vq);
+    virtio_delete_queue(s->event_vq);
     virtio_cleanup(vdev);
+    g_hash_table_destroy(s->as_by_busptr);
 }
 
 static void virtio_iommu_device_reset(VirtIODevice *vdev)
-- 
2.18.2


