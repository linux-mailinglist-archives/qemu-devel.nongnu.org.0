Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28725A0BCA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:44:59 +0200 (CEST)
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8Tt-0004C3-RX
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR7vf-0006MO-W2
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:09:32 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:41733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oR7vL-0004gb-Fi
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:09:15 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R941e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VNCYVJg_1661414938; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VNCYVJg_1661414938) by smtp.aliyun-inc.com;
 Thu, 25 Aug 2022 16:08:58 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
Subject: [PATCH v3 00/15] Support VIRTIO_F_RING_RESET for virtio-net,
 vhost-net kernel in virtio pci-modern
Date: Thu, 25 Aug 2022 16:08:43 +0800
Message-Id: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.132;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-132.freemail.mail.aliyun.com
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

The virtio queue reset function has already been defined in the virtio spec 1.2.
The relevant virtio spec information is here:

    https://github.com/oasis-tcs/virtio-spec/issues/124
    https://github.com/oasis-tcs/virtio-spec/issues/139

This patch set is to support this function in QEMU. It consists of several parts:
1. Patches 1-7 are the basic interfaces for vq reset in virtio and virtio-pci.
2. Patches 8-11 support vq reset and vq restart for vhost-kernel.
3. Patches 12-14 support vq reset and vq restart for virtio-net.
5. Patch 15 enables the vq reset feature for vhost-kernel.

The process of virtqueue reset can be concluded as:
1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
2. Then the virtqueue can be optionally restarted(re-enabled).

Since this patch set involves multiple modules and seems a bit messy, we briefly describe the
calling process for different modes below.
virtio-net:
1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
    -> virtio_queue_reset() [virtio]
        -> virtio_net_queue_reset() [virtio-net]
        -> __virtio_queue_reset()
2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
    -> set enabled, reset status of vq.

vhost-kernel:
1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
    -> virtio_queue_reset() [virtio]
        -> virtio_net_queue_reset() [virtio-net]
            -> vhost_net_virtqueue_stop() [vhost-net]
                -> vhost_net_set_backend() [vhost]
                -> vhost_virtqueue_unmap()
        -> __virtio_queue_reset()
2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
    -> virtio_queue_enable() [virtio]
        -> virtio_net_queue_enable() [virtio-net]
            -> vhost_net_virtqueue_restart() [vhost-net]
                -> vhost_virtqueue_start() [vhost]
                -> vhost_net_set_backend()
    -> set enabled, reset status of vq.


Test environment and method:
    Host: 5.19.0-rc3 (With vq reset support)
    Qemu: QEMU emulator version 7.0.50
    Guest: 5.19.0-rc3 (With vq reset support)
    Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g eth1;

    The drvier can resize the virtio queue, then virtio queue reset function should
    be triggered.

    The default is split mode, modify Qemu virtio-net to add PACKED feature to 
    test packed mode.

Guest Kernel Patch:
    https://lore.kernel.org/bpf/20220801063902.129329-1-xuanzhuo@linux.alibaba.com/

Host Kernel Patch:
    https://github.com/middaywords/linux/commit/a845098f0df6b8bdf7e1e5db57af6ebd1c8eaf47

Looking forward to your review and comments. Thanks.

changelog:
v3:
  1. Remove support for vhost-user in this series and refactor the code.
  2. Rename 'vhost_net_virtqueue_stop' to 'vhost_net_virtqueue_reset'.
  3. Make PCI transport ready before device ready when queue_enabled is set to true.
  3. Add some comments.

v2:
  1. Add support for vhost-net kernel scenario.
  2. Add a new vhost-user message VHOST_USER_RESET_VRING.
  3. Add migration compatibility for virtqueue reset.

Kangjie Xu (10):
  virtio: introduce virtio_queue_enable()
  virtio: core: vq reset feature negotation support
  virtio-pci: support queue enable
  vhost: extract the logic of unmapping the vrings and desc
  vhost: expose vhost_virtqueue_start()
  vhost-net: vhost-kernel: introduce vhost_net_virtqueue_reset()
  vhost-net: vhost-kernel: introduce vhost_net_virtqueue_restart()
  virtio-net: introduce flush_or_purge_queued_packets()
  virtio-net: support queue_enable
  vhost: vhost-kernel: enable vq reset feature

Xuan Zhuo (5):
  virtio: sync relevant definitions with linux
  virtio: introduce __virtio_queue_reset()
  virtio: introduce virtio_queue_reset()
  virtio-pci: support queue reset
  virtio-net: support queue reset

 hw/core/machine.c                             |  1 +
 hw/net/vhost_net.c                            | 75 +++++++++++++++++++
 hw/net/virtio-net.c                           | 56 ++++++++++++--
 hw/virtio/vhost.c                             | 28 ++++---
 hw/virtio/virtio-pci.c                        | 16 ++++
 hw/virtio/virtio.c                            | 62 +++++++++++----
 include/hw/virtio/vhost.h                     |  5 ++
 include/hw/virtio/virtio-pci.h                |  5 ++
 include/hw/virtio/virtio.h                    |  8 +-
 include/net/vhost_net.h                       |  4 +
 .../standard-headers/linux/virtio_config.h    |  5 ++
 include/standard-headers/linux/virtio_pci.h   |  2 +
 12 files changed, 234 insertions(+), 33 deletions(-)

-- 
2.32.0


