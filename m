Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A246B6A1F20
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:59:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaPd-0005P3-8J; Fri, 24 Feb 2023 10:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pVaPX-0005N9-Qe
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pVaPW-0005Wa-3b
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677254101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eEeRfwwIN44/Adg4INU1tbOT+msU8OVisKYfCUJYZrI=;
 b=SJwdJFZDwhsNxjDh3oJ4kZfbQU/1CymqAzzoQnzCnUgvp+OovF3roeatT/e9KLPEaJ6a3R
 ft66eizvnByeuGa9VyhQxwUD69SRqut4v+Xo2al5DvzxoSP0+NNiloX1bIaawHI0rYkwUq
 nbw/l1WUQUbpEBV+OLFORlZWIjNOTg4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364--KdNxvwhNM6j9Dufd5G8tg-1; Fri, 24 Feb 2023 10:54:55 -0500
X-MC-Unique: -KdNxvwhNM6j9Dufd5G8tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA0523804530;
 Fri, 24 Feb 2023 15:54:53 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA0D7C15BA0;
 Fri, 24 Feb 2023 15:54:50 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Jason Wang <jasowang@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 alvaro.karsz@solid-run.com, longpeng2@huawei.com,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
Subject: [PATCH v4 03/15] vdpa: stop svq at vhost_vdpa_dev_start(false)
Date: Fri, 24 Feb 2023 16:54:26 +0100
Message-Id: <20230224155438.112797-4-eperezma@redhat.com>
In-Reply-To: <20230224155438.112797-1-eperezma@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It used to be done at vhost_vdpa_svq_cleanup, since a device couldn't
switch to SVQ mode dynamically.  Now that we need to fetch the state and
trust SVQ will not modify guest's used_idx at migration, stop
effectively SVQ at suspend time, as a real device would do.

Leaving old vhost_svq_stop call at vhost_vdpa_svq_cleanup, as its
supported to call it many times and it follows other operations that are
called redundantly there too:
* vhost_vdpa_host_notifiers_uninit
* memory_listener_unregister

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v3: New in v3
---
 hw/virtio/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4f72a52a43..d9260191cc 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1100,10 +1100,11 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 
     for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
         VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
+
+        vhost_svq_stop(svq);
         vhost_vdpa_svq_unmap_rings(dev, svq);
 
         event_notifier_cleanup(&svq->hdev_kick);
-        event_notifier_cleanup(&svq->hdev_call);
     }
 }
 
-- 
2.31.1


