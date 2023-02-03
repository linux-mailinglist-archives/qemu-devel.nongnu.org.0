Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E498968A2AF
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 20:13:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO1U7-0006lv-Ai; Fri, 03 Feb 2023 14:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1U2-0006g4-PX
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pO1Ty-0007aj-U6
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 14:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675451542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cqdlab7l8nHdwiCXObkZmhi8oBObwKS48XyRXQYZ434=;
 b=H2LIZNv3huBO5aI/GivJzxVH+OKBxBtu+Bls1izuOem4XxtgnXWKeQlyJ8xvCQcWQW+ZNt
 53ItuU31IrWSe2+uEe32VR3So1z+8/RB8XDSWTZbCk4YwrGGbrXFxzTqWYE7rsLIf3fCrx
 Y8b2PzNytNqnlV58TK7u1kGZMu/dfQk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-w3QyRM5VO8SeJjCqN7vZLg-1; Fri, 03 Feb 2023 14:12:20 -0500
X-MC-Unique: w3QyRM5VO8SeJjCqN7vZLg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FC2C803CBB;
 Fri,  3 Feb 2023 19:12:16 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5188492C14;
 Fri,  3 Feb 2023 19:12:13 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, longpeng2@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>, si-wei.liu@oracle.com,
 Laurent Vivier <lvivier@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH 09/13] vdpa net: block migration if the device has CVQ
Date: Fri,  3 Feb 2023 20:11:38 +0100
Message-Id: <20230203191142.362623-10-eperezma@redhat.com>
In-Reply-To: <20230203191142.362623-1-eperezma@redhat.com>
References: <20230203191142.362623-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Devices with CVQ needs to migrate state beyond vq state.  Leaving this
to future series.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index bca13f97fd..309861e56c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -955,11 +955,17 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     }
 
     if (has_cvq) {
+        VhostVDPAState *s;
+
         nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
                                  vdpa_device_fd, i, 1, false,
                                  opts->x_svq, iova_range);
         if (!nc)
             goto err;
+
+        s = DO_UPCAST(VhostVDPAState, nc, nc);
+        error_setg(&s->vhost_vdpa.dev->migration_blocker,
+                   "net vdpa cannot migrate with MQ feature");
     }
 
     return 0;
-- 
2.31.1


