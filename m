Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 046814D1151
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:52:53 +0100 (CET)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUeK-000467-3h
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:52:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRUMg-0001X5-3x
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRUMd-0008CD-Lt
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646724874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfKE5Kp7qwEgqHd/rfsj2BcHX1IWW69+V0DA8sWS2/s=;
 b=aRp7P1SD/LUDrx/M70fCLakBbI4YRJE8eIPQqNeselaWYgc7NrNbxJ5WoEwd1Rk1PFiyz0
 JW+SazDC7xTl7S5gCs1pTpLFM5XqyVwAOFLkgo2Wz0OW5nV0DqnnCSrFekXuV4vFspMN95
 jOdv7gWeQvYZ/YLokEuWw73L6ElR8N0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-T65b1JtTMcS2h3HEXbokvw-1; Tue, 08 Mar 2022 02:34:31 -0500
X-MC-Unique: T65b1JtTMcS2h3HEXbokvw-1
Received: by mail-lj1-f200.google.com with SMTP id
 20-20020a2e0914000000b0024635d136ddso7468728ljj.22
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dfKE5Kp7qwEgqHd/rfsj2BcHX1IWW69+V0DA8sWS2/s=;
 b=45VBUjrk8j21qXdye1pktKdDjEPYGfP+qSnWUiq12oBOEj2s85tvu4IWmFGFKvtXVu
 8D9/MVnrr2jNJASu0M3HqQ48Gqu6Q94TkbfsrRFt9aTD7KT1ujKZugQlj5WZNded8Tx9
 LEGm+t5yqdeDTN54TWR2GXZwT1eiHStIuK+kVNCG6fpyskNRSjgIPy+XHoj/8SoxxjL8
 AGk9fuEydENLHLX7dpOfFHQWopdc5XSvAxJA63sUEGhND663wZ4cDAgPRW4DkHF+/uo5
 yvpxOQg1y4q1cKZ5YS7UURKJiFFXnn8hNN2FZjRtwyp+Z/cfP4SLjNOx4lZMUt7ZvcxQ
 gt4A==
X-Gm-Message-State: AOAM531D7N3t5TRqwkyn+4AoEORAzIUX0zogUEXnxEb5y+PN5vSMryWZ
 4hBXGqjr4Sa+hesKFfsSEERW5dN4AjH0vI6JuuwiUoGueYXTUpaRldIXbIJbTfqt9OhX7bLuOiy
 Y+b/I/z5OIGx/zLG13IYLFI7N4log/Wo=
X-Received: by 2002:a05:6512:3890:b0:448:21bd:28d with SMTP id
 n16-20020a056512389000b0044821bd028dmr9841733lft.376.1646724869601; 
 Mon, 07 Mar 2022 23:34:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweEt8oq3dJWo9keGtJcmLQBKP6tmkQblYJ9WoLzYvOuHGtpuFBBadzif55GpUgMxivqoE/gWxiXR+IWX280Uo=
X-Received: by 2002:a05:6512:3890:b0:448:21bd:28d with SMTP id
 n16-20020a056512389000b0044821bd028dmr9841700lft.376.1646724869192; Mon, 07
 Mar 2022 23:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220308022300-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 8 Mar 2022 15:34:17 +0800
Message-ID: <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 8, 2022 at 3:28 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Mar 08, 2022 at 03:14:35PM +0800, Jason Wang wrote:
> > On Tue, Mar 8, 2022 at 3:11 PM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
> > >
> > > On Tue, Mar 08, 2022 at 02:03:32PM +0800, Jason Wang wrote:
> > > >
> > > > =E5=9C=A8 2022/3/7 =E4=B8=8B=E5=8D=8811:33, Eugenio P=C3=A9rez =E5=
=86=99=E9=81=93:
> > > > > This series enable shadow virtqueue (SVQ) for vhost-vdpa devices.=
 This
> > > > > is intended as a new method of tracking the memory the devices to=
uch
> > > > > during a migration process: Instead of relay on vhost device's di=
rty
> > > > > logging capability, SVQ intercepts the VQ dataplane forwarding th=
e
> > > > > descriptors between VM and device. This way qemu is the effective
> > > > > writer of guests memory, like in qemu's virtio device operation.
> > > > >
> > > > > When SVQ is enabled qemu offers a new virtual address space to th=
e
> > > > > device to read and write into, and it maps new vrings and the gue=
st
> > > > > memory in it. SVQ also intercepts kicks and calls between the dev=
ice
> > > > > and the guest. Used buffers relay would cause dirty memory being
> > > > > tracked.
> > > > >
> > > > > This effectively means that vDPA device passthrough is intercepte=
d by
> > > > > qemu. While SVQ should only be enabled at migration time, the swi=
tching
> > > > > from regular mode to SVQ mode is left for a future series.
> > > > >
> > > > > It is based on the ideas of DPDK SW assisted LM, in the series of
> > > > > DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these d=
oes
> > > > > not map the shadow vq in guest's VA, but in qemu's.
> > > > >
> > > > > For qemu to use shadow virtqueues the guest virtio driver must no=
t use
> > > > > features like event_idx.
> > > > >
> > > > > SVQ needs to be enabled with cmdline:
> > > > >
> > > > > -netdev type=3Dvhost-vdpa,vhostdev=3Dvhost-vdpa-0,id=3Dvhost-vdpa=
0,svq=3Don
> > >
> > > A stable API for an incomplete feature is a problem imho.
> >
> > It should be "x-svq".
>
>
> Well look at patch 15.

It's a bug that needs to be fixed.

>
> > >
> > >
> > > > >
> > > > > The first three patches enables notifications forwarding with
> > > > > assistance of qemu. It's easy to enable only this if the relevant
> > > > > cmdline part of the last patch is applied on top of these.
> > > > >
> > > > > Next four patches implement the actual buffer forwarding. However=
,
> > > > > address are not translated from HVA so they will need a host devi=
ce with
> > > > > an iommu allowing them to access all of the HVA range.
> > > > >
> > > > > The last part of the series uses properly the host iommu, so qemu
> > > > > creates a new iova address space in the device's range and transl=
ates
> > > > > the buffers in it. Finally, it adds the cmdline parameter.
> > > > >
> > > > > Some simple performance tests with netperf were done. They used a=
 nested
> > > > > guest with vp_vdpa, vhost-kernel at L0 host. Starting with no svq=
 and a
> > > > > baseline average of ~9009.96Mbps:
> > > > > Recv   Send    Send
> > > > > Socket Socket  Message  Elapsed
> > > > > Size   Size    Size     Time     Throughput
> > > > > bytes  bytes   bytes    secs.    10^6bits/sec
> > > > > 131072  16384  16384    30.01    9061.03
> > > > > 131072  16384  16384    30.01    8962.94
> > > > > 131072  16384  16384    30.01    9005.92
> > > > >
> > > > > To enable SVQ buffers forwarding reduce throughput to about
> > > > > Recv   Send    Send
> > > > > Socket Socket  Message  Elapsed
> > > > > Size   Size    Size     Time     Throughput
> > > > > bytes  bytes   bytes    secs.    10^6bits/sec
> > > > > 131072  16384  16384    30.01    7689.72
> > > > > 131072  16384  16384    30.00    7752.07
> > > > > 131072  16384  16384    30.01    7750.30
> > > > >
> > > > > However, many performance improvements were left out of this seri=
es for
> > > > > simplicity, so difference should shrink in the future.
> > > > >
> > > > > Comments are welcome.
> > > >
> > > >
> > > > Hi Michael:
> > > >
> > > > What do you think of this series? It looks good to me as a start. T=
he
> > > > feature could only be enabled as a dedicated parameter. If you're o=
k, I'd
> > > > try to make it for 7.0.
> > > >
> > > > Thanks
> > >
> > > Well that's cutting it awfully close, and it's not really useful
> > > at the current stage, is it?
> >
> > This allows vDPA to be migrated when using "x-svq=3Don".
> > But anyhow it's
> > experimental.
>
> it's less experimental than incomplete. It seems pretty clearly not
> the way it will work down the road, we don't want svq involved
> at all times.

Right, but SVQ could be used for other places e.g providing migration
compatibility when the destination lacks some features.

>
> > >
> > > The IOVA trick does not feel complete either.
> >
> > I don't get here. We don't use any IOVA trick as DPDK (it reserve IOVA
> > for shadow vq) did. So we won't suffer from the issues of DPDK.
> >
> > Thanks
>
> Maybe I misundrstand how this all works.
> I refer to all the iova_tree_alloc_map things.

It's a simple IOVA allocater actually. Anything wrong with that?

I'm fine with making it for the future release.

Thanks

>
> > >
> > > >
> > > > >
> > > > > TODO on future series:
> > > > > * Event, indirect, packed, and others features of virtio.
> > > > > * To support different set of features between the device<->SVQ a=
nd the
> > > > >    SVQ<->guest communication.
> > > > > * Support of device host notifier memory regions.
> > > > > * To sepparate buffers forwarding in its own AIO context, so we c=
an
> > > > >    throw more threads to that task and we don't need to stop the =
main
> > > > >    event loop.
> > > > > * Support multiqueue virtio-net vdpa.
> > > > > * Proper documentation.
> > > > >
> > > > > Changes from v4:
> > > > > * Iterate iova->hva tree instead on maintain own tree so we suppo=
rt HVA
> > > > >    overlaps.
> > > > > * Fix: Errno completion at failure.
> > > > > * Rename x-svq to svq, so changes to stable does not affect cmdli=
ne parameter.
> > > > >
> > > > > Changes from v3:
> > > > > * Add @unstable feature to NetdevVhostVDPAOptions.x-svq.
> > > > > * Fix uncomplete mapping (by 1 byte) of memory regions if svq is =
enabled.
> > > > > v3 link:
> > > > > https://lore.kernel.org/qemu-devel/20220302203012.3476835-1-epere=
zma@redhat.com/
> > > > >
> > > > > Changes from v2:
> > > > > * Less assertions and more error handling in iova tree code.
> > > > > * Better documentation, both fixing errors and making @param: for=
mat
> > > > > * Homogeneize SVQ avail_idx_shadow and shadow_used_idx to make sh=
adow a
> > > > >    prefix at both times.
> > > > > * Fix: Fo not use VirtQueueElement->len field, track separatedly.
> > > > > * Split vhost_svq_{enable,disable}_notification, so the code look=
s more
> > > > >    like the kernel driver code.
> > > > > * Small improvements.
> > > > > v2 link:
> > > > > https://lore.kernel.org/all/CAJaqyWfXHE0C54R_-OiwJzjC0gPpkE3eX0L8=
BeeZXGm1ERYPtA@mail.gmail.com/
> > > > >
> > > > > Changes from v1:
> > > > > * Feature set at device->SVQ is now the same as SVQ->guest.
> > > > > * Size of SVQ is not max available device size anymore, but guest=
's
> > > > >    negotiated.
> > > > > * Add VHOST_FILE_UNBIND kick and call fd treatment.
> > > > > * Make SVQ a public struct
> > > > > * Come back to previous approach to iova-tree
> > > > > * Some assertions are now fail paths. Some errors are now log_gue=
st.
> > > > > * Only mask _F_LOG feature at vdpa_set_features svq enable path.
> > > > > * Refactor some errors and messages. Add missing error unwindings=
.
> > > > > * Add memory barrier at _F_NO_NOTIFY set.
> > > > > * Stop checking for features flags out of transport range.
> > > > > v1 link:
> > > > > https://lore.kernel.org/virtualization/7d86c715-6d71-8a27-91f5-8d=
47b71e3201@redhat.com/
> > > > >
> > > > > Changes from v4 RFC:
> > > > > * Support of allocating / freeing iova ranges in IOVA tree. Exten=
ding
> > > > >    already present iova-tree for that.
> > > > > * Proper validation of guest features. Now SVQ can negotiate a
> > > > >    different set of features with the device when enabled.
> > > > > * Support of host notifiers memory regions
> > > > > * Handling of SVQ full queue in case guest's descriptors span to
> > > > >    different memory regions (qemu's VA chunks).
> > > > > * Flush pending used buffers at end of SVQ operation.
> > > > > * QMP command now looks by NetClientState name. Other devices wil=
l need
> > > > >    to implement it's way to enable vdpa.
> > > > > * Rename QMP command to set, so it looks more like a way of worki=
ng
> > > > > * Better use of qemu error system
> > > > > * Make a few assertions proper error-handling paths.
> > > > > * Add more documentation
> > > > > * Less coupling of virtio / vhost, that could cause friction on c=
hanges
> > > > > * Addressed many other small comments and small fixes.
> > > > >
> > > > > Changes from v3 RFC:
> > > > >    * Move everything to vhost-vdpa backend. A big change, this al=
lowed
> > > > >      some cleanup but more code has been added in other places.
> > > > >    * More use of glib utilities, especially to manage memory.
> > > > > v3 link:
> > > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032=
.html
> > > > >
> > > > > Changes from v2 RFC:
> > > > >    * Adding vhost-vdpa devices support
> > > > >    * Fixed some memory leaks pointed by different comments
> > > > > v2 link:
> > > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600=
.html
> > > > >
> > > > > Changes from v1 RFC:
> > > > >    * Use QMP instead of migration to start SVQ mode.
> > > > >    * Only accepting IOMMU devices, closer behavior with target de=
vices
> > > > >      (vDPA)
> > > > >    * Fix invalid masking/unmasking of vhost call fd.
> > > > >    * Use of proper methods for synchronization.
> > > > >    * No need to modify VirtIO device code, all of the changes are
> > > > >      contained in vhost code.
> > > > >    * Delete superfluous code.
> > > > >    * An intermediate RFC was sent with only the notifications for=
warding
> > > > >      changes. It can be seen in
> > > > >      https://patchew.org/QEMU/20210129205415.876290-1-eperezma@re=
dhat.com/
> > > > > v1 link:
> > > > > https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.ht=
ml
> > > > >
> > > > > Eugenio P=C3=A9rez (20):
> > > > >        virtio: Add VIRTIO_F_QUEUE_STATE
> > > > >        virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
> > > > >        virtio: Add virtio_queue_is_host_notifier_enabled
> > > > >        vhost: Make vhost_virtqueue_{start,stop} public
> > > > >        vhost: Add x-vhost-enable-shadow-vq qmp
> > > > >        vhost: Add VhostShadowVirtqueue
> > > > >        vdpa: Register vdpa devices in a list
> > > > >        vhost: Route guest->host notification through shadow virtq=
ueue
> > > > >        Add vhost_svq_get_svq_call_notifier
> > > > >        Add vhost_svq_set_guest_call_notifier
> > > > >        vdpa: Save call_fd in vhost-vdpa
> > > > >        vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_=
call
> > > > >        vhost: Route host->guest notification through shadow virtq=
ueue
> > > > >        virtio: Add vhost_shadow_vq_get_vring_addr
> > > > >        vdpa: Save host and guest features
> > > > >        vhost: Add vhost_svq_valid_device_features to shadow vq
> > > > >        vhost: Shadow virtqueue buffers forwarding
> > > > >        vhost: Add VhostIOVATree
> > > > >        vhost: Use a tree to store memory mappings
> > > > >        vdpa: Add custom IOTLB translations to SVQ
> > > > >
> > > > > Eugenio P=C3=A9rez (15):
> > > > >    vhost: Add VhostShadowVirtqueue
> > > > >    vhost: Add Shadow VirtQueue kick forwarding capabilities
> > > > >    vhost: Add Shadow VirtQueue call forwarding capabilities
> > > > >    vhost: Add vhost_svq_valid_features to shadow vq
> > > > >    virtio: Add vhost_svq_get_vring_addr
> > > > >    vdpa: adapt vhost_ops callbacks to svq
> > > > >    vhost: Shadow virtqueue buffers forwarding
> > > > >    util: Add iova_tree_alloc_map
> > > > >    util: add iova_tree_find_iova
> > > > >    vhost: Add VhostIOVATree
> > > > >    vdpa: Add custom IOTLB translations to SVQ
> > > > >    vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
> > > > >    vdpa: Never set log_base addr if SVQ is enabled
> > > > >    vdpa: Expose VHOST_F_LOG_ALL on SVQ
> > > > >    vdpa: Add x-svq to NetdevVhostVDPAOptions
> > > > >
> > > > >   qapi/net.json                      |   8 +-
> > > > >   hw/virtio/vhost-iova-tree.h        |  27 ++
> > > > >   hw/virtio/vhost-shadow-virtqueue.h |  87 ++++
> > > > >   include/hw/virtio/vhost-vdpa.h     |   8 +
> > > > >   include/qemu/iova-tree.h           |  38 +-
> > > > >   hw/virtio/vhost-iova-tree.c        | 110 +++++
> > > > >   hw/virtio/vhost-shadow-virtqueue.c | 637 ++++++++++++++++++++++=
+++++++
> > > > >   hw/virtio/vhost-vdpa.c             | 525 ++++++++++++++++++++++=
+-
> > > > >   net/vhost-vdpa.c                   |  48 ++-
> > > > >   util/iova-tree.c                   | 169 ++++++++
> > > > >   hw/virtio/meson.build              |   2 +-
> > > > >   11 files changed, 1633 insertions(+), 26 deletions(-)
> > > > >   create mode 100644 hw/virtio/vhost-iova-tree.h
> > > > >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
> > > > >   create mode 100644 hw/virtio/vhost-iova-tree.c
> > > > >   create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
> > > > >
> > >
>


