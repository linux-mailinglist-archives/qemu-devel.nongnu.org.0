Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062EE4C640E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 08:49:46 +0100 (CET)
Received: from localhost ([::1]:59114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOamv-0008V2-4S
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 02:49:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOafP-0004NT-8j
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nOafM-0005CK-74
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 02:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646034115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hkmoZQ5q7SLEYUDc8VdEbUe5c/wRT7pvO2HSaQx/X1M=;
 b=VeRJ1McK1taRU4/wSHFwFesgD1XCqqSBu58nYyFw3bNq01MQ7gkZ4FZkdW73VRDhfP4UCV
 XWt0zsFjeOf4gmptz+sAygdmsC6Tl6mSrtj2HShKaONtm3wURj1TNEk3YGPBY3ly7puWP2
 8u+QTW+oXxJ/8fxDwVSM8P6a/BAmB6M=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-MFjw_i-DOkC3b8bkT4qbfg-1; Mon, 28 Feb 2022 02:41:51 -0500
X-MC-Unique: MFjw_i-DOkC3b8bkT4qbfg-1
Received: by mail-pj1-f71.google.com with SMTP id
 t7-20020a17090a3b4700b001bc366c58faso10903739pjf.4
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 23:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hkmoZQ5q7SLEYUDc8VdEbUe5c/wRT7pvO2HSaQx/X1M=;
 b=S/wwo3ugOfcSPLZGqps5SSzN9E49FzJNiwL2AW7FerxHWhaiPhV+vO31qi5H5IqNMC
 QhSKrTyuCbgYUCgC9FywmKT1tZmZH9vDnLTi/BfcCwhgaqilkDMhfPkZ5S1DeI5HVEDL
 YxNPyVbkLsFRGBDRaLAbMMRyJSczihyvHWCv3BDCjWgnxUvKosirUL/G3rdPNRnSQG7I
 daM0do++liv3LDHDTshlgiz8Ob/r2Z7rbnr+/Z2I51UmFSn0rmN2XHrABVKkd0zo6VRQ
 DBAsoPfEQgfjEKx5qU/fkzkm0kDPOPNnmUfFjBPmi1IxK8MwK0EYYOzBdqg5BGbSvZsH
 Q89Q==
X-Gm-Message-State: AOAM5333SOVei8vZE1cXRsEYfyv294vNAMHGbE84a+L1MFTuaP0LaIEv
 aiIRSWmEreWNB0/4CZ3LitQXy00q+YIen6Tl7plSLgZxOTf4rMrmvlJRvMMD40OS9M+W7lgBL6L
 g/8XGHf1kOokWpc4=
X-Received: by 2002:a05:6a00:21c7:b0:4e1:dba1:a3a6 with SMTP id
 t7-20020a056a0021c700b004e1dba1a3a6mr20287064pfj.59.1646034108923; 
 Sun, 27 Feb 2022 23:41:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDPs+oT2GoHpXgsVtxxj6DgK7J3krCf3LI4Gyyhv+8m2yJ0lGGMwFxdOeHlPbR6HSdZ+yruA==
X-Received: by 2002:a05:6a00:21c7:b0:4e1:dba1:a3a6 with SMTP id
 t7-20020a056a0021c700b004e1dba1a3a6mr20287043pfj.59.1646034108624; 
 Sun, 27 Feb 2022 23:41:48 -0800 (PST)
Received: from [10.72.13.215] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a655b47000000b00373ec9fcb06sm9526795pgr.27.2022.02.27.23.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 23:41:47 -0800 (PST)
Message-ID: <f3d826e8-e157-7aac-cc8d-868a95b45e78@redhat.com>
Date: Mon, 28 Feb 2022 15:41:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 00/14] vDPA shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220227134111.3254066-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220227134111.3254066-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/27 下午9:40, Eugenio Pérez 写道:
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
> tracked.
>
> This effectively means that vDPA device passthrough is intercepted by
> qemu. While SVQ should only be enabled at migration time, the switching
> from regular mode to SVQ mode is left for a future series.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> not map the shadow vq in guest's VA, but in qemu's.
>
> For qemu to use shadow virtqueues the guest virtio driver must not use
> features like event_idx, indirect descriptors, packed and in_order.
> These features are easy to implement on top of this base, but is left
> for a future series for simplicity.
>
> SVQ needs to be enabled at qemu start time with vdpa cmdline parameter:
>
> -netdev type=vhost-vdpa,vhostdev=vhost-vdpa-0,id=vhost-vdpa0,x-svq=off
>
> The first three patches enables notifications forwarding with
> assistance of qemu. It's easy to enable only this if the relevant
> cmdline part of the last patch is applied on top of these.
>
> Next four patches implement the actual buffer forwarding. However,
> address are not translated from HVA so they will need a host device with
> an iommu allowing them to access all of the HVA range.
>
> The last part of the series uses properly the host iommu, so qemu
> creates a new iova address space in the device's range and translates
> the buffers in it. Finally, it adds the cmdline parameter.
>
> Some simple performance tests with netperf were done. They used a nested
> guest with vp_vdpa, vhost-kernel at L0 host. Starting with no svq and a
> baseline average of ~9980.13Mbps:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    30.01    9910.61
> 131072  16384  16384    30.00    10030.94
> 131072  16384  16384    30.01    9998.84
>
> To enable the notifications interception reduced performance to an
> average of ~9577.73Mbit/s:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    30.00    9563.03
> 131072  16384  16384    30.01    9626.65
> 131072  16384  16384    30.01    9543.51
>
> Finally, to enable buffers forwarding reduced the throughput again to
> ~8902.92Mbit/s:
> Recv   Send    Send
> Socket Socket  Message  Elapsed
> Size   Size    Size     Time     Throughput
> bytes  bytes   bytes    secs.    10^6bits/sec
>
> 131072  16384  16384    30.01    8643.19
> 131072  16384  16384    30.01    9033.56
> 131072  16384  16384    30.01    9032.02
>
> However, many performance improvements were left out of this series for
> simplicity, so difference if performance should shrink in the future.
>
> Comments are welcome.


The series looks good overall, few comments in the individual patch.

I think if there's no objection, we can try to make it 7.0. (soft-freeze 
is 2022-03-08)

Thanks


>
> TODO in future series:
> * Event, indirect, packed, and others features of virtio.
> * To support different set of features between the device<->SVQ and the
>    SVQ<->guest communication.
> * Support of device host notifier memory regions.
> * To sepparate buffers forwarding in its own AIO context, so we can
>    throw more threads to that task and we don't need to stop the main
>    event loop.
> * Support multiqueue virtio-net vdpa.
> * Proper documentation.
>
> Changes from v1:
> * Feature set at device->SVQ is now the same as SVQ->guest.
> * Size of SVQ is not max available device size anymore, but guest's
>    negotiated.
> * Add VHOST_FILE_UNBIND kick and call fd treatment.
> * Make SVQ a public struct
> * Come back to previous approach to iova-tree
> * Some assertions are now fail paths. Some errors are now log_guest.
> * Only mask _F_LOG feature at vdpa_set_features svq enable path.
> * Refactor some errors and messages. Add missing error unwindings.
> * Add memory barrier at _F_NO_NOTIFY set.
> * Stop checking for features flags out of transport range.
> v1 link:
> https://lore.kernel.org/virtualization/7d86c715-6d71-8a27-91f5-8d47b71e3201@redhat.com/
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
> Eugenio Pérez (14):
>    vhost: Add VhostShadowVirtqueue
>    vhost: Add Shadow VirtQueue kick forwarding capabilities
>    vhost: Add Shadow VirtQueue call forwarding capabilities
>    vhost: Add vhost_svq_valid_features to shadow vq
>    virtio: Add vhost_shadow_vq_get_vring_addr
>    vdpa: adapt vhost_ops callbacks to svq
>    vhost: Shadow virtqueue buffers forwarding
>    util: Add iova_tree_alloc
>    vhost: Add VhostIOVATree
>    vdpa: Add custom IOTLB translations to SVQ
>    vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
>    vdpa: Never set log_base addr if SVQ is enabled
>    vdpa: Expose VHOST_F_LOG_ALL on SVQ
>    vdpa: Add x-svq to NetdevVhostVDPAOptions
>
>   qapi/net.json                      |   5 +-
>   hw/virtio/vhost-iova-tree.h        |  27 ++
>   hw/virtio/vhost-shadow-virtqueue.h |  90 ++++
>   include/hw/virtio/vhost-vdpa.h     |   8 +
>   include/qemu/iova-tree.h           |  18 +
>   hw/virtio/vhost-iova-tree.c        | 155 +++++++
>   hw/virtio/vhost-shadow-virtqueue.c | 632 +++++++++++++++++++++++++++++
>   hw/virtio/vhost-vdpa.c             | 551 ++++++++++++++++++++++++-
>   net/vhost-vdpa.c                   |  48 ++-
>   util/iova-tree.c                   | 133 ++++++
>   hw/virtio/meson.build              |   2 +-
>   11 files changed, 1644 insertions(+), 25 deletions(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>


