Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258868109E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:05:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUm8-0004RJ-3v; Mon, 30 Jan 2023 09:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUm6-0004R7-5m
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:04:46 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUm4-0006tg-MP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:04:45 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 143so7679275pgg.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=njFo12pYsEFIvREMCTlvpgnTekGhXNsA8n4nmT3z7A4=;
 b=zyHK4fyvxsHyqs+tSflMy5SXIWFcLHmaVxLgznDhQhAjCQ9xgYXR/ycpfZsFW/QRNZ
 j1bkw1oE+aJRtm1GHYKmz2vio4Plg4uhmEzfAiydY8uYIc+fQyiZQjj19qEd+MmDZZDz
 V+F6ajRgMG6p5Kc8GNpN2z4zcHvLRtTFKCmEdqpI4GKEiFpC1Sj8rm2PX48M4phzZna2
 EHsA17SbeJx4H5DyGS3BAHI5qB+sVt7/boIEF5ZQo1EHWtdH6QYPnMvEtyFB+4/SYAPJ
 EdwbRDLf79HeZIOlJkiwaK/3PL50xGXZorA0k2m9azA8Mk7rdZcebzxh7tow7zDZeF9X
 BmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njFo12pYsEFIvREMCTlvpgnTekGhXNsA8n4nmT3z7A4=;
 b=ZVu2crQBN+zSj6X7rrACqCvG1XYlvkJEwi6iU52QnCSGmi4U6t3i888lCq/+fCbQTJ
 BJVB9/qQoLxD+Qj7X/nO9rpAd7FYgfIuB7OLXSUN7zxyWoaZ1tf9uPAZlRUeJtBmhaGe
 LCn3tq5ngVv3Pxxx2FsZYLRHl9i/z7vldCgUsDSg5wxoFJNOeI9Y6Dyq9PFymTWnYr5V
 6FBID1oi7exj8rLx2aePsxDB8FbuGCdJvYscPyyQr0rsdtdZ/EiemZjmj5ctiyF3fMhv
 S2HDAaVKAtDSQAT/KinxhRt9L8q18+fC84f6AysrSLxMAZf7TdhaAvLDRkreuJlQg3S9
 1XXg==
X-Gm-Message-State: AO0yUKXJa7ulDi+bPTr6oWficidKVXd4WQ5iEEnNymOOw3jvVfvbfqNf
 QOTai/wyIQOIl0M/IZuFiOVawur6DFIlrCzz
X-Google-Smtp-Source: AK7set+sUkvhPXu3Fy6CIND7z7eUUhS9+0I0YVQA5R60OtfogzJMRNHDaqtb+TW70WnHsXiPgCYbfQ==
X-Received: by 2002:a05:6a00:1818:b0:592:6313:20fb with SMTP id
 y24-20020a056a00181800b00592631320fbmr15149704pfa.30.1675087483179; 
 Mon, 30 Jan 2023 06:04:43 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a056a001d9300b00581f76c1da1sm6448128pfw.191.2023.01.30.06.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:04:42 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] vhost-user-i2c: Back up vqs before cleaning up vhost_dev
Date: Mon, 30 Jan 2023 23:04:35 +0900
Message-Id: <20230130140435.78049-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52b.google.com
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

Fixes: 7221d3b634 ("hw/virtio: add boilerplate for vhost-user-i2c device")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/virtio/vhost-user-i2c.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index dc5c828ba6..60eaf0d95b 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -143,8 +143,6 @@ static void do_vhost_user_cleanup(VirtIODevice *vdev, VHostUserI2C *i2c)
     vhost_user_cleanup(&i2c->vhost_user);
     virtio_delete_queue(i2c->vq);
     virtio_cleanup(vdev);
-    g_free(i2c->vhost_dev.vqs);
-    i2c->vhost_dev.vqs = NULL;
 }
 
 static int vu_i2c_connect(DeviceState *dev)
@@ -228,6 +226,7 @@ static void vu_i2c_device_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&i2c->vhost_dev, &i2c->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
+        g_free(i2c->vhost_dev.vqs);
         do_vhost_user_cleanup(vdev, i2c);
     }
 
@@ -239,10 +238,12 @@ static void vu_i2c_device_unrealize(DeviceState *dev)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserI2C *i2c = VHOST_USER_I2C(dev);
+    struct vhost_virtqueue *vhost_vqs = i2c->vhost_dev.vqs;
 
     /* This will stop vhost backend if appropriate. */
     vu_i2c_set_status(vdev, 0);
     vhost_dev_cleanup(&i2c->vhost_dev);
+    g_free(vhost_vqs);
     do_vhost_user_cleanup(vdev, i2c);
 }
 
-- 
2.39.1


