Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D376D65E780
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:17:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKU-0001LF-2n; Thu, 05 Jan 2023 04:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKS-0001Ks-Tz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKR-0006l9-BR
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiK7Orr6ur5e67j0AHms6zyenXMrQvCI9Jun2X6gj8E=;
 b=K7nflXfOMVI+ZRU253JOX+4XehPyRoFi0Dfqsut3yoOw/xipDIh/kWmIi8riodMKPdiGKz
 RYdzoynuPn5rqinOvWldnyjQoTU2Twa1Ei57Dh5eB70dVU3bc1cXngTBCtOsfjB9m4JhY7
 jSkTdf3xMQ0sz0boJxFT/DHg5lwsl9A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-182-ZO3vVVpWNyW-cchINdt2Vg-1; Thu, 05 Jan 2023 04:14:25 -0500
X-MC-Unique: ZO3vVVpWNyW-cchINdt2Vg-1
Received: by mail-wr1-f71.google.com with SMTP id
 s3-20020adf9783000000b002ab389f64c1so531589wrb.22
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aiK7Orr6ur5e67j0AHms6zyenXMrQvCI9Jun2X6gj8E=;
 b=VSfv5LntYrWa9ybtIEB8pdK2BFA0S//hjaa8j06+/6WRPCdYZjiscAYkOi7HZcPHjG
 ajySymrU7aZpit/lWgnipNqb+bAqBYVpRItKxmG3Zf3MywqaZxsCB+rJRKEx7lMCR8Jy
 xeYAuXmGQTh5zRREV1gDs1epTZRZARqUJ/YWwweZXz1oUpsiMkEI/ayTWCrCjoI1ZRhK
 hopuKDbBnoVyo1EknTBqu86Ngh3AU9r522SgpIv9FR5AezBqT0NFG9HHgWDnVO5QBGX+
 2k2xaUdc3ugN7Ci8LwTVGglPxHgexYnH0OK5B1mu9janqZb2ut+lDgYoH4L20s3jLdDB
 fVLA==
X-Gm-Message-State: AFqh2kqD6RQtNxI7QS7fr0l/NOM8EP+ymHpoSfOwQy+/+ZgeEnO/HjqF
 hp6gV9lF8GvKvbQnYn6rvg/tYKu1aeyVGLl/K5kiALAXsVXtjl4y/HRQDSBACooyBondI+yepbX
 nrz0TOaZ91IDO05wocxBgrl5OULDKcH1jX6ZE1vlhbxQMNUDdjLJLZbF2thqi
X-Received: by 2002:a05:600c:4255:b0:3d2:282a:e1f5 with SMTP id
 r21-20020a05600c425500b003d2282ae1f5mr34615519wmm.30.1672910063344; 
 Thu, 05 Jan 2023 01:14:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtkIxUzO7g1tyk9iSWIutpVfrDeeZVdycHLAk+7q2TgtJXlitB/HTDBRuRtV1joXCjElkCTZw==
X-Received: by 2002:a05:600c:4255:b0:3d2:282a:e1f5 with SMTP id
 r21-20020a05600c425500b003d2282ae1f5mr34615498wmm.30.1672910062957; 
 Thu, 05 Jan 2023 01:14:22 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 l24-20020a1ced18000000b003d99da8d30asm1602848wmh.46.2023.01.05.01.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:22 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 01/51] virtio_net: Modify virtio_net_get_config to early return
Message-ID: <20230105091310.263867-2-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

Next patches introduce more code on vhost-vdpa branch, with already have
too much indentation.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221221115015.1400889-2-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9cbdfa5547..b30038d130 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -168,20 +168,22 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
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
MST


