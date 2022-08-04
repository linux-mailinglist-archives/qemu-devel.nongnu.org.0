Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5AA58A075
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:26:01 +0200 (CEST)
Received: from localhost ([::1]:39940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfXk-00017H-NX
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfPu-0005yG-Nf
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:17:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfPr-0001EO-7p
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659637070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFcSWUZrd/1meZg3dITq3TzQyarfrxoNesnu+w7BZmQ=;
 b=W+2tf65PxDJVcxrkGfwNaEG8clYD/cZDE+1BPns33u76WZZLgSP1yaeTUxfe9vZgfKRx1S
 w+egZKZwdrYSULbgTzd6So3+bDSycUKdhENUgydGQiomzY11T+f6wsED0gBmhm8qLibM9e
 5O77VaoxWB4WS2JCPlEStfvOccRmQ28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-4ybmrivsN8Cw15iNeI7m3g-1; Thu, 04 Aug 2022 14:17:48 -0400
X-MC-Unique: 4ybmrivsN8Cw15iNeI7m3g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC856800DBE;
 Thu,  4 Aug 2022 18:17:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C42B2492C3B;
 Thu,  4 Aug 2022 18:17:31 +0000 (UTC)
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
Subject: [PATCH v6 02/12] vhost: use SVQ element ndescs instead of opaque data
 for desc validation
Date: Thu,  4 Aug 2022 20:17:12 +0200
Message-Id: <20220804181722.701067-3-eperezma@redhat.com>
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

Since we're going to allow SVQ to add elements without the guest's
knowledge and without its own VirtQueueElement, it's easier to check if
an element is a valid head checking a different thing than the
VirtQueueElement.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index ffd2b2c972..e6eebd0e8d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -414,7 +414,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
         return NULL;
     }
 
-    if (unlikely(!svq->desc_state[used_elem.id].elem)) {
+    if (unlikely(!svq->desc_state[used_elem.id].ndescs)) {
         qemu_log_mask(LOG_GUEST_ERROR,
             "Device %s says index %u is used, but it was not available",
             svq->vdev->name, used_elem.id);
@@ -422,6 +422,7 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
     }
 
     num = svq->desc_state[used_elem.id].ndescs;
+    svq->desc_state[used_elem.id].ndescs = 0;
     last_used_chain = vhost_svq_last_desc_of_chain(svq, num, used_elem.id);
     svq->desc_next[last_used_chain] = svq->free_head;
     svq->free_head = used_elem.id;
-- 
2.31.1


