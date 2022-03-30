Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A14ECCDE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 21:03:24 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdbH-0003IC-J6
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 15:03:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd6b-00066k-3x
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZd6Z-0006WJ-3Q
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648665098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zck6c8oTpToAbaL+eBIMP52brUzAbPTu3DbdpX7x8FU=;
 b=GngRUskuqWk+xThTRhi+gBe8atOefVIBOvu+tbSeN+2J6XOEHO0OiqzPHhd0bvzLJdDGUP
 9xybdmf7hL4dNMwZhS+2SUQ2de4It2ztExGMWplXAVas3XuI3w6oKP3BOesmNfPZOvtSwy
 4CNmRJjTA1Y75wWtMd/+x102EkqahlM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-swfhJ3iBOP-QfRmo-wQoqg-1; Wed, 30 Mar 2022 14:31:35 -0400
X-MC-Unique: swfhJ3iBOP-QfRmo-wQoqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAAA31C168EC;
 Wed, 30 Mar 2022 18:31:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EE9E57ECED;
 Wed, 30 Mar 2022 18:31:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 03/19] vhost: move descriptor translation to
 vhost_svq_vring_write_descs
Date: Wed, 30 Mar 2022 20:31:00 +0200
Message-Id: <20220330183116.358598-4-eperezma@redhat.com>
In-Reply-To: <20220330183116.358598-1-eperezma@redhat.com>
References: <20220330183116.358598-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Peter Xu <peterx@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's done for both in and out descriptors so it's better placed here.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index b232803d1b..349255525f 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -122,17 +122,23 @@ static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
     return true;
 }
 
-static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
-                                    const struct iovec *iovec, size_t num,
-                                    bool more_descs, bool write)
+static bool vhost_svq_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
+                                        const struct iovec *iovec, size_t num,
+                                        bool more_descs, bool write)
 {
     uint16_t i = svq->free_head, last = svq->free_head;
     unsigned n;
     uint16_t flags = write ? cpu_to_le16(VRING_DESC_F_WRITE) : 0;
     vring_desc_t *descs = svq->vring.desc;
+    bool ok;
 
     if (num == 0) {
-        return;
+        return true;
+    }
+
+    ok = vhost_svq_translate_addr(svq, sg, iovec, num);
+    if (unlikely(!ok)) {
+        return false;
     }
 
     for (n = 0; n < num; n++) {
@@ -149,6 +155,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     }
 
     svq->free_head = le16_to_cpu(descs[last].next);
+    return true;
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
@@ -168,21 +175,18 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
         return false;
     }
 
-    ok = vhost_svq_translate_addr(svq, sgs, elem->out_sg, elem->out_num);
+    ok = vhost_svq_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
+                                     elem->in_num > 0, false);
     if (unlikely(!ok)) {
         return false;
     }
-    vhost_vring_write_descs(svq, sgs, elem->out_sg, elem->out_num,
-                            elem->in_num > 0, false);
 
-
-    ok = vhost_svq_translate_addr(svq, sgs, elem->in_sg, elem->in_num);
+    ok = vhost_svq_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false,
+                                     true);
     if (unlikely(!ok)) {
         return false;
     }
 
-    vhost_vring_write_descs(svq, sgs, elem->in_sg, elem->in_num, false, true);
-
     /*
      * Put the entry in the available array (but don't update avail->idx until
      * they do sync).
-- 
2.27.0


