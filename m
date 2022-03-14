Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9154D8AE6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:37:45 +0100 (CET)
Received: from localhost ([::1]:52764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTodc-00006F-A6
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:37:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobJ-0005hx-1p
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nTobB-0007aR-DS
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647279303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i/e/Dc8ScIg+UZmYnNpjVV/lsHO4XnV1U8m1CswJk2A=;
 b=bCYwCjtPgW824NB/6IzmYCIMgAgX48dGrLL3lc6hvToSjBMVGi7c17lq27I02OcRnbfvai
 aS+Q4NuWGQQr0ICzFHNMCuxkr/Ea64+5fI4vHFSs6it1fElenKVhaD7ob/NiEKgQSRY/y2
 K2wrJ2mAXTDrkD2kFd06jRRoHqU/RFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-N2X_pW3sNfGlHpCMRFv_PA-1; Mon, 14 Mar 2022 13:34:59 -0400
X-MC-Unique: N2X_pW3sNfGlHpCMRFv_PA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DF75811E75
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 17:34:59 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 690B84B8D5A;
 Mon, 14 Mar 2022 17:34:58 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/15] vDPA shadow virtqueue
Date: Mon, 14 Mar 2022 18:34:40 +0100
Message-Id: <20220314173455.200342-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
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
tracked.=0D
=0D
This effectively means that vDPA device passthrough is intercepted by=0D
qemu. While SVQ should only be enabled at migration time, the switching=0D
from regular mode to SVQ mode is left for a future series.=0D
=0D
It is based on the ideas of DPDK SW assisted LM, in the series of=0D
DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does=0D
not map the shadow vq in guest's VA, but in qemu's.=0D
=0D
For qemu to use shadow virtqueues the guest virtio driver must not use=0D
features like event_idx.=0D
=0D
SVQ needs to be enabled with cmdline:=0D
=0D
-netdev type=3Dvhost-vdpa,vhostdev=3Dvhost-vdpa-0,id=3Dvhost-vdpa0,svq=3Don=
=0D
=0D
The first three patches enables notifications forwarding with=0D
assistance of qemu. It's easy to enable only this if the relevant=0D
cmdline part of the last patch is applied on top of these.=0D
=0D
Next four patches implement the actual buffer forwarding. However,=0D
address are not translated from HVA so they will need a host device with=0D
an iommu allowing them to access all of the HVA range.=0D
=0D
The last part of the series uses properly the host iommu, so qemu=0D
creates a new iova address space in the device's range and translates=0D
the buffers in it. Finally, it adds the cmdline parameter.=0D
=0D
Some simple performance tests with netperf were done. They used a nested=0D
guest with vp_vdpa, vhost-kernel at L0 host. Starting with no svq and a=0D
baseline average of ~9009.96Mbps:=0D
Recv   Send    Send=0D
Socket Socket  Message  Elapsed=0D
Size   Size    Size     Time     Throughput=0D
bytes  bytes   bytes    secs.    10^6bits/sec=0D
131072  16384  16384    30.01    9061.03=0D
131072  16384  16384    30.01    8962.94=0D
131072  16384  16384    30.01    9005.92=0D
=0D
To enable SVQ buffers forwarding reduce throughput to an average of=0D
~7730.7mbps:=0D
Recv   Send    Send=0D
Socket Socket  Message  Elapsed=0D
Size   Size    Size     Time     Throughput=0D
bytes  bytes   bytes    secs.    10^6bits/sec=0D
131072  16384  16384    30.01    7689.72=0D
131072  16384  16384    30.00    7752.07=0D
131072  16384  16384    30.01    7750.30=0D
=0D
However, many performance improvements were left out of this series for=0D
simplicity, so difference should shrink in the future.=0D
=0D
Comments are welcome.=0D
=0D
TODO on future series:=0D
* Event, indirect, packed, and others features of virtio.=0D
* To support different set of features between the device<->SVQ and the=0D
  SVQ<->guest communication.=0D
* Support of device host notifier memory regions.=0D
* To sepparate buffers forwarding in its own AIO context, so we can=0D
  throw more threads to that task and we don't need to stop the main=0D
  event loop.=0D
* Support multiqueue virtio-net vdpa.=0D
* Proper documentation.=0D
=0D
Changes from v5:=0D
* Add proper casting on 32 bits compilations.=0D
* Fix merge conflict adding qemu_memalign header=0D
=0D
Changes from v4:=0D
* Iterate iova->hva tree instead on maintain own tree so we support HVA=0D
  overlaps.=0D
* Fix: Errno completion at failure.=0D
* Rename x-svq to svq, so changes to stable does not affect cmdline paramet=
er.=0D
=0D
Changes from v3:=0D
* Add @unstable feature to NetdevVhostVDPAOptions.x-svq.=0D
* Fix uncomplete mapping (by 1 byte) of memory regions if svq is enabled.=
=0D
v3 link:=0D
https://lore.kernel.org/qemu-devel/20220302203012.3476835-1-eperezma@redhat=
.com/=0D
=0D
Changes from v2:=0D
* Less assertions and more error handling in iova tree code.=0D
* Better documentation, both fixing errors and making @param: format=0D
* Homogeneize SVQ avail_idx_shadow and shadow_used_idx to make shadow a=0D
  prefix at both times.=0D
* Fix: Fo not use VirtQueueElement->len field, track separatedly.=0D
* Split vhost_svq_{enable,disable}_notification, so the code looks more=0D
  like the kernel driver code.=0D
* Small improvements.=0D
v2 link:=0D
https://lore.kernel.org/all/CAJaqyWfXHE0C54R_-OiwJzjC0gPpkE3eX0L8BeeZXGm1ER=
YPtA@mail.gmail.com/=0D
=0D
Changes from v1:=0D
* Feature set at device->SVQ is now the same as SVQ->guest.=0D
* Size of SVQ is not max available device size anymore, but guest's=0D
  negotiated.=0D
* Add VHOST_FILE_UNBIND kick and call fd treatment.=0D
* Make SVQ a public struct=0D
* Come back to previous approach to iova-tree=0D
* Some assertions are now fail paths. Some errors are now log_guest.=0D
* Only mask _F_LOG feature at vdpa_set_features svq enable path.=0D
* Refactor some errors and messages. Add missing error unwindings.=0D
* Add memory barrier at _F_NO_NOTIFY set.=0D
* Stop checking for features flags out of transport range.=0D
v1 link:=0D
https://lore.kernel.org/virtualization/7d86c715-6d71-8a27-91f5-8d47b71e3201=
@redhat.com/=0D
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
Eugenio P=C3=A9rez (15):=0D
  vhost: Add VhostShadowVirtqueue=0D
  vhost: Add Shadow VirtQueue kick forwarding capabilities=0D
  vhost: Add Shadow VirtQueue call forwarding capabilities=0D
  vhost: Add vhost_svq_valid_features to shadow vq=0D
  virtio: Add vhost_svq_get_vring_addr=0D
  vdpa: adapt vhost_ops callbacks to svq=0D
  vhost: Shadow virtqueue buffers forwarding=0D
  util: Add iova_tree_alloc_map=0D
  util: add iova_tree_find_iova=0D
  vhost: Add VhostIOVATree=0D
  vdpa: Add custom IOTLB translations to SVQ=0D
  vdpa: Adapt vhost_vdpa_get_vring_base to SVQ=0D
  vdpa: Never set log_base addr if SVQ is enabled=0D
  vdpa: Expose VHOST_F_LOG_ALL on SVQ=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
=0D
 qapi/net.json                      |   8 +-=0D
 hw/virtio/vhost-iova-tree.h        |  27 ++=0D
 hw/virtio/vhost-shadow-virtqueue.h |  87 ++++=0D
 include/hw/virtio/vhost-vdpa.h     |   8 +=0D
 include/qemu/iova-tree.h           |  38 +-=0D
 hw/virtio/vhost-iova-tree.c        | 110 +++++=0D
 hw/virtio/vhost-shadow-virtqueue.c | 636 +++++++++++++++++++++++++++++=0D
 hw/virtio/vhost-vdpa.c             | 522 ++++++++++++++++++++++-=0D
 net/vhost-vdpa.c                   |  48 ++-=0D
 util/iova-tree.c                   | 170 ++++++++=0D
 hw/virtio/meson.build              |   2 +-=0D
 11 files changed, 1630 insertions(+), 26 deletions(-)=0D
 create mode 100644 hw/virtio/vhost-iova-tree.h=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h=0D
 create mode 100644 hw/virtio/vhost-iova-tree.c=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c=0D
=0D
--=20=0D
2.27.0=0D
=0D


