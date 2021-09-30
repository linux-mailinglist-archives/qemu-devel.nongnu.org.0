Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01D41D181
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 04:37:21 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVlwm-0005tE-Ed
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 22:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVluQ-0004Zy-20
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVluO-00046J-2H
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632969291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5OxXT5vwCSaxMJcCBln9PLTU8YcBV6S6Ba4bWGtdK3A=;
 b=EXc9KbHMHwZQ4S9N/Dh9nornzCfChadzJxl2lx/NzOCFftYnZkx/n/jlUCDxjRXKBk668w
 tj/Qpva8xhCMvpvK36bSdo+75yCK9MnrBqPixtdqg85xpjLB9LNZbyASUEoGmkWtp02i7S
 B7ztHzNtzqOpZiaawYa4RfAoZuhAA9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-z45RO01fPjKFY1do3JhjSQ-1; Wed, 29 Sep 2021 22:34:50 -0400
X-MC-Unique: z45RO01fPjKFY1do3JhjSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34244180830F;
 Thu, 30 Sep 2021 02:34:49 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-120.pek2.redhat.com [10.72.12.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0AA01009962;
 Thu, 30 Sep 2021 02:33:50 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com
Subject: [PATCH v9 00/10] vhost-vdpa: add support for configure interrupt
Date: Thu, 30 Sep 2021 10:33:38 +0800
Message-Id: <20210930023348.17770-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

these patches add the support for configure interrupt

These codes are all tested in vp-vdpa (support configure interrupt)
vdpa_sim (not support configure interrupt), virtio tap device

test in virtio-pci bus and virtio-mmio bus

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
decouple virtqueue from interrupt setting and misc process
fix the bug in virtio_net_handle_rx
use -1 as the queue number to identify if the interrupt is configure interrupt

Change in v7
misc fixes from v6
decouple virtqueue from interrupt setting and misc process
decouple virtqueue from vector use/release process
decouple virtqueue from set notifier fd handler process
move config_notifier and masked_config_notifier to VirtIODevice
fix the bug in virtio_net_handle_rx, add more information
add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the interrupt is configure interrupt

Change in v8
misc fixes from v7
decouple virtqueue from interrupt setting and misc process
decouple virtqueue from vector use/release process
decouple virtqueue from set notifier fd handler process
move the vhost configure interrupt to vhost_net

Change in v9
misc fixes from v8
address the comments for v8

Cindy Lu (10):
  virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
  virtio-pci: decouple notifier from interrupt process
  virtio-pci: decouple the single vector from the interrupt process
  vhost: add new call back function for config interrupt
  vhost-vdpa: add support for config interrupt call back
  virtio: add support for configure interrupt
  virtio-net: add support for configure interrupt
  vhost: add support for configure interrupt
  virtio-mmio: add support for configure interrupt
  virtio-pci: add support for configure interrupt

 hw/display/vhost-user-gpu.c       |   6 +
 hw/net/vhost_net.c                |  10 ++
 hw/net/virtio-net.c               |  16 +-
 hw/virtio/trace-events            |   2 +
 hw/virtio/vhost-user-fs.c         |   9 +-
 hw/virtio/vhost-vdpa.c            |   7 +
 hw/virtio/vhost-vsock-common.c    |   6 +
 hw/virtio/vhost.c                 |  76 +++++++++
 hw/virtio/virtio-crypto.c         |   6 +
 hw/virtio/virtio-mmio.c           |  27 ++++
 hw/virtio/virtio-pci.c            | 260 ++++++++++++++++++++----------
 hw/virtio/virtio-pci.h            |   4 +-
 hw/virtio/virtio.c                |  29 ++++
 include/hw/virtio/vhost-backend.h |   3 +
 include/hw/virtio/vhost.h         |   4 +
 include/hw/virtio/virtio.h        |   6 +
 include/net/vhost_net.h           |   3 +
 17 files changed, 386 insertions(+), 88 deletions(-)

-- 
2.21.3


