Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29059F268
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:12:24 +0200 (CEST)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhkd-0001sf-Bs
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhii-00080y-0M
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhie-0001aX-E5
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661314219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osId80KFfDhS/R2oXzvYLpozkcquf2RFrmVrGq3EFoY=;
 b=Y5SknY8dkFKblqWeBY2LuJBEpeB9vWtL48xQVBMHVB60pwLy6QjcJmttMpKRomXSNjqAAo
 K1b5j0rwOIJB2Z+v/J6t/YbPOxhKg3KQkGEI+kTQn8eHjl/t5emYT4evr/BGstgP7K31D1
 JLrTJ5ZDGrLKkdc89MkNTUSGCMbUt2Q=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-71mxef4sNUWnesVC8UUafg-1; Wed, 24 Aug 2022 00:10:14 -0400
X-MC-Unique: 71mxef4sNUWnesVC8UUafg-1
Received: by mail-pj1-f70.google.com with SMTP id
 k1-20020a17090a658100b001fb35f86ccdso234561pjj.9
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=osId80KFfDhS/R2oXzvYLpozkcquf2RFrmVrGq3EFoY=;
 b=HsrjNsi84htPHWkGyR4qH5Hgw8B7Uh69kJ+Q0o44f3x5y5r5G+3rFNm9TzEa+yJ/x3
 KrKu9y3GLMvcyy7Dd8S8GRj0x0tFr3QQ0CE4rlHwA5+bvguHwWocVgz4x6a5TKiE8vxF
 TR9wS0q5iMJsx4pcUDmsngX1Fzip8r5vLuifF94bwQEGfUF97ueKpo3Vgqj7fKqQQcBr
 T5J1MRoOHd11Hh7DFT1Ut6yo9k2yVrQAQ/CLflTdklfWFjgoXZ3MuTy7S9jmsLf+KJps
 iw44sxE9o3oRPIPXYXdyT4VmSNS3zkwHse8O/rpvAvJPaNyOkpBEBFum5UAnCFQytFUR
 AUCA==
X-Gm-Message-State: ACgBeo14pXaDmhH2tomDfLV61z7lXye6g17YAJulro5tocB/ZPbRKjOy
 iBo85vSZ6KyAgNyvvZJw2B7vMaEo1Evp1+2iLAQ/R8rkYlunpwOdl+yuHmNID9QBiflv00T+RgQ
 e8J8HPZn4nky1rxc=
X-Received: by 2002:a17:902:f612:b0:172:cbb0:9b4f with SMTP id
 n18-20020a170902f61200b00172cbb09b4fmr19020905plg.142.1661314213825; 
 Tue, 23 Aug 2022 21:10:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ymVulrQbXaLcuYLsfQzFz69J+ng8eyNElQ8WnDDiLf7FIEM+JVOOC101EbkV+H4vbljddTA==
X-Received: by 2002:a17:902:f612:b0:172:cbb0:9b4f with SMTP id
 n18-20020a170902f61200b00172cbb09b4fmr19020888plg.142.1661314213537; 
 Tue, 23 Aug 2022 21:10:13 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 b204-20020a621bd5000000b005361af33036sm7463069pfb.22.2022.08.23.21.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:10:12 -0700 (PDT)
Message-ID: <43305c59-4d48-ca5d-d852-bc06a4d60718@redhat.com>
Date: Wed, 24 Aug 2022 12:10:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 00/24] Support VIRTIO_F_RING_RESET for virtio-net,
 vhost-user, vhost-kernel in virtio pci-modern
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> The virtio queue reset function has already been defined in the virtio spec 1.2.
> The relevant virtio spec information is here:
>
>      https://github.com/oasis-tcs/virtio-spec/issues/124
>      https://github.com/oasis-tcs/virtio-spec/issues/139
>
> This patch set is to support this function in QEMU. It consists of several parts:
> 1. Patches 1-7 are the basic interfaces for vq reset in virtio and virtio-pci.
> 2. Patches 8-12 support vq stop and vq restart for vhost-kernel.
> 3. Patches 13-19 support vq stop and vq restart for vhost-user.
> 4. Patches 20-22 support vq reset and re-enable for virtio-net.
> 5. Patches 23-24 enable the vq reset feature for vhost-kernel and vhost-user.
>
> The process of virtqueue reset can be concluded as:
> 1. The virtqueue is disabled when VIRTIO_PCI_COMMON_Q_RESET is written.
> 2. Then the virtqueue can be optionally restarted(re-enabled).
>
> Since this patch set involves multiple modules and seems a bit messy, we briefly describe the
> calling process for different modes below.
> virtio-net:
> 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
>      -> virtio_queue_reset() [virtio]
>          -> virtio_net_queue_reset() [virtio-net]
>          -> __virtio_queue_reset()
> 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
>      -> set enabled, reset status of vq.
>
> vhost-kernel:
> 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
>      -> virtio_queue_reset() [virtio]
>          -> virtio_net_queue_reset() [virtio-net]
>              -> vhost_net_virtqueue_stop() [vhost-net]
>                  -> vhost_net_set_backend() [vhost]
>                  -> vhost_dev_virtqueue_stop()
>                      -> vhost_virtqueue_unmap()
>          -> __virtio_queue_reset()
> 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
>      -> virtio_queue_enable() [virtio]
>          -> virtio_net_queue_enable() [virtio-net]
>              -> vhost_net_virtqueue_restart() [vhost-net]
>                  -> vhost_dev_virtqueue_restart() [vhost]
>                      -> vhost_virtqueue_start()
>                  -> vhost_net_set_backend()
>      -> set enabled, reset status of vq.
>
> vhost-user:
> 1. VIRTIO_PCI_COMMON_Q_RESET is written [virtio-pci]
>      -> virtio_queue_reset() [virtio]
>          -> virtio_net_queue_reset() [virtio-net]
>              -> vhost_net_virtqueue_stop() [vhost-net]
>                  -> vhost_dev_virtqueue_stop() [vhost]
>                      -> vhost_user_reset_vring() [vhost-user]
>                          -> send VHOST_USER_RESET_VRING to the device
>                      -> vhost_virtqueue_unmap()
>          -> __virtio_queue_reset()
> 2. VIRTIO_PCI_COMMON_Q_ENABLE is written [virtio-pci]
>      -> virtio_queue_enable() [virtio]
>          -> virtio_net_queue_enable() [virtio-net]
>              -> vhost_net_virtqueue_restart() [vhost-net]
>                  -> vhost_dev_virtqueue_restart() [vhost]
>                      -> vhost_virtqueue_start()
>                      -> vhost_user_set_single_vring_enable [vhost-user]
>                          -> send VHOST_USER_SET_VRING_ENABLE to the device
>      -> set enabled, reset status of vq.
>
>
> Test environment:
>      Host: 5.19.0-rc3 (With vq reset support)
>      Qemu: QEMU emulator version 7.0.50
>      Guest: 5.19.0-rc3 (With vq reset support)
>      DPDK: 22.07-rc1 (With vq reset support)
>      Test Cmd: ethtool -g eth1; ethtool -G eth1 rx $1 tx $2; ethtool -g eth1;
>
>      The drvier can resize the virtio queue, then virtio queue reset function should
>      be triggered.
>
>      The default is split mode, modify Qemu virtio-net to add PACKED feature to
>      test packed mode.
>
> Guest Kernel Patch:
>      https://lore.kernel.org/bpf/20220801063902.129329-1-xuanzhuo@linux.alibaba.com/
>
> DPDK Patch:
>      https://github.com/middaywords/dpdk/compare/72206323a5dd3182b13f61b25a64abdddfee595c...eabadfac7953da66bc10ffb8284b490d09bb7ec7
>
> Host Kernel Patch:
>      https://github.com/middaywords/linux/commit/19a91e0d7167b2031e46078c6215c213b89cb2c3
>
> Looking forward to your review and comments. Thanks.


I suggest to split vhost-user part into another series since:

1) vhost-net kernel is ready for this future

2) vhost-user probably requires some extensions of the current protocol

Then it can speed up the merging and reduce the rebasing of a huge series.

Thanks


>
> Kangjie Xu (19):
>    virtio: introduce virtio_queue_enable()
>    virtio: core: vq reset feature negotation support
>    virtio-pci: support queue enable
>    vhost: extract the logic of unmapping the vrings and desc
>    vhost: introduce vhost_dev_virtqueue_stop()
>    vhost: introduce vhost_dev_virtqueue_restart()
>    vhost-net: vhost-kernel: introduce vhost_net_virtqueue_stop()
>    vhost-net: vhost-kernel: introduce vhost_net_virtqueue_restart()
>    docs: vhost-user: add VHOST_USER_RESET_VRING message
>    vhost-user: introduce vhost_reset_vring() interface
>    vhost-user: add op to enable or disable a single vring
>    vhost: vhost-user: update vhost_dev_virtqueue_stop()
>    vhost: vhost-user: update vhost_dev_virtqueue_restart()
>    vhost-net: vhost-user: update vhost_net_virtqueue_stop()
>    vhost-net: vhost-user: update vhost_net_virtqueue_restart()
>    virtio-net: introduce flush_or_purge_queued_packets()
>    virtio-net: support queue_enable
>    vhost: vhost-kernel: enable vq reset feature
>    vhost: vhost-user: enable vq reset feature
>
> Xuan Zhuo (5):
>    virtio: sync relevant definitions with linux
>    virtio: introduce __virtio_queue_reset()
>    virtio: introduce virtio_queue_reset()
>    virtio-pci: support queue reset
>    virtio-net: support queue reset
>
>   docs/interop/vhost-user.rst                   | 10 +++
>   hw/core/machine.c                             |  1 +
>   hw/net/vhost_net.c                            | 79 +++++++++++++++++++
>   hw/net/virtio-net.c                           | 58 ++++++++++++--
>   hw/virtio/vhost-user.c                        | 67 ++++++++++++++--
>   hw/virtio/vhost.c                             | 79 +++++++++++++++++--
>   hw/virtio/virtio-pci.c                        | 20 +++++
>   hw/virtio/virtio.c                            | 62 +++++++++++----
>   include/hw/virtio/vhost-backend.h             |  6 ++
>   include/hw/virtio/vhost.h                     |  5 ++
>   include/hw/virtio/virtio-pci.h                |  1 +
>   include/hw/virtio/virtio.h                    |  8 +-
>   include/net/vhost_net.h                       |  4 +
>   .../standard-headers/linux/virtio_config.h    |  5 ++
>   include/standard-headers/linux/virtio_pci.h   |  2 +
>   15 files changed, 371 insertions(+), 36 deletions(-)
>


