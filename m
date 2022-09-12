Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E335B52CD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 05:14:21 +0200 (CEST)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXZts-00042T-3V
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 23:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXZqk-0006Tp-J3
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 23:11:06 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:45323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oXZqd-0007IF-O8
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 23:11:02 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VPNIbu0_1662952249; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VPNIbu0_1662952249) by smtp.aliyun-inc.com;
 Mon, 12 Sep 2022 11:10:50 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, arei.gonglei@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v2 0/6] Support VIRTIO_F_RING_RESET for vhost-user in virtio
 pci-modern
Date: Mon, 12 Sep 2022 11:10:43 +0800
Message-Id: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.42;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-42.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set is based on the patch set that supports VIRTIO_F_RING_RESET for vhost-kernel:
    https://lore.kernel.org/qemu-devel/cover.1662916759.git.kangjie.xu@linux.alibaba.com/

The virtio queue reset function has already been defined in the virtio spec 1.2.
The relevant virtio spec information is here:
    https://github.com/oasis-tcs/virtio-spec/issues/124
    https://github.com/oasis-tcs/virtio-spec/issues/139

The process of virtqueue reset can be concluded as:
1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
2. Then the virtqueue can be optionally restarted(re-enabled).

The detailed process is listed below:
1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
    -> virtio_queue_reset() [virtio]
        -> virtio_net_queue_reset() [virtio-net]
            -> vhost_net_virtqueue_reset() [vhost-net]
                -> vhost_virtqueue_stop()
        -> __virtio_queue_reset()
2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
    -> virtio_queue_enable() [virtio]
        -> virtio_net_queue_enable() [virtio-net]
            -> vhost_net_virtqueue_restart() [vhost-net]
                -> vhost_virtqueue_start()
                -> vhost_user_set_vring_enable [vhost-user]
                    -> send VHOST_USER_SET_VRING_ENABLE to the device
    -> set enabled, reset status of vq.

changelog:
  1. Reuse the vhost_virtqueue_stop() when resetting a vq.

Test environment:
    Qemu: QEMU emulator version 7.1.50
    Guest: 5.19.0-rc3 (With vq reset support)
    DPDK: 22.11-rc0 (With vq reset support)
    Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g eth1;

    The drvier can resize the virtio queue, then virtio queue reset function should
    be triggered.

    The default is split mode, modify Qemu virtio-net to add PACKED feature to 
    test packed mode.

Guest Kernel Patch:
    https://lore.kernel.org/bpf/20220801063902.129329-1-xuanzhuo@linux.alibaba.com/

DPDK Patch:
    https://github.com/middaywords/dpdk/compare/72206323a5dd3182b13f61b25a64abdddfee595c...080d9d5a6bba8ff8dce5186e2c6cb35cabef77c9

Kangjie Xu (6):
  net: virtio: rename vhost_set_vring_enable to vhost_set_dev_enable
  vhost-user: add op to enable or disable a single vring
  vhost-net: vhost-user: update vhost_net_virtqueue_reset()
  vhost-net: vhost-user: update vhost_net_virtqueue_restart()
  virtio-net: vhost-user: update queue_reset and queue_enable
  vhost: vhost-user: enable vq reset feature

 backends/cryptodev-vhost.c        | 12 ++++++------
 hw/net/vhost_net-stub.c           |  2 +-
 hw/net/vhost_net.c                | 15 +++++++++++----
 hw/net/virtio-net.c               | 10 ++++++----
 hw/virtio/vhost-user.c            | 27 +++++++++++++++++++--------
 include/hw/virtio/vhost-backend.h |  5 ++++-
 include/net/vhost_net.h           |  2 +-
 7 files changed, 48 insertions(+), 25 deletions(-)

-- 
2.32.0


