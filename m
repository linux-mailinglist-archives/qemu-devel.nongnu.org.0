Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7826D6A7CA3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFq-0002hx-02; Thu, 02 Mar 2023 03:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFZ-0002Fv-QS
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFX-0002CI-GE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mHgZzuUR8eKxbjo0rCrirNhTNqh5oYr9Fm8k8gMJ5Xw=;
 b=Ns2u8YUmZu8FbhgC9CDRCDb1ChKNh+lbh7HLEhjdsA+v8ppXdCHC/y962v4ffqXHhSlBzu
 S9Xxc0cpFAJQFTvmT8rLgpVFYrmKed2UjOd0svsURU6IJdljgTf7tgUDBYBxSu5pA4P/l0
 RSuqw4stsPaPKWqVQ1Vyr2Yfk8Vkzlw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-U8yKUTfSMrO6O2pRJKPE2w-1; Thu, 02 Mar 2023 03:25:13 -0500
X-MC-Unique: U8yKUTfSMrO6O2pRJKPE2w-1
Received: by mail-wr1-f69.google.com with SMTP id
 x3-20020a5d6503000000b002c8c421fdfaso3030058wru.15
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHgZzuUR8eKxbjo0rCrirNhTNqh5oYr9Fm8k8gMJ5Xw=;
 b=er6WDlptX3eLYMUbn7CBB972irkCv5caLusBHCktiIEbucPVG8ihjTttwrm2poM5ex
 EqR0/Q2yaToq6KLxIz/p58Q5xtfo+Q8Zj3QDQHRMzTq072pBTj3xBkZ0n3bYEpwzD0ep
 YzaNkyCboS4RqUh72i4IczJuMx4mNciresRMYQq9jBaZwIV2Mmh1V32LPGKCzEgBgMvc
 XA6SIkHi6u+RRpVOYEflsjLWmbvZkd3vn2CEM/QuTPx1f/bLg+8XD7s+3DKQXPyc3M3s
 2Wbjqug0+AlHfhMMxpj8tIKY3nVmLDHCNSTedqYqq1Cl8GYB7B7oUnde586DxzAeeOa8
 BMuA==
X-Gm-Message-State: AO0yUKUubjlSM1Uzk9GofDZ+ELk15z73ppi88iL7JCFTQ7Ur2xDso9S9
 MVz6VqkWM3+18RE2tKbSwlNvJLr26LQVPFulRbJm22aWFuyu0cIAMZBmbLS+GRRpMqNH6sOB4iQ
 tr7TZv4l6mzZE3zYzroPQ6yMWx/oCHQg/0HXJtKRIBkkJsQYLTSCZFnGw1p5a5L67sg==
X-Received: by 2002:a05:600c:310e:b0:3eb:3148:a1b7 with SMTP id
 g14-20020a05600c310e00b003eb3148a1b7mr7192619wmo.12.1677745511338; 
 Thu, 02 Mar 2023 00:25:11 -0800 (PST)
X-Google-Smtp-Source: AK7set8aO1L6RIiyFhrvx7PidP0hOyyww16YnHhJ5idmMjAHu/36Q6rvzeXzPiLrzIV7obY9EJpZeA==
X-Received: by 2002:a05:600c:310e:b0:3eb:3148:a1b7 with SMTP id
 g14-20020a05600c310e00b003eb3148a1b7mr7192603wmo.12.1677745511018; 
 Thu, 02 Mar 2023 00:25:11 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c445000b003dd1bd66e0dsm2341373wmn.3.2023.03.02.00.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:10 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PULL 12/53] vhost-user-i2c: Back up vqs before cleaning up vhost_dev
Message-ID: <20230302082343.560446-13-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

vhost_dev_cleanup() clears vhost_dev so back up its vqs member to free
the memory pointed by the member.

Fixes: 7221d3b634 ("hw/virtio: add boilerplate for vhost-user-i2c device")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230130140435.78049-1-akihiko.odaki@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


