Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF67736BDD1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:42:47 +0200 (CEST)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEcY-0007TN-P1
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEa9-0005eJ-Jf
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lbEa5-0005x8-IW
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 23:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619494811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JWzgOAHu9DP2QKZkO6pt3/A8SPhxsbBcqPs3QtjJbxk=;
 b=NgItng0iBaGBWNgZiTuNyFYzvHTiqIfzZkc9BrLs15w3eDqHNJ+H1XNCpGwAtGYJXlYMwj
 5g/glw00Q3VYoFAmFS6oWzB64wnMtnSK6lvZ+/oDjZp/xW1E7Lx6m4SoeM4DoXt7XCQFFM
 SkMO1pPAqm7zwNVx9wPDZTlT1ZvKGK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-MwZRlckkNvK_U0chGWxzYA-1; Mon, 26 Apr 2021 23:40:09 -0400
X-MC-Unique: MwZRlckkNvK_U0chGWxzYA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A5D80D6A8
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:40:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-211.pek2.redhat.com [10.72.13.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 836D35D9C0;
 Tue, 27 Apr 2021 03:39:58 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v6 0/9] vhost-vdpa: add support for configure interrupt
Date: Tue, 27 Apr 2021 11:39:42 +0800
Message-Id: <20210427033951.29805-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
vdpa_sim (not support configure interrupt)

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

Cindy Lu (9):
  hw: Add check for queue number
  virtio-pci:decouple virtqueue from interrupt setting process
  vhost: add new call back function for config interrupt
  vhost-vdpa: add support for config interrupt call back
  vhost:add support for configure interrupt
  virtio-mmio: add support for configure interrupt
  virtio-pci: add support for configure interrupt
  virtio: decouple virtqueue from set notifier fd handler
  virtio-net: add peer_deleted check in virtio_net_handle_rx

 hw/display/vhost-user-gpu.c       |   8 +-
 hw/net/vhost_net.c                |   9 ++
 hw/net/virtio-net.c               |  20 ++-
 hw/s390x/virtio-ccw.c             |   6 +-
 hw/virtio/trace-events            |   2 +
 hw/virtio/vhost-user-fs.c         |  11 +-
 hw/virtio/vhost-vdpa.c            |   7 +
 hw/virtio/vhost-vsock-common.c    |   8 +-
 hw/virtio/vhost.c                 |  70 +++++++++-
 hw/virtio/virtio-crypto.c         |   8 +-
 hw/virtio/virtio-mmio.c           |  30 ++++-
 hw/virtio/virtio-pci.c            | 212 +++++++++++++++++++-----------
 hw/virtio/virtio.c                |  37 ++++--
 include/hw/virtio/vhost-backend.h |   3 +
 include/hw/virtio/vhost.h         |   3 +
 include/hw/virtio/virtio.h        |   4 +-
 include/net/vhost_net.h           |   3 +
 17 files changed, 336 insertions(+), 105 deletions(-)

-- 
2.21.3


