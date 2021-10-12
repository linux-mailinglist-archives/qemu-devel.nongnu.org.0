Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA3429C28
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 06:02:30 +0200 (CEST)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma8zl-0005ES-Hy
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 00:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8wh-00041u-2K
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ma8we-0004yq-Qf
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 23:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634011154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp5WOmkCyXrQs2s9Tda4X/a/yD46dsVoBz1jueyX69k=;
 b=Rj7N1Kti7Tc8vAmnzoqpOhNyoeYPbqqTblOeVMWmKySHi6l44fNQFO5EPRzHP6BDMY+9ai
 /EXcF/ZThkmX6RKh7OGGoWyqUPLwhxgsuxbKgsgR7FPgV0/HKqESm8SZT36O+hMVGB1j1b
 FcfzS6sTxk031Sou0ZKkNd7N5am855M=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-wBioBkC2OsqBTrawpH8jwQ-1; Mon, 11 Oct 2021 23:59:11 -0400
X-MC-Unique: wBioBkC2OsqBTrawpH8jwQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 d187-20020a6236c4000000b0044cf291bfebso3562471pfa.10
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 20:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Xp5WOmkCyXrQs2s9Tda4X/a/yD46dsVoBz1jueyX69k=;
 b=wliCs7n3Sg6K16dtTiIGehOHK/e8pja2kXF0TSewEgiSMOnBXuSsYdSMogws3HbGMD
 Nr8GldU82LXedaFM6UVP9YEuqGy4/nxL9uC2tvgI5DVpYQz6wuzMxttmFqmWdQJFeXKh
 jT8wGlIL7UvPfddwU1L4lmlQiBS9IcI5D1/fq1pzyOz0KE8M+wDwY9ijFzxlPF2TKp8Q
 so1TGZ6nbEBn00xPf6fpfGcx3YBA25jydE2TXlqQBw2y0x8uvX65WWPBxw2GIW4dhHmm
 PVs8b+FeDSUPDrU+R6Xc3GOPzNgTzBH+K9bshS+vlwd17tznJacAPrCQxeg24B9x4hre
 vTEg==
X-Gm-Message-State: AOAM530BtXHK8PlMCurEhbkKfwhx442BtxboVNEzjsxpZK7dkzzsUmUa
 kHmykCTV7gX6u1cO8HvdhtOpzj7ED9aIy5jBSziVgDQiaCdygMtA6yXJa5SmgAxQgnm06JvQDyW
 kSasbwoloTqks+X0=
X-Received: by 2002:a05:6a00:1801:b0:44c:aab8:a5ba with SMTP id
 y1-20020a056a00180100b0044caab8a5bamr29532897pfa.32.1634011150120; 
 Mon, 11 Oct 2021 20:59:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoXjR29UmFLA4pONA+wlc3dAs3kAuphLvQORih8nL7l4ssZx40sFikDWVLFSYbBjEN+lHGgg==
X-Received: by 2002:a05:6a00:1801:b0:44c:aab8:a5ba with SMTP id
 y1-20020a056a00180100b0044caab8a5bamr29532862pfa.32.1634011149668; 
 Mon, 11 Oct 2021 20:59:09 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p18sm9744096pgk.28.2021.10.11.20.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 20:59:09 -0700 (PDT)
Subject: Re: [RFC PATCH v4 00/20] vDPA shadow virtqueue
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20211001070603.307037-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9f438a35-a5ff-1891-24e6-dd11d1a3bba6@redhat.com>
Date: Tue, 12 Oct 2021 11:59:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211001070603.307037-1-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/10/1 下午3:05, Eugenio Pérez 写道:
> This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. This
> is intended as a new method of tracking the memory the devices touch
> during a migration process: Instead of relay on vhost device's dirty
> logging capability, SVQ intercepts the VQ dataplane forwarding the
> descriptors between VM and device. This way qemu is the effective
> writer of guests memory, like in qemu's virtio device operation.
>
> When SVQ is enabled qemu offers a new vring to the device to read
> and write into, and also intercepts kicks and calls between the device
> and the guest. Used buffers relay would cause dirty memory being
> tracked, but at this RFC SVQ is not enabled on migration automatically.
>
> It is based on the ideas of DPDK SW assisted LM, in the series of
> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> not map the shadow vq in guest's VA, but in qemu's.
>
> For qemu to use shadow virtqueues the guest virtio driver must not use
> features like event_idx or indirect descriptors. These limitations will
> be addressed in later series, but they are left out for simplicity at
> the moment.
>
> SVQ needs to be enabled with QMP command:
>
> { "execute": "x-vhost-enable-shadow-vq",
>        "arguments": { "name": "dev0", "enable": true } }
>
> This series includes some patches to delete in the final version that
> helps with its testing. The first two of the series freely implements
> the feature to stop the device and be able to retrieve its status. It's
> intended to be used with vp_vpda driver in a nested environment. This
> driver also need modifications to forward the new status bit.
>
> Patches 2-8 prepares the SVQ and QMP command to support guest to host
> notifications forwarding. If the SVQ is enabled with these ones
> applied and the device supports it, that part can be tested in
> isolation (for example, with networking), hopping through SVQ.
>
> Same thing is true with patches 9-13, but with device to guest
> notifications.
>
> The rest of the patches implements the actual buffer forwarding.
>
> Comments are welcome.


Hi Eugenio:


It would be helpful to have a public git repo for us to ease the review.

Thanks


>
> TODO:
> * Event, indirect, packed, and others features of virtio - Waiting for
>    confirmation of the big picture.
> * Use already available iova tree to track mappings.
> * To sepparate buffers forwarding in its own AIO context, so we can
>    throw more threads to that task and we don't need to stop the main
>    event loop.
> * unmap iommu memory. Now the tree can only grow from SVQ enable, but
>    it should be fine as long as not a lot of memory is added to the
>    guest.
> * Rebase on top of latest qemu (and, hopefully, on top of multiqueue
>    vdpa).
> * Some assertions need to be appropiate error handling paths.
> * Proper documentation.
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
> Eugenio Pérez (20):
>    virtio: Add VIRTIO_F_QUEUE_STATE
>    virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>    virtio: Add virtio_queue_is_host_notifier_enabled
>    vhost: Make vhost_virtqueue_{start,stop} public
>    vhost: Add x-vhost-enable-shadow-vq qmp
>    vhost: Add VhostShadowVirtqueue
>    vdpa: Register vdpa devices in a list
>    vhost: Route guest->host notification through shadow virtqueue
>    vdpa: Save call_fd in vhost-vdpa
>    vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>    vhost: Route host->guest notification through shadow virtqueue
>    virtio: Add vhost_shadow_vq_get_vring_addr
>    vdpa: Save host and guest features
>    vhost: Add vhost_svq_valid_device_features to shadow vq
>    vhost: Shadow virtqueue buffers forwarding
>    vhost: Check for device VRING_USED_F_NO_NOTIFY at shadow virtqueue
>      kick
>    vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call on shadow
>      virtqueue
>    vhost: Add VhostIOVATree
>    vhost: Use a tree to store memory mappings
>    vdpa: Add custom IOTLB translations to SVQ
>
>   qapi/net.json                                 |  23 +
>   hw/virtio/vhost-iova-tree.h                   |  40 ++
>   hw/virtio/vhost-shadow-virtqueue.h            |  37 ++
>   hw/virtio/virtio-pci.h                        |   1 +
>   include/hw/virtio/vhost-vdpa.h                |  13 +
>   include/hw/virtio/vhost.h                     |   4 +
>   include/hw/virtio/virtio.h                    |   5 +-
>   .../standard-headers/linux/virtio_config.h    |   5 +
>   include/standard-headers/linux/virtio_pci.h   |   2 +
>   hw/net/virtio-net.c                           |   6 +-
>   hw/virtio/vhost-iova-tree.c                   | 230 +++++++
>   hw/virtio/vhost-shadow-virtqueue.c            | 619 ++++++++++++++++++
>   hw/virtio/vhost-vdpa.c                        | 412 +++++++++++-
>   hw/virtio/vhost.c                             |  12 +-
>   hw/virtio/virtio-pci.c                        |  16 +-
>   hw/virtio/virtio.c                            |   5 +
>   hw/virtio/meson.build                         |   2 +-
>   hw/virtio/trace-events                        |   1 +
>   18 files changed, 1413 insertions(+), 20 deletions(-)
>   create mode 100644 hw/virtio/vhost-iova-tree.h
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>   create mode 100644 hw/virtio/vhost-iova-tree.c
>   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>


