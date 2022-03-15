Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29894D947E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 07:18:03 +0100 (CET)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU0VO-000327-O2
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 02:18:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0S1-0000Dd-UE
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nU0Rz-0004Lk-3X
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647324869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=09DtvxiJIgRiNZJt3Y6R5qrsD1s1uHK8ES9v7rfWjlI=;
 b=hQ/z+lHgIx2GjMjM/mCRMy8WxlppvP1sEgX1OrJJPmAeyzUoBLHRCvEw89xvR6lwj55PZ1
 m0aaoq7rnkDScYpNs+Dk+ils3cM/H0OIBuDfpNhuJfco05OIsR/BBVVRGeR6gavREuZm4/
 gHCwNWfcATuKmV4tTKLa0yfy8NQLeqM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-fVAtEOm-OyOe5GDj8vXbWQ-1; Tue, 15 Mar 2022 02:14:26 -0400
X-MC-Unique: fVAtEOm-OyOe5GDj8vXbWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCB5F800960;
 Tue, 15 Mar 2022 06:14:25 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-38.pek2.redhat.com [10.72.14.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEE9F40C128B;
 Tue, 15 Mar 2022 06:14:23 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL V3 00/15] Net patches
Date: Tue, 15 Mar 2022 14:14:05 +0800
Message-Id: <20220315061420.31910-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:

  Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 12a195fa343aae2ead1301ce04727bd0ae25eb15:

  vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-15 13:57:44 +0800)

----------------------------------------------------------------

Changes since V2:
- fix 32bit build errros

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
 hw/virtio/vhost-shadow-virtqueue.c | 636 +++++++++++++++++++++++++++++++++++++
 hw/virtio/vhost-shadow-virtqueue.h |  87 +++++
 hw/virtio/vhost-vdpa.c             | 522 +++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-vdpa.h     |   8 +
 include/qemu/iova-tree.h           |  38 ++-
 util/iova-tree.c                   | 170 ++++++++++
 10 files changed, 1584 insertions(+), 17 deletions(-)
 create mode 100644 hw/virtio/vhost-iova-tree.c
 create mode 100644 hw/virtio/vhost-iova-tree.h
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.c
 create mode 100644 hw/virtio/vhost-shadow-virtqueue.h



