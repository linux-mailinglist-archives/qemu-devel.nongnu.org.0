Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B23152F9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:41:45 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9V96-0004tR-Sm
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V5q-0003I7-Gl
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l9V5k-0008A6-KR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612885095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Ylf3/e25fEsPCloRkHRt6KEsdAdmN090KH+lElwv6U=;
 b=YvU4Lk+04XxBTm6cE8jUxX6vmKRcxc85Iijx6DrXZdn18+aowiAnFG68TUDkWr8+KGOLa6
 TcIwvZ7Ol1ERXyoUlaZVXea+jRySdas1rYcJFDUtsGieLIcbIL2GFwLzJkQu2DrciZgMUU
 BZzOS1hJfI8uN2I59W+n4vXo0TXVCNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-HPrrstX0OB-xjI2SAbuUPQ-1; Tue, 09 Feb 2021 10:38:11 -0500
X-MC-Unique: HPrrstX0OB-xjI2SAbuUPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7572E804036;
 Tue,  9 Feb 2021 15:38:09 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-210.ams2.redhat.com
 [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61D1360CCD;
 Tue,  9 Feb 2021 15:37:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 0/7] vDPA shadow virtqueue - notifications forwarding
Date: Tue,  9 Feb 2021 16:37:50 +0100
Message-Id: <20210209153757.1653598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Rob Miller <rob.miller@broadcom.com>, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series enable vhost (And vhost-vdpa) notifications forwarding for
software assisted live migration, implemented through a shadow
virtqueue.

Shadow virtqueue is a new method of tracking memory for migration:
Instead of relay on vDPA device's dirty logging capability, SW assisted
LM intercepts dataplane, forwarding the descriptors between VM and
device.

In this migration mode, qemu offers a new (shadow) vring to the device
to read and write into, and forwards descriptors between host vring
and qemu one. On used buffer relay, qemu will mark the dirty memory as
with plain virtio-net devices. This way, devices does not need to have
dirty page logging capability.

This RFC series just enables just the notifications forwarding part,
not buffer forwarding/tracking.

It is based on the ideas of DPDK SW assisted LM, in the series of
DPDK's https://patchwork.dpdk.org/cover/48370/ , but will use memory in
qemu Virtual Address Space for rings, instead of in guest's.

Comments are welcome.

Thanks!

v2: Fix non matching comments on qapi/net.json (Eric).
    Delete virtio_queue_get_idx and use already available
        virtio_get_queue_index (Jason).
    Do not check on used notification enable flag, since we need to
        particularize for each virtqueue layout and IOMMU, and it is
        unlikely for this code to be in final version.
    Handle multiqueue devices.
    Delete trailing dot in previous errpr_setg argument

Main changes from previous RFC [1] are:
* Use QMP to enable. Can disable through QMP too.
* Do not use vhost_dev_{enable,disable}_notifiers, since they override
  the VM ioeventfd set, and could cause race conditions. Do never modify
  irqfd or ioeventfd used for the guest.

[1] https://patchew.org/QEMU/20201120185105.279030-1-eperezma@redhat.com/

Eugenio Pérez (7):
  vhost: Delete trailing dot in errpr_setg argument
  virtio: Add virtio_queue_host_notifier_status
  vhost: Save masked_notifier state
  vhost: Add VhostShadowVirtqueue
  vhost: Add x-vhost-enable-shadow-vq qmp
  vhost: Route guest->host notification through shadow virtqueue
  vhost: Route host->guest notification through shadow virtqueue

 qapi/net.json                      |  22 ++++
 hw/virtio/vhost-shadow-virtqueue.h |  33 +++++
 include/hw/virtio/vhost.h          |   5 +
 include/hw/virtio/virtio.h         |   1 +
 hw/virtio/vhost-shadow-virtqueue.c | 205 +++++++++++++++++++++++++++++
 hw/virtio/vhost.c                  | 159 +++++++++++++++++++++-
 hw/virtio/virtio.c                 |   5 +
 hw/virtio/meson.build              |   2 +-
 8 files changed, 430 insertions(+), 2 deletions(-)
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c

-- 
2.27.0


