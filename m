Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5113E4CB00B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:39:26 +0100 (CET)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPVkr-0005aZ-29
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:39:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVck-0005hT-Sj
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:31:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nPVci-00023k-RG
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:31:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646253060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H0TN7a0aAR6p/WYfJs1pIRSrlwnpzzthMeaa7vGuFBQ=;
 b=eIwC36nVstPKAmOxjWg6B7EKffSRdiTHNzz+vLq8v++PFVqfNYUWfY2UYvF72e3bGC5uja
 2iFcCpfrMwQ1OW3rzLt5XlQQdzP3jkAfUTaf5vpVbICTdlNsKBHjn23DIraxA2qVJkPhVX
 c+HZWG6hR0mW73AFRNcMIlDe9a56SAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-U1fFpUnzP662fOwQgwUDIw-1; Wed, 02 Mar 2022 15:30:47 -0500
X-MC-Unique: U1fFpUnzP662fOwQgwUDIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ACED80733B;
 Wed,  2 Mar 2022 20:30:45 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B94F5E482;
 Wed,  2 Mar 2022 20:30:15 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/14] vDPA shadow virtqueue
Date: Wed,  2 Mar 2022 21:29:58 +0100
Message-Id: <20220302203012.3476835-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Xu <peterx@redhat.com>, virtualization@lists.linux-foundation.org,
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
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
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
Eugenio P=C3=A9rez (14):=0D
  vhost: Add VhostShadowVirtqueue=0D
  vhost: Add Shadow VirtQueue kick forwarding capabilities=0D
  vhost: Add Shadow VirtQueue call forwarding capabilities=0D
  vhost: Add vhost_svq_valid_features to shadow vq=0D
  virtio: Add vhost_svq_get_vring_addr=0D
  vdpa: adapt vhost_ops callbacks to svq=0D
  vhost: Shadow virtqueue buffers forwarding=0D
  util: Add iova_tree_alloc_map.=0D
  vhost: Add VhostIOVATree=0D
  vdpa: Add custom IOTLB translations to SVQ=0D
  vdpa: Adapt vhost_vdpa_get_vring_base to SVQ=0D
  vdpa: Never set log_base addr if SVQ is enabled=0D
  vdpa: Expose VHOST_F_LOG_ALL on SVQ=0D
  vdpa: Add x-svq to NetdevVhostVDPAOptions=0D
=0D
 qapi/net.json                      |   5 +-=0D
 hw/virtio/vhost-iova-tree.h        |  27 ++=0D
 hw/virtio/vhost-shadow-virtqueue.h |  87 ++++=0D
 include/hw/virtio/vhost-vdpa.h     |   8 +=0D
 include/qemu/iova-tree.h           |  18 +=0D
 hw/virtio/vhost-iova-tree.c        | 155 +++++++=0D
 hw/virtio/vhost-shadow-virtqueue.c | 637 +++++++++++++++++++++++++++++=0D
 hw/virtio/vhost-vdpa.c             | 525 +++++++++++++++++++++++-=0D
 net/vhost-vdpa.c                   |  48 ++-=0D
 util/iova-tree.c                   | 135 ++++++=0D
 hw/virtio/meson.build              |   2 +-=0D
 11 files changed, 1622 insertions(+), 25 deletions(-)=0D
 create mode 100644 hw/virtio/vhost-iova-tree.h=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h=0D
 create mode 100644 hw/virtio/vhost-iova-tree.c=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c=0D
=0D
--=20=0D
2.27.0=0D
=0D


