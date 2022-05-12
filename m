Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8166152550A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:41:14 +0200 (CEST)
Received: from localhost ([::1]:52612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDkO-0003A6-TG
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4g-0000XH-AU
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1npD4e-0001im-Od
 for qemu-devel@nongnu.org; Thu, 12 May 2022 13:58:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652378284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyfecB7cDAHlStp0iGvtgqADQTrNlA30aKHmxiznVwA=;
 b=TgWtsA2my9swrpi/WAMW/dFYSPKh4qBo6mJR6UJPMUdHTuJUUkHG/SXTEQ3AxtmWUVuAr3
 GXa7RQEk8aDVWODoOlVCbB/TxEPSLXvjKIKkRYSvNaoX6LXcVRVOP4v5vrNAJuIoPYrBX/
 +MD9YjveMTbXy6uWQsmkizxdi/yGJi8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-mBU0YjqYNjSqB7K283lKGw-1; Thu, 12 May 2022 13:58:00 -0400
X-MC-Unique: mBU0YjqYNjSqB7K283lKGw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25853801E80;
 Thu, 12 May 2022 17:58:00 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5172243E390;
 Thu, 12 May 2022 17:57:58 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH 4/6] vdpa: Fix index calculus at vhost_vdpa_svqs_start
Date: Thu, 12 May 2022 19:57:45 +0200
Message-Id: <20220512175747.142058-5-eperezma@redhat.com>
In-Reply-To: <20220512175747.142058-1-eperezma@redhat.com>
References: <20220512175747.142058-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

With the introduction of MQ the index of the vq needs to be calculated
with the device model vq_index.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 493269b0b5..ed106bff47 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1018,7 +1018,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
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


