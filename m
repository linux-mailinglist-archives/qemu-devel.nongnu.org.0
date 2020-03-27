Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5158B194FBE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 04:42:41 +0100 (CET)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHftI-0006Ew-Dn
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 23:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jHfsM-0005Mv-Ip
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jHfsL-0005fr-KW
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:42 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:36522 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jHfsL-0005YG-9S
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 23:41:41 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 021AEA07A1C5731FBE0B;
 Fri, 27 Mar 2020 11:41:37 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Mar 2020 11:41:26 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 2/2] virtio-iommu: delete vqs in unrealize to fix memleaks
Date: Fri, 27 Mar 2020 11:56:50 +0800
Message-ID: <20200327035650.2085-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200327035650.2085-1-pannengyuan@huawei.com>
References: <20200327035650.2085-1-pannengyuan@huawei.com>
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
Cc: Eric Auger <eric.auger@redhat.com>, euler.robot@huawei.com,
 Pan Nengyuan <pannengyuan@huawei.com>, zhang.zhanghailiang@huawei.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

req_vq/event_vq forgot to free in unrealize(). Fix that.

Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4cee8083bc..9d2ff0693c 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -696,6 +696,8 @@ static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
     g_tree_destroy(s->domains);
     g_tree_destroy(s->endpoints);
 
+    virtio_delete_queue(s->req_vq);
+    virtio_delete_queue(s->event_vq);
     virtio_cleanup(vdev);
 }
 
-- 
2.18.2


