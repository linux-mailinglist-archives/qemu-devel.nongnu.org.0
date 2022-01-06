Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570CF4865E2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:15:12 +0100 (CET)
Received: from localhost ([::1]:54274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TXr-0007Ss-3u
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:15:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfO-0006aU-JT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfM-00017Z-Vl
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sZKl68SrJVJX9J/g8uBNG773VeE63EY7yyNvoTLPOxc=;
 b=Hvi0E7WsphqjpF9QUnaF6PTqvovzUacwpPtlMK+LSmB1qg5EGuOzdmvgn0BTyXRmJNj+ZP
 H71lqfOjUuURylh5FeEKOSzDSqUFOvLXx5hLdGCagfwZQckJkraogcGyiGBiivEeIJrPNW
 CVlHzgG5770z7+hp+wsbOZaZaCqbYlM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-ez0CdN6AOtGu0iODoSafSQ-1; Thu, 06 Jan 2022 08:18:51 -0500
X-MC-Unique: ez0CdN6AOtGu0iODoSafSQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s7-20020a056402520700b003f841380832so1943968edd.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sZKl68SrJVJX9J/g8uBNG773VeE63EY7yyNvoTLPOxc=;
 b=ZSMnMDFb8l82fPZ4OSz6igbSi/NzvqkJ8wZzvyMiAAI32NZoHBiJqJXe7Zte4Wdj3B
 xRw9w1IObo8jiadgS8R05oSLUpm95dYOWNXdkcqywqKVPUaE9jLq2gTg3raRsA7W04Cv
 QKRE446IKda6plQ7bidy0PlmxlwooCkhzUqFUXjbyZnLzTm8cAV4vOaTScxilhKqrm5A
 TQgpdWSrRYWq1qJWIePFWH9DOMisb3s5tV826NkG4ElTudXd11UCInABjLtZBLBo1ldx
 DfLvUGGOFCJr8lOHMq/eWmZAU+fi99ByO34P0AnRLxKq3LZSbigkjIwDczJT4oO5x8xV
 HqIQ==
X-Gm-Message-State: AOAM530mkQtUofH+x32eZR7qB8+IlAz2SVswSBxDdU/WK0z0pyVJXWR6
 upFvYPVF5PdCKwMzFF0jzZdOwAKKd13J0d1INFO/FQlNMuYlCAjkAt2VDkjIDrpS3NI1QHiL70q
 B6fs2D44nDZ1LBpovkahNJGXsDo2Gz0cRN31VMtZgN4h6/4/BmPcrmoxvhj5t
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr56255000ede.353.1641475130193; 
 Thu, 06 Jan 2022 05:18:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcVtpDp46hIDOlR8avCRQF9fh5fJnT8Ik41AdP3NPm9WJosYtOZsntM1M73RJsXUEBeY5YFQ==
X-Received: by 2002:a05:6402:2793:: with SMTP id
 b19mr56254976ede.353.1641475129917; 
 Thu, 06 Jan 2022 05:18:49 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id r17sm500302eje.15.2022.01.06.05.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:49 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 52/52] virtio/vhost-vsock: don't double close vhostfd, remove
 redundant cleanup
Message-ID: <20220106131534.423671-53-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

In case of an error during initialization in vhost_dev_init, vhostfd is
closed in vhost_dev_cleanup. Remove close from err_virtio as it's both
redundant and causes a double close on vhostfd.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20211129125204.1108088-1-d-tatianin@yandex-team.ru>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vsock.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
index 478c0c9a87..433d42d897 100644
--- a/hw/virtio/vhost-vsock.c
+++ b/hw/virtio/vhost-vsock.c
@@ -171,6 +171,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     ret = vhost_dev_init(&vvc->vhost_dev, (void *)(uintptr_t)vhostfd,
                          VHOST_BACKEND_TYPE_KERNEL, 0, errp);
     if (ret < 0) {
+        /*
+         * vhostfd is closed by vhost_dev_cleanup, which is called
+         * by vhost_dev_init on initialization error.
+         */
         goto err_virtio;
     }
 
@@ -183,15 +187,10 @@ static void vhost_vsock_device_realize(DeviceState *dev, Error **errp)
     return;
 
 err_vhost_dev:
-    vhost_dev_cleanup(&vvc->vhost_dev);
     /* vhost_dev_cleanup() closes the vhostfd passed to vhost_dev_init() */
-    vhostfd = -1;
+    vhost_dev_cleanup(&vvc->vhost_dev);
 err_virtio:
     vhost_vsock_common_unrealize(vdev);
-    if (vhostfd >= 0) {
-        close(vhostfd);
-    }
-    return;
 }
 
 static void vhost_vsock_device_unrealize(DeviceState *dev)
-- 
MST


