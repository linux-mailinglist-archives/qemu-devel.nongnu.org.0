Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C813D5A0173
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 20:39:18 +0200 (CEST)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQvHZ-0003RZ-De
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 14:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEj-0007aj-EG
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQvEV-0005Ri-C4
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 14:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661366164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFiLWeiVsGEscClQ/MvCKfr/QZjXWkuihIbsMAiGk+o=;
 b=aV4cxl6wB3b+Iqqj2fdBy8vjwj3nX6vPudViqUjGDKWjndGlawJ6ZObt8vc0AdjZ6wvEFM
 Z+1/EOU55LCl6ic70aDyEPJLP+5iHTMCpTKQfebW9yp064i4UNFIMBePeYs2OY8gay9Mi0
 aExRbpamydhjyL0be1mI6bCSauOGQVs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-Y_Scn3pLM82iW5zgEw-6Ng-1; Wed, 24 Aug 2022 14:36:00 -0400
X-MC-Unique: Y_Scn3pLM82iW5zgEw-6Ng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF8793C0CD5D;
 Wed, 24 Aug 2022 18:35:59 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50BC72166B26;
 Wed, 24 Aug 2022 18:35:57 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Subject: [PATCH v2 1/6] vdpa: Make VhostVDPAState cvq_cmd_out_buffer control
 ack type
Date: Wed, 24 Aug 2022 20:35:46 +0200
Message-Id: <20220824183551.197052-2-eperezma@redhat.com>
In-Reply-To: <20220824183551.197052-1-eperezma@redhat.com>
References: <20220824183551.197052-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to simplify the code.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6ce68fcd3f..468e460ac2 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -35,7 +35,9 @@ typedef struct VhostVDPAState {
     VHostNetState *vhost_net;
 
     /* Control commands shadow buffers */
-    void *cvq_cmd_out_buffer, *cvq_cmd_in_buffer;
+    void *cvq_cmd_out_buffer;
+    virtio_net_ctrl_ack *cvq_cmd_in_buffer;
+
     bool started;
 } VhostVDPAState;
 
@@ -396,7 +398,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
             return dev_written;
         }
 
-        return *((virtio_net_ctrl_ack *)s->cvq_cmd_in_buffer) != VIRTIO_NET_OK;
+        return *s->cvq_cmd_in_buffer != VIRTIO_NET_OK;
     }
 
     return 0;
@@ -491,8 +493,7 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         goto out;
     }
 
-    memcpy(&status, s->cvq_cmd_in_buffer, sizeof(status));
-    if (status != VIRTIO_NET_OK) {
+    if (*s->cvq_cmd_in_buffer != VIRTIO_NET_OK) {
         return VIRTIO_NET_ERR;
     }
 
-- 
2.31.1


