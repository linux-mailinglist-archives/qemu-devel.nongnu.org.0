Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3656596048
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 18:31:43 +0200 (CEST)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNzTi-0004Tu-Rj
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 12:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oNqGD-00005b-NK
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 02:41:10 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:39257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuanzhuo@linux.alibaba.com>)
 id 1oNqG5-0005Yz-RE
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 02:41:04 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VMP-ra5_1660632050; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VMP-ra5_1660632050) by smtp.aliyun-inc.com;
 Tue, 16 Aug 2022 14:40:51 +0800
Message-ID: <1660632013.6600778-4-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH 00/24] Support VIRTIO_F_RING_RESET for virtio-net,
 vhost-user, vhost-kernel in virtio pci-modern
Date: Tue, 16 Aug 2022 14:40:13 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, Kangjie Xu <kangjie.xu@linux.alibaba.com>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <20220816021322-mutt-send-email-mst@kernel.org>
 <1660630557.1887379-3-xuanzhuo@linux.alibaba.com>
 <20220816022156-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220816022156-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=xuanzhuo@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 16 Aug 2022 12:27:18 -0400
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

On Tue, 16 Aug 2022 02:22:16 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Aug 16, 2022 at 02:15:57PM +0800, Xuan Zhuo wrote:
> > On Tue, 16 Aug 2022 02:14:10 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Tue, Aug 16, 2022 at 09:06:12AM +0800, Kangjie Xu wrote:
> > > > The virtio queue reset function has already been defined in the virtio spec 1.2.
> > > > The relevant virtio spec information is here:
> > > >
> > > >     https://github.com/oasis-tcs/virtio-spec/issues/124
> > > >     https://github.com/oasis-tcs/virtio-spec/issues/139
> > > >
> > > > This patch set is to support this function in QEMU. It consists of several parts:
> > > > 1. Patches 1-7 are the basic interfaces for vq reset in virtio and virtio-pci.
> > > > 2. Patches 8-12 support vq stop and vq restart for vhost-kernel.
> > > > 3. Patches 13-19 support vq stop and vq restart for vhost-user.
> > > > 4. Patches 20-22 support vq reset and re-enable for virtio-net.
> > > > 5. Patches 23-24 enable the vq reset feature for vhost-kernel and vhost-user.
> > > >
> > > > The process of virtqueue reset can be concluded as:
> > > > 1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
> > > > 2. Then the virtqueue can be optionally restarted(re-enabled).
> > > >
> > > > Since this patch set involves multiple modules and seems a bit messy, we briefly describe the
> > > > calling process for different modes below.
> > > > virtio-net:
> > > > 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
> > > >     -> virtio_queue_reset() [virtio]
> > > >         -> virtio_net_queue_reset() [virtio-net]
> > > >         -> __virtio_queue_reset()
> > > > 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
> > > >     -> set enabled, reset status of vq.
> > > >
> > > > vhost-kernel:
> > > > 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
> > > >     -> virtio_queue_reset() [virtio]
> > > >         -> virtio_net_queue_reset() [virtio-net]
> > > >             -> vhost_net_virtqueue_stop() [vhost-net]
> > > >                 -> vhost_net_set_backend() [vhost]
> > > >                 -> vhost_dev_virtqueue_stop()
> > > >                     -> vhost_virtqueue_unmap()
> > > >         -> __virtio_queue_reset()
> > > > 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
> > > >     -> virtio_queue_enable() [virtio]
> > > >         -> virtio_net_queue_enable() [virtio-net]
> > > >             -> vhost_net_virtqueue_restart() [vhost-net]
> > > >                 -> vhost_dev_virtqueue_restart() [vhost]
> > > >                     -> vhost_virtqueue_start()
> > > >                 -> vhost_net_set_backend()
> > > >     -> set enabled, reset status of vq.
> > > >
> > > > vhost-user:
> > > > 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
> > > >     -> virtio_queue_reset() [virtio]
> > > >         -> virtio_net_queue_reset() [virtio-net]
> > > >             -> vhost_net_virtqueue_stop() [vhost-net]
> > > >                 -> vhost_dev_virtqueue_stop() [vhost]
> > > >                     -> vhost_user_reset_vring() [vhost-user]
> > > >                         -> send VHOST_USER_RESET_VRING to the device
> > > >                     -> vhost_virtqueue_unmap()
> > > >         -> __virtio_queue_reset()
> > > > 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
> > > >     -> virtio_queue_enable() [virtio]
> > > >         -> virtio_net_queue_enable() [virtio-net]
> > > >             -> vhost_net_virtqueue_restart() [vhost-net]
> > > >                 -> vhost_dev_virtqueue_restart() [vhost]
> > > >                     -> vhost_virtqueue_start()
> > > >                     -> vhost_user_set_single_vring_enable [vhost-user]
> > > >                         -> send VHOST_USER_SET_VRING_ENABLE to the device
> > > >     -> set enabled, reset status of vq.
> > > >
> > > >
> > > > Test environment:
> > > >     Host: 5.19.0-rc3 (With vq reset support)
> > > >     Qemu: QEMU emulator version 7.0.50
> > > >     Guest: 5.19.0-rc3 (With vq reset support)
> > > >     DPDK: 22.07-rc1 (With vq reset support)
> > > >     Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g eth1;
> > > >
> > > >     The drvier can resize the virtio queue, then virtio queue reset function should
> > > >     be triggered.
> > > >
> > > >     The default is split mode, modify Qemu virtio-net to add PACKED feature to
> > > >     test packed mode.
> > >
> > > legacy mode testing?
> >
> >
> > legacy does not support vq reset.
> >
> > Thanks.
>
> yes but did it break with all these code changes?

OK, I see, we'll test this.

Thanks.


>
> > >
> > > > Guest Kernel Patch:
> > > >     https://lore.kernel.org/bpf/20220801063902.129329-1-xuanzhuo@linux.alibaba.com/
> > > >
> > > > DPDK Patch:
> > > >     https://github.com/middaywords/dpdk/compare/72206323a5dd3182b13f61b25a64abdddfee595c...eabadfac7953da66bc10ffb8284b490d09bb7ec7
> > > >
> > > > Host Kernel Patch:
> > > >     https://github.com/middaywords/linux/commit/19a91e0d7167b2031e46078c6215c213b89cb2c3
> > > >
> > > > Looking forward to your review and comments. Thanks.
> > > >
> > > > Kangjie Xu (19):
> > > >   virtio: introduce virtio_queue_enable()
> > > >   virtio: core: vq reset feature negotation support
> > > >   virtio-pci: support queue enable
> > > >   vhost: extract the logic of unmapping the vrings and desc
> > > >   vhost: introduce vhost_dev_virtqueue_stop()
> > > >   vhost: introduce vhost_dev_virtqueue_restart()
> > > >   vhost-net: vhost-kernel: introduce vhost_net_virtqueue_stop()
> > > >   vhost-net: vhost-kernel: introduce vhost_net_virtqueue_restart()
> > > >   docs: vhost-user: add VHOST_USER_RESET_VRING message
> > > >   vhost-user: introduce vhost_reset_vring() interface
> > > >   vhost-user: add op to enable or disable a single vring
> > > >   vhost: vhost-user: update vhost_dev_virtqueue_stop()
> > > >   vhost: vhost-user: update vhost_dev_virtqueue_restart()
> > > >   vhost-net: vhost-user: update vhost_net_virtqueue_stop()
> > > >   vhost-net: vhost-user: update vhost_net_virtqueue_restart()
> > > >   virtio-net: introduce flush_or_purge_queued_packets()
> > > >   virtio-net: support queue_enable
> > > >   vhost: vhost-kernel: enable vq reset feature
> > > >   vhost: vhost-user: enable vq reset feature
> > > >
> > > > Xuan Zhuo (5):
> > > >   virtio: sync relevant definitions with linux
> > > >   virtio: introduce __virtio_queue_reset()
> > > >   virtio: introduce virtio_queue_reset()
> > > >   virtio-pci: support queue reset
> > > >   virtio-net: support queue reset
> > > >
> > > >  docs/interop/vhost-user.rst                   | 10 +++
> > > >  hw/core/machine.c                             |  1 +
> > > >  hw/net/vhost_net.c                            | 79 +++++++++++++++++++
> > > >  hw/net/virtio-net.c                           | 58 ++++++++++++--
> > > >  hw/virtio/vhost-user.c                        | 67 ++++++++++++++--
> > > >  hw/virtio/vhost.c                             | 79 +++++++++++++++++--
> > > >  hw/virtio/virtio-pci.c                        | 20 +++++
> > > >  hw/virtio/virtio.c                            | 62 +++++++++++----
> > > >  include/hw/virtio/vhost-backend.h             |  6 ++
> > > >  include/hw/virtio/vhost.h                     |  5 ++
> > > >  include/hw/virtio/virtio-pci.h                |  1 +
> > > >  include/hw/virtio/virtio.h                    |  8 +-
> > > >  include/net/vhost_net.h                       |  4 +
> > > >  .../standard-headers/linux/virtio_config.h    |  5 ++
> > > >  include/standard-headers/linux/virtio_pci.h   |  2 +
> > > >  15 files changed, 371 insertions(+), 36 deletions(-)
> > > >
> > > > --
> > > > 2.32.0
> > >
>

