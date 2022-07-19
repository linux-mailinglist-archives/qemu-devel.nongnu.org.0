Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C53579F6D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:19:56 +0200 (CEST)
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDn8l-00040u-MU
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn5v-0006ri-Pk
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn5s-0004nh-P6
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTPD93mdkwqFWoWbm4Wn8FWGSk8O98DYcyDcvL0UTvg=;
 b=ToBSMMoBP7Y6/wkepr0zOFGvCCsoA7NYzdSTyj+8adtAUnmZy6lvA7L3kswelbF5HsJEPx
 sNg/fQcI3/B5QW6Ri4NAg4khzlS5C4OmKrwoEPu1DO4R/uUq/h/VI/lLE43Uhgj9A3dSE/
 klPDEMSvCZoRiAm9wrpJDhyWw4M4N3M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-Wl2M9tt1NxqVgg0oZW8WLg-1; Tue, 19 Jul 2022 09:16:54 -0400
X-MC-Unique: Wl2M9tt1NxqVgg0oZW8WLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE0DA38149A7;
 Tue, 19 Jul 2022 13:16:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39731400E894;
 Tue, 19 Jul 2022 13:16:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 01/24] vhost: move descriptor translation to
 vhost_svq_vring_write_descs
Date: Tue, 19 Jul 2022 21:16:14 +0800
Message-Id: <20220719131637.46131-2-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

It's done for both in and out descriptors so it's better placed here.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 56c96eb..e2184a4 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -122,17 +122,35 @@ static bool vhost_svq_translate_addr(const VhostShadowVirtqueue *svq,
     return true;
 }
 
-static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
-                                    const struct iovec *iovec, size_t num,
-                                    bool more_descs, bool write)
+/**
+ * Write descriptors to SVQ vring
+ *
+ * @svq: The shadow virtqueue
+ * @sg: Cache for hwaddr
+ * @iovec: The iovec from the guest
+ * @num: iovec length
+ * @more_descs: True if more descriptors come in the chain
+ * @write: True if they are writeable descriptors
+ *
+ * Return true if success, false otherwise and print error.
+ */
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
@@ -150,6 +168,7 @@ static void vhost_vring_write_descs(VhostShadowVirtqueue *svq, hwaddr *sg,
     }
 
     svq->free_head = le16_to_cpu(svq->desc_next[last]);
+    return true;
 }
 
 static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
@@ -169,21 +188,18 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
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
2.7.4


