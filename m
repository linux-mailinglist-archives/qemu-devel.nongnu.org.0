Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38209440231
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:41:35 +0200 (CEST)
Received: from localhost ([::1]:60824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWoo-0005C0-9a
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWje-0008Q2-3U
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWjY-0000EV-Li
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qsHyAjfcHwCwHzG3HCTZUJtScJwe5VCWOgiNZj75b5A=;
 b=V05XtV0k7u/gXbv2hwj6cV9blV3Bkt3RL60YBc4JG9MKgX5l3u9tXQH0wxO/BzK4CKHwF0
 lUTvlsnsvkCpzzqtjVT6uC4dX9kh2NRIZq+jY2qoqFIC0xKeppQBGSiwKILQaoDqUUioCn
 0xAmKbdTM0WB0phfW7ofbMkB3VeNgaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-d35a3-LJNT6LkZDTaS84PA-1; Fri, 29 Oct 2021 14:36:00 -0400
X-MC-Unique: d35a3-LJNT6LkZDTaS84PA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD16806688;
 Fri, 29 Oct 2021 18:35:58 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8ADA95D6CF;
 Fri, 29 Oct 2021 18:35:29 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 00/26] vDPA shadow virtqueue
Date: Fri, 29 Oct 2021 20:34:59 +0200
Message-Id: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
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

This series enable shadow virtqueue (SVQ) for vhost-vdpa devices. This=0D
is intended as a new method of tracking the memory the devices touch=0D
during a migration process: Instead of relay on vhost device's dirty=0D
logging capability, SVQ intercepts the VQ dataplane forwarding the=0D
descriptors between VM and device. This way qemu is the effective=0D
writer of guests memory, like in qemu's virtio device operation.=0D
=0D
When SVQ is enabled qemu offers a new virtual address space to the=0D
device to read and write into, and it maps new vrings and the guest=0D
memory in it. SVQ also intercepts kicks and calls between the device=0D
and the guest. Used buffers relay would cause dirty memory being=0D
tracked, but at this RFC SVQ is not enabled on migration automatically.=0D
=0D
Thanks of being a buffers relay system, SVQ can be used also to=0D
communicate devices and drivers with different capabilities, like=0D
devices that only supports packed vring and not split and old guest=0D
with no driver packed support.=0D
=0D
It is based on the ideas of DPDK SW assisted LM, in the series of=0D
DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does=0D
not map the shadow vq in guest's VA, but in qemu's.=0D
=0D
For qemu to use shadow virtqueues the guest virtio driver must not use=0D
features like event_idx.=0D
=0D
SVQ needs to be enabled with QMP command:=0D
=0D
{ "execute": "x-vhost-set-shadow-vq",=0D
      "arguments": { "name": "vhost-vdpa0", "enable": true } }=0D
=0D
This series includes some patches to delete in the final version that=0D
helps with its testing. The first two of the series have been sent=0D
sepparately but they haven't been included in qemu main branch.=0D
=0D
The two after them adds the feature to stop the device and be able to=0D
set and get its status. It's intended to be used with vp_vpda driver in=0D
a nested environment, so they are also external to this series. The=0D
vp_vdpa driver also need modifications to forward the new status bit,=0D
they will be proposed sepparately=0D
=0D
Patches 5-12 prepares the SVQ and QMP command to support guest to host=0D
notifications forwarding. If the SVQ is enabled with these ones=0D
applied and the device supports it, that part can be tested in=0D
isolation (for example, with networking), hopping through SVQ.=0D
=0D
Same thing is true with patches 13-17, but with device to guest=0D
notifications.=0D
=0D
Based on them, patches from 18 to 22 implement the actual buffer=0D
forwarding, using some features already introduced in previous.=0D
However, they will need a host device with no iommu, something that=0D
is not available at the moment.=0D
=0D
The last part of the series uses properly the host iommu, so the driver=0D
can access this new virtual address space created.=0D
=0D
Comments are welcome.=0D
=0D
TODO:=0D
* Event, indirect, packed, and others features of virtio.=0D
* To sepparate buffers forwarding in its own AIO context, so we can=0D
  throw more threads to that task and we don't need to stop the main=0D
  event loop.=0D
* Support multiqueue virtio-net vdpa.=0D
* Proper documentation.=0D
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
Eugenio P=C3=A9rez (26):=0D
  util: Make some iova_tree parameters const=0D
  vhost: Fix last queue index of devices with no cvq=0D
  virtio: Add VIRTIO_F_QUEUE_STATE=0D
  virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED=0D
  vhost: Add x-vhost-set-shadow-vq qmp=0D
  vhost: Add VhostShadowVirtqueue=0D
  vdpa: Save kick_fd in vhost-vdpa=0D
  vdpa: Add vhost_svq_get_dev_kick_notifier=0D
  vdpa: Add vhost_svq_set_svq_kick_fd=0D
  vhost: Add Shadow VirtQueue kick forwarding capabilities=0D
  vhost: Handle host notifiers in SVQ=0D
  vhost: Route guest->host notification through shadow virtqueue=0D
  Add vhost_svq_get_svq_call_notifier=0D
  Add vhost_svq_set_guest_call_notifier=0D
  vdpa: Save call_fd in vhost-vdpa=0D
  vhost-vdpa: Take into account SVQ in vhost_vdpa_set_vring_call=0D
  vhost: Route host->guest notification through shadow virtqueue=0D
  virtio: Add vhost_shadow_vq_get_vring_addr=0D
  vdpa: ack VIRTIO_F_QUEUE_STATE if device supports it=0D
  vhost: Add vhost_svq_valid_device_features to shadow vq=0D
  vhost: Add vhost_svq_valid_guest_features to shadow vq=0D
  vhost: Shadow virtqueue buffers forwarding=0D
  util: Add iova_tree_alloc=0D
  vhost: Add VhostIOVATree=0D
  vhost: Use a tree to store memory mappings=0D
  vdpa: Add custom IOTLB translations to SVQ=0D
=0D
 qapi/net.json                                 |  20 +=0D
 hw/virtio/vhost-iova-tree.h                   |  27 +=0D
 hw/virtio/vhost-shadow-virtqueue.h            |  44 ++=0D
 hw/virtio/virtio-pci.h                        |   1 +=0D
 include/hw/virtio/vhost-vdpa.h                |  12 +=0D
 include/hw/virtio/virtio.h                    |   4 +-=0D
 include/qemu/iova-tree.h                      |  25 +-=0D
 .../standard-headers/linux/virtio_config.h    |   5 +=0D
 include/standard-headers/linux/virtio_pci.h   |   2 +=0D
 hw/i386/intel_iommu.c                         |   2 +-=0D
 hw/net/vhost_net.c                            |   2 +-=0D
 hw/net/virtio-net.c                           |   6 +-=0D
 hw/virtio/vhost-iova-tree.c                   | 157 ++++=0D
 hw/virtio/vhost-shadow-virtqueue.c            | 746 ++++++++++++++++++=0D
 hw/virtio/vhost-vdpa.c                        | 437 +++++++++-=0D
 hw/virtio/virtio-pci.c                        |  16 +-=0D
 net/vhost-vdpa.c                              |  28 +=0D
 util/iova-tree.c                              | 151 +++-=0D
 hw/virtio/meson.build                         |   2 +-=0D
 19 files changed, 1664 insertions(+), 23 deletions(-)=0D
 create mode 100644 hw/virtio/vhost-iova-tree.h=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h=0D
 create mode 100644 hw/virtio/vhost-iova-tree.c=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c=0D
=0D
--=20=0D
2.27.0=0D
=0D


