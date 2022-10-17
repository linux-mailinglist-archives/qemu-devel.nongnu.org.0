Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE9600B1A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:41:35 +0200 (CEST)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMcn-0004Sk-Qk
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMO4-0005ZV-3J
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:26:20 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1okMNv-0002ny-Ld
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:26:15 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VSMHd8a_1665998758; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VSMHd8a_1665998758) by smtp.aliyun-inc.com;
 Mon, 17 Oct 2022 17:25:59 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH v6 00/15] Support VIRTIO_F_RING_RESET for virtio-net,
 vhost-net kernel in virtio pci-modern
Date: Mon, 17 Oct 2022 17:25:43 +0800
Message-Id: <20221017092558.111082-1-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
MIME-Version: 1.0
X-Git-Hash: 3b20cde7ef
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
                -> vhost_virtqueue_stop()
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
    https://lore.kernel.org/bpf/20220825085610.80315-1-kangjie.xu@linux.alibaba.com/

Looking forward to your review and comments. Thanks.

changelog:

v6:
  1. fix for compile fail for mingw 32 by adding funcs inside vhost_net-stub.c
  2. add one new commit to add vq reset support inside virtio-net (not wait for vhost-user)

v5:
  1. vhost_net_virtqueue_restart() use -EBUSY replace -ENOTSUP. @Jason
  2. reuse  VHOST_FILE_UNBIND. @Jason

v4:
  1. Add explanation for preventing userspace datapath in virtio-net.
  2. Return error when vhost is not started in vhost_net_virtqueue_restart().
  3. Reset the virtqueue in the device reusing vhost_virtqueue_stop().
  4. Disable queue reset feature for pre-7.2 machine.

v3:
  1. Remove support for vhost-user in this series and refactor the code.
  2. Rename 'vhost_net_virtqueue_stop' to 'vhost_net_virtqueue_reset'.
  3. Make PCI transport ready before device ready when queue_enabled is set to true.
  4. Add some comments.

v2:
  1. Add support for vhost-net kernel scenario.
  2. Add a new vhost-user message VHOST_USER_RESET_VRING.
  3. Add migration compatibility for virtqueue reset.

Kangjie Xu (10):
  virtio: introduce virtio_queue_enable()
  virtio: core: vq reset feature negotation support
  virtio-pci: support queue enable
  vhost: expose vhost_virtqueue_start()
  vhost: expose vhost_virtqueue_stop()
  vhost-net: vhost-kernel: introduce vhost_net_virtqueue_reset()
  vhost-net: vhost-kernel: introduce vhost_net_virtqueue_restart()
  virtio-net: introduce flush_or_purge_queued_packets()
  virtio-net: support queue_enable
  vhost: vhost-kernel: enable vq reset feature

Xuan Zhuo (5):
  virtio: introduce __virtio_queue_reset()
  virtio: introduce virtio_queue_reset()
  virtio-pci: support queue reset
  virtio-net: support queue reset
  virtio-net: enable vq reset feature

 hw/core/machine.c              |  4 +-
 hw/net/vhost_net-stub.c        | 12 ++++++
 hw/net/vhost_net.c             | 79 ++++++++++++++++++++++++++++++++++
 hw/net/virtio-net.c            | 57 +++++++++++++++++++++---
 hw/virtio/vhost.c              | 16 +++----
 hw/virtio/virtio-pci.c         | 16 +++++++
 hw/virtio/virtio.c             | 62 +++++++++++++++++++-------
 include/hw/virtio/vhost.h      |  5 +++
 include/hw/virtio/virtio-pci.h |  5 +++
 include/hw/virtio/virtio.h     |  8 +++-
 include/net/vhost_net.h        |  4 ++
 11 files changed, 236 insertions(+), 32 deletions(-)

--
2.32.0.3.g01195cf9f


