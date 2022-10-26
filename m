Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8008B60DE74
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:55:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ond6x-0005bd-Gl; Wed, 26 Oct 2022 05:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ond6d-0004Ry-5B
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ond6a-0001m6-CO
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 05:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666778027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLtreQwHsO0YrDlU6q0qDajqfSzKbrfe72ZcC5xn614=;
 b=iDn25yBwWyATO1vW4ILzPSAmaRNlXFmECifgOn1lSkHLgDWVOm8iWKVnw5eHs4RHjEnPsL
 ZcsLUAshACoJwZFDcpdNNGrJCPaRLfePajJpgdJyRb6vTMcA6dMK/DdL3qnrDXGpTyjCJx
 1UjgVNCLN5ubxVsv3LkHFjV78VM5W5Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-atBwR0O8MLeidk4JRBwJIg-1; Wed, 26 Oct 2022 05:53:42 -0400
X-MC-Unique: atBwR0O8MLeidk4JRBwJIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC55857D19;
 Wed, 26 Oct 2022 09:53:25 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0147492B17;
 Wed, 26 Oct 2022 09:53:15 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH 1/3] virtio_net: Modify virtio_net_get_config to early return
Date: Wed, 26 Oct 2022 11:53:01 +0200
Message-Id: <20221026095303.37907-2-eperezma@redhat.com>
In-Reply-To: <20221026095303.37907-1-eperezma@redhat.com>
References: <20221026095303.37907-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Next patches introduce more code on vhost-vdpa branch, with already have
too much indentation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index e9f696b4cf..56ff219196 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -158,20 +158,22 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
         ret = vhost_net_get_config(get_vhost_net(nc->peer), (uint8_t *)&netcfg,
                                    n->config_size);
-        if (ret != -1) {
-            /*
-             * Some NIC/kernel combinations present 0 as the mac address.  As
-             * that is not a legal address, try to proceed with the
-             * address from the QEMU command line in the hope that the
-             * address has been configured correctly elsewhere - just not
-             * reported by the device.
-             */
-            if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
-                info_report("Zero hardware mac address detected. Ignoring.");
-                memcpy(netcfg.mac, n->mac, ETH_ALEN);
-            }
-            memcpy(config, &netcfg, n->config_size);
+        if (ret == -1) {
+            return;
         }
+
+        /*
+         * Some NIC/kernel combinations present 0 as the mac address.  As that
+         * is not a legal address, try to proceed with the address from the
+         * QEMU command line in the hope that the address has been configured
+         * correctly elsewhere - just not reported by the device.
+         */
+        if (memcmp(&netcfg.mac, &zero, sizeof(zero)) == 0) {
+            info_report("Zero hardware mac address detected. Ignoring.");
+            memcpy(netcfg.mac, n->mac, ETH_ALEN);
+        }
+
+        memcpy(config, &netcfg, n->config_size);
     }
 }
 
-- 
2.31.1


