Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90258442667
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 05:28:48 +0100 (CET)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhlPj-0003tP-7d
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 00:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhlNA-0003Bf-J3
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 00:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mhlN6-0004FS-W7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 00:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635827163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvg+HikNyDyJBaTRL/LKvXvdLuqXQ+ovHkuwaXlPRts=;
 b=J/TOQcJATap7YYVZsD1G8UFqXvNy2rmVa/11SVnUXYvJK8KgiGt8nZ2ss3plkGqkBl89qv
 sQJXJYhv2ZI/utt2Wy9q/UJMP4lVR/w65eNGQQtmW1zjQIgSzQiVefXf3D2pzatzqAsyXe
 QnHc7u/xr6g1RHUn11TapPgBbMe5/ws=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-hQN9XXiRN5WI8DYiJmCRVw-1; Tue, 02 Nov 2021 00:26:00 -0400
X-MC-Unique: hQN9XXiRN5WI8DYiJmCRVw-1
Received: by mail-pf1-f198.google.com with SMTP id
 j3-20020a628003000000b004811bc66186so1795540pfd.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 21:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qvg+HikNyDyJBaTRL/LKvXvdLuqXQ+ovHkuwaXlPRts=;
 b=H80miYPTHs2YGwV9LdLOvCEbrgf39SKqZeW0sS/I1X2LgkYA/qeXWwiFmqkYUv07C9
 vZhGXlaC9eY7KOI8y3rTv3yeXOUSYrtlrIXkM2sC6DkO5XAqdHHiiuzFFAD3Gr9Y1ql4
 IWFOkIioEg9YVCceykiVgY7DQ+TNxFE0hmzIXXgnbBR4jzoLknhJJgHSXH50DP+eGrQb
 /XtVKVRYcWlvl1Yd4f0nch3xGBu8j+GzdWmMrB6t1UzzSjvvRweojENhqYymGefOVoFr
 sQUsNDeUGF05RbXPUwZ6wHQzuRzek5w3Te36c03kWs7bJo2a9Co4QXwwsqiMEMtvh+YV
 tMaA==
X-Gm-Message-State: AOAM5308gv+v/y7sgooq7bWTjxKujKtsYaMRIJSlqLCILU2u36L0dgwT
 EhyVxBotoBd4q50r88HGMriP6K7H897j3fgHWMyMgvdm31S7jroAfq/iejTpH8GBStelpFvlnKf
 RNBOOASY3i0O/cHs=
X-Received: by 2002:a17:90a:930d:: with SMTP id
 p13mr3809999pjo.171.1635827159310; 
 Mon, 01 Nov 2021 21:25:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuNbxM5lKYgJXKvx6NIXFs6ThF4xgcMu2QEdHQmwXdUNrnDLVNoz6LXH3B0ZCGPjbSgZq9Pw==
X-Received: by 2002:a17:90a:930d:: with SMTP id
 p13mr3809946pjo.171.1635827158898; 
 Mon, 01 Nov 2021 21:25:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h3sm879092pjz.43.2021.11.01.21.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 21:25:58 -0700 (PDT)
Subject: Re: [RFC PATCH v5 00/26] vDPA shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211029183525.1776416-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <24da75d6-edcd-5cb9-f51e-c3e5ce55dcd4@redhat.com>
Date: Tue, 2 Nov 2021 12:25:45 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/30 上午2:34, Eugenio Pérez 写道:
> This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. This
> is intended as a new method of tracking the memory the devices touch
> during a migration process: Instead of relay on vhost device's dirty
> logging capability, SVQ intercepts the VQ dataplane forwarding the
> descriptors between VM and device. This way qemu is the effective
> writer of guests memory, like in qemu's virtio device operation.
>
> When SVQ is enabled qemu offers a new virtual address space to the
> device to read and write into, and it maps new vrings and the guest
> memory in it. SVQ also intercepts kicks and calls between the device
> and the guest. Used buffers relay would cause dirty memory being
> tracked, but at this RFC SVQ is not enabled on migration automatically.
>
> Thanks of being a buffers relay system, SVQ can be used also to
> communicate devices and drivers with different capabilities, like
> devices that only supports packed vring and not split and old guest
> with no driver packed support.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> not map the shadow vq in guest's VA, but in qemu's.
>
> For qemu to use shadow virtqueues the guest virtio driver must not use
> features like event_idx.
>
> SVQ needs to be enabled with QMP command:
>
> { "execute": "x-vhost-set-shadow-vq",
>        "arguments": { "name": "vhost-vdpa0", "enable": true } }
>
> This series includes some patches to delete in the final version that
> helps with its testing. The first two of the series have been sent
> sepparately but they haven't been included in qemu main branch.
>
> The two after them adds the feature to stop the device and be able to
> set and get its status. It's intended to be used with vp_vpda driver in
> a nested environment, so they are also external to this series. The
> vp_vdpa driver also need modifications to forward the new status bit,
> they will be proposed sepparately
>
> Patches 5-12 prepares the SVQ and QMP command to support guest to host
> notifications forwarding. If the SVQ is enabled with these ones
> applied and the device supports it, that part can be tested in
> isolation (for example, with networking), hopping through SVQ.
>
> Same thing is true with patches 13-17, but with device to guest
> notifications.
>
> Based on them, patches from 18 to 22 implement the actual buffer
> forwarding, using some features already introduced in previous.
> However, they will need a host device with no iommu, something that
> is not available at the moment.
>
> The last part of the series uses properly the host iommu, so the driver
> can access this new virtual address space created.
>
> Comments are welcome.


I think we need do some benchmark to see the performance impact.

Thanks


>
> TODO:
> * Event, indirect, packed, and others features of virtio.
> * To sepparate buffers forwarding in its own AIO context, so we can
>    throw more threads to that task and we don't need to stop the main
>    event loop.
> * Support multiqueue virtio-net vdpa.
> * Proper documentation.
>
> Changes from v4 RFC:
> * Support of allocating / freeing iova ranges in IOVA tree. Extending
>    already present iova-tree for that.
> * Proper validation of guest features. Now SVQ can negotiate a
>    different set of features with the device when enabled.
> * Support of host notifiers memory regions
> * Handling of SVQ full queue in case guest's descriptors span to
>    different memory regions (qemu's VA chunks).
> * Flush pending used buffers at end of SVQ operation.
> * QMP command now looks by NetClientState name. Other devices will need
>    to implement it's way to enable vdpa.
> * Rename QMP command to set, so it looks more like a way of working
> * Better use of qemu error system
> * Make a few assertions proper error-handling paths.
> * Add more documentation
> * Less coupling of virtio / vhost, that could cause friction on changes
> * Addressed many other small comments and small fixes.
>
> Changes from v3 RFC:
>    * Move everything to vhost-vdpa backend. A big change, this allowed
>      some cleanup but more code has been added in other places.
>    * More use of glib utilities, especially to manage memory.
> v3 link:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032.html
>
> Changes from v2 RFC:
>    * Adding vhost-vdpa devices support
>    * Fixed some memory leaks pointed by different comments
> v2 link:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600.html
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
> v1 link:
> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
>
> Eugenio Pérez (20):
>        virtio: Add VIRTIO_F_QUEUE_STATE
>        virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>        virtio: Add virtio_queue_is_host_notifier_enabled
>        vhost: Make vhost_virtqueue_{start,stop} public
>        vhost: Add x-vhost-enable-shadow-vq qmp
>        vhost: Add VhostShadowVirtqueue
>        vdpa: Register vdpa devices in a list
>        vhost: Route guest->host notification through shadow virtqueue
>        Add vhost_svq_get_svq_call_notifier
>        Add vhost_svq_set_guest_call_notifier
>        vdpa: Save call_fd in vhost-vdpa
>        vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>        vhost: Route host->guest notification through shadow virtqueue
>        virtio: Add vhost_shadow_vq_get_vring_addr
>        vdpa: Save host and guest features
>        vhost: Add vhost_svq_valid_device_features to shadow vq
>        vhost: Shadow virtqueue buffers forwarding
>        vhost: Add VhostIOVATree
>        vhost: Use a tree to store memory mappings
>        vdpa: Add custom IOTLB translations to SVQ
>
> Eugenio Pérez (26):
>    util: Make some iova_tree parameters const
>    vhost: Fix last queue index of devices with no cvq
>    virtio: Add VIRTIO_F_QUEUE_STATE
>    virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>    vhost: Add x-vhost-set-shadow-vq qmp
>    vhost: Add VhostShadowVirtqueue
>    vdpa: Save kick_fd in vhost-vdpa
>    vdpa: Add vhost_svq_get_dev_kick_notifier
>    vdpa: Add vhost_svq_set_svq_kick_fd
>    vhost: Add Shadow VirtQueue kick forwarding capabilities
>    vhost: Handle host notifiers in SVQ
>    vhost: Route guest->host notification through shadow virtqueue
>    Add vhost_svq_get_svq_call_notifier
>    Add vhost_svq_set_guest_call_notifier
>    vdpa: Save call_fd in vhost-vdpa
>    vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>    vhost: Route host->guest notification through shadow virtqueue
>    virtio: Add vhost_shadow_vq_get_vring_addr
>    vdpa: ack VIRTIO_F_QUEUE_STATE if device supports it
>    vhost: Add vhost_svq_valid_device_features to shadow vq
>    vhost: Add vhost_svq_valid_guest_features to shadow vq
>    vhost: Shadow virtqueue buffers forwarding
>    util: Add iova_tree_alloc
>    vhost: Add VhostIOVATree
>    vhost: Use a tree to store memory mappings
>    vdpa: Add custom IOTLB translations to SVQ
>
>   qapi/net.json                                 |  20 +
>   hw/virtio/vhost-iova-tree.h                   |  27 +
>   hw/virtio/vhost-shadow-virtqueue.h            |  44 ++
>   hw/virtio/virtio-pci.h                        |   1 +
>   include/hw/virtio/vhost-vdpa.h                |  12 +
>   include/hw/virtio/virtio.h                    |   4 +-
>   include/qemu/iova-tree.h                      |  25 +-
>   .../standard-headers/linux/virtio_config.h    |   5 +
>   include/standard-headers/linux/virtio_pci.h   |   2 +
>   hw/i386/intel_iommu.c                         |   2 +-
>   hw/net/vhost_net.c                            |   2 +-
>   hw/net/virtio-net.c                           |   6 +-
>   hw/virtio/vhost-iova-tree.c                   | 157 ++++
>   hw/virtio/vhost-shadow-virtqueue.c            | 746 ++++++++++++++++++
>   hw/virtio/vhost-vdpa.c                        | 437 +++++++++-
>   hw/virtio/virtio-pci.c                        |  16 +-
>   net/vhost-vdpa.c                              |  28 +
>   util/iova-tree.c                              | 151 +++-
>   hw/virtio/meson.build                         |   2 +-
>   19 files changed, 1664 insertions(+), 23 deletions(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>


