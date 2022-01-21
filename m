Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E649666B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:40:40 +0100 (CET)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0i7-0005Sj-Id
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:40:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Yz-0005PW-UM
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0Xx-0002th-PA
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mtJ2lQG+TD2w0EqbSmIiPUmtWsafD0knITLkJwIc8WQ=;
 b=fiMPEvwQ3SlRBM//5c/wNB/SorYEchY6ysi6IoIjUKW3vUbeGcLG2oh7OrXUDjmJexUrHw
 o+QA6ZpO0ay69qqusrh0Lf2N+l8sOschp/0nqVmBfrquc5ggYWwmgpeEN2wy0Uz6lg8dzn
 fNULFnuULR/LoZkHCA2C+WgWG+nXXuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-NEwJe34zOISBQDgSZK5kBw-1; Fri, 21 Jan 2022 15:28:52 -0500
X-MC-Unique: NEwJe34zOISBQDgSZK5kBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F55F92500;
 Fri, 21 Jan 2022 20:28:50 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10999E2C8;
 Fri, 21 Jan 2022 20:27:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/31] vDPA shadow virtqueue
Date: Fri, 21 Jan 2022 21:27:02 +0100
Message-Id: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enables shadow virtqueue (SVQ) for vhost-vdpa devices. This=0D
is intended as a new method of tracking the memory the devices touch=0D
during a migration process: Instead of relay on vhost device's dirty=0D
logging capability, SVQ intercepts the VQ dataplane forwarding the=0D
descriptors between VM and device. This way qemu is the effective=0D
writer of guests memory, like in qemu's emulated virtio device=0D
operation.=0D
=0D
When SVQ is enabled qemu offers a new virtual address space to the=0D
device to read and write into, and it maps new vrings and the guest=0D
memory in it. SVQ also intercepts kicks and calls between the device=0D
and the guest. Used buffers relay would cause dirty memory being=0D
tracked, but at this RFC SVQ is not enabled on migration automatically.=0D
=0D
Thanks of being a buffers relay system, SVQ can be used also to=0D
communicate devices and drivers with different capabilities, like=0D
devices that only support packed vring and not split and old guests with=0D
no driver packed support.=0D
=0D
It is based on the ideas of DPDK SW assisted LM, in the series of=0D
DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does=0D
not map the shadow vq in guest's VA, but in qemu's.=0D
=0D
This version of SVQ is limited in the amount of features it can use with=0D
guest and device, because this series is already very big otherwise.=0D
Features like indirect or event_idx will be addressed in future series.=0D
=0D
SVQ needs to be enabled with cmdline parameter x-svq, like:=0D
=0D
-netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdpa0,x-s=
vq=3Dtrue=0D
=0D
In this version it cannot be enabled or disabled in runtime. Further=0D
series will remove this limitation and will enable it only for migration=0D
time.=0D
=0D
Some patches are intentionally very small to ease review, but they can=0D
be squashed if preferred.=0D
=0D
Patches 1-10 prepares the SVQ and QEMU to support both guest to device=0D
and device to guest notifications forwarding, with the extra qemu hop.=0D
That part can be tested in isolation if cmdline change is reproduced.=0D
=0D
Patches from 11 to 18 implement the actual buffer forwarding, but with=0D
no IOMMU support. It requires a vdpa device capable of addressing all=0D
qemu vaddr.=0D
=0D
Patches 19 to 23 adds the iommu support, so the device with address=0D
range limitations can access SVQ through this new virtual address space=0D
created.=0D
=0D
The rest of the series add the last pieces needed for migration.=0D
=0D
Comments are welcome.=0D
=0D
TODO:=0D
* Event, indirect, packed, and other features of virtio.=0D
* To separate buffers forwarding in its own AIO context, so we can=0D
  throw more threads to that task and we don't need to stop the main=0D
  event loop.=0D
* Support virtio-net control vq.=0D
* Proper documentation.=0D
=0D
Changes from v5 RFC:=0D
* Remove dynamic enablement of SVQ, making less dependent of the device.=0D
* Enable live migration if SVQ is enabled.=0D
* Fix SVQ when driver reset.=0D
* Comments addressed, specially in the iova area.=0D
* Rebase on latest master, adding multiqueue support (but no networking=0D
  control vq processing).=0D
v5 link:=0D
https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg07250.html=0D
=0D
Changes from v4 RFC:=0D
* Support of allocating / freeing iova ranges in IOVA tree. Extending=0D
  already present iova-tree for that.=0D
* Proper validation of guest features. Now SVQ can negotiate a=0D
  different set of features with the device when enabled.=0D
* Support of host notifiers memory regions=0D
* Handling of SVQ full queue in case guest's descriptors span to=0D
  different memory regions (qemu's VA chunks).=0D
* Flush pending used buffers at end of SVQ operation.=0D
* QMP command now looks by NetClientState name. Other devices will need=0D
  to implement it's way to enable vdpa.=0D
* Rename QMP command to set, so it looks more like a way of working=0D
* Better use of qemu error system=0D
* Make a few assertions proper error-handling paths.=0D
* Add more documentation=0D
* Less coupling of virtio / vhost, that could cause friction on changes=0D
* Addressed many other small comments and small fixes.=0D
=0D
Changes from v3 RFC:=0D
  * Move everything to vhost-vdpa backend. A big change, this allowed=0D
    some cleanup but more code has been added in other places.=0D
  * More use of glib utilities, especially to manage memory.=0D
v3 link:=0D
https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06032.html=0D
=0D
Changes from v2 RFC:=0D
  * Adding vhost-vdpa devices support=0D
  * Fixed some memory leaks pointed by different comments=0D
v2 link:=0D
https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg05600.html=0D
=0D
Changes from v1 RFC:=0D
  * Use QMP instead of migration to start SVQ mode.=0D
  * Only accepting IOMMU devices, closer behavior with target devices=0D
    (vDPA)=0D
  * Fix invalid masking/unmasking of vhost call fd.=0D
  * Use of proper methods for synchronization.=0D
  * No need to modify VirtIO device code, all of the changes are=0D
    contained in vhost code.=0D
  * Delete superfluous code.=0D
  * An intermediate RFC was sent with only the notifications forwarding=0D
    changes. It can be seen in=0D
    https://patchew.org/QEMU/20210129205415.876290-1-eperezma@redhat.com/=
=0D
v1 link:=0D
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html=0D
=0D
Eugenio P=C3=A9rez (20):=0D
      virtio: Add VIRTIO_F_QUEUE_STATE=0D
      virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED=0D
      virtio: Add virtio_queue_is_host_notifier_enabled=0D
      vhost: Make vhost_virtqueue_{start,stop} public=0D
      vhost: Add x-vhost-enable-shadow-vq qmp=0D
      vhost: Add VhostShadowVirtqueue=0D
      vdpa: Register vdpa devices in a list=0D
      vhost: Route guest->host notification through shadow virtqueue=0D
      Add vhost_svq_get_svq_call_notifier=0D
      Add vhost_svq_set_guest_call_notifier=0D
      vdpa: Save call_fd in vhost-vdpa=0D
      vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call=0D
      vhost: Route host->guest notification through shadow virtqueue=0D
      virtio: Add vhost_shadow_vq_get_vring_addr=0D
      vdpa: Save host and guest features=0D
      vhost: Add vhost_svq_valid_device_features to shadow vq=0D
      vhost: Shadow virtqueue buffers forwarding=0D
      vhost: Add VhostIOVATree=0D
      vhost: Use a tree to store memory mappings=0D
      vdpa: Add custom IOTLB translations to SVQ=0D
=0D
Eugenio P=C3=A9rez (31):=0D
  vdpa: Reorder virtio/vhost-vdpa.c functions=0D
  vhost: Add VhostShadowVirtqueue=0D
  vdpa: Add vhost_svq_get_dev_kick_notifier=0D
  vdpa: Add vhost_svq_set_svq_kick_fd=0D
  vhost: Add Shadow VirtQueue kick forwarding capabilities=0D
  vhost: Route guest->host notification through shadow virtqueue=0D
  vhost: dd vhost_svq_get_svq_call_notifier=0D
  vhost: Add vhost_svq_set_guest_call_notifier=0D
  vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call=0D
  vhost: Route host->guest notification through shadow virtqueue=0D
  vhost: Add vhost_svq_valid_device_features to shadow vq=0D
  vhost: Add vhost_svq_valid_guest_features to shadow vq=0D
  vhost: Add vhost_svq_ack_guest_features to shadow vq=0D
  virtio: Add vhost_shadow_vq_get_vring_addr=0D
  vdpa: Add vhost_svq_get_num=0D
  vhost: pass queue index to vhost_vq_get_addr=0D
  vdpa: adapt vhost_ops callbacks to svq=0D
  vhost: Shadow virtqueue buffers forwarding=0D
  utils: Add internal DMAMap to iova-tree=0D
  util: Store DMA entries in a list=0D
  util: Add iova_tree_alloc=0D
  vhost: Add VhostIOVATree=0D
  vdpa: Add custom IOTLB translations to SVQ=0D
  vhost: Add vhost_svq_get_last_used_idx=0D
  vdpa: Adapt vhost_vdpa_get_vring_base to SVQ=0D
  vdpa: Clear VHOST_VRING_F_LOG at vhost_vdpa_set_vring_addr in SVQ=0D
  vdpa: Never set log_base addr if SVQ is enabled=0D
  vdpa: Expose VHOST_F_LOG_ALL on SVQ=0D
  vdpa: Make ncs autofree=0D
  vdpa: Move vhost_vdpa_get_iova_range to net/vhost-vdpa.c=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
=0D
 qapi/net.json                      |   5 +-=0D
 hw/virtio/vhost-iova-tree.h        |  27 +=0D
 hw/virtio/vhost-shadow-virtqueue.h |  46 ++=0D
 include/hw/virtio/vhost-vdpa.h     |   7 +=0D
 include/qemu/iova-tree.h           |  17 +=0D
 hw/virtio/vhost-iova-tree.c        | 157 ++++++=0D
 hw/virtio/vhost-shadow-virtqueue.c | 761 +++++++++++++++++++++++++++++=0D
 hw/virtio/vhost-vdpa.c             | 740 ++++++++++++++++++++++++----=0D
 hw/virtio/vhost.c                  |   6 +-=0D
 net/vhost-vdpa.c                   |  58 ++-=0D
 util/iova-tree.c                   | 161 +++++-=0D
 hw/virtio/meson.build              |   2 +-=0D
 12 files changed, 1852 insertions(+), 135 deletions(-)=0D
 create mode 100644 hw/virtio/vhost-iova-tree.h=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h=0D
 create mode 100644 hw/virtio/vhost-iova-tree.c=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c=0D
=0D
--=20=0D
2.27.0=0D
=0D


