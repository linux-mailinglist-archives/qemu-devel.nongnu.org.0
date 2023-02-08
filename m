Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA468EBEB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:43:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgzJ-0005J0-Lu; Wed, 08 Feb 2023 04:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgzH-0005Io-3z
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pPgzF-0005nw-J9
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675849412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cqdlab7l8nHdwiCXObkZmhi8oBObwKS48XyRXQYZ434=;
 b=XQgB3gSTAVgY5VMudRRN7/wrxPHch7IkNdZgtcT7g8mLQafDTu/flmL4T3b1aFWnGyFTVP
 bRfPiMQp32FjhmV5m/ejhIonNay67J0ZtgiYBGV+eqLuCj9/FI6tX+7jsaeaNNiO+PwLS+
 HmbglY63IMUwKTyWPxJ3Vgxig/nZZ8g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-kvLAOZfENSSAqxAecCBmLA-1; Wed, 08 Feb 2023 04:43:29 -0500
X-MC-Unique: kvLAOZfENSSAqxAecCBmLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 011342800495;
 Wed,  8 Feb 2023 09:43:29 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E92BE2166B29;
 Wed,  8 Feb 2023 09:43:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, alvaro.karsz@solid-run.com,
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Subject: [PATCH v2 09/13] vdpa net: block migration if the device has CVQ
Date: Wed,  8 Feb 2023 10:42:49 +0100
Message-Id: <20230208094253.702672-10-eperezma@redhat.com>
In-Reply-To: <20230208094253.702672-1-eperezma@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


