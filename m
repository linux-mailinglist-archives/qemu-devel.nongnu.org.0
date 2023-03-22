Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A56C4D77
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:22:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezM0-0008B2-2x; Wed, 22 Mar 2023 10:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLx-00087B-Ct
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLv-0007PV-RU
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5wvpndhRCwTda5Q3tQ0X6OyRA7fdM9iBx5DMXb0RVI=;
 b=c3qcJpCfSoRyY1Ekid6FoLz85/4HJKcDhJXeEKlHf6LfVbJQglya65xZfltr/C2+ebQQZ3
 5RiAMS5in1f/nNPT6cyEKQGAqB/Ku3ZqSsexB2deQqWrgEGhY1mValivpBRJBaDR67hPo6
 747CISgrhj1/6EarTvvN0R4on2J7Fu0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-j9tEj7ACMXS-bYXCPL6B2w-1; Wed, 22 Mar 2023 10:22:06 -0400
X-MC-Unique: j9tEj7ACMXS-bYXCPL6B2w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 879FB185A792;
 Wed, 22 Mar 2023 14:22:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7900740C6E67;
 Wed, 22 Mar 2023 14:22:03 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 10/12] vhost-user-video: add dev_type to CLI
Date: Wed, 22 Mar 2023 15:21:30 +0100
Message-Id: <20230322142132.22909-11-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
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

Add dev_type to the command line interface.
This way we can select dev_type=encoder or
dev_type=decoder and assign the virtio ID
appropiately. If ommited, default virtio
ID used is decoder's ID.

Example:
-device vhost-user-video-pci,chardev=video,dev_type=encoder,id=video

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 docs/system/devices/vhost-user-video.rst |  2 +-
 hw/display/vhost-user-video.c            | 13 +++++++++++--
 include/hw/virtio/vhost-user-video.h     |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/docs/system/devices/vhost-user-video.rst b/docs/system/devices/vhost-user-video.rst
index ff0a8fe5c7..d428a773e2 100644
--- a/docs/system/devices/vhost-user-video.rst
+++ b/docs/system/devices/vhost-user-video.rst
@@ -72,7 +72,7 @@ use to communicate as well as share the guests memory over a memfd.
 ::
 
     host# qemu-system								\
-        -device vhost-user-video-pci,chardev=video,id=video                     \
+        -device vhost-user-video-pci,chardev=video,dev_type=decoder,id=video    \
         -chardev socket,path=/tmp//video.sock,id=video                          \
         -m 4096 		        					\
         -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
diff --git a/hw/display/vhost-user-video.c b/hw/display/vhost-user-video.c
index 9cc6a717d5..469e9e7c89 100644
--- a/hw/display/vhost-user-video.c
+++ b/hw/display/vhost-user-video.c
@@ -300,8 +300,16 @@ static void vhost_user_video_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    /* TODO Implement VIDEO_ENC, currently only support VIDEO_DEC */
-    virtio_init(vdev, VIRTIO_ID_VIDEO_DECODER, sizeof(struct virtio_video_config));
+    if (video->conf.type == NULL || !strcmp(video->conf.type, "decoder")) {
+        virtio_init(vdev, VIRTIO_ID_VIDEO_DECODER,
+                    sizeof(struct virtio_video_config));
+    } else if (!strcmp(video->conf.type, "encoder")) {
+        virtio_init(vdev, VIRTIO_ID_VIDEO_ENCODER,
+                    sizeof(struct virtio_video_config));
+    } else {
+        error_report("invalid type received: %s", video->conf.type);
+        goto vhost_dev_init_failed;
+    }
 
     /* one command queue and one event queue */
     video->vhost_dev.nvqs = 2;
@@ -375,6 +383,7 @@ static const VMStateDescription vhost_user_video_vmstate = {
 
 static Property vhost_user_video_properties[] = {
     DEFINE_PROP_CHR("chardev", VHostUserVIDEO, conf.chardev),
+    DEFINE_PROP_STRING("dev_type", VHostUserVIDEO, conf.type),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/virtio/vhost-user-video.h b/include/hw/virtio/vhost-user-video.h
index f8329c3b36..3fe00b79a6 100644
--- a/include/hw/virtio/vhost-user-video.h
+++ b/include/hw/virtio/vhost-user-video.h
@@ -22,6 +22,7 @@
 
 typedef struct {
     CharBackend chardev;
+    char *type;
     struct virtio_video_config config;
 } VHostUserVIDEOConf;
 
-- 
2.39.2


