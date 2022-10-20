Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B32F605E9C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:17:20 +0200 (CEST)
Received: from localhost ([::1]:54868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTY6-0001qO-Lb
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:17:18 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTGk-0001F7-KT
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSsx-00049x-PN
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSsw-0001Io-5r
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666262083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLtreQwHsO0YrDlU6q0qDajqfSzKbrfe72ZcC5xn614=;
 b=Cs6M103mGwlFIQthhmMl5MkAjiXigBTANShK/KQyPjiYhTKVTkFb5CyhZ5CN3OVFzP7hcc
 9Hd1IT9OYpzNFiX+UmfdCVcDm0u4BL5T4FqztlEU7dx6JqMi5jHDZcFyV3JyyUhcYZLVFT
 7HOMLHIGnSPTNEdh1/Y3ub2WLozATBI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-33SrZLKFOnCgMS2FhKaLyg-1; Thu, 20 Oct 2022 06:34:39 -0400
X-MC-Unique: 33SrZLKFOnCgMS2FhKaLyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B0031010366;
 Thu, 20 Oct 2022 10:34:39 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1886EC15BA5;
 Thu, 20 Oct 2022 10:34:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 2/7] virtio_net: Modify virtio_net_get_config to early return
Date: Thu, 20 Oct 2022 12:34:24 +0200
Message-Id: <20221020103429.347525-3-eperezma@redhat.com>
In-Reply-To: <20221020103429.347525-1-eperezma@redhat.com>
References: <20221020103429.347525-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


