Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F015AEE7B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 17:17:56 +0200 (CEST)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVaKp-0000rg-58
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 11:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVaAz-0004tH-5f
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oVaAt-0002IL-NZ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 11:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662476859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bseDS+wOobKWNpI52Cr9QlPEX2vQfsnWTkOXDELPEw=;
 b=B4Zb+7pLivnlVgzn7bK3KxP4Ii3UNPDaiTOY8oqxQolCsOdoqWoi6KQI7OEUgwoYe6OG4S
 X1rLdildy8GKS/DdHKowIMzDZBa4vwUuT6HhdmYcShr8cjvfF/LgfSmWs4EvIopk7yOKWR
 zSb/UBM7VWrov4NdrZkHU352QaVHGzY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-vdB46o3OMHSQY6kin3r9hA-1; Tue, 06 Sep 2022 11:07:35 -0400
X-MC-Unique: vdB46o3OMHSQY6kin3r9hA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AD313C01D86;
 Tue,  6 Sep 2022 15:07:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC47040D296C;
 Tue,  6 Sep 2022 15:07:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>
Subject: [PATCH v4 3/6] vdpa: Add vhost_vdpa_net_load_mq
Date: Tue,  6 Sep 2022 17:07:16 +0200
Message-Id: <20220906150719.1134955-4-eperezma@redhat.com>
In-Reply-To: <20220906150719.1134955-1-eperezma@redhat.com>
References: <20220906150719.1134955-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Same way as with the MAC, restore the expected number of queues at
device's start.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index e799e744cd..3950e4f25d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -400,6 +400,28 @@ static int vhost_vdpa_net_load_mac(VhostVDPAState *s, const VirtIONet *n)
     return 0;
 }
 
+static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
+                                  const VirtIONet *n)
+{
+    struct virtio_net_ctrl_mq mq;
+    uint64_t features = n->parent_obj.guest_features;
+    ssize_t dev_written;
+
+    if (!(features & BIT_ULL(VIRTIO_NET_F_MQ))) {
+        return 0;
+    }
+
+    mq.virtqueue_pairs = cpu_to_le16(n->curr_queue_pairs);
+    dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_MQ,
+                                          VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET, &mq,
+                                          sizeof(mq));
+    if (unlikely(dev_written < 0)) {
+        return dev_written;
+    }
+
+    return *s->status != VIRTIO_NET_OK;
+}
+
 static int vhost_vdpa_net_load(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -418,6 +440,10 @@ static int vhost_vdpa_net_load(NetClientState *nc)
     if (unlikely(r < 0)) {
         return r;
     }
+    r = vhost_vdpa_net_load_mq(s, n);
+    if (unlikely(r)) {
+        return r;
+    }
 
     return 0;
 }
-- 
2.31.1


