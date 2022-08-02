Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6C587D0E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:26:58 +0200 (CEST)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrvF-0001bS-H3
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oIrtG-0007lj-3S
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oIrtB-00035M-5f
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659446688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fmAuQVeTJipfLwNrimjnWs4amQCSR1ELmwPJMslh6jA=;
 b=XhU5/1rQWIQs/IXlxLRlrSNvHM5VY2kyeq9vntYeEJS2JYNxyzzwlJMq4UiVAFkEAkUWsw
 jbGMhPC0i9Cp+rERv5aR9BapUsDuDSKGPyiIKsfhuqNucpHtBpYE2lAV+Q+SAkex2PRmMQ
 RfWTE3ppOgtG/FY7CZvodTBEB8/t67g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-jyro36oWNiCRJskD17UZkQ-1; Tue, 02 Aug 2022 09:24:44 -0400
X-MC-Unique: jyro36oWNiCRJskD17UZkQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8416E8037AE;
 Tue,  2 Aug 2022 13:24:44 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4D56492C3B;
 Tue,  2 Aug 2022 13:24:43 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Amit Shah <amit@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] virtio: remove unnecessary host_features in ->get_features()
Date: Tue,  2 Aug 2022 09:24:42 -0400
Message-Id: <20220802132442.685011-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since at least commit 6b8f1020540c27246277377aa2c3331ad2bfb160 ("virtio:
move host_features") the ->get_features() function has been called with
host_features as an argument.

Some devices manually add host_features in ->get_features() although the
features argument already contains host_features. Make all devices
consistent by dropping the unnecessary code.

Cc: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/block/virtio-blk.c       | 3 ---
 hw/char/virtio-serial-bus.c | 1 -
 hw/net/virtio-net.c         | 3 ---
 hw/scsi/vhost-scsi-common.c | 3 ---
 hw/scsi/virtio-scsi.c       | 4 ----
 hw/virtio/virtio-balloon.c  | 2 --
 6 files changed, 16 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..429aedcf2b 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -996,9 +996,6 @@ static uint64_t virtio_blk_get_features(VirtIODevice *vdev, uint64_t features,
 {
     VirtIOBlock *s = VIRTIO_BLK(vdev);
 
-    /* Firstly sync all virtio-blk possible supported features */
-    features |= s->host_features;
-
     virtio_add_feature(&features, VIRTIO_BLK_F_SEG_MAX);
     virtio_add_feature(&features, VIRTIO_BLK_F_GEOMETRY);
     virtio_add_feature(&features, VIRTIO_BLK_F_TOPOLOGY);
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 7d4601cb5d..1414fb85ae 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -557,7 +557,6 @@ static uint64_t get_features(VirtIODevice *vdev, uint64_t features,
 
     vser = VIRTIO_SERIAL(vdev);
 
-    features |= vser->host_features;
     if (vser->bus.max_nr_ports > 1) {
         virtio_add_feature(&features, VIRTIO_CONSOLE_F_MULTIPORT);
     }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index dd0d056fde..8ecdc1cd83 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -715,9 +715,6 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
     VirtIONet *n = VIRTIO_NET(vdev);
     NetClientState *nc = qemu_get_queue(n->nic);
 
-    /* Firstly sync all virtio-net possible supported features */
-    features |= n->host_features;
-
     virtio_add_feature(&features, VIRTIO_NET_F_MAC);
 
     if (!peer_has_vnet_hdr(n)) {
diff --git a/hw/scsi/vhost-scsi-common.c b/hw/scsi/vhost-scsi-common.c
index 767f827e55..8b26f90aa1 100644
--- a/hw/scsi/vhost-scsi-common.c
+++ b/hw/scsi/vhost-scsi-common.c
@@ -124,9 +124,6 @@ uint64_t vhost_scsi_common_get_features(VirtIODevice *vdev, uint64_t features,
 {
     VHostSCSICommon *vsc = VHOST_SCSI_COMMON(vdev);
 
-    /* Turn on predefined features supported by this device */
-    features |= vsc->host_features;
-
     return vhost_get_features(&vsc->dev, vsc->feature_bits, features);
 }
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 4141dddd51..f754611dfe 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -816,10 +816,6 @@ static uint64_t virtio_scsi_get_features(VirtIODevice *vdev,
                                          uint64_t requested_features,
                                          Error **errp)
 {
-    VirtIOSCSI *s = VIRTIO_SCSI(vdev);
-
-    /* Firstly sync all virtio-scsi possible supported features */
-    requested_features |= s->host_features;
     return requested_features;
 }
 
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 73ac5eb675..0e9ca71b15 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -796,8 +796,6 @@ static void virtio_balloon_set_config(VirtIODevice *vdev,
 static uint64_t virtio_balloon_get_features(VirtIODevice *vdev, uint64_t f,
                                             Error **errp)
 {
-    VirtIOBalloon *dev = VIRTIO_BALLOON(vdev);
-    f |= dev->host_features;
     virtio_add_feature(&f, VIRTIO_BALLOON_F_STATS_VQ);
 
     return f;
-- 
2.37.1


