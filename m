Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED92658A095
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:39:54 +0200 (CEST)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfl8-00030B-P6
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfb1-0008F8-Bo
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:29:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfay-00034G-JU
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659637752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buucNH6UPudgudlKQDxV5Skj8xgGaEiYKwfKh+0154k=;
 b=RQq1weoeFHALmw+xkZGVCPY6+4VhYpVCb+a0Las9GSDL/R5ijuhQiinJn/HPChMSSbAXbG
 aBOssQv4oobjzj9gGYaulHrdKY+sKzQ2AUlLRhBkYJxJiQ6FnLjijl2aBGEb9xoxJuGKNK
 DdVzQ9IcYKHEPoHS7TIpE14eR/EJGjE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-nuQN8Na3Nuq__q-aF9DJ_g-1; Thu, 04 Aug 2022 14:29:09 -0400
X-MC-Unique: nuQN8Na3Nuq__q-aF9DJ_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A108C2802281;
 Thu,  4 Aug 2022 18:29:08 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42DE8492C3B;
 Thu,  4 Aug 2022 18:29:05 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH v7 03/12] vhost: Delete useless read memory barrier
Date: Thu,  4 Aug 2022 20:28:43 +0200
Message-Id: <20220804182852.703398-4-eperezma@redhat.com>
In-Reply-To: <20220804182852.703398-1-eperezma@redhat.com>
References: <20220804182852.703398-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

As discussed in previous series [1], this memory barrier is useless with
the atomic read of used idx at vhost_svq_more_used. Deleting it.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02616.html

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index e6eebd0e8d..1b49bf54f2 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -509,9 +509,6 @@ size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
         if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
             return 0;
         }
-
-        /* Make sure we read new used_idx */
-        smp_rmb();
     } while (true);
 }
 
-- 
2.31.1


