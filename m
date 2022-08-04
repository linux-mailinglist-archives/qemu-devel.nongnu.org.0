Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF14058A090
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:34:49 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfgG-0005sJ-SP
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfPv-0005zL-4b
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfPs-0001Eu-If
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659637072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0B8KI4/fnEok6w2Efz5xLoWx7wcqHk6mQq7G+EE1gok=;
 b=gyGKROFTgC+bhrxNJ4GgcYjP1zrJjwixyF8IUxrRRqtLqNz/F9Z+74BoF/aW7cpHPntAcH
 2vRqNIUGebM0N7FI0ZEW5u3OLlsmEjdwCeIOuBoU2aaf9q9f68OVefKrIRmxZaMsMF4aOU
 VMD9E5vxkqVxbjGPdDhiGI1MHLl6vMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-g_EtLKGPOfCG1pxft7bN3Q-1; Thu, 04 Aug 2022 14:17:48 -0400
X-MC-Unique: g_EtLKGPOfCG1pxft7bN3Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 882EB8039AE;
 Thu,  4 Aug 2022 18:17:41 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82EB6492C3B;
 Thu,  4 Aug 2022 18:17:38 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v6 04/12] vhost: Do not depend on !NULL VirtQueueElement on
 vhost_svq_flush
Date: Thu,  4 Aug 2022 20:17:14 +0200
Message-Id: <20220804181722.701067-5-eperezma@redhat.com>
In-Reply-To: <20220804181722.701067-1-eperezma@redhat.com>
References: <20220804181722.701067-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

Since QEMU will be able to inject new elements on CVQ to restore the
state, we need not to depend on a VirtQueueElement to know if a new
element has been used by the device or not. Instead of check that, check
if there are new elements only using used idx on vhost_svq_flush.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v6: Change less from the previous function
---
 hw/virtio/vhost-shadow-virtqueue.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 1b49bf54f2..f863b08627 100644
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


