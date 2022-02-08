Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8904B4AD46B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:11:43 +0100 (CET)
Received: from localhost ([::1]:47148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHMXG-00055m-LX
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:11:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLqz-0002Dt-V4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:28:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLqw-0002yB-Rg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:28:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644308878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i1ub9xr/QwA4MhJV+FioBawD7/GrfPqiQxLzRBzhsSs=;
 b=CJJUmgY7vek4jvzqB2haBYcJbugc65c4JRXFTILmtzZPIIufzsDCLMly154FbuBSCz1U0U
 WGX+bqrST78dXbuYAODMf80okTPQH2taVQBQk3Z9A4AzlusbXUoi5vG4h3LjPsu/yBWAg4
 pLdUGaMa9QsNbntoF2WzyGeYv/fBfn8=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-JfhL699OPiGmI7cWL7IriQ-1; Tue, 08 Feb 2022 03:27:54 -0500
X-MC-Unique: JfhL699OPiGmI7cWL7IriQ-1
Received: by mail-pf1-f199.google.com with SMTP id
 b11-20020aa7950b000000b004df185959c4so6987876pfp.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i1ub9xr/QwA4MhJV+FioBawD7/GrfPqiQxLzRBzhsSs=;
 b=L+rBjKCO1e/jdLWt9FDMtH899U1sCg8ljp38GPP1Yq+x7OXwxOKLDZqRvh/7usP6T0
 w/tzcfGeTvWnsmgUis/PcmMl7yrsxXA07gkVn3/ujGDTCnc9tqdow1nty8+Y+snt7beW
 KdkmMUA7pCA24DdKB8j57AGKNhrJ4g2l/xuslkJViroXL02MGMR+8DsmWXYVokeoIJHc
 ZLZIfkJ6ECj0SfPWoAmE77m1IDP66xETHi34xZVUrDjqyQ7RiXy0TqM8XK4EkJZrYvTw
 FHlJbyLPNGNTntxFILZrf9OG89uDcAePtSPdJdLsI+XXAlorYx5K0MvlAxu8Iy4xGk2l
 HKgw==
X-Gm-Message-State: AOAM530UZHeNoFfesCEoX93aynXFEWMNDd9ZGjiKmx7mCsPo1SszPsEm
 FHJWvulLj0v06IVJM5WQoQfzKnK/q5JDdIPEpRgf4LbV45XLXPuDKjohLZ9i/5dbgDfslylUdIA
 7R8astpSA2DgJ6kw=
X-Received: by 2002:a17:902:f68a:: with SMTP id
 l10mr3489645plg.146.1644308872669; 
 Tue, 08 Feb 2022 00:27:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpy3xwX9tx9I3wRAwY9kln8W9qHfGjeT7shrOFQnY9sFs9u6bR7EvCTCIWyfnHFjWUf3u30w==
X-Received: by 2002:a17:902:f68a:: with SMTP id
 l10mr3489603plg.146.1644308872240; 
 Tue, 08 Feb 2022 00:27:52 -0800 (PST)
Received: from [10.72.13.12] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id md9sm1840360pjb.6.2022.02.08.00.27.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:27:51 -0800 (PST)
Message-ID: <a389cbf9-3ca4-680b-67b5-441f1811683c@redhat.com>
Date: Tue, 8 Feb 2022 16:27:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 00/31] vDPA shadow virtqueue
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <7d86c715-6d71-8a27-91f5-8d47b71e3201@redhat.com>
 <CAJaqyWfWxQSJc3YMpF6g7VwZBN_ab0Z+1nXgWH1sg+uBaOYgBQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWfWxQSJc3YMpF6g7VwZBN_ab0Z+1nXgWH1sg+uBaOYgBQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/31 下午5:15, Eugenio Perez Martin 写道:
> On Fri, Jan 28, 2022 at 7:02 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/1/22 上午4:27, Eugenio Pérez 写道:
>>> This series enables shadow virtqueue (SVQ) for vhost-vdpa devices. This
>>> is intended as a new method of tracking the memory the devices touch
>>> during a migration process: Instead of relay on vhost device's dirty
>>> logging capability, SVQ intercepts the VQ dataplane forwarding the
>>> descriptors between VM and device. This way qemu is the effective
>>> writer of guests memory, like in qemu's emulated virtio device
>>> operation.
>>>
>>> When SVQ is enabled qemu offers a new virtual address space to the
>>> device to read and write into, and it maps new vrings and the guest
>>> memory in it. SVQ also intercepts kicks and calls between the device
>>> and the guest. Used buffers relay would cause dirty memory being
>>> tracked, but at this RFC SVQ is not enabled on migration automatically.
>>>
>>> Thanks of being a buffers relay system, SVQ can be used also to
>>> communicate devices and drivers with different capabilities, like
>>> devices that only support packed vring and not split and old guests with
>>> no driver packed support.
>>>
>>> It is based on the ideas of DPDK SW assisted LM, in the series of
>>> DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
>>> not map the shadow vq in guest's VA, but in qemu's.
>>>
>>> This version of SVQ is limited in the amount of features it can use with
>>> guest and device, because this series is already very big otherwise.
>>> Features like indirect or event_idx will be addressed in future series.
>>>
>>> SVQ needs to be enabled with cmdline parameter x-svq, like:
>>>
>>> -netdev type=vhost-vdpa,vhostdev=/dev/vhost-vdpa-0,id=vhost-vdpa0,x-svq=true
>>>
>>> In this version it cannot be enabled or disabled in runtime. Further
>>> series will remove this limitation and will enable it only for migration
>>> time.
>>>
>>> Some patches are intentionally very small to ease review, but they can
>>> be squashed if preferred.
>>>
>>> Patches 1-10 prepares the SVQ and QEMU to support both guest to device
>>> and device to guest notifications forwarding, with the extra qemu hop.
>>> That part can be tested in isolation if cmdline change is reproduced.
>>>
>>> Patches from 11 to 18 implement the actual buffer forwarding, but with
>>> no IOMMU support. It requires a vdpa device capable of addressing all
>>> qemu vaddr.
>>>
>>> Patches 19 to 23 adds the iommu support, so the device with address
>>> range limitations can access SVQ through this new virtual address space
>>> created.
>>>
>>> The rest of the series add the last pieces needed for migration.
>>>
>>> Comments are welcome.
>>
>> I wonder the performance impact. So performance numbers are more than
>> welcomed.
>>
> Sure, I'll do it for the next revision. Since this one brings a decent
> amount of changes, I chose to collect the feedback first.


A simple single TCP_STREAM netperf test should be sufficient to give 
some basic understanding about the performance impact.

Thanks


>
> Thanks!
>
>> Thanks
>>
>>
>>> TODO:
>>> * Event, indirect, packed, and other features of virtio.
>>> * To separate buffers forwarding in its own AIO context, so we can
>>>     throw more threads to that task and we don't need to stop the main
>>>     event loop.
>>> * Support virtio-net control vq.
>>> * Proper documentation.
>>>
>>> Changes from v5 RFC:
>>> * Remove dynamic enablement of SVQ, making less dependent of the device.
>>> * Enable live migration if SVQ is enabled.
>>> * Fix SVQ when driver reset.
>>> * Comments addressed, specially in the iova area.
>>> * Rebase on latest master, adding multiqueue support (but no networking
>>>     control vq processing).
>>> v5 link:
>>> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg07250.html
>>>
>>> Changes from v4 RFC:
>>> * Support of allocating / freeing iova ranges in IOVA tree. Extending
>>>     already present iova-tree for that.
>>> * Proper validation of guest features. Now SVQ can negotiate a
>>>     different set of features with the device when enabled.
>>> * Support of host notifiers memory regions
>>> * Handling of SVQ full queue in case guest's descriptors span to
>>>     different memory regions (qemu's VA chunks).
>>> * Flush pending used buffers at end of SVQ operation.
>>> * QMP command now looks by NetClientState name. Other devices will need
>>>     to implement it's way to enable vdpa.
>>> * Rename QMP command to set, so it looks more like a way of working
>>> * Better use of qemu error system
>>> * Make a few assertions proper error-handling paths.
>>> * Add more documentation
>>> * Less coupling of virtio / vhost, that could cause friction on changes
>>> * Addressed many other small comments and small fixes.
>>>
>>> Changes from v3 RFC:
>>>     * Move everything to vhost-vdpa backend. A big change, this allowed
>>>       some cleanup but more code has been added in other places.
>>>     * More use of glib utilities, especially to manage memory.
>>> v3 link:
>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032.html
>>>
>>> Changes from v2 RFC:
>>>     * Adding vhost-vdpa devices support
>>>     * Fixed some memory leaks pointed by different comments
>>> v2 link:
>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600.html
>>>
>>> Changes from v1 RFC:
>>>     * Use QMP instead of migration to start SVQ mode.
>>>     * Only accepting IOMMU devices, closer behavior with target devices
>>>       (vDPA)
>>>     * Fix invalid masking/unmasking of vhost call fd.
>>>     * Use of proper methods for synchronization.
>>>     * No need to modify VirtIO device code, all of the changes are
>>>       contained in vhost code.
>>>     * Delete superfluous code.
>>>     * An intermediate RFC was sent with only the notifications forwarding
>>>       changes. It can be seen in
>>>       https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.com/
>>> v1 link:
>>> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
>>>
>>> Eugenio Pérez (20):
>>>         virtio: Add VIRTIO_F_QUEUE_STATE
>>>         virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
>>>         virtio: Add virtio_queue_is_host_notifier_enabled
>>>         vhost: Make vhost_virtqueue_{start,stop} public
>>>         vhost: Add x-vhost-enable-shadow-vq qmp
>>>         vhost: Add VhostShadowVirtqueue
>>>         vdpa: Register vdpa devices in a list
>>>         vhost: Route guest->host notification through shadow virtqueue
>>>         Add vhost_svq_get_svq_call_notifier
>>>         Add vhost_svq_set_guest_call_notifier
>>>         vdpa: Save call_fd in vhost-vdpa
>>>         vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>>>         vhost: Route host->guest notification through shadow virtqueue
>>>         virtio: Add vhost_shadow_vq_get_vring_addr
>>>         vdpa: Save host and guest features
>>>         vhost: Add vhost_svq_valid_device_features to shadow vq
>>>         vhost: Shadow virtqueue buffers forwarding
>>>         vhost: Add VhostIOVATree
>>>         vhost: Use a tree to store memory mappings
>>>         vdpa: Add custom IOTLB translations to SVQ
>>>
>>> Eugenio Pérez (31):
>>>     vdpa: Reorder virtio/vhost-vdpa.c functions
>>>     vhost: Add VhostShadowVirtqueue
>>>     vdpa: Add vhost_svq_get_dev_kick_notifier
>>>     vdpa: Add vhost_svq_set_svq_kick_fd
>>>     vhost: Add Shadow VirtQueue kick forwarding capabilities
>>>     vhost: Route guest->host notification through shadow virtqueue
>>>     vhost: dd vhost_svq_get_svq_call_notifier
>>>     vhost: Add vhost_svq_set_guest_call_notifier
>>>     vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
>>>     vhost: Route host->guest notification through shadow virtqueue
>>>     vhost: Add vhost_svq_valid_device_features to shadow vq
>>>     vhost: Add vhost_svq_valid_guest_features to shadow vq
>>>     vhost: Add vhost_svq_ack_guest_features to shadow vq
>>>     virtio: Add vhost_shadow_vq_get_vring_addr
>>>     vdpa: Add vhost_svq_get_num
>>>     vhost: pass queue index to vhost_vq_get_addr
>>>     vdpa: adapt vhost_ops callbacks to svq
>>>     vhost: Shadow virtqueue buffers forwarding
>>>     utils: Add internal DMAMap to iova-tree
>>>     util: Store DMA entries in a list
>>>     util: Add iova_tree_alloc
>>>     vhost: Add VhostIOVATree
>>>     vdpa: Add custom IOTLB translations to SVQ
>>>     vhost: Add vhost_svq_get_last_used_idx
>>>     vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
>>>     vdpa: Clear VHOST_VRING_F_LOG at vhost_vdpa_set_vring_addr in SVQ
>>>     vdpa: Never set log_base addr if SVQ is enabled
>>>     vdpa: Expose VHOST_F_LOG_ALL on SVQ
>>>     vdpa: Make ncs autofree
>>>     vdpa: Move vhost_vdpa_get_iova_range to net/vhost-vdpa.c
>>>     vdpa: Add x-svq to NetdevVhostVDPAOptions
>>>
>>>    qapi/net.json                      |   5 +-
>>>    hw/virtio/vhost-iova-tree.h        |  27 +
>>>    hw/virtio/vhost-shadow-virtqueue.h |  46 ++
>>>    include/hw/virtio/vhost-vdpa.h     |   7 +
>>>    include/qemu/iova-tree.h           |  17 +
>>>    hw/virtio/vhost-iova-tree.c        | 157 ++++++
>>>    hw/virtio/vhost-shadow-virtqueue.c | 761 +++++++++++++++++++++++++++++
>>>    hw/virtio/vhost-vdpa.c             | 740 ++++++++++++++++++++++++----
>>>    hw/virtio/vhost.c                  |   6 +-
>>>    net/vhost-vdpa.c                   |  58 ++-
>>>    util/iova-tree.c                   | 161 +++++-
>>>    hw/virtio/meson.build              |   2 +-
>>>    12 files changed, 1852 insertions(+), 135 deletions(-)
>>>    create mode 100644 hw/virtio/vhost-iova-tree.h
>>>    create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
>>>    create mode 100644 hw/virtio/vhost-iova-tree.c
>>>    create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
>>>


