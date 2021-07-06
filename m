Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84D3BC70A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 09:22:17 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0fPM-0000FV-A5
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 03:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fNn-0006N2-4d
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1m0fNl-0003w2-E4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 03:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625556036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7cbxmPO1HRXGfNG8yZcTqsyswyxAMv0nqGS/o3Jrm8Y=;
 b=DRQDqx97x6R4bQq0YjFmV1lFfQYzqhxando1EYD+OnzQzydxZLZr6P+BCyqwp91qir3pri
 qHfgBQM13pH9kPYV/asbfTvyJoVJLBlfwhz4BtD0SXsIr9tfR5PHMPcBJPBEVq3yLduUVq
 Lt+jHp3OxzxEy3mpgiG4Bq3y6gLvhRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-QS51O57QMUqhWWihuh5F5Q-1; Tue, 06 Jul 2021 03:20:35 -0400
X-MC-Unique: QS51O57QMUqhWWihuh5F5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E9EF5074B
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 07:20:34 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-123.pek2.redhat.com [10.72.13.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED4DA5C1D0;
 Tue,  6 Jul 2021 07:20:32 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v8 0/9] vhost-vdpa: add support for configure interrupt
Date: Tue,  6 Jul 2021 15:20:21 +0800
Message-Id: <20210706072030.32365-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

these patches are add the support for configure interrupt 

These code are all tested in vp-vdpa (support configure interrupt)
vdpa_sim (not support configure interrupt), virtio tap device 

test in virtio-pci bus and virtio-mmio bus

Change in v2:
Add support for virtio-mmio bus
active the notifier while the backend support configure interrupt
misc fixes form v1

Change in v3
fix the coding style problems

Change in v4
misc fixes form v3
merge the set_config_notifier to set_guest_notifier
when vdpa start, check the feature by VIRTIO_NET_F_STATUS 

Change in v5
misc fixes form v4
split the code for introduce configure interrupt type and callback function 
will init the configure interrupt in all virtio-pci and virtio-mmio bus, but will 
only active while using vhost-vdpa driver

Change in v6
misc fixes form v5
decouple virtqueue from interrupt setting and misc process
fix the bug in virtio_net_handle_rx
use -1 as the queue number to identify if the interrupt is configure interrupt

Change in v7
misc fixes form v6
decouple virtqueue from interrupt setting and misc process
decouple virtqueue from verctor use/release process 
decouple virtqueue from set notifier fd handler process
move config_notifier and masked_config_notifier to VirtIODevice
fix the bug in virtio_net_handle_rx, add more information 
add VIRTIO_CONFIG_IRQ_IDX as the queue number to identify if the interrupt is configure interrupt


Change in v8
misc fixes form v7
decouple virtqueue from interrupt setting and misc process
decouple virtqueue from verctor use/release process 
decouple virtqueue from set notifier fd handler process
move the vhost configure interrpt to vhost_net

Cindy Lu (9):
  virtio: introduce macro IRTIO_CONFIG_IRQ_IDX
  virtio-pci:decouple virtqueue from interrupt setting process
  vhost: add new call back function for config interrupt
  vhost-vdpa: add support for config interrupt call back
  vhost-net:add support for configure interrupt
  virtio-mmio: add support for configure interrupt
  virtio-pci: decouple notifier from interrupt process
  virtio-pci:decouple the single vector from the interrupt process
  virtio-pci: add support for configure interrupt

 hw/display/vhost-user-gpu.c       |   6 +
 hw/net/vhost_net.c                |  36 ++++++
 hw/net/virtio-net.c               |  16 ++-
 hw/virtio/trace-events            |   2 +
 hw/virtio/vhost-user-fs.c         |   9 +-
 hw/virtio/vhost-vdpa.c            |   7 +
 hw/virtio/vhost-vsock-common.c    |   6 +
 hw/virtio/vhost.c                 |  44 +++++++
 hw/virtio/virtio-crypto.c         |   6 +
 hw/virtio/virtio-mmio.c           |  26 ++++
 hw/virtio/virtio-pci.c            | 207 ++++++++++++++++++------------
 hw/virtio/virtio.c                |  33 ++++-
 include/hw/virtio/vhost-backend.h |   3 +
 include/hw/virtio/vhost.h         |   2 +
 include/hw/virtio/virtio.h        |   7 +
 include/net/vhost_net.h           |   3 +
 16 files changed, 326 insertions(+), 87 deletions(-)

-- 
2.21.3


