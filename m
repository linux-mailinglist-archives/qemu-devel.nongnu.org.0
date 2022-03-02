Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F64CB05E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:57:45 +0100 (CET)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPW2a-0003MH-Mu
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVeu-0000N5-Je
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:33:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVes-0002OQ-8w
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646253193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAGT1m5uK9wqYdNMg6g1oXLDerCJAT+FfMphqS7iDhs=;
 b=T6YO9MxMJy1tSd7EEH/55C7IvhTTFE7DVJYdysX77/6RnsE1zbEIciTOfR7q6BO7iPPpOC
 MK1xoRrT3eE79BqyzUM2TfxEYvPN8JMLvqI0wd4fn+EnWqSs5glNu52Vf2n31JTd9t3K4H
 /HjZJm8d3G07zPmG3AGlkxDwcoNFSZ4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-aQ60k1QmPqGHjQub_PfX5w-1; Wed, 02 Mar 2022 15:31:20 -0500
X-MC-Unique: aQ60k1QmPqGHjQub_PfX5w-1
Received: by mail-qk1-f199.google.com with SMTP id
 u12-20020a05620a0c4c00b00475a9324977so1914082qki.13
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wAGT1m5uK9wqYdNMg6g1oXLDerCJAT+FfMphqS7iDhs=;
 b=UTrfo3yLpihG/ze2GjQTcTR0OtkGaGjf0KFDQ5I4GuM3oYoKHkIHOLtI1uxT7I8TrP
 qeRNEFyH5sqNWf37gkxzPgGrO1YkoQrouC+fi46e7v1wFfaBKjs6eTzyUx0dtjkQ5KV6
 NpNLoXxFYHa/LS3Y365/S/GmB01XiBdSDTcf6vEBaasoiCmrupUoSbIwblurGeFvhDpY
 67fw976cni4VChddpIFH6E14uoM8Hw+YhrbCNjd2mDsD2gWli29qsjD4G2f0AOvsp71S
 tq5HChMX3xh3bGtwwPhmFTrBuTi2anykA40HI3xCOdUg5lCGHx/8sSOiCyXZF1AG1pTg
 yBLw==
X-Gm-Message-State: AOAM53083kGlq7w1t0umGCps7lv5UPHygXkodkKElNlubmMlhSYg3kXt
 GNz74MdHVPAmggxjc2dt4TbbGYa0XyESBL2QvMOyK2d7qcTI/fAdrVVVDZFwsr/PKbP7IAUAgti
 EiR9QHnxQKGQE3htk5G8jW82FNf4usX4=
X-Received: by 2002:a05:6214:5293:b0:42c:f749:971d with SMTP id
 kj19-20020a056214529300b0042cf749971dmr21813353qvb.119.1646253080128; 
 Wed, 02 Mar 2022 12:31:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwa/wdR4WMmVZHNIIEdM77GuQ1c7wco+om1ZhImSLz0+ApOvOR17FUpE/iVvmFiir3JauGyxexCmch3fWf1TC8=
X-Received: by 2002:a05:6214:5293:b0:42c:f749:971d with SMTP id
 kj19-20020a056214529300b0042cf749971dmr21813333qvb.119.1646253079848; Wed, 02
 Mar 2022 12:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <f3d826e8-e157-7aac-cc8d-868a95b45e78@redhat.com>
In-Reply-To: <f3d826e8-e157-7aac-cc8d-868a95b45e78@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 2 Mar 2022 21:30:43 +0100
Message-ID: <CAJaqyWdC_t-mO8868Ggd2EwK-iD1UVEOKM5-OYQnyWazVSP-Qg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] vDPA shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
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

On Mon, Feb 28, 2022 at 8:41 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:40, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. This
> > is intended as a new method of tracking the memory the devices touch
> > during a migration process: Instead of relay on vhost device's dirty
> > logging capability, SVQ intercepts the VQ dataplane forwarding the
> > descriptors between VM and device. This way qemu is the effective
> > writer of guests memory, like in qemu's virtio device operation.
> >
> > When SVQ is enabled qemu offers a new virtual address space to the
> > device to read and write into, and it maps new vrings and the guest
> > memory in it. SVQ also intercepts kicks and calls between the device
> > and the guest. Used buffers relay would cause dirty memory being
> > tracked.
> >
> > This effectively means that vDPA device passthrough is intercepted by
> > qemu. While SVQ should only be enabled at migration time, the switching
> > from regular mode to SVQ mode is left for a future series.
> >
> > It is based on the ideas of DPDK SW assisted LM, in the series of
> > DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does
> > not map the shadow vq in guest's VA, but in qemu's.
> >
> > For qemu to use shadow virtqueues the guest virtio driver must not use
> > features like event_idx, indirect descriptors, packed and in_order.
> > These features are easy to implement on top of this base, but is left
> > for a future series for simplicity.
> >
> > SVQ needs to be enabled at qemu start time with vdpa cmdline parameter:
> >
> > -netdev type=3Dvhost-vdpa,vhostdev=3Dvhost-vdpa-0,id=3Dvhost-vdpa0,x-sv=
q=3Doff
> >
> > The first three patches enables notifications forwarding with
> > assistance of qemu. It's easy to enable only this if the relevant
> > cmdline part of the last patch is applied on top of these.
> >
> > Next four patches implement the actual buffer forwarding. However,
> > address are not translated from HVA so they will need a host device wit=
h
> > an iommu allowing them to access all of the HVA range.
> >
> > The last part of the series uses properly the host iommu, so qemu
> > creates a new iova address space in the device's range and translates
> > the buffers in it. Finally, it adds the cmdline parameter.
> >
> > Some simple performance tests with netperf were done. They used a neste=
d
> > guest with vp_vdpa, vhost-kernel at L0 host. Starting with no svq and a
> > baseline average of ~9980.13Mbps:
> > Recv   Send    Send
> > Socket Socket  Message  Elapsed
> > Size   Size    Size     Time     Throughput
> > bytes  bytes   bytes    secs.    10^6bits/sec
> >
> > 131072  16384  16384    30.01    9910.61
> > 131072  16384  16384    30.00    10030.94
> > 131072  16384  16384    30.01    9998.84
> >
> > To enable the notifications interception reduced performance to an
> > average of ~9577.73Mbit/s:
> > Recv   Send    Send
> > Socket Socket  Message  Elapsed
> > Size   Size    Size     Time     Throughput
> > bytes  bytes   bytes    secs.    10^6bits/sec
> >
> > 131072  16384  16384    30.00    9563.03
> > 131072  16384  16384    30.01    9626.65
> > 131072  16384  16384    30.01    9543.51
> >
> > Finally, to enable buffers forwarding reduced the throughput again to
> > ~8902.92Mbit/s:
> > Recv   Send    Send
> > Socket Socket  Message  Elapsed
> > Size   Size    Size     Time     Throughput
> > bytes  bytes   bytes    secs.    10^6bits/sec
> >
> > 131072  16384  16384    30.01    8643.19
> > 131072  16384  16384    30.01    9033.56
> > 131072  16384  16384    30.01    9032.02
> >
> > However, many performance improvements were left out of this series for
> > simplicity, so difference if performance should shrink in the future.
> >
> > Comments are welcome.
>
>
> The series looks good overall, few comments in the individual patch.
>
> I think if there's no objection, we can try to make it 7.0. (soft-freeze
> is 2022-03-08)
>
> Thanks
>

Sending v3 with all the comments we agree, so we can comment on the
new code too. We can ignore it if sending it with the pending comments
is wrong.

Thanks!

>
> >
> > TODO in future series:
> > * Event, indirect, packed, and others features of virtio.
> > * To support different set of features between the device<->SVQ and the
> >    SVQ<->guest communication.
> > * Support of device host notifier memory regions.
> > * To sepparate buffers forwarding in its own AIO context, so we can
> >    throw more threads to that task and we don't need to stop the main
> >    event loop.
> > * Support multiqueue virtio-net vdpa.
> > * Proper documentation.
> >
> > Changes from v1:
> > * Feature set at device->SVQ is now the same as SVQ->guest.
> > * Size of SVQ is not max available device size anymore, but guest's
> >    negotiated.
> > * Add VHOST_FILE_UNBIND kick and call fd treatment.
> > * Make SVQ a public struct
> > * Come back to previous approach to iova-tree
> > * Some assertions are now fail paths. Some errors are now log_guest.
> > * Only mask _F_LOG feature at vdpa_set_features svq enable path.
> > * Refactor some errors and messages. Add missing error unwindings.
> > * Add memory barrier at _F_NO_NOTIFY set.
> > * Stop checking for features flags out of transport range.
> > v1 link:
> > https://lore.kernel.org/virtualization/7d86c715-6d71-8a27-91f5-8d47b71e=
3201@redhat.com/
> >
> > Changes from v4 RFC:
> > * Support of allocating / freeing iova ranges in IOVA tree. Extending
> >    already present iova-tree for that.
> > * Proper validation of guest features. Now SVQ can negotiate a
> >    different set of features with the device when enabled.
> > * Support of host notifiers memory regions
> > * Handling of SVQ full queue in case guest's descriptors span to
> >    different memory regions (qemu's VA chunks).
> > * Flush pending used buffers at end of SVQ operation.
> > * QMP command now looks by NetClientState name. Other devices will need
> >    to implement it's way to enable vdpa.
> > * Rename QMP command to set, so it looks more like a way of working
> > * Better use of qemu error system
> > * Make a few assertions proper error-handling paths.
> > * Add more documentation
> > * Less coupling of virtio / vhost, that could cause friction on changes
> > * Addressed many other small comments and small fixes.
> >
> > Changes from v3 RFC:
> >    * Move everything to vhost-vdpa backend. A big change, this allowed
> >      some cleanup but more code has been added in other places.
> >    * More use of glib utilities, especially to manage memory.
> > v3 link:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032.html
> >
> > Changes from v2 RFC:
> >    * Adding vhost-vdpa devices support
> >    * Fixed some memory leaks pointed by different comments
> > v2 link:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600.html
> >
> > Changes from v1 RFC:
> >    * Use QMP instead of migration to start SVQ mode.
> >    * Only accepting IOMMU devices, closer behavior with target devices
> >      (vDPA)
> >    * Fix invalid masking/unmasking of vhost call fd.
> >    * Use of proper methods for synchronization.
> >    * No need to modify VirtIO device code, all of the changes are
> >      contained in vhost code.
> >    * Delete superfluous code.
> >    * An intermediate RFC was sent with only the notifications forwardin=
g
> >      changes. It can be seen in
> >      https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.c=
om/
> > v1 link:
> > https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html
> >
> > Eugenio P=C3=A9rez (20):
> >        virtio: Add VIRTIO_F_QUEUE_STATE
> >        virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
> >        virtio: Add virtio_queue_is_host_notifier_enabled
> >        vhost: Make vhost_virtqueue_{start,stop} public
> >        vhost: Add x-vhost-enable-shadow-vq qmp
> >        vhost: Add VhostShadowVirtqueue
> >        vdpa: Register vdpa devices in a list
> >        vhost: Route guest->host notification through shadow virtqueue
> >        Add vhost_svq_get_svq_call_notifier
> >        Add vhost_svq_set_guest_call_notifier
> >        vdpa: Save call_fd in vhost-vdpa
> >        vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call
> >        vhost: Route host->guest notification through shadow virtqueue
> >        virtio: Add vhost_shadow_vq_get_vring_addr
> >        vdpa: Save host and guest features
> >        vhost: Add vhost_svq_valid_device_features to shadow vq
> >        vhost: Shadow virtqueue buffers forwarding
> >        vhost: Add VhostIOVATree
> >        vhost: Use a tree to store memory mappings
> >        vdpa: Add custom IOTLB translations to SVQ
> >
> > Eugenio P=C3=A9rez (14):
> >    vhost: Add VhostShadowVirtqueue
> >    vhost: Add Shadow VirtQueue kick forwarding capabilities
> >    vhost: Add Shadow VirtQueue call forwarding capabilities
> >    vhost: Add vhost_svq_valid_features to shadow vq
> >    virtio: Add vhost_shadow_vq_get_vring_addr
> >    vdpa: adapt vhost_ops callbacks to svq
> >    vhost: Shadow virtqueue buffers forwarding
> >    util: Add iova_tree_alloc
> >    vhost: Add VhostIOVATree
> >    vdpa: Add custom IOTLB translations to SVQ
> >    vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
> >    vdpa: Never set log_base addr if SVQ is enabled
> >    vdpa: Expose VHOST_F_LOG_ALL on SVQ
> >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> >
> >   qapi/net.json                      |   5 +-
> >   hw/virtio/vhost-iova-tree.h        |  27 ++
> >   hw/virtio/vhost-shadow-virtqueue.h |  90 ++++
> >   include/hw/virtio/vhost-vdpa.h     |   8 +
> >   include/qemu/iova-tree.h           |  18 +
> >   hw/virtio/vhost-iova-tree.c        | 155 +++++++
> >   hw/virtio/vhost-shadow-virtqueue.c | 632 ++++++++++++++++++++++++++++=
+
> >   hw/virtio/vhost-vdpa.c             | 551 ++++++++++++++++++++++++-
> >   net/vhost-vdpa.c                   |  48 ++-
> >   util/iova-tree.c                   | 133 ++++++
> >   hw/virtio/meson.build              |   2 +-
> >   11 files changed, 1644 insertions(+), 25 deletions(-)
> >   create mode 100644 hw/virtio/vhost-iova-tree.h
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
> >   create mode 100644 hw/virtio/vhost-iova-tree.c
> >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
> >
>


