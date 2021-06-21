Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9C73AE21F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:18:44 +0200 (CEST)
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBOU-0003AY-PT
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBMv-00010a-Ve
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBMs-0000j8-Vv
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624249020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VOQu7hcNFocOD7guFAiBnaq35+Z+uWjMB3FRLcqbDmI=;
 b=WI7oc30F+p6ls8fKGJYa9Z7IqCQtnYJP/bJNEn6dfZ2vVWlzlIXwdHLEY2K/B1K5wFz591
 XglPg2R04HGYnnrqW8gzkII0+pPTOuJ6wtdknv0LoDD3ZSKnjsVanVYbeQDsd9AITIkJF3
 D84vRCtt6pSJxwUvNpQbY2ozQ7CJY4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-1hIDL8-wNwm5gV9VRigBCw-1; Mon, 21 Jun 2021 00:16:59 -0400
X-MC-Unique: 1hIDL8-wNwm5gV9VRigBCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BF85100C609;
 Mon, 21 Jun 2021 04:16:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-217.pek2.redhat.com
 [10.72.12.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B775F60877;
 Mon, 21 Jun 2021 04:16:52 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 00/18] vhost-vDPA multiqueue
Date: Mon, 21 Jun 2021 12:16:32 +0800
Message-Id: <20210621041650.5826-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All:

This patch implements the multiqueue support for vhost-vDPA. The most
important requirement the control virtqueue support. The virtio-net
and vhost-net core are tweak to support control virtqueue as if what
data queue pairs are done: a dedicated vhost_net device which is
coupled with the NetClientState is intrdouced so most of the existing
vhost codes could be reused with minor changes. With the control
virtqueue, vhost-vDPA are extend to support creating and destroying
multiqueue queue pairs plus the control virtqueue.

Tests are done via the vp_vdpa driver in L1 guest.

Please reivew.

Thanks

Jason Wang (18):
  vhost_net: remove the meaningless assignment in vhost_net_start_one()
  vhost: use unsigned int for nvqs
  vhost_net: do not assume nvqs is always 2
  vhost-vdpa: remove the unnecessary check in vhost_vdpa_add()
  vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
  vhost-vdpa: fix leaking of vhost_net in vhost_vdpa_add()
  vhost-vdpa: tweak the error label in vhost_vdpa_add()
  vhost-vdpa: fix the wrong assertion in vhost_vdpa_init()
  vhost-vdpa: remove the unncessary queue_index assignment
  vhost-vdpa: open device fd in net_init_vhost_vdpa()
  vhost-vdpa: classify one time request
  vhost-vdpa: prepare for the multiqueue support
  vhost-vdpa: let net_vhost_vdpa_init() returns NetClientState *
  net: introduce control client
  vhost-net: control virtqueue support
  virito-net: use "qps" instead of "queues" when possible
  virtio-net: vhost control virtqueue support
  vhost-vdpa: multiqueue support

 hw/net/vhost_net.c             |  48 +++++++---
 hw/net/virtio-net.c            | 165 ++++++++++++++++++---------------
 hw/virtio/vhost-vdpa.c         |  55 ++++++++++-
 include/hw/virtio/vhost-vdpa.h |   1 +
 include/hw/virtio/vhost.h      |   2 +-
 include/hw/virtio/virtio-net.h |   5 +-
 include/net/net.h              |   5 +
 include/net/vhost_net.h        |   7 +-
 net/net.c                      |  24 ++++-
 net/tap.c                      |   1 +
 net/vhost-user.c               |   1 +
 net/vhost-vdpa.c               | 150 +++++++++++++++++++++++-------
 12 files changed, 326 insertions(+), 138 deletions(-)

-- 
2.25.1


