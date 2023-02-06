Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F868B471
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 04:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOs4J-0002vF-Ld; Sun, 05 Feb 2023 22:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pOs4G-0002ur-O3
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:21:20 -0500
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pOs4E-000693-HP
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 22:21:20 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0Vawboys_1675653665; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vawboys_1675653665) by smtp.aliyun-inc.com;
 Mon, 06 Feb 2023 11:21:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 0/2] virtio: fix for assertion failure:
 virtio_net_get_subqueue(nc)->async_tx.elem failed
Date: Mon,  6 Feb 2023 11:21:03 +0800
Message-Id: <20230206032105.35831-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
X-Git-Hash: 761767cc32
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In the current design, we stop the device from operating on the vring
during per-queue reset by resetting the structure VirtQueue.

But before the reset operation, when recycling some resources, we should
stop referencing new vring resources.

This bug is caused by this reason.

    https://gitlab.com/qemu-project/qemu/-/issues/1451

Before we reset the structure, we called the ->queue_reset callback to let the
device reclaim resources. Here virtio-net tries to release the packets sent
asynchronously, but during this process virtio_net_flush_tx() will be called,
and new data will be sent again. This leads to asserted.

     assert(!virtio_net_get_subqueue(nc)->async_tx.elem);

v2:
    1. fix by stop flush inside virtio_net_tx_complete() when purge packets.

v1:
    1. rename "reset" to disabled_by_reset
    2. add api: virtio_queue_reset_state()

Xuan Zhuo (2):
  virtio_net: virtio_net_tx_complete() stop flush new packets for purge
    operation
  virtio_net: just purge tx when dev/queue reset

 hw/net/virtio-net.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

--
2.32.0.3.g01195cf9f


