Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E361DD24
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 19:17:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orNiW-0000Z3-LC; Sat, 05 Nov 2022 14:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNiU-0000Yv-Po
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orNiT-0007pp-Cc
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 14:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667672184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCumTYExZFxa+mUq1vvCATCLdsbTjyIn1a3PvxIM+9M=;
 b=XleJh3K2FdkBD4kv72DIwGNmbPJWEk7bCGh7YRUlgCuBQHJepW/SfdCGvwbAp56OUPllcO
 s6GJww9d2uPowidzyhqZjG7T28QMGp+7+zGUW8HLGfdAQO0sYt20nSMEcJhXz/zvF5Hv3N
 i6oSvrUptlAcCIh0byDV1VQ9cgNdWME=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-MSCj35T5MBaL3oWlGQxzvQ-1; Sat, 05 Nov 2022 14:16:23 -0400
X-MC-Unique: MSCj35T5MBaL3oWlGQxzvQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f62-20020a1c3841000000b003cf6d9aacbbso3885634wma.8
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 11:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HCumTYExZFxa+mUq1vvCATCLdsbTjyIn1a3PvxIM+9M=;
 b=jpq+yYuaUp5XKvTyEecbE69ReHkIGlQzbmAC5Qx7iqltdbbeuE/qp2DRr+d4+hYsoe
 AdyP/GgtlkMV6nHRvJ5G8XyMYpS5IVpXzwSYEPJ3q+3WLmuwUce+Atvq4d7C/gFOgNlH
 EAmFhO54GzpXAK5OeshRFNQtOSfJkGKYPKt7Jn1P3APF2f2Oz5xv+okI+ITHMsmqedFL
 9tte7EG0QorNtHGoI8ZDjsIbWFZ1flIqCMZid5+xbrKGVFT66t7tS6M7Ks5gXgbRya6q
 nAHdXDxPeVQhtxG55xLfLBBts4VYxp9FAusQWm9gXMTIz3zhXijI7+dC4eu/10l5z2tg
 J+/g==
X-Gm-Message-State: ACrzQf0C9hhjxgLzuULIIVEBfIp9XKuT2QRBu2og4lKj0jSXFsQRn0Up
 yp+airrFsYR0cGXgpByzI4jb5WRBXJoeqGM3BnXQMjo2jZBAQYlNERTfHoLRzzFiIsxgX01IO+r
 tFzpiAnEdCT/pqh5mP8yVMybSjB2l3QtVoothk5KnXvGLa4Na3twH9Wes4wga
X-Received: by 2002:a5d:6ac6:0:b0:236:84b5:6660 with SMTP id
 u6-20020a5d6ac6000000b0023684b56660mr26277513wrw.555.1667672181650; 
 Sat, 05 Nov 2022 11:16:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Ivx8YsggX6Au2nVrdjA0cIlz2WJBWkCu1cripEIU+OZf+RRanl+an2I57k5IF1TKablafKw==
X-Received: by 2002:a5d:6ac6:0:b0:236:84b5:6660 with SMTP id
 u6-20020a5d6ac6000000b0023684b56660mr26277498wrw.555.1667672181358; 
 Sat, 05 Nov 2022 11:16:21 -0700 (PDT)
Received: from redhat.com ([169.150.226.216]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003b4ff30e566sm19943300wmq.3.2022.11.05.11.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 11:16:21 -0700 (PDT)
Date: Sat, 5 Nov 2022 14:16:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, virtio-fs@redhat.com
Subject: [PATCH RFC 2/3] gpio: use virtio_device_running
Message-ID: <20221105172453.445049-3-mst@redhat.com>
References: <20221105172453.445049-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105172453.445049-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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

Same as other vhost-user devices, vhost-user-gpio cares whether
device is running not whether frontend is started.
Switch to that.

Fixes: 27ba7b027f ("hw/virtio: add boilerplate for vhost-user-gpio device")
Cc: "Viresh Kumar" <viresh.kumar@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user-gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
index 8b40fe450c..f34ee59b6e 100644
--- a/hw/virtio/vhost-user-gpio.c
+++ b/hw/virtio/vhost-user-gpio.c
@@ -152,7 +152,7 @@ static void vu_gpio_stop(VirtIODevice *vdev)
 static void vu_gpio_set_status(VirtIODevice *vdev, uint8_t status)
 {
     VHostUserGPIO *gpio = VHOST_USER_GPIO(vdev);
-    bool should_start = virtio_device_started(vdev, status);
+    bool should_start = virtio_device_running(vdev, status);
 
     trace_virtio_gpio_set_status(status);
 
@@ -228,7 +228,7 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
     }
 
     /* restore vhost state */
-    if (virtio_device_started(vdev, vdev->status)) {
+    if (virtio_device_running(vdev, vdev->status)) {
         vu_gpio_start(vdev);
     }
 
-- 
MST


