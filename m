Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1226F4EE049
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:19:51 +0200 (CEST)
Received: from localhost ([::1]:33284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzOf-0007M8-Uy
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:19:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzA7-0004RL-TN
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzA5-0007N0-Pg
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648749885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+ZKd6KUcLTqI9r8rju+MObNDFWLHKaMjymBGI90yBQ=;
 b=JR9swLQXYbZn8sUfuhBRkTGsmHKyrKqITftFF54PaAoffltYRYWkpwYp3bus8wgM9NBUFs
 9BFtBlEtSsYLFRkzErkWY2PSLetzGI0yAMibK17ZdUGByNnFKR42LPRTe5jUtuFE48QawF
 /jzau1iuwPfIcRHDJiNl8hDbE8Eq/6Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-gwNLbsJgPBO6ROv7HGqsFw-1; Thu, 31 Mar 2022 14:04:39 -0400
X-MC-Unique: gwNLbsJgPBO6ROv7HGqsFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B67DD85A5BE;
 Thu, 31 Mar 2022 18:04:38 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80B2840CF8F2;
 Thu, 31 Mar 2022 18:04:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 09/20] virtio: Make virtqueue_alloc_element non-static
Date: Thu, 31 Mar 2022 20:03:59 +0200
Message-Id: <20220331180410.531837-10-eperezma@redhat.com>
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

So SVQ can allocate elements using it

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio.h | 1 +
 hw/virtio/virtio.c         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b31c4507f5..1e85833897 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -195,6 +195,7 @@ void virtqueue_fill(VirtQueue *vq, const VirtQueueElement *elem,
                     unsigned int len, unsigned int idx);
 
 void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem);
+void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num);
 void *virtqueue_pop(VirtQueue *vq, size_t sz);
 unsigned int virtqueue_drop_all(VirtQueue *vq);
 void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t sz);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9d637e043e..17cbbb5fca 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1376,7 +1376,7 @@ void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem)
                                                                         false);
 }
 
-static void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num)
+void *virtqueue_alloc_element(size_t sz, unsigned out_num, unsigned in_num)
 {
     VirtQueueElement *elem;
     size_t in_addr_ofs = QEMU_ALIGN_UP(sz, __alignof__(elem->in_addr[0]));
-- 
2.27.0


