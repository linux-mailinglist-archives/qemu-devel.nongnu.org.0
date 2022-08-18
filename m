Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188155987CD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 17:50:59 +0200 (CEST)
Received: from localhost ([::1]:40736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOhnK-0002tn-Nu
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 11:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oOhKb-0001u1-3G
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:21:13 -0400
Received: from smtp236.sjtu.edu.cn ([202.120.2.236]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1oOhKZ-0000PO-32
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 11:21:12 -0400
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp236.sjtu.edu.cn (Postfix) with ESMTPS id 379FB1008B392;
 Thu, 18 Aug 2022 23:13:10 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by proxy02.sjtu.edu.cn (Postfix) with ESMTP id 7874C2391A025;
 Thu, 18 Aug 2022 23:13:10 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id U7xg1c3srkZN; Thu, 18 Aug 2022 23:13:10 +0800 (CST)
Received: from localhost.localdomain (unknown [202.120.40.82])
 (Authenticated sender: qtxuning1999@sjtu.edu.cn)
 by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id CD8B32391A010;
 Thu, 18 Aug 2022 23:13:00 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: eperezma@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 mst@redhat.com
Cc: qemu-devel@nongnu.org,
	Guo Zhi <qtxuning1999@sjtu.edu.cn>
Subject: [RFC 2/2] virtio: enable f_in_order feature for virtio-net
Date: Thu, 18 Aug 2022 23:12:44 +0800
Message-Id: <20220818151244.2050-3-qtxuning1999@sjtu.edu.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
References: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
Received-SPF: pass client-ip=202.120.2.236;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp236.sjtu.edu.cn
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In order feature is not a transparent feature in QEMU, only specific
devices(eg, virtio-net) support it.

Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
---
 hw/net/virtio-net.c        | 1 +
 include/hw/virtio/virtio.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c8e83921..cf0b23d8 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -719,6 +719,7 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
     features |= n->host_features;
 
     virtio_add_feature(&features, VIRTIO_NET_F_MAC);
+    virtio_add_feature(&features, VIRTIO_F_IN_ORDER);
 
     if (!peer_has_vnet_hdr(n)) {
         virtio_clear_feature(&features, VIRTIO_NET_F_CSUM);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index db1c0ddf..578f22c8 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -291,7 +291,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
     DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
                       VIRTIO_F_IOMMU_PLATFORM, false), \
     DEFINE_PROP_BIT64("packed", _state, _field, \
-                      VIRTIO_F_RING_PACKED, false)
+                      VIRTIO_F_RING_PACKED, false), \
+    DEFINE_PROP_BIT64("in_order", _state, _field, \
+                      VIRTIO_F_IN_ORDER, false)
 
 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
 bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);
-- 
2.17.1


