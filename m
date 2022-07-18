Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A455757846F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 15:55:17 +0200 (CEST)
Received: from localhost ([::1]:44902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRDQ-0001by-NI
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 09:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpl-0007Qr-Hl
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:41 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:58513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kangjie.xu@linux.alibaba.com>)
 id 1oDOpf-0000hz-UH
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 07:22:40 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=kangjie.xu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VJjIA67_1658143033; 
Received: from localhost(mailfrom:kangjie.xu@linux.alibaba.com
 fp:SMTPD_---0VJjIA67_1658143033) by smtp.aliyun-inc.com;
 Mon, 18 Jul 2022 19:17:13 +0800
From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, jasowang@redhat.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
Subject: [PATCH 00/16] Support VIRTIO_F_RING_RESET for virtio-net and
 vhost-user in virtio pci
Date: Mon, 18 Jul 2022 19:16:57 +0800
Message-Id: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=kangjie.xu@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:49:04 -0400
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

This patch set is to support this function in QEMU. It consists of two parts: virtio-net
and vhost-user. The patches 1-7 are the implementation for virtio-net and the patches
8-16 are for vhost-user. 

The process of virt queue reset can be concluded as:
1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
2. Then the virtqueue is restarted after the information of vrings is passed to QEMU and
VIRTIO_PCI_COMMON_Q_ENABLE is written.

Test environment:
    Host: 5.4.189
    Qemu: QEMU emulator version 7.0.50
    Guest: 5.19.0-rc3 (With vq reset support)
    DPDK: 22.07-rc1 (With vq reset support)
    Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g eth1;

    The frontend can resize the virtio queue, then virtio queue reset function should
    be triggered.

    The default is split mode, modify Qemu virtio-net to add PACKED feature to 
    test packed mode.

Guest Kernel Patch:
    https://lore.kernel.org/bpf/20220629065656.54420-1-xuanzhuo@linux.alibaba.com/

DPDK Code:
    https://github.com/middaywords/dpdk/commit/098c8e1dfae10b747da8dd8950a82890efca7bee

Please review. Thanks.

Kangjie Xu (9):
  vhost: add op to enable or disable a single vring
  vhost-user: enable/disable a single vring
  vhost: extract the logic of unmapping the vrings and desc
  vhost: introduce restart and release for vhost_dev's vqs
  vhost-net: introduce restart and stop for vhost_net's vqs
  virtio: introduce queue_enable in virtio
  virtio-net: support queue_enable for vhost-user
  virtio-net: support queue_reset for vhost-user
  vhost-net: vq reset feature bit support

Xuan Zhuo (7):
  virtio-pci: virtio_pci_common_cfg add queue_notify_data
  virtio: add VIRTIO_F_RING_RESET
  virtio: pci: virtio_pci_common_cfg add queue_reset
  virtio: introduce __virtio_queue_reset()
  virtio: introduce virtio_queue_reset()
  virtio-pci: support queue reset
  virtio-net: support queue reset

 hw/net/vhost_net.c                            | 56 ++++++++++++++++++
 hw/net/virtio-net.c                           | 40 +++++++++++++
 hw/virtio/vhost-user.c                        | 55 +++++++++++++++---
 hw/virtio/vhost.c                             | 49 ++++++++++++++--
 hw/virtio/virtio-pci.c                        | 17 ++++++
 hw/virtio/virtio.c                            | 57 +++++++++++++------
 include/hw/virtio/vhost-backend.h             |  4 ++
 include/hw/virtio/vhost.h                     |  6 ++
 include/hw/virtio/virtio-pci.h                |  1 +
 include/hw/virtio/virtio.h                    |  4 ++
 include/net/vhost_net.h                       |  5 ++
 .../standard-headers/linux/virtio_config.h    |  5 ++
 include/standard-headers/linux/virtio_pci.h   |  4 ++
 13 files changed, 274 insertions(+), 29 deletions(-)

-- 
2.32.0


