Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463BC6810B7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:06:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUmo-0005R4-8f; Mon, 30 Jan 2023 09:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUmk-0005N4-4y
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:05:26 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUmi-0007Ai-ID
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:05:25 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so11173455pjb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gCQ404BNB8/0v6NdgXiAE+NORb7uYju01/OI8nFZjP0=;
 b=OUXziGdmjtUDY9SFFnfNpMu9ZigjBMEGxEXutdsX/cA46UT1P3rGfHDOsh9RR/q8G6
 bzKUdi6MuEBW1sKzDBcbU8YYcN0lIwM/bc0KgoWAFW4mtYU0oFgYfCHS9zd+CKivkKTq
 OE5IuSgg0DQ42HELQFCj5FMYYmSmMeuhvutFmjUKPwN0W38oLLzNd79xQTA36ZpyaSca
 qN4CQ9ByazVquEUsrepNi9tCeZLLFK+O+RVqjwOZ76KZblo2Arb1jTnvC1PSjrRKbHGr
 CLIV0/ug2M7qb3/tzTzAtD/hhPEyL37Dm2AgOlXzP+VotEEtt8wELjFbnMD5T2HnfzI3
 Y2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gCQ404BNB8/0v6NdgXiAE+NORb7uYju01/OI8nFZjP0=;
 b=DpdJYw5nZtsXmqCnfa9LOegqRzTnp2J1JeAsIgalhhOlLq/IvQAWSS/VOfxOgfGseS
 Uqig3GCz544vZ3JKX0qCzsgLZLzHxytetYrMZQXiQ5DTbPQlbZ6UEtXm3kf6HyuOq8Zl
 7jOeI9xr3A0lMCNRl2Xwvv9grWvkAFW/OzLdF2rX9UfMAfDD4H5qqQvj3YorCoRWWh0+
 u0kKFl8mcG60cYIBQH+xRSh+aPFPjwikUpylFTyPdZYyOcIAQAJiKOG54Hmu+uCiKvsL
 OmZevIx/l8wIVBSRNS6YYv9SiGZiBtmbJyLyEreIatqT4QWZTajW2RuwzocMq0XDTHRo
 +CUQ==
X-Gm-Message-State: AO0yUKXOKc4I6sWQPiplB32J+ZKH8lbZysTLQoatEXkldCOzaTAEILL/
 yFb0BxGTpEkHQTqxwW85pccQQ8IbZbg039cK
X-Google-Smtp-Source: AK7set8Cffjf4p9jU4EAW4wS2UYLbi3Z50s+Xh1WN3U0VILnYqQKxgBa5eMXG+MUWb/YiItn7+zpCA==
X-Received: by 2002:a05:6a20:c19a:b0:b8:4cc9:16d9 with SMTP id
 bg26-20020a056a20c19a00b000b84cc916d9mr17683202pzb.46.1675087523184; 
 Mon, 30 Jan 2023 06:05:23 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a633844000000b0047899d0d62csm2729588pgn.52.2023.01.30.06.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:05:22 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] vhost-user-rng: Back up vqs before cleaning up vhost_dev
Date: Mon, 30 Jan 2023 23:05:16 +0900
Message-Id: <20230130140516.78078-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

vhost_dev_cleanup() clears vhost_dev so back up its vqs member to free
the memory pointed by the member.

Fixes: 821d28b88f ("vhost-user-rng: Add vhost-user-rng implementation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/vhost-user-rng.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
index 201a39e220..efc54cd3fb 100644
--- a/hw/virtio/vhost-user-rng.c
+++ b/hw/virtio/vhost-user-rng.c
@@ -229,6 +229,7 @@ static void vu_rng_device_realize(DeviceState *dev, Error **errp)
     return;
 
 vhost_dev_init_failed:
+    g_free(rng->vhost_dev.vqs);
     virtio_delete_queue(rng->req_vq);
 virtio_add_queue_failed:
     virtio_cleanup(vdev);
@@ -239,12 +240,12 @@ static void vu_rng_device_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserRNG *rng = VHOST_USER_RNG(dev);
+    struct vhost_virtqueue *vhost_vqs = rng->vhost_dev.vqs;
 
     vu_rng_set_status(vdev, 0);
 
     vhost_dev_cleanup(&rng->vhost_dev);
-    g_free(rng->vhost_dev.vqs);
-    rng->vhost_dev.vqs = NULL;
+    g_free(vhost_vqs);
     virtio_delete_queue(rng->req_vq);
     virtio_cleanup(vdev);
     vhost_user_cleanup(&rng->vhost_user);
-- 
2.39.1


