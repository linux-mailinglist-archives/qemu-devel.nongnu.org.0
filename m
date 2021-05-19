Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE1A3893CE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:32:19 +0200 (CEST)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljP7I-0004TA-Cv
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP4i-00021p-JA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ljP4f-00054K-DK
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:29:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O83wLQUkB2jMqEKdetFLiXk7xT5RTVTgTKygIY9tlOs=;
 b=Qt+2cx0HV++jh6pn2vPQX1kVF9n8b5LzjyHu8hLXIBJ2oJzE8c6jYKS81nfGJrKf7AtcxN
 l+gq96w36yIZ9xBUYIc3cTKAg0tvjKVMQt//800WefZ5xP3JcimxNQzhR+YnY4kl0nXoak
 /ngrRvvn11RCX5z6DAE7id/YOoOnGl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542--CXuFhpxMTK5pFEJjtlHvg-1; Wed, 19 May 2021 12:29:25 -0400
X-MC-Unique: -CXuFhpxMTK5pFEJjtlHvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0ED87801817;
 Wed, 19 May 2021 16:29:24 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-65.ams2.redhat.com [10.36.113.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12CEF5D6AC;
 Wed, 19 May 2021 16:29:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 00/29] vDPA software assisted live migration
Date: Wed, 19 May 2021 18:28:34 +0200
Message-Id: <20210519162903.1172366-1-eperezma@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enable shadow virtqueue for vhost-vdpa devices. This is a=0D
new method of vhost devices migration: Instead of relay on vhost=0D
device's dirty logging capability, SW assisted LM intercepts dataplane,=0D
forwarding the descriptors between VM and device. Is intended for vDPA=0D
devices with no dirty memory tracking capabilities.=0D
=0D
In this migration mode, qemu offers a new vring to the device to=0D
read and write into, and disable vhost notifiers, processing guest and=0D
vhost notifications in qemu. On used buffer relay, qemu will mark the=0D
dirty memory as with plain virtio-net devices. This way, devices does=0D
not need to have dirty page logging capability.=0D
=0D
This series is a POC doing SW LM for vhost-net and vhost-vdpa devices.=0D
The former already have dirty page logging capabilities, but it is both=0D
easier to test and uses different code paths in qemu.=0D
=0D
For qemu to use shadow virtqueues the vhost-net devices need to be=0D
instantiated:=0D
* With IOMMU (iommu_platform=3Don,ats=3Don)=0D
* Without event_idx (event_idx=3Doff)=0D
=0D
And shadow virtqueue needs to be enabled for them with QMP command=0D
like:=0D
=0D
{ "execute": "x-vhost-enable-shadow-vq",=0D
      "arguments": { "name": "dev0", "enable": true } }=0D
=0D
The series includes some commits to delete in the final version. One=0D
of them is the one that adds vhost_kernel_vring_pause to vhost kernel=0D
devices. This is only intended to work with vhost-net devices, as a way=0D
to test the solution, so don't use any other vhost kernel device in the=0D
same test.=0D
=0D
The vhost-vdpa devices should work the same way. However, vp_vdpa is=0D
not working properly with intel iommu unmapping, so this series add two=0D
extra commits to allow testing the solution enable SVQ mode from the=0D
device start and forbidding any other vhost-vdpa memory mapping. The=0D
causes of this are still under debugging.=0D
=0D
For testing vhost-vdpa devices vp_vdpa device has been used with nested=0D
virtualization, using a qemu virtio-net device in L0. To be able to=0D
stop and reset status, features in RFC status has been implemented in=0D
commits 5 and 6. After that, virtio-net driver in L0 guest is replaced=0D
by vp_vdpa driver, and a nested qemu instance is launched using it.=0D
=0D
This vp_vdpa driver needs to be also modified to support the RFCs,=0D
mainly allowing it to removing the _S_STOPPED status flag and=0D
implementing actual vp_vdpa_set_vq_state and vp_vdpa_get_vq_state=0D
callbacks.=0D
=0D
Just the notification forwarding (with no descriptor relay) can be=0D
achieved with patches 7 and 8, and starting SVQ. Previous commits=0D
are cleanup ones and declaration of QMP command.=0D
=0D
Commit 17 introduces the buffer forwarding. Previous one are for=0D
preparations again, and laters are for enabling some obvious=0D
optimizations. However, it needs the vdpa device to be able to map=0D
every IOVA space, and some vDPA devices are not able to do so. Checking=0D
of this is added in previous commits.=0D
=0D
Later commits allow vhost and shadow virtqueue to track and translate=0D
between qemu virtual addresses and a restricted iommu range. At the=0D
moment is not able to delete old translations, limit maximum range=0D
it can translate, nor vhost add new memory regions from the moment=0D
SVQ is enabled, but is somehow straightforward to add these.=0D
=0D
This is a big series, so the idea is to send it in logical chunks once=0D
all comments have been collected. As a first complete usecase, a SVQ=0D
mode with no possibility of going back to regular mode would cover a=0D
first usecase, and this RFC already have all the ingredients but=0D
internal memory tracking.=0D
=0D
It is based on the ideas of DPDK SW assisted LM, in the series of=0D
DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does=0D
not map the shadow vq in guest's VA, but in qemu's.=0D
=0D
Comments are welcome!=0D
=0D
TODO:=0D
* Event, indirect, packed, and others features of virtio - Waiting for=0D
  confirmation of the big picture.=0D
* vDPA devices: Grow IOVA tree to track new or deleted memory. Cap=0D
  IOVA limit in tree so it cannot grow forever.=0D
* To sepparate buffers forwarding in its own AIO context, so we can=0D
  throw more threads to that task and we don't need to stop the main=0D
  event loop.=0D
* IOMMU optimizations, so bacthing and bigger chunks of IOVA can be=0D
  sent to device.=0D
* Automatic kick-in on live-migration.=0D
* Proper documentation.=0D
=0D
Thanks!=0D
=0D
Changes from v2 RFC:=0D
  * Adding vhost-vdpa devices support=0D
  * Fixed some memory leaks pointed by different comments=0D
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
  * v1 at=0D
    https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg05372.html=0D
=0D
Eugenio P=C3=A9rez (29):=0D
  virtio: Add virtio_queue_is_host_notifier_enabled=0D
  vhost: Save masked_notifier state=0D
  vhost: Add VhostShadowVirtqueue=0D
  vhost: Add x-vhost-enable-shadow-vq qmp=0D
  virtio: Add VIRTIO_F_QUEUE_STATE=0D
  virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED=0D
  vhost: Route guest->host notification through shadow virtqueue=0D
  vhost: Route host->guest notification through shadow virtqueue=0D
  vhost: Avoid re-set masked notifier in shadow vq=0D
  virtio: Add vhost_shadow_vq_get_vring_addr=0D
  vhost: Add vhost_vring_pause operation=0D
  vhost: add vhost_kernel_vring_pause=0D
  vhost: Add vhost_get_iova_range operation=0D
  vhost: add vhost_has_limited_iova_range=0D
  vhost: Add enable_custom_iommu to VhostOps=0D
  vhost-vdpa: Add vhost_vdpa_enable_custom_iommu=0D
  vhost: Shadow virtqueue buffers forwarding=0D
  vhost: Use vhost_enable_custom_iommu to unmap everything if available=0D
  vhost: Check for device VRING_USED_F_NO_NOTIFY at shadow virtqueue=0D
    kick=0D
  vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call on shadow=0D
    virtqueue=0D
  vhost: Add VhostIOVATree=0D
  vhost: Add iova_rev_maps_find_iova to IOVAReverseMaps=0D
  vhost: Use a tree to store memory mappings=0D
  vhost: Add iova_rev_maps_alloc=0D
  vhost: Add custom IOTLB translations to SVQ=0D
  vhost: Map in vdpa-dev=0D
  vhost-vdpa: Implement vhost_vdpa_vring_pause operation=0D
  vhost-vdpa: never map with vDPA listener=0D
  vhost: Start vhost-vdpa SVQ directly=0D
=0D
 qapi/net.json                                 |  22 +=0D
 hw/virtio/vhost-iova-tree.h                   |  61 ++=0D
 hw/virtio/vhost-shadow-virtqueue.h            |  38 ++=0D
 hw/virtio/virtio-pci.h                        |   1 +=0D
 include/hw/virtio/vhost-backend.h             |  16 +=0D
 include/hw/virtio/vhost-vdpa.h                |   2 +-=0D
 include/hw/virtio/vhost.h                     |  14 +=0D
 include/hw/virtio/virtio.h                    |   5 +-=0D
 .../standard-headers/linux/virtio_config.h    |   5 +=0D
 include/standard-headers/linux/virtio_pci.h   |   2 +=0D
 hw/net/virtio-net.c                           |   4 +-=0D
 hw/virtio/vhost-backend.c                     |  42 ++=0D
 hw/virtio/vhost-iova-tree.c                   | 283 ++++++++=0D
 hw/virtio/vhost-shadow-virtqueue.c            | 643 ++++++++++++++++++=0D
 hw/virtio/vhost-vdpa.c                        |  73 +-=0D
 hw/virtio/vhost.c                             | 459 ++++++++++++-=0D
 hw/virtio/virtio-pci.c                        |   9 +=0D
 hw/virtio/virtio.c                            |   5 +=0D
 hw/virtio/meson.build                         |   2 +-=0D
 hw/virtio/trace-events                        |   1 +=0D
 20 files changed, 1663 insertions(+), 24 deletions(-)=0D
 create mode 100644 hw/virtio/vhost-iova-tree.h=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h=0D
 create mode 100644 hw/virtio/vhost-iova-tree.c=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c=0D
=0D
--=20=0D
2.27.0=0D
=0D


