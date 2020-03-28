Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3B21962AB
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 01:42:49 +0100 (CET)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHzYn-0003qV-2i
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 20:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHzXp-0002s5-EW
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:41:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHzXo-0003QP-Fg
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:41:49 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60100 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHzXo-0003JF-4v
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 20:41:48 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 81D9DE7336605BBEBF04;
 Sat, 28 Mar 2020 08:41:45 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Sat, 28 Mar 2020 08:41:36 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 2/2] virtio-iommu: avoid memleak in the unrealize
Date: Sat, 28 Mar 2020 08:57:05 +0800
Message-ID: <20200328005705.29898-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200328005705.29898-1-pannengyuan@huawei.com>
References: <20200328005705.29898-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: zhang.zhanghailiang@huawei.com, mst@redhat.com,
 Pan Nengyuan <pannengyuan@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

req_vq/event_vq forgot to free in unrealize. Fix that.
And also do clean 's->as_by_busptr' hash table in unrealize to fix another leak.

Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Acked-by: Eric Auger <eric.auger@redhat.com>
---
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
v3->v1/v2:
- Also clean 's->as_by_busptr' hash table in unrealize.(Suggested by Stefano Garzarella)
v4->v3:
- update subject msg and move g_hash_table_destroy to the beginning of unrealize.
---
 hw/virtio/virtio-iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cee8083bc..22ba8848c2 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -693,9 +693,12 @@ static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(dev);
 
+    g_hash_table_destroy(s->as_by_busptr);
     g_tree_destroy(s->domains);
     g_tree_destroy(s->endpoints);
 
+    virtio_delete_queue(s->req_vq);
+    virtio_delete_queue(s->event_vq);
     virtio_cleanup(vdev);
 }
 
-- 
2.18.2


