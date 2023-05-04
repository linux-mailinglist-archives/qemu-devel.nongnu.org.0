Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7B6F68F5
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:15:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVzK-0005Tw-03; Thu, 04 May 2023 06:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1puVzH-0005Td-7G
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:14:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1puVzF-0002QD-N5
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683195295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z24416o6Xa8k85eskLO2Ur37iwz+n/CFQLepnLera2U=;
 b=JQYs1xV80NOmkcU85df41EG36OegdGP87jx9E7fHc52FEy/aUGg+FsYxwdcoEmCO6P6aAF
 tsJlmdzxqWQa+m3uqKMxyouS6mvPNfWAF/GHaeieoyCPK26oMZNTIb4dpBDvyApJ+CkRWU
 YSr4TRPiFVKRiLjIjcSgehjyoEyyGMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-vMtWXmbIPkuorBNpXUwlsw-1; Thu, 04 May 2023 06:14:51 -0400
X-MC-Unique: vMtWXmbIPkuorBNpXUwlsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD85B185A790;
 Thu,  4 May 2023 10:14:50 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D76F01121339;
 Thu,  4 May 2023 10:14:49 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Lei Yang <leiyang@redhat.com>
Subject: [PATCH] virtio-net: not enable vq reset feature unconditionally
Date: Thu,  4 May 2023 12:14:47 +0200
Message-Id: <20230504101447.389398-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The commit 93a97dc5200a ("virtio-net: enable vq reset feature") enables
unconditionally vq reset feature as long as the device is emulated.
This makes impossible to actually disable the feature, and it causes
migration problems from qemu version previous than 7.2.

The entire final commit is unneeded as device system already enable or
disable the feature properly.

This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

---
Tested by checking feature bit at  /sys/devices/pci.../virtio0/features
enabling and disabling queue_reset virtio-net feature and vhost=on/off
on net device backend.
---
 hw/net/virtio-net.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c32643..4ea33b6e2e 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -805,7 +805,6 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
     }
 
     if (!get_vhost_net(nc->peer)) {
-        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
         return features;
     }
 
-- 
2.31.1


