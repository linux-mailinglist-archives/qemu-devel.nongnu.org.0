Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C43985CC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:01:14 +0200 (CEST)
Received: from localhost ([::1]:40576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loNgW-0003XC-Sm
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loNf0-0002nx-Nd
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loNey-00068r-5W
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622627974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/+UxHHRPSWqeSLQJo8wSV4BQ0M8CtTEQpMoGd7eTGA=;
 b=gYwXzoApKenU1wzAi2Fi3XeUR6ir1eE5HkyMx0UWiSLj4eZDlUKhM8dS249jftKTN2+hZE
 Uhteo/2WyYEitKYguRztOralgUT/JF3GpS59c+5Z7AjCVl9Sh6jft6gCNcDyM8JzP2xCJz
 7o6sNGJ8TG8wlI7O13+pbzVwcbd619A=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-7n7Q-maoOoa0AoACDD5KDQ-1; Wed, 02 Jun 2021 05:59:31 -0400
X-MC-Unique: 7n7Q-maoOoa0AoACDD5KDQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 d64-20020a6368430000b02902104a07607cso1367917pgc.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 02:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=b/+UxHHRPSWqeSLQJo8wSV4BQ0M8CtTEQpMoGd7eTGA=;
 b=KcWPvES4xZ+UJWv3K7AM9FSeTd9FXMSeKgejuo0yniWxWvKLnRQRvy0MZzCVt9suE/
 hYjnIzlSIqM8rv4mdreWCqFtjctsmCpbTbQOAfI4E/d0FVumdVCbPreuiRjnnzVwKh1m
 pgG/Vv9j+sxgo9Ysc2GoZZ6OcFAf3+N60/E9K0m2dneoQ9YQ3YqzFbF8vXlTy28AisZ6
 t+oqXzUS2kyBwM51QQiHBcrCVY9Mau1z+pYA7DXxZqPxIoWFVry6B9bS7jQCNYzSJuNR
 Lu32TO1OFAedoHz9ggyFM2TxmxISP85Q7xfwFbRC2Z0S1zTh5OGSGpW1+u8RrXjEuJof
 THbw==
X-Gm-Message-State: AOAM5300fbKcPeJW5PH8Ysa61YB1Ky7gQ+IViK/2vV9AJgG71ebWllEV
 r532GrUSsgu9bJZQq2ggH2DgMFURbY1zgynWUxfJ8SXh9SsGV87LTGa3KR4TbOLxIV4fgd2YKfS
 ADBn/IBG9YgkQeqk=
X-Received: by 2002:aa7:9983:0:b029:2ea:2408:386d with SMTP id
 k3-20020aa799830000b02902ea2408386dmr1904885pfh.13.1622627970614; 
 Wed, 02 Jun 2021 02:59:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsAa6vNTVKa2veSmjFHYadFPElE/+CXhyUddXnrEuvYDh6e5FHprJCXAphXTTgCtOkZsqmqw==
X-Received: by 2002:aa7:9983:0:b029:2ea:2408:386d with SMTP id
 k3-20020aa799830000b02902ea2408386dmr1904855pfh.13.1622627970278; 
 Wed, 02 Jun 2021 02:59:30 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y129sm14794213pfy.123.2021.06.02.02.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 02:59:29 -0700 (PDT)
Subject: Re: [RFC v3 00/29] vDPA software assisted live migration
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bacca888-990d-9158-9483-8a61188c381e@redhat.com>
Date: Wed, 2 Jun 2021 17:59:20 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/20 上午12:28, Eugenio Pérez 写道:
> This series enable shadow virtqueue for vhost-vdpa devices. This is a
> new method of vhost devices migration: Instead of relay on vhost
> device's dirty logging capability, SW assisted LM intercepts dataplane,
> forwarding the descriptors between VM and device. Is intended for vDPA
> devices with no dirty memory tracking capabilities.
>
> In this migration mode, qemu offers a new vring to the device to
> read and write into, and disable vhost notifiers, processing guest and
> vhost notifications in qemu. On used buffer relay, qemu will mark the
> dirty memory as with plain virtio-net devices. This way, devices does
> not need to have dirty page logging capability.
>
> This series is a POC doing SW LM for vhost-net and vhost-vdpa devices.
> The former already have dirty page logging capabilities, but it is both
> easier to test and uses different code paths in qemu.
>
> For qemu to use shadow virtqueues the vhost-net devices need to be
> instantiated:
> * With IOMMU (iommu_platform=on,ats=on)
> * Without event_idx (event_idx=off)
>
> And shadow virtqueue needs to be enabled for them with QMP command
> like:
>
> { "execute": "x-vhost-enable-shadow-vq",
>        "arguments": { "name": "dev0", "enable": true } }
>
> The series includes some commits to delete in the final version. One
> of them is the one that adds vhost_kernel_vring_pause to vhost kernel
> devices. This is only intended to work with vhost-net devices, as a way
> to test the solution, so don't use any other vhost kernel device in the
> same test.
>
> The vhost-vdpa devices should work the same way. However, vp_vdpa is
> not working properly with intel iommu unmapping, so this series add two
> extra commits to allow testing the solution enable SVQ mode from the
> device start and forbidding any other vhost-vdpa memory mapping. The
> causes of this are still under debugging.
>
> For testing vhost-vdpa devices vp_vdpa device has been used with nested
> virtualization, using a qemu virtio-net device in L0. To be able to
> stop and reset status, features in RFC status has been implemented in
> commits 5 and 6. After that, virtio-net driver in L0 guest is replaced
> by vp_vdpa driver, and a nested qemu instance is launched using it.
>
> This vp_vdpa driver needs to be also modified to support the RFCs,
> mainly allowing it to removing the _S_STOPPED status flag and
> implementing actual vp_vdpa_set_vq_state and vp_vdpa_get_vq_state
> callbacks.
>
> Just the notification forwarding (with no descriptor relay) can be
> achieved with patches 7 and 8, and starting SVQ. Previous commits
> are cleanup ones and declaration of QMP command.
>
> Commit 17 introduces the buffer forwarding. Previous one are for
> preparations again, and laters are for enabling some obvious
> optimizations. However, it needs the vdpa device to be able to map
> every IOVA space, and some vDPA devices are not able to do so. Checking
> of this is added in previous commits.
>
> Later commits allow vhost and shadow virtqueue to track and translate
> between qemu virtual addresses and a restricted iommu range. At the
> moment is not able to delete old translations, limit maximum range
> it can translate, nor vhost add new memory regions from the moment
> SVQ is enabled, but is somehow straightforward to add these.
>
> This is a big series, so the idea is to send it in logical chunks once
> all comments have been collected. As a first complete usecase, a SVQ
> mode with no possibility of going back to regular mode would cover a
> first usecase, and this RFC already have all the ingredients but
> internal memory tracking.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> not map the shadow vq in guest's VA, but in qemu's.
>
> Comments are welcome!


Thanks a lot for working on this.

I feel like we need to start from something simple to have some minimal 
functions to work first.

There are two major issues for the current complexity:

1) the current code tries to work on general virtio level (all kinds of 
vhost backends)
2) two kinds of translations are used (qemu HVA and qemu IOVA)

For 1), I'd suggest to start from vhost-vdpa, and it's even better to 
hide all the svq stuffs from the vhost API first. That is to say, do it 
totally inside vhost-vDPA and leave the rest part of Qemu untouched. 
This makes things easier and after this part is merged. We can start to 
think of how to generalize it other vhost bakcends (or it's still 
questionable that it's worth to do so). I believe most of the codes 
could be re-used.

For 2), I think we'd better always go with qemu IOVA (IOVA allocator). 
This should work for all cases and may simplify the code a lot. In the 
future, if we found qemu HVA is useful, we can implement some dedicated 
alocator for vhost-net to have 1:1 mapping.

Thoughts?

Thanks


>
> TODO:
> * Event, indirect, packed, and others features of virtio - Waiting for
>    confirmation of the big picture.
> * vDPA devices: Grow IOVA tree to track new or deleted memory. Cap
>    IOVA limit in tree so it cannot grow forever.
> * To sepparate buffers forwarding in its own AIO context, so we can
>    throw more threads to that task and we don't need to stop the main
>    event loop.
> * IOMMU optimizations, so bacthing and bigger chunks of IOVA can be
>    sent to device.
> * Automatic kick-in on live-migration.
> * Proper documentation.
>
> Thanks!
>
> Changes from v2 RFC:
>    * Adding vhost-vdpa devices support
>    * Fixed some memory leaks pointed by different comments
>
> Changes from v1 RFC:
>    * Use QMP instead of migration to start SVQ mode.
>    * Only accepting IOMMU devices, closer behavior with target devices
>      (vDPA)
>    * Fix invalid masking/unmasking of vhost call fd.
>    * Use of proper methods for synchronization.
>    * No need to modify VirtIO device code, all of the changes are
>      contained in vhost code.
>    * Delete superfluous code.
>    * An intermediate RFC was sent with only the notifications forwarding
>      changes. It can be seen in
>      https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.com/
>    * v1 at
>      https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
>
> Eugenio Pérez (29):
>    virtio: Add virtio_queue_is_host_notifier_enabled
>    vhost: Save masked_notifier state
>    vhost: Add VhostShadowVirtqueue
>    vhost: Add x-vhost-enable-shadow-vq qmp
>    virtio: Add VIRTIO_F_QUEUE_STATE
>    virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>    vhost: Route guest->host notification through shadow virtqueue
>    vhost: Route host->guest notification through shadow virtqueue
>    vhost: Avoid re-set masked notifier in shadow vq
>    virtio: Add vhost_shadow_vq_get_vring_addr
>    vhost: Add vhost_vring_pause operation
>    vhost: add vhost_kernel_vring_pause
>    vhost: Add vhost_get_iova_range operation
>    vhost: add vhost_has_limited_iova_range
>    vhost: Add enable_custom_iommu to VhostOps
>    vhost-vdpa: Add vhost_vdpa_enable_custom_iommu
>    vhost: Shadow virtqueue buffers forwarding
>    vhost: Use vhost_enable_custom_iommu to unmap everything if available
>    vhost: Check for device VRING_USED_F_NO_NOTIFY at shadow virtqueue
>      kick
>    vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call on shadow
>      virtqueue
>    vhost: Add VhostIOVATree
>    vhost: Add iova_rev_maps_find_iova to IOVAReverseMaps
>    vhost: Use a tree to store memory mappings
>    vhost: Add iova_rev_maps_alloc
>    vhost: Add custom IOTLB translations to SVQ
>    vhost: Map in vdpa-dev
>    vhost-vdpa: Implement vhost_vdpa_vring_pause operation
>    vhost-vdpa: never map with vDPA listener
>    vhost: Start vhost-vdpa SVQ directly
>
>   qapi/net.json                                 |  22 +
>   hw/virtio/vhost-iova-tree.h                   |  61 ++
>   hw/virtio/vhost-shadow-virtqueue.h            |  38 ++
>   hw/virtio/virtio-pci.h                        |   1 +
>   include/hw/virtio/vhost-backend.h             |  16 +
>   include/hw/virtio/vhost-vdpa.h                |   2 +-
>   include/hw/virtio/vhost.h                     |  14 +
>   include/hw/virtio/virtio.h                    |   5 +-
>   .../standard-headers/linux/virtio_config.h    |   5 +
>   include/standard-headers/linux/virtio_pci.h   |   2 +
>   hw/net/virtio-net.c                           |   4 +-
>   hw/virtio/vhost-backend.c                     |  42 ++
>   hw/virtio/vhost-iova-tree.c                   | 283 ++++++++
>   hw/virtio/vhost-shadow-virtqueue.c            | 643 ++++++++++++++++++
>   hw/virtio/vhost-vdpa.c                        |  73 +-
>   hw/virtio/vhost.c                             | 459 ++++++++++++-
>   hw/virtio/virtio-pci.c                        |   9 +
>   hw/virtio/virtio.c                            |   5 +
>   hw/virtio/meson.build                         |   2 +-
>   hw/virtio/trace-events                        |   1 +
>   20 files changed, 1663 insertions(+), 24 deletions(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>


