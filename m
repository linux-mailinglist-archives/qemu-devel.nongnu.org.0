Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62554595284
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:28:38 +0200 (CEST)
Received: from localhost ([::1]:45142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNq45-0007zf-Bg
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNpyH-0004iS-HK
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 02:22:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNpyE-0003AR-Ba
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 02:22:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660630945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A13xfkIxhleKJhBYBtvpuDhWg/4pLrsKO3/by4peOtk=;
 b=U30UiVxJN4vW7E+OMrK9XbChzCJsSqq6l31Xkei81CEio+j6zSKOJZyOTD/r7Dl8cdh7Is
 eXzwzsFQLg2XeuEshSPIXRpHu7qf/A79fXo2qUrh/02IeAA0CfgpWQ94LjMXn6v5MTTqWh
 yH9zUue7wO6dleemv8Mgbn2WT4MCuxU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-411-44U35m4cPPKMNvreDEG8KA-1; Tue, 16 Aug 2022 02:22:23 -0400
X-MC-Unique: 44U35m4cPPKMNvreDEG8KA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k1-20020adfb341000000b00224ff0f424eso1123068wrd.16
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 23:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=A13xfkIxhleKJhBYBtvpuDhWg/4pLrsKO3/by4peOtk=;
 b=4vL7oYHv/PwEb8dvvPtz3tKPhT6bSBtOekH+J5qfXPWr6Ia206imZOlXOyjMq2Y6YJ
 IO9KVYlkz8MryTKHK++F/F2KeftJFLYmTLBaUIdr3MQQzpw1KxVvsEhSnpx8qbnjaSF1
 tBEFs4WrdofgeIGJVDs79Xa6cldt9fjHJCf+44087ZJEcsDKkeLHWCv1TRvbbEDxOn5c
 awqxvQ0h7XXYBUQF8u2+3qBT1g8rqepm5GOjrMqQ2Gb/JHvNsPvPnSOlMNL6/H4gy3UP
 m65mMqnip6mOzAam8m/tUT637ZHX0GnqEU8e740PSR3K0jjhJI6oRWc21UsyZapamLT1
 CU4A==
X-Gm-Message-State: ACgBeo2AVsNGhuWe2yWzphcfloNYx5dCXv3JENvTIB+HF8HdL09BJXGX
 3/vdQaG0Pv+W1gbZnUSwp3oFNV20tdmhV053+iueG+znzXUQGBBSBXK9koke6RpL/ucLGw73KRg
 kJzkwxtQOyRHljz4=
X-Received: by 2002:adf:a502:0:b0:224:f8eb:d1ab with SMTP id
 i2-20020adfa502000000b00224f8ebd1abmr6508522wrb.615.1660630942012; 
 Mon, 15 Aug 2022 23:22:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4i/jpmQ25MyixuesO6SiWaxV76H8ZaQ+aPv3zoo5LuU80XB28zCPx4djHu0GH/cQqpWBGgvg==
X-Received: by 2002:adf:a502:0:b0:224:f8eb:d1ab with SMTP id
 i2-20020adfa502000000b00224f8ebd1abmr6508511wrb.615.1660630941689; 
 Mon, 15 Aug 2022 23:22:21 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600000ce00b0021ee28ff76esm9029699wrx.38.2022.08.15.23.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:22:21 -0700 (PDT)
Date: Tue, 16 Aug 2022 02:22:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, f4bug@amsat.org, wangyanan55@huawei.com,
 hengqi@linux.alibaba.com, Kangjie Xu <kangjie.xu@linux.alibaba.com>
Subject: Re: [PATCH 00/24] Support VIRTIO_F_RING_RESET for virtio-net,
 vhost-user, vhost-kernel in virtio pci-modern
Message-ID: <20220816022156-mutt-send-email-mst@kernel.org>
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <20220816021322-mutt-send-email-mst@kernel.org>
 <1660630557.1887379-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1660630557.1887379-3-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Aug 16, 2022 at 02:15:57PM +0800, Xuan Zhuo wrote:
> On Tue, 16 Aug 2022 02:14:10 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Tue, Aug 16, 2022 at 09:06:12AM +0800, Kangjie Xu wrote:
> > > The virtio queue reset function has already been defined in the virtio spec 1.2.
> > > The relevant virtio spec information is here:
> > >
> > >     https://github.com/oasis-tcs/virtio-spec/issues/124
> > >     https://github.com/oasis-tcs/virtio-spec/issues/139
> > >
> > > This patch set is to support this function in QEMU. It consists of several parts:
> > > 1. Patches 1-7 are the basic interfaces for vq reset in virtio and virtio-pci.
> > > 2. Patches 8-12 support vq stop and vq restart for vhost-kernel.
> > > 3. Patches 13-19 support vq stop and vq restart for vhost-user.
> > > 4. Patches 20-22 support vq reset and re-enable for virtio-net.
> > > 5. Patches 23-24 enable the vq reset feature for vhost-kernel and vhost-user.
> > >
> > > The process of virtqueue reset can be concluded as:
> > > 1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
> > > 2. Then the virtqueue can be optionally restarted(re-enabled).
> > >
> > > Since this patch set involves multiple modules and seems a bit messy, we briefly describe the
> > > calling process for different modes below.
> > > virtio-net:
> > > 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
> > >     -> virtio_queue_reset() [virtio]
> > >         -> virtio_net_queue_reset() [virtio-net]
> > >         -> __virtio_queue_reset()
> > > 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
> > >     -> set enabled, reset status of vq.
> > >
> > > vhost-kernel:
> > > 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
> > >     -> virtio_queue_reset() [virtio]
> > >         -> virtio_net_queue_reset() [virtio-net]
> > >             -> vhost_net_virtqueue_stop() [vhost-net]
> > >                 -> vhost_net_set_backend() [vhost]
> > >                 -> vhost_dev_virtqueue_stop()
> > >                     -> vhost_virtqueue_unmap()
> > >         -> __virtio_queue_reset()
> > > 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
> > >     -> virtio_queue_enable() [virtio]
> > >         -> virtio_net_queue_enable() [virtio-net]
> > >             -> vhost_net_virtqueue_restart() [vhost-net]
> > >                 -> vhost_dev_virtqueue_restart() [vhost]
> > >                     -> vhost_virtqueue_start()
> > >                 -> vhost_net_set_backend()
> > >     -> set enabled, reset status of vq.
> > >
> > > vhost-user:
> > > 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
> > >     -> virtio_queue_reset() [virtio]
> > >         -> virtio_net_queue_reset() [virtio-net]
> > >             -> vhost_net_virtqueue_stop() [vhost-net]
> > >                 -> vhost_dev_virtqueue_stop() [vhost]
> > >                     -> vhost_user_reset_vring() [vhost-user]
> > >                         -> send VHOST_USER_RESET_VRING to the device
> > >                     -> vhost_virtqueue_unmap()
> > >         -> __virtio_queue_reset()
> > > 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
> > >     -> virtio_queue_enable() [virtio]
> > >         -> virtio_net_queue_enable() [virtio-net]
> > >             -> vhost_net_virtqueue_restart() [vhost-net]
> > >                 -> vhost_dev_virtqueue_restart() [vhost]
> > >                     -> vhost_virtqueue_start()
> > >                     -> vhost_user_set_single_vring_enable [vhost-user]
> > >                         -> send VHOST_USER_SET_VRING_ENABLE to the device
> > >     -> set enabled, reset status of vq.
> > >
> > >
> > > Test environment:
> > >     Host: 5.19.0-rc3 (With vq reset support)
> > >     Qemu: QEMU emulator version 7.0.50
> > >     Guest: 5.19.0-rc3 (With vq reset support)
> > >     DPDK: 22.07-rc1 (With vq reset support)
> > >     Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g eth1;
> > >
> > >     The drvier can resize the virtio queue, then virtio queue reset function should
> > >     be triggered.
> > >
> > >     The default is split mode, modify Qemu virtio-net to add PACKED feature to
> > >     test packed mode.
> >
> > legacy mode testing?
> 
> 
> legacy does not support vq reset.
> 
> Thanks.

yes but did it break with all these code changes?

> >
> > > Guest Kernel Patch:
> > >     https://lore.kernel.org/bpf/20220801063902.129329-1-xuanzhuo@linux.alibaba.com/
> > >
> > > DPDK Patch:
> > >     https://github.com/middaywords/dpdk/compare/72206323a5dd3182b13f61b25a64abdddfee595c...eabadfac7953da66bc10ffb8284b490d09bb7ec7
> > >
> > > Host Kernel Patch:
> > >     https://github.com/middaywords/linux/commit/19a91e0d7167b2031e46078c6215c213b89cb2c3
> > >
> > > Looking forward to your review and comments. Thanks.
> > >
> > > Kangjie Xu (19):
> > >   virtio: introduce virtio_queue_enable()
> > >   virtio: core: vq reset feature negotation support
> > >   virtio-pci: support queue enable
> > >   vhost: extract the logic of unmapping the vrings and desc
> > >   vhost: introduce vhost_dev_virtqueue_stop()
> > >   vhost: introduce vhost_dev_virtqueue_restart()
> > >   vhost-net: vhost-kernel: introduce vhost_net_virtqueue_stop()
> > >   vhost-net: vhost-kernel: introduce vhost_net_virtqueue_restart()
> > >   docs: vhost-user: add VHOST_USER_RESET_VRING message
> > >   vhost-user: introduce vhost_reset_vring() interface
> > >   vhost-user: add op to enable or disable a single vring
> > >   vhost: vhost-user: update vhost_dev_virtqueue_stop()
> > >   vhost: vhost-user: update vhost_dev_virtqueue_restart()
> > >   vhost-net: vhost-user: update vhost_net_virtqueue_stop()
> > >   vhost-net: vhost-user: update vhost_net_virtqueue_restart()
> > >   virtio-net: introduce flush_or_purge_queued_packets()
> > >   virtio-net: support queue_enable
> > >   vhost: vhost-kernel: enable vq reset feature
> > >   vhost: vhost-user: enable vq reset feature
> > >
> > > Xuan Zhuo (5):
> > >   virtio: sync relevant definitions with linux
> > >   virtio: introduce __virtio_queue_reset()
> > >   virtio: introduce virtio_queue_reset()
> > >   virtio-pci: support queue reset
> > >   virtio-net: support queue reset
> > >
> > >  docs/interop/vhost-user.rst                   | 10 +++
> > >  hw/core/machine.c                             |  1 +
> > >  hw/net/vhost_net.c                            | 79 +++++++++++++++++++
> > >  hw/net/virtio-net.c                           | 58 ++++++++++++--
> > >  hw/virtio/vhost-user.c                        | 67 ++++++++++++++--
> > >  hw/virtio/vhost.c                             | 79 +++++++++++++++++--
> > >  hw/virtio/virtio-pci.c                        | 20 +++++
> > >  hw/virtio/virtio.c                            | 62 +++++++++++----
> > >  include/hw/virtio/vhost-backend.h             |  6 ++
> > >  include/hw/virtio/vhost.h                     |  5 ++
> > >  include/hw/virtio/virtio-pci.h                |  1 +
> > >  include/hw/virtio/virtio.h                    |  8 +-
> > >  include/net/vhost_net.h                       |  4 +
> > >  .../standard-headers/linux/virtio_config.h    |  5 ++
> > >  include/standard-headers/linux/virtio_pci.h   |  2 +
> > >  15 files changed, 371 insertions(+), 36 deletions(-)
> > >
> > > --
> > > 2.32.0
> >


