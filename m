Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35D8576618
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 19:33:39 +0200 (CEST)
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCPC6-0006gJ-R6
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 13:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOyA-0005Fs-E1
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCOy8-0005sy-Tq
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 13:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657905552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUj+IsouhY5Fm8JAI1LY9cCh0zDRy7WQa9mbuUixvV4=;
 b=Cfff2Ujd945GnQTiDOABaumlKsXSLE0S2tSZHtxEGGuAHODiid/mf5xQELp1yPD0TbnMGA
 FEm+IXmCz2J7eU1B7arGzFpYmYLRuqdJWEYdV7FSewaY4KEkcrkXSZi4Fpza7fckcLNNso
 eVzTo/8HJc3P9G0Lis9N+Hv5Nz36l4w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-13ZHEaYBMUqjgyTbyMz-DQ-1; Fri, 15 Jul 2022 13:19:09 -0400
X-MC-Unique: 13ZHEaYBMUqjgyTbyMz-DQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B51C801755;
 Fri, 15 Jul 2022 17:19:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE17540E8B04;
 Fri, 15 Jul 2022 17:19:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Parav Pandit <parav@mellanox.com>,
 Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eric Blake <eblake@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 09/19] vhost: Track number of descs in SVQDescState
Date: Fri, 15 Jul 2022 19:18:24 +0200
Message-Id: <20220715171834.2666455-10-eperezma@redhat.com>
In-Reply-To: <20220715171834.2666455-1-eperezma@redhat.com>
References: <20220715171834.2666455-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index d12f5afffb..ae5bd6efa8 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -257,6 +257,7 @@ static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
     }
 
     svq->desc_state[qemu_head].elem = elem;
+    svq->desc_state[qemu_head].ndescs = ndescs;
     vhost_svq_kick(svq);
     return 0;
 }
@@ -417,8 +418,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
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


