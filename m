Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151663E9CDF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 05:23:31 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE1JZ-000193-Ea
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 23:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1mDzg6-0007U2-De
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 21:38:38 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:34690
 helo=mellanox.co.il) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yajunw@nvidia.com>) id 1mDzg3-00071N-Cw
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 21:38:38 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from
 yajunw@nvidia.com) with SMTP; 12 Aug 2021 04:38:31 +0300
Received: from gen-l-vrt-294.mtl.labs.mlnx. (gen-l-vrt-294.mtl.labs.mlnx
 [10.237.7.1])
 by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 17C1cVL1016940;
 Thu, 12 Aug 2021 04:38:31 +0300
To: qemu-devel@nongnu.org, mst@redhat.com
Cc: Yajun Wu <yajunw@nvidia.com>
Subject: [PATCH] hw/virtio: Fix leak of host-notifier memory-region
Date: Thu, 12 Aug 2021 04:37:26 +0300
Message-Id: <1628732246-34765-1-git-send-email-yajunw@nvidia.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: pass client-ip=193.47.165.129; envelope-from=yajunw@nvidia.com;
 helo=mellanox.co.il
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Aug 2021 23:22:39 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Yajun Wu <yajunw@nvidia.com>
From:  Yajun Wu via <qemu-devel@nongnu.org>

If call virtio_queue_set_host_notifier_mr fails, should free
host-notifier memory-region.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
---
 hw/virtio/vhost-user.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index aec6cc1..3ae5297 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1474,6 +1474,7 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
+        object_unparent(OBJECT(&n->mr));
         munmap(addr, page_size);
         return -1;
     }
-- 
1.8.3.1


