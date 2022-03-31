Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9364D4EE029
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:09:33 +0200 (CEST)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzEi-0003cg-Hu
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:09:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZz9u-0003dj-2I
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZz9s-0007L8-L7
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648749872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9IDz/9W93pVKAcRcZydDC03uu8yVY/Dr0TINJi9riQA=;
 b=d651+AvSnUHZiYE0sT+ejkiv6wFY6wsvqeJOfJrXnyeImIiYt4d111HGI2CBNPV7RKaFsA
 4hD3zYE8FlGzc/eqSUStjZw2MDdpm6PRVA2nIUOkVfzwkGrKhtmUAygAYueW6Nq4bDKxOf
 mbd6WB1DAwUu3tQRLdlp5npqLDZ8l+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-tudCt62MMZiXKEOs4XqIaA-1; Thu, 31 Mar 2022 14:04:29 -0400
X-MC-Unique: tudCt62MMZiXKEOs4XqIaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FA272A5954B;
 Thu, 31 Mar 2022 18:04:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45D2240CFD02;
 Thu, 31 Mar 2022 18:04:26 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 05/20] vdpa: Fix index calculus at vhost_vdpa_svqs_start
Date: Thu, 31 Mar 2022 20:03:55 +0200
Message-Id: <20220331180410.531837-6-eperezma@redhat.com>
In-Reply-To: <20220331180410.531837-1-eperezma@redhat.com>
References: <20220331180410.531837-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Peter Xu <peterx@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index c5ed7a3779..9eeac8fa8e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1016,7 +1016,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
         VirtQueue *vq = virtio_get_queue(dev->vdev, dev->vq_index + i);
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
         struct vhost_vring_addr addr = {
-            .index = i,
+            .index = dev->vq_index + i,
         };
         int r;
         bool ok = vhost_vdpa_svq_setup(dev, svq, i, &err);
-- 
2.27.0


