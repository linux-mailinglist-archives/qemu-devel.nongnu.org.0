Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A759A2EA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:32:10 +0200 (CEST)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5qr-0004WL-Ua
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5N2-00081q-0o
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:01:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5N0-0001uS-I2
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660928476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWQ9YRdR82DD5uwHUvIfW+1twM0pNqdoLDuXgi2Jaew=;
 b=IBRMUFzzGjS38+eXyDFumwc6sGazcvCX1ZuIGcPOPGD9QGNCOuztEUDtHpGtW0BfNLDrDC
 q6zrw5ELpzo7QIF8Tzz2aSiyiBjCOtvHGBTjjlub4PHveKBVY39b+CLk91wxWAeYivu4jT
 yKbh0j5NRiaCh/LmhQP8C9RBJztqF6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-GsyGPR5ZMbih6aHFUwx0dg-1; Fri, 19 Aug 2022 13:01:10 -0400
X-MC-Unique: GsyGPR5ZMbih6aHFUwx0dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8353B811E7A;
 Fri, 19 Aug 2022 17:01:09 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B15EF40D2827;
 Fri, 19 Aug 2022 17:01:06 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v9 04/12] vhost: Do not depend on !NULL VirtQueueElement on
 vhost_svq_flush
Date: Fri, 19 Aug 2022 19:00:40 +0200
Message-Id: <20220819170048.3593487-5-eperezma@redhat.com>
In-Reply-To: <20220819170048.3593487-1-eperezma@redhat.com>
References: <20220819170048.3593487-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

Since QEMU will be able to inject new elements on CVQ to restore the
state, we need not to depend on a VirtQueueElement to know if a new
element has been used by the device or not. Instead of check that, check
if there are new elements only using used idx on vhost_svq_flush.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
v6: Change less from the previous function
---
 hw/virtio/vhost-shadow-virtqueue.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 8df5296f24..e8e5bbc368 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -499,17 +499,20 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
 {
     int64_t start_us = g_get_monotonic_time();
+    uint32_t len;
+
     do {
-        uint32_t len;
-        VirtQueueElement *elem = vhost_svq_get_buf(svq, &len);
-        if (elem) {
-            return len;
+        if (vhost_svq_more_used(svq)) {
+            break;
         }
 
         if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
             return 0;
         }
     } while (true);
+
+    vhost_svq_get_buf(svq, &len);
+    return len;
 }
 
 /**
-- 
2.31.1


