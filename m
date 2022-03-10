Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E164D3F4D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 03:42:05 +0100 (CET)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS8kd-0005ly-Vi
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 21:42:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8i2-0003F1-5b
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8hz-0003yf-CG
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646879958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5fF6kefIAxrQyFTX1lcfg6Xw8Q4+jMfBSuF66v8MAYY=;
 b=BCWrYXZfLVcGHmJBmO47xjRAKfbtzS7rrBYS3WLyWThCV+Nh2adxIBzhPdN4788qUuSoIe
 V5lXLO7hMulaK+mY/Y/J9QNNgbo1GeCIhg566mm//6gZrTT93+1DVm82MjVEscIM3T+R8E
 dgfc7BPH4ICueKJx/sReFeiTF8uc0OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-a2tGxeHAOl6JXisMZonEiQ-1; Wed, 09 Mar 2022 21:39:15 -0500
X-MC-Unique: a2tGxeHAOl6JXisMZonEiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EAC6824FA8;
 Thu, 10 Mar 2022 02:39:14 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-194.pek2.redhat.com
 [10.72.13.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D10F100685F;
 Thu, 10 Mar 2022 02:39:09 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V2 00/15] Net patches
Date: Thu, 10 Mar 2022 10:38:52 +0800
Message-Id: <20220310023907.2443-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d9ccf33f9479201e5add8db0af68ca9ca8da358b:

  Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/linux-user-for-7.0-pull-request' into staging (2022-03-09 20:01:17 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to eea40402ecf895ed345f8e8eb07dbb484f4542c5:

  vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-10 10:26:32 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Eugenio Pérez (14):
      vhost: Add VhostShadowVirtqueue
      vhost: Add Shadow VirtQueue kick forwarding capabilities
      vhost: Add Shadow VirtQueue call forwarding capabilities
      vhost: Add vhost_svq_valid_features to shadow vq
      virtio: Add vhost_svq_get_vring_addr
      vdpa: adapt vhost_ops callbacks to svq
      vhost: Shadow virtqueue buffers forwarding
      util: Add iova_tree_alloc_map
      util: add iova_tree_find_iova
      vhost: Add VhostIOVATree
      vdpa: Add custom IOTLB translations to SVQ
      vdpa: Adapt vhost_vdpa_get_vring_base to SVQ
      vdpa: Never set log_base addr if SVQ is enabled
      vdpa: Expose VHOST_F_LOG_ALL on SVQ

Jason Wang (1):
      virtio-net: fix map leaking on error during receive

 hw/net/virtio-net.c                |   1 +
 hw/virtio/meson.build              |   2 +-
 hw/virtio/vhost-iova-tree.c        | 110 +++++++
 hw/virtio/vhost-iova-tree.h        |  27 ++
 hw/virtio/vhost-shadow-virtqueue.c | 638 +++++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.h |  87 +++++
 hw/virtio/vhost-vdpa.c             | 525 +++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vdpa.h     |   8 +
 include/qemu/iova-tree.h           |  38 ++-
 util/iova-tree.c                   | 169 ++++++++++
 10 files changed, 1588 insertions(+), 17 deletions(-)
 create mode 100644 hw/virtio/vhost-iova-tree.c
 create mode 100644 hw/virtio/vhost-iova-tree.h
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h


