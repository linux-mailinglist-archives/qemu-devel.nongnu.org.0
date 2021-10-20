Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E3B4349C6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:07:44 +0200 (CEST)
Received: from localhost ([::1]:50160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Rf-0001RR-IB
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iI-0004rf-4K
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iE-0003q3-Jx
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IaTVAxVRtUqiDhm0qAmv+3+o3GLdoBq3LLcABwSRz5g=;
 b=GSuelxxjKXg3RXqudMEjVfGKdZa5PCjGHLPnjMxAQQ8TPSSLfE6gi2Z5I7S2bBx96o+Us0
 6VCkDH99zPfJezRy+zZ/Kxkj29PG1YBh7M1zSmmp2yrU3e2iMMBbzMou0ujsKF0bcxKbQN
 lON564+V8RA/NyHgcNBZbXPSHPaUhtk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-rIn23gzUM02_-j4Fte3pjw-1; Wed, 20 Oct 2021 06:20:44 -0400
X-MC-Unique: rIn23gzUM02_-j4Fte3pjw-1
Received: by mail-ed1-f69.google.com with SMTP id
 a3-20020a50da43000000b003dca31dcfc2so4118649edk.14
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IaTVAxVRtUqiDhm0qAmv+3+o3GLdoBq3LLcABwSRz5g=;
 b=cSJPQRPGPUFaAwUsa8cpdmefbdItq1Xcm+Pgn+iQOUmYoqGiYVfjpeAUAHGwjXKq94
 TiORsGKG0pRErxQQnhW8IQhHD85T09Q3iV7iaRCze5HkzFLExhI6KTK3kuLNLhHfXT7a
 HwF0LEAJlEGVIXGAzIZhrFOBxrXaHxmCunwckI6e/BuKNt263yKXHd3rP6R3v6PUBspo
 xkRei+23Zq9a3PWCEj9u2M30yLJuSSGDa451D9cXOw6pjWSZorGtt3w9EP70nC+iqDVC
 kEkkMXTdA/aOOzREi5E2unwahmAy+slSGgKoQNs5Ih6XwzF3kVdgBDzM5eqgzWhb46Lx
 5WqA==
X-Gm-Message-State: AOAM5305Skd9w0RCGy3biOmwcdQCkaQ7SsTYqWp4xc0QIY7TTAGEkJiY
 dvEAiJv0FMjL0anVIS5muZgv0btN80KLiRCJNprBTx4aJV4TcroX5OOlC+2AAwBNFOoHqCrmceq
 jcpLEkINPmjunud9tLjyM04GM0ntpnjk8nOAAic3XiKb9Tr+fAou2rtaNHoGL
X-Received: by 2002:a17:907:9908:: with SMTP id
 ka8mr46250824ejc.164.1634725243124; 
 Wed, 20 Oct 2021 03:20:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAVX2YHVEetkWOf8X7Gdx7CsNP0oc1/Ig9z+3Q4ws4TGTkuNLxYsE0Lb5v9jcQT0g7C20ylg==
X-Received: by 2002:a17:907:9908:: with SMTP id
 ka8mr46250798ejc.164.1634725242960; 
 Wed, 20 Oct 2021 03:20:42 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id f20sm933464edq.20.2021.10.20.03.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:42 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 31/44] vhost-vdpa: open device fd in net_init_vhost_vdpa()
Message-ID: <20211020101844.988480-32-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch switches to open device fd in net_init_vhost_vpda(). This is
used to prepare for the multiqueue support.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 6dc68d8677..fd4ff5a0fb 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -170,24 +170,19 @@ static NetClientInfo net_vhost_vdpa_info = {
 };
 
 static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
-                               const char *name, const char *vhostdev)
+                               const char *name, int vdpa_device_fd)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
-    int vdpa_device_fd = -1;
     int ret = 0;
     assert(name);
     nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
-    vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
-    if (vdpa_device_fd == -1) {
-        return -errno;
-    }
+
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
     if (ret) {
-        qemu_close(vdpa_device_fd);
         qemu_del_net_client(nc);
     }
     return ret;
@@ -197,8 +192,20 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
+    int vdpa_device_fd, ret;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
-    return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
+
+    vdpa_device_fd = qemu_open_old(opts->vhostdev, O_RDWR);
+    if (vdpa_device_fd == -1) {
+        return -errno;
+    }
+
+    ret = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
+    if (ret) {
+        qemu_close(vdpa_device_fd);
+    }
+
+    return ret;
 }
-- 
MST


