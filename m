Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF11681082
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:04:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUl2-0002hx-IC; Mon, 30 Jan 2023 09:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUl0-0002bU-DI
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:03:38 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUky-0006nj-Lq
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:03:38 -0500
Received: by mail-pl1-x629.google.com with SMTP id jm10so11675233plb.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nr85VddG1aNAMhiRa7oAEJJDUJSA7CWs8fDfBYv3Yr0=;
 b=IRe6fO3EUcL9Oou2hzz2BRpufu2jH3nQ+FYy1pkxJR3DaEPcTCdGlq93bEBH4zS7r7
 VWIntoCnaQ6ywVeT08uLxU0vPgNED//vo43a80U42l8mvekIwceikr7ODP5btHCHooTU
 K0pyp8CN23PKGCJcIs7JBdAlQeqJJgg8i1Rf7X00Jy9cfWC3oIMVVFov6HfkLbHCCkU6
 95J+kMqTXnSVYcgRXIQ+LhkR5wZwczltFkYPSNUMZ9ou8Yd039a6rTHczRiPiTlMt3+Q
 PLOMNUoPuj2WiR4XkPcJVJU14SjA6Edk6aCFKVDbh+jXRGjrAcNsGEJW/TS1ZWRMGoqm
 hWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nr85VddG1aNAMhiRa7oAEJJDUJSA7CWs8fDfBYv3Yr0=;
 b=Kuf4F5y3HcCUaQQkaTo1kKdGsxMj+AX7QpxNckcn1Dze95DKaQYxM2YfiE1OZW8tH5
 ikQoz95VTbQ+wqoFSp9nRTAJaJqJJzgYGu4IsHZ1J4p46nA3PZdM/IM43LtN1A7zo1bH
 R0ep5eM+xz2UtdeWxH54OlCZVdTjFFZF4xC/qTNp6ubCPZ0ssroclbtN3fuNuV9r7rQt
 v+ia3IgngxTfxJAqhrUafn3kZPOcLbo8Cy0BNfmzfrKMLS4Hwo2fwXbiPsW6Zbjbx8Je
 BZA0iw5qcnIjJwF8QcP/ZomZxO00eBochZmtwsgtDiBuE3S9qJ8Rc5iXg/EGbIHTWjkc
 DBTQ==
X-Gm-Message-State: AO0yUKWe+cubsp8b0qUmxG/uz9OeQCYvi8I0TtcEuEXA4N3yY2p/Y9aS
 yvGN+1+omjDV7gwsDCvts2hVt1u2M4oPG6RY
X-Google-Smtp-Source: AK7set9H80uHkZAgYMK8U8C2Pfh40WdAxnmPxO9UMC+ZweoN7gm153yULn/vU453DAI2+RgUXSVwWQ==
X-Received: by 2002:a17:902:c405:b0:196:8a80:4d91 with SMTP id
 k5-20020a170902c40500b001968a804d91mr3399518plk.35.1675087414940; 
 Mon, 30 Jan 2023 06:03:34 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a170903234600b001947ba0ac8fsm4521168plh.236.2023.01.30.06.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:03:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] vhost-user-gpio: Configure vhost_dev when connecting
Date: Mon, 30 Jan 2023 23:03:20 +0900
Message-Id: <20230130140320.77999-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
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

vhost_dev_cleanup(), called from vu_gpio_disconnect(), clears vhost_dev
so vhost-user-gpio must set the members of vhost_dev each time
connecting.

do_vhost_user_cleanup() should also acquire the pointer to vqs directly
from VHostUserGPIO instead of referring to vhost_dev as it can be called
after vhost_dev_cleanup().

Fixes: 27ba7b027f ("hw/virtio: add boilerplate for vhost-user-gpio device")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/vhost-user-gpio.c         | 10 ++++++----
 include/hw/virtio/vhost-user-gpio.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index fe3da32c74..d6927b610a 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -16,6 +16,7 @@
 #include "trace.h"
 
 #define REALIZE_CONNECTION_RETRIES 3
+#define VHOST_NVQS 2
 
 /* Features required from VirtIO */
 static const int feature_bits[] = {
@@ -208,8 +209,7 @@ static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserGPIO *gpio)
 {
     virtio_delete_queue(gpio->command_vq);
     virtio_delete_queue(gpio->interrupt_vq);
-    g_free(gpio->vhost_dev.vqs);
-    gpio->vhost_dev.vqs = NULL;
+    g_free(gpio->vhost_vqs);
     virtio_cleanup(vdev);
     vhost_user_cleanup(&gpio->vhost_user);
 }
@@ -229,6 +229,9 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
     vhost_dev_set_config_notifier(vhost_dev, &gpio_ops);
     gpio->vhost_user.supports_config = true;
 
+    gpio->vhost_dev.nvqs = VHOST_NVQS;
+    gpio->vhost_dev.vqs = gpio->vhost_vqs;
+
     ret = vhost_dev_init(vhost_dev, &gpio->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
@@ -347,10 +350,9 @@ static void vu_gpio_device_realize(DeviceState *dev, Error **errp)
 
     virtio_init(vdev, VIRTIO_ID_GPIO, sizeof(gpio->config));
 
-    gpio->vhost_dev.nvqs = 2;
     gpio->command_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
     gpio->interrupt_vq = virtio_add_queue(vdev, 256, vu_gpio_handle_output);
-    gpio->vhost_dev.vqs = g_new0(struct vhost_virtqueue, gpio->vhost_dev.nvqs);
+    gpio->vhost_vqs = g_new0(struct vhost_virtqueue, VHOST_NVQS);
 
     gpio->connected = false;
 
diff --git a/include/hw/virtio/vhost-user-gpio.h b/include/hw/virtio/vhost-user-gpio.h
index a9305c5e6c..a9d3f9b049 100644
--- a/include/hw/virtio/vhost-user-gpio.h
+++ b/include/hw/virtio/vhost-user-gpio.h
@@ -23,7 +23,7 @@ struct VHostUserGPIO {
     VirtIODevice parent_obj;
     CharBackend chardev;
     struct virtio_gpio_config config;
-    struct vhost_virtqueue *vhost_vq;
+    struct vhost_virtqueue *vhost_vqs;
     struct vhost_dev vhost_dev;
     VhostUserState vhost_user;
     VirtQueue *command_vq;
-- 
2.39.1


