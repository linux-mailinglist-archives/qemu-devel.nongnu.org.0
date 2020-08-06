Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08923D8C6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 11:38:29 +0200 (CEST)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3cM0-0006ml-Ib
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 05:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k3cKc-0005Am-6U; Thu, 06 Aug 2020 05:37:02 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41088 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k3cKa-0007WK-4P; Thu, 06 Aug 2020 05:37:01 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 47DD27A2981179D8D588;
 Thu,  6 Aug 2020 17:36:51 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Thu, 6 Aug 2020 17:36:45 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH 3/5] log: Add more details to virtio_report in virtqueue_pop
Date: Thu, 6 Aug 2020 17:37:18 +0800
Message-ID: <20200806093720.2355692-4-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200806093720.2355692-1-liangpeng10@huawei.com>
References: <20200806093720.2355692-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:36:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: Peng Liang <liangpeng10@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add virtio device name and virtqueue info to virtio_report in
virtqueue_pop so that we can find out which device's virtqueue is
broken.

Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 hw/virtio/virtio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index f3568f5267..6b35bed1d7 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1439,7 +1439,9 @@ static void *virtqueue_split_pop(VirtQueue *vq, size_t sz)
     max = vq->vring.num;
 
     if (vq->inuse >= vq->vring.num) {
-        virtio_error(vdev, "Virtqueue size exceeded");
+        virtio_error(vdev, "Virtio device %s vq->inuse=%d vq->vring.num=%d, "
+                     "virtqueue size exceeded",
+                     vdev->name, vq->inuse, vq->vring.num);
         goto done;
     }
 
-- 
2.18.4


