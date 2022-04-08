Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AAB4F9713
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:41:41 +0200 (CEST)
Received: from localhost ([::1]:53882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncors-0003E5-Sy
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ncolG-0002yY-G1
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ncolE-0003dg-8a
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649424886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wu1vsUndWOLvb3RTGasVPJU6G3DYWl3fVIUxjaYHcOU=;
 b=Qcema8/XM9PL6Ch4m37vt0HuPCF1BolbGpEONczsYZGcQvEQxYcMlt93/nOwYePMi8B1Bq
 dmOTXot083RBIlRVXsV1TFYZeGcNK1NBcaLLxHuDEQWYCHMDmZWf5EsCWjl988krh1pfRa
 74YcLM56+0Re4QjmX/72V3fOpnDG3Ew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-qv1CmmJZOx67jT6ABpEJNA-1; Fri, 08 Apr 2022 09:34:43 -0400
X-MC-Unique: qv1CmmJZOx67jT6ABpEJNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4004811E80;
 Fri,  8 Apr 2022 13:34:42 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBBFE145B97F;
 Fri,  8 Apr 2022 13:34:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 07/23] vhost: move descriptor translation to
 vhost_svq_vring_write_descs
Date: Fri,  8 Apr 2022 15:33:59 +0200
Message-Id: <20220408133415.1371760-8-eperezma@redhat.com>
In-Reply-To: <20220408133415.1371760-1-eperezma@redhat.com>
References: <20220408133415.1371760-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Peter Xu <peterx@redhat.com>,
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
index c17506df20..bcb5f3aae9 100644
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


