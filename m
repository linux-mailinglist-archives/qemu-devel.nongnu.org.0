Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF38612167
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:29:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oohCe-0007cJ-KN; Sat, 29 Oct 2022 04:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oohCT-0007WL-Pd
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oohCQ-0003Oy-Ou
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 04:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667032089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yUDwJULcuV+6uMhn4qtmjJ3D4Fzg/iReNXsvGDuECtk=;
 b=fSRQpnVU3HfN2dQ+7uE7CBuIeBR+AD/9wK/2elJfWfdaUzZppFypgFufUhhdyBnR2fI8zc
 MYf5/KZqzMYMthVO0aS/hDQ+sn7/TtA4C0/0A1tEL3CPs6VHhHnzusYJ7hYemn2I8g2qXJ
 yH3bZnOZGp0AxXgDF6x26ABS1sQIyck=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-vyBoY9OdMdCVMymCvgT0MA-1; Sat, 29 Oct 2022 04:28:02 -0400
X-MC-Unique: vyBoY9OdMdCVMymCvgT0MA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96BC8811E87;
 Sat, 29 Oct 2022 08:28:02 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-241.pek2.redhat.com [10.72.12.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3EAF492B2B;
 Sat, 29 Oct 2022 08:27:58 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v18 00/10] vhost-vdpa: add support for configure interrupt
Date: Sat, 29 Oct 2022 16:27:45 +0800
Message-Id: <20221029082755.1265144-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These patches introduced the support for configure interrupt 

These codes are tested on x86_64 and aarch64 platforms.  
the test scenario is based on vp-vdpa/vdpa_sim /virtio net device, with
the irqfd and without irqfd.

Tested in virtio-pci bus and virtio-mmio bus


Change in v2:
Add support for virtio-mmio bus
active the notifier while the backend support configure interrupt
misc fixes from v1

Change in v3
fix the coding style problems

Change in v4
misc fixes from v3
merge the set_config_notifier to set_guest_notifier
when vdpa start, check the feature by VIRTIO_NET_F_STATUS

Change in v5
misc fixes from v4
split the code to introduce configure interrupt type and the callback function
will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will
only active while using vhost-vdpa driver

Change in v6
misc fixes from v5
decouple vq from interrupt setting and misc process
fix the bug in virtio_net_handle_rx

Change in v7
misc fixes from v6
decouple vq from interrupt setting and misc process
decouple vq from vector use/release process
decouple vq from set notifier fd handler process
move config_notifier and masked_config_notifier to VirtIODevice
fix the bug in virtio_net_handle_rx, add more information
add VIRTIO_CONFIG_IRQ_IDX as the queue number for configure interrupt 

Change in v8
misc fixes from v7
decouple vq from interrupt setting and misc process
decouple vq from vector use/release process
decouple vq from set notifier fd handler process
move the vhost configure interrupt to vhost_net

Change in v9
misc fixes from v8
address the comments from v8

Change in v10
fix the hang issue in qtest
address the comments from v9

Change in v11
fix the crash in aarch64 plateform.
fix the crash upstream reported

Change in v12
fix the typo and the comments

changes in v13
re-send the patches by git-publish

changes in v14
rebased the code based on upstream

changes in v15
rebased the code based on upstream

changes in v16
resend the patch, seems there not send successfully

changes in v18
fix the crash in qtest
Because hw/virtio/vhost-user-gpio.c is a new device,So I missed 
to add the VIRTIO_CONFIG_IRQ_IDX check in notifier_mask

Cindy Lu (10):
  virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX
  virtio-pci: decouple notifier from interrupt process
  virtio-pci: decouple the single vector from the interrupt process
  vhost: introduce new VhostOps vhost_set_config_call
  vhost-vdpa: add support for config interrupt
  virtio: add support for configure interrupt
  vhost: add support for configure interrupt
  virtio-net: add support for configure interrupt
  virtio-mmio: add support for configure interrupt
  virtio-pci: add support for configure interrupt

 hw/display/vhost-user-gpu.c       |  18 ++
 hw/net/vhost_net.c                |   9 +
 hw/net/virtio-net.c               |  22 ++-
 hw/virtio/trace-events            |   1 +
 hw/virtio/vhost-user-fs.c         |  18 ++
 hw/virtio/vhost-user-gpio.c       |  10 ++
 hw/virtio/vhost-vdpa.c            |   8 +
 hw/virtio/vhost-vsock-common.c    |  18 ++
 hw/virtio/vhost.c                 |  78 +++++++-
 hw/virtio/virtio-crypto.c         |  18 ++
 hw/virtio/virtio-mmio.c           |  27 +++
 hw/virtio/virtio-pci.c            | 283 +++++++++++++++++++++---------
 hw/virtio/virtio.c                |  29 +++
 include/hw/virtio/vhost-backend.h |   3 +
 include/hw/virtio/vhost.h         |   4 +
 include/hw/virtio/virtio-pci.h    |   4 +-
 include/hw/virtio/virtio.h        |   7 +
 include/net/vhost_net.h           |   2 +
 18 files changed, 472 insertions(+), 87 deletions(-)

-- 
2.34.3


