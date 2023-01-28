Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F467F57B
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 08:24:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLfY9-0003qx-FV; Sat, 28 Jan 2023 02:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLfY7-0003pe-FF
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 02:22:55 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1pLfY4-0000ko-Mi
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 02:22:55 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R841e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VaGyJEs_1674890244; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaGyJEs_1674890244) by smtp.aliyun-inc.com;
 Sat, 28 Jan 2023 15:17:25 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH 0/3] virtio: fix for assertion failure:
 virtio_net_get_subqueue(nc)->async_tx.elem failed
Date: Sat, 28 Jan 2023 15:17:21 +0800
Message-Id: <20230128071724.33677-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
X-Git-Hash: d28a204005
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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

This patch set introduce new item "reset" into struct VirtQueue, then device can
know this virtqueue is per-queue reset state.

Xuan Zhuo (3):
  virtio: move struct VirtQueue to include file
  virtio: struct VirtQueue introduce reset
  virtio-net: virtio_net_flush_tx() check for per-queue reset

 hw/net/virtio-net.c        |  2 +-
 hw/virtio/virtio.c         | 57 ++++++--------------------------------
 include/hw/virtio/virtio.h | 55 ++++++++++++++++++++++++++++++++++--
 3 files changed, 62 insertions(+), 52 deletions(-)

--
2.32.0.3.g01195cf9f


