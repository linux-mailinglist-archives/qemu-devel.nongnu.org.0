Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5857B167
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:09:33 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3ps-0000RD-0V
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hI-0000T1-9o
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hG-0006ef-NT
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658300437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4H+U8wSNcX4JZbeeKzhQcCq+VvtHuoOrUr7FSQWW5rA=;
 b=fTaAyXI/7LAi0L5c2MDnk+YVtEGqFDeuu2LA3ijQ9ffHQdRLyemox3tBNHVfFtUo1hd7QT
 T02lFfaHDRvez34pI/gV0UsGtrQlKxFD2HE3TGuSzN2ax8gPmuS2LXvDIUr/oqV5SgYNKf
 Uud2xITRHd+GHw0LizbNJLwrer99VzU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-sB0nXdbEP8eZ9EVXVJs9pg-1; Wed, 20 Jul 2022 03:00:27 -0400
X-MC-Unique: sB0nXdbEP8eZ9EVXVJs9pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0186238149A8;
 Wed, 20 Jul 2022 07:00:27 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC79118EA8;
 Wed, 20 Jul 2022 07:00:23 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v6 10/21] vhost: Track number of descs in SVQDescState
Date: Wed, 20 Jul 2022 08:59:35 +0200
Message-Id: <20220720065946.3122611-11-eperezma@redhat.com>
In-Reply-To: <20220720065946.3122611-1-eperezma@redhat.com>
References: <20220720065946.3122611-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

A guest's buffer continuos on GPA may need multiple descriptors on
qemu's VA, so SVQ should track its length sepparatedly.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 6 ++++++
 hw/virtio/vhost-shadow-virtqueue.c | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index d646c35054..5c7e7cbab6 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -17,6 +17,12 @@
 
 typedef struct SVQDescState {
     VirtQueueElement *elem;
+
+    /*
+     * Number of descriptors exposed to the device. May or may not match
+     * guest's
+     */
+    unsigned int ndescs;
 } SVQDescState;
 
 /* Shadow virtqueue to relay notifications */
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e4c09e2d88..8314405e01 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -257,6 +257,7 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
     }
 
     svq->desc_state[qemu_head].elem = elem;
+    svq->desc_state[qemu_head].ndescs = ndescs;
     vhost_svq_kick(svq);
     return 0;
 }
@@ -418,8 +419,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    num = svq->desc_state[used_elem.id].elem->in_num +
-          svq->desc_state[used_elem.id].elem->out_num;
+    num = svq->desc_state[used_elem.id].ndescs;
     last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
-- 
2.31.1


