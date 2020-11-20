Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203C2BB4B6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:02:16 +0100 (CET)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBfj-0004ZI-5F
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBVm-00045o-V6
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:51:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBVZ-0006sd-DR
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Sb8SkhHSx+YyTW1MXsUsqQRkW1t3AvbZ30ip8xfmcY=;
 b=cdswnbE9DhbYFCNDaG1rHdLz9ODZymz6QE97f2ynL105y4WtHjS23CSX/Y9ycL4MevJ088
 jAHUNXuOB/jIf4CytYD6KR2GCcKXeyyxbZPgl4k9LuSwzcbRLit50uCGYGNjRTMi1a6lb2
 1YUXMW9ndCBH9DjrHRigWTiqUVB+nXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-vIcMi6b8OYG6iQ1GEt0oHw-1; Fri, 20 Nov 2020 13:51:32 -0500
X-MC-Unique: vIcMi6b8OYG6iQ1GEt0oHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF47263CC8;
 Fri, 20 Nov 2020 18:51:22 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38DB65C1D5;
 Fri, 20 Nov 2020 18:51:07 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/27] vDPA software assisted live migration
Date: Fri, 20 Nov 2020 19:50:38 +0100
Message-Id: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enable vDPA software assisted live migration for vhost-net
devices. This is a new method of vhost devices migration: Instead of
relay on vDPA device's dirty logging capability, SW assisted LM
intercepts dataplane, forwarding the descriptors between VM and device.

In this migration mode, qemu offers a new vring to the device to
read and write into, and disable vhost notifiers, processing guest and
vhost notifications in qemu. On used buffer relay, qemu will mark the
dirty memory as with plain virtio-net devices. This way, devices does
not need to have dirty page logging capability.

This series is a POC doing SW LM for vhost-net devices, which already
have dirty page logging capabilities. None of the changes have actual
effect with current devices until last two patches (26 and 27) are
applied, but they can be rebased on top of any other. These checks the
device to meet all requirements, and disable vhost-net devices logging
so migration goes through SW LM. This last patch is not meant to be
applied in the final revision, it is in the series just for testing
purposes.

For use SW assisted LM these vhost-net devices need to be instantiated:
* With IOMMU (iommu_platform=on,ats=on)
* Without event_idx (event_idx=off)

Just the notification forwarding (with no descriptor relay) can be
achieved with patches 7 and 9, and starting migration. Partial applies
between 13 and 24 will not work while migrating on source, and patch
25 is needed for the destination to resume network activity.

It is based on the ideas of DPDK SW assisted LM, in the series of
DPDK's https://patchwork.dpdk.org/cover/48370/ .

Comments are welcome.

Thanks!

Eugenio Pérez (27):
  vhost: Add vhost_dev_can_log
  vhost: Add device callback in vhost_migration_log
  vhost: Move log resize/put to vhost_dev_set_log
  vhost: add vhost_kernel_set_vring_enable
  vhost: Add hdev->dev.sw_lm_vq_handler
  virtio: Add virtio_queue_get_used_notify_split
  vhost: Route guest->host notification through qemu
  vhost: Add a flag for software assisted Live Migration
  vhost: Route host->guest notification through qemu
  vhost: Allocate shadow vring
  virtio: const-ify all virtio_tswap* functions
  virtio: Add virtio_queue_full
  vhost: Send buffers to device
  virtio: Remove virtio_queue_get_used_notify_split
  vhost: Do not invalidate signalled used
  virtio: Expose virtqueue_alloc_element
  vhost: add vhost_vring_set_notification_rcu
  vhost: add vhost_vring_poll_rcu
  vhost: add vhost_vring_get_buf_rcu
  vhost: Return used buffers
  vhost: Add vhost_virtqueue_memory_unmap
  vhost: Add vhost_virtqueue_memory_map
  vhost: unmap qemu's shadow virtqueues on sw live migration
  vhost: iommu changes
  vhost: Do not commit vhost used idx on vhost_virtqueue_stop
  vhost: Add vhost_hdev_can_sw_lm
  vhost: forbid vhost devices logging

 hw/virtio/vhost-sw-lm-ring.h      |  39 +++
 include/hw/virtio/vhost.h         |   5 +
 include/hw/virtio/virtio-access.h |   8 +-
 include/hw/virtio/virtio.h        |   4 +
 hw/net/virtio-net.c               |  39 ++-
 hw/virtio/vhost-backend.c         |  29 ++
 hw/virtio/vhost-sw-lm-ring.c      | 268 +++++++++++++++++++
 hw/virtio/vhost.c                 | 431 +++++++++++++++++++++++++-----
 hw/virtio/virtio.c                |  18 +-
 hw/virtio/meson.build             |   2 +-
 10 files changed, 758 insertions(+), 85 deletions(-)
 create mode 100644 hw/virtio/vhost-sw-lm-ring.h
 create mode 100644 hw/virtio/vhost-sw-lm-ring.c

-- 
2.18.4


