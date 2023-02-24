Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83206A1F22
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaQI-0006Zy-3j; Fri, 24 Feb 2023 10:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pVaQB-00067B-FC
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pVaQ9-0005vr-Fu
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677254140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pS6Z/sVXz2QPRzFhXYU2YnsrDLbW6mC8TdAMsQ9cUGY=;
 b=ZlLxEL+fTEEVix1mwaCB2bS9lSSzrJlmDM4tMncrbEJErUds9i+b2TI72vURLN1esqJ6Wb
 aSC0iSlgO5RGHeR8j4TfiunU7tzIIF4W0TsJGj7yJSYIuW6uqFUk8k611dRVJr9TK481AK
 opnb9UYcsu1XhQdt5IVk+uIoMcpi2xI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-CaW9JJfxP0WN4eqga-830w-1; Fri, 24 Feb 2023 10:55:32 -0500
X-MC-Unique: CaW9JJfxP0WN4eqga-830w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 218501C05B02;
 Fri, 24 Feb 2023 15:55:32 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43F0CC15BA0;
 Fri, 24 Feb 2023 15:55:29 +0000 (UTC)
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
Subject: [PATCH v4 15/15] vdpa: return VHOST_F_LOG_ALL in vhost-vdpa devices
Date: Fri, 24 Feb 2023 16:54:38 +0100
Message-Id: <20230224155438.112797-16-eperezma@redhat.com>
In-Reply-To: <20230224155438.112797-1-eperezma@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

vhost-vdpa devices can return this features now that blockers have been
set in case some features are not met.

Expose VHOST_F_LOG_ALL only in that case.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 8702780ad6..2a66cb51fc 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1307,10 +1307,9 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
 {
-    struct vhost_vdpa *v = dev->opaque;
     int ret = vhost_vdpa_get_dev_features(dev, features);
 
-    if (ret == 0 && v->shadow_vqs_enabled) {
+    if (ret == 0) {
         /* Add SVQ logging capabilities */
         *features |= BIT_ULL(VHOST_F_LOG_ALL);
     }
-- 
2.31.1


