Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A0233C716
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:51:27 +0100 (CET)
Received: from localhost ([::1]:50508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtFO-0006Jc-Nc
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtD5-00050K-0T
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1lLtD1-0003r4-88
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615837736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dyAcr8KFvX5ZXIu4EGLiiqNLB0VmrbBhQ/enTolLbEE=;
 b=Ou5MhtQFMkooj/wFarvlQ4Wp7pvNxPUyjx4WATZsfTmiD6oNlHsOj+EnqoYnWPiRMEcVwu
 fZtPnBf/nW4+ipNIm8K4PFMVnVyCpGflHosRXnPhOEgyOUbE/jgRA8i1QIkaf+1lNXWkH2
 m22f6mF6dzogZJX9eIMsbwi2xanJ8pM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-VEkVYNdUPlq3truCdywumA-1; Mon, 15 Mar 2021 15:48:52 -0400
X-MC-Unique: VEkVYNdUPlq3truCdywumA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 091A319200C5;
 Mon, 15 Mar 2021 19:48:51 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-173.ams2.redhat.com
 [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FEAB1C4;
 Mon, 15 Mar 2021 19:48:44 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 00/13] vDPA software assisted live migration
Date: Mon, 15 Mar 2021 20:48:29 +0100
Message-Id: <20210315194842.277740-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Guru Prasad <guru.prasad@broadcom.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enable shadow virtqueue for vhost-net devices. This is a=0D
new method of vhost devices migration: Instead of relay on vhost=0D
device's dirty logging capability, SW assisted LM intercepts dataplane,=0D
forwarding the descriptors between VM and device. Is intended for vDPA=0D
devices with no logging, but this address the basic platform to build=0D
that support on.=0D
=0D
In this migration mode, qemu offers a new vring to the device to=0D
read and write into, and disable vhost notifiers, processing guest and=0D
vhost notifications in qemu. On used buffer relay, qemu will mark the=0D
dirty memory as with plain virtio-net devices. This way, devices does=0D
not need to have dirty page logging capability.=0D
=0D
This series is a POC doing SW LM for vhost-net devices, which already=0D
have dirty page logging capabilities. For qemu to use shadow virtqueues=0D
these vhost-net devices need to be instantiated:=0D
* With IOMMU (iommu_platform=3Don,ats=3Don)=0D
* Without event_idx (event_idx=3Doff)=0D
=0D
And shadow virtqueue needs to be enabled for them with QMP command=0D
like:=0D
=0D
{=0D
  "execute": "x-vhost-enable-shadow-vq",=0D
  "arguments": {=0D
    "name": "virtio-net",=0D
    "enable": false=0D
  }=0D
}=0D
=0D
Just the notification forwarding (with no descriptor relay) can be=0D
achieved with patches 5 and 6, and starting SVQ. Previous commits=0D
are cleanup ones and declaration of QMP command.=0D
=0D
Commit 11 introduces the buffer forwarding. Previous one are for=0D
preparations again, and laters are for enabling some obvious=0D
optimizations.=0D
=0D
It is based on the ideas of DPDK SW assisted LM, in the series of=0D
DPDK's https://patchwork.dpdk.org/cover/48370/ . However, these does=0D
not map the shadow vq in guest's VA, but in qemu's.=0D
=0D
Comments are welcome! Especially on:=0D
* Different/improved way of synchronization, particularly on the race=0D
  of masking.=0D
=0D
TODO:=0D
* Event, indirect, packed, and others features of virtio - Waiting for=0D
  confirmation of the big picture.=0D
* vDPA devices: Developing solutions for tracking the available IOVA=0D
  space for all devices. Small POC available, skipping the get/set=0D
  status (since vDPA does not support it) and just allocating more and=0D
  more IOVA addresses in a hardcoded range available for the device.=0D
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
Eugenio P=C3=A9rez (13):=0D
  virtio: Add virtio_queue_is_host_notifier_enabled=0D
  vhost: Save masked_notifier state=0D
  vhost: Add VhostShadowVirtqueue=0D
  vhost: Add x-vhost-enable-shadow-vq qmp=0D
  vhost: Route guest->host notification through shadow virtqueue=0D
  vhost: Route host->guest notification through shadow virtqueue=0D
  vhost: Avoid re-set masked notifier in shadow vq=0D
  virtio: Add vhost_shadow_vq_get_vring_addr=0D
  virtio: Add virtio_queue_full=0D
  vhost: add vhost_kernel_set_vring_enable=0D
  vhost: Shadow virtqueue buffers forwarding=0D
  vhost: Check for device VRING_USED_F_NO_NOTIFY at shadow virtqueue=0D
    kick=0D
  vhost: Use VRING_AVAIL_F_NO_INTERRUPT at device call on shadow=0D
    virtqueue=0D
=0D
 qapi/net.json                      |  22 ++=0D
 hw/virtio/vhost-shadow-virtqueue.h |  36 ++=0D
 include/hw/virtio/vhost.h          |   6 +=0D
 include/hw/virtio/virtio.h         |   3 +=0D
 hw/virtio/vhost-backend.c          |  29 ++=0D
 hw/virtio/vhost-shadow-virtqueue.c | 551 +++++++++++++++++++++++++++++=0D
 hw/virtio/vhost.c                  | 283 +++++++++++++++=0D
 hw/virtio/virtio.c                 |  23 +-=0D
 hw/virtio/meson.build              |   2 +-=0D
 9 files changed, 952 insertions(+), 3 deletions(-)=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h=0D
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c=0D
=0D
--=20=0D
2.27.0=0D
=0D


