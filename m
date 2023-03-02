Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C276A7C98
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:28:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFm-0002S2-NF; Thu, 02 Mar 2023 03:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFV-0002FP-UJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFT-0002Bg-Qx
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TCSYqJbo9EsXx3sz7ebfc0MQ5H8efRMAzVObswWYkt0=;
 b=EQSIDD8Ze76D4wWqgDfuXsRcb5lVAAtwvhR61uvXc2jKowLy+IWjov0/Nuf3tAiVN5iBau
 N3W0qChhTTZuG0q1CvyRiWNqLLRgwZM0u34onv/M2cCBmqf0Oc/+/Kn4irCwmMJ7CO2gI/
 ryMUJjI6C+k9uA9qiTKVsvVtkA1bX0M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-6icMR7s4PtKcmPpXvow22A-1; Thu, 02 Mar 2023 03:25:10 -0500
X-MC-Unique: 6icMR7s4PtKcmPpXvow22A-1
Received: by mail-wm1-f69.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5461652wmi.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745508;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TCSYqJbo9EsXx3sz7ebfc0MQ5H8efRMAzVObswWYkt0=;
 b=dUQXDdDi0d4jfj9CVpfLJ934XaV8wSDxO2QcoTckGUOb8kijn92MRDN44tCyjMbHmx
 joZ0oxuPEp3VsotsNIZh48DqEP7q6rIoeWt5oSmluuUpDA9U4rj/8Rd3/WvNULh90fRT
 HJGzwH7D0iL3W9i/fmEoBsLHaIUdXhJIqZch3RLR8L9KE2p0BhvogNW1SFVonsCtikY8
 9f1JIrrSgGlembwQz7G0cBNj8fqLmsNwz4vlRJNDYf0j/YBVvu2mLuA24IR0spk7C2Hn
 krSxpFvEC7slJVFAPFwR//eixQXtRWSgvP6M3VFf0jCKO/BB/410ljZ3Fm94rBg2DYvh
 tU5Q==
X-Gm-Message-State: AO0yUKU/aGz4viUGyFcFliB23dYD9zXpWsUPaQNy2/87VsFAP9jBSzcw
 PSqxnUCxv82Q5XkATz7Zhql5DLA3eTIvR3/VZeqVLq5REsUQb4SOFHDRvkzXYoK1q2goGfZ9WxA
 s7vNQgHxbU7HYXuVcDshgcctc+iLU/YFXL+fpkag9aR3Jliqm8epjsFQTF/59JP0q5w==
X-Received: by 2002:a05:6000:120b:b0:2c7:17dd:ed6a with SMTP id
 e11-20020a056000120b00b002c717dded6amr6916465wrx.33.1677745508429; 
 Thu, 02 Mar 2023 00:25:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9uE+NA736YKjGbN1si1U/5ZcsuV5oWfhNPQibx4NmQgCTNEpdlLXYbS5NiVcYXXS+DkvMV1g==
X-Received: by 2002:a05:6000:120b:b0:2c7:17dd:ed6a with SMTP id
 e11-20020a056000120b00b002c717dded6amr6916448wrx.33.1677745508198; 
 Thu, 02 Mar 2023 00:25:08 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 u4-20020adfed44000000b002c563b124basm14710344wro.103.2023.03.02.00.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:07 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 11/53] vhost-user-gpio: Configure vhost_dev when connecting
Message-ID: <20230302082343.560446-12-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

vhost_dev_cleanup(), called from vu_gpio_disconnect(), clears vhost_dev
so vhost-user-gpio must set the members of vhost_dev each time
connecting.

do_vhost_user_cleanup() should also acquire the pointer to vqs directly
from VHostUserGPIO instead of referring to vhost_dev as it can be called
after vhost_dev_cleanup().

Fixes: 27ba7b027f ("hw/virtio: add boilerplate for vhost-user-gpio device")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230130140320.77999-1-akihiko.odaki@daynix.com>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-gpio.h |  2 +-
 hw/virtio/vhost-user-gpio.c         | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

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
 
-- 
MST


