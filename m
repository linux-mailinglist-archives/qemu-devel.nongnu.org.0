Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BCA48A193
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:11:28 +0100 (CET)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n71ws-0002Ra-QI
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71qf-0007rT-0C
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71qc-0004OU-6B
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BAJ+KG3jYTMVyAFjeLpjh/nWVc+IFbPXKDIrO0tfKro=;
 b=HrkNWqnATLGWQAFnlLvAA6WvwCZvox8/25kOschScnKmM7jH1ZdTkQMjKwUbF1HqvjLATi
 lyTMV2RalDFizr+sr4NZrrwwor0bcyrrKV6BB9AwNqahTixfdNdXODEZ4eT43BeVfHg/oW
 xWLqHJAvn8O9Bo3tV7kguK942XkiOUA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-ajgu4CATONO8uRUGvqpzVQ-1; Mon, 10 Jan 2022 16:04:56 -0500
X-MC-Unique: ajgu4CATONO8uRUGvqpzVQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 j18-20020a05600c1c1200b003335872db8dso2650796wms.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BAJ+KG3jYTMVyAFjeLpjh/nWVc+IFbPXKDIrO0tfKro=;
 b=sK8a+K2nqQMzzoWEcOtY+ds/nHh4vAVgz0ReTOKesdn+k1y/CdFBPr8A/fD2cW7H/R
 aLy6D28UYAoP/qxgI7qxfouBX7NEv2ZIz2FaV2MneudY6sh7goLn6uJvOAp5kYkZsPPe
 wFhWC7quhz2itt3Ng+QES3hCwX2HeGqgQ+FqLGIJdO7a58V4WoOTsXCsRJN4U3a67xlR
 vV9wBSFH1Rsbvrdav9LbeVSeoZt8UFG7FChp7X5oVHkbtPwMvrvzQ38H5OzolnVlqvfJ
 PlGNrJKScMU6vYE/eYxXn9p8Zsu265LkaX4WywIwmCt6zgzngJfhvbnf50RW+93FstA6
 alaA==
X-Gm-Message-State: AOAM531nRRj65BEhq0o4C2Js0B0BnVubZjMFP87RZZLWXaYC1mXSxKi7
 RFoilF2xwccOK8vENmf1uikUDWZJsSDD3UJMqPsSh9w0tGle+B+4X7xJ0PmXx2PMxGT6qnzBaeI
 TIiZpY/vzusRy5G9Q/+L+rgVhBDHg5kbPvQSEu7+/MaotJOslaY74RNzo6L6N
X-Received: by 2002:a1c:c915:: with SMTP id f21mr1047903wmb.39.1641848694623; 
 Mon, 10 Jan 2022 13:04:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt6Y9nbLnVQlPjrvkA6VnZueCjLxH54XRIPpLs4LGFVPItDMXlVcP/BHmc7MWGdjg4qQXIyw==
X-Received: by 2002:a1c:c915:: with SMTP id f21mr1047883wmb.39.1641848694380; 
 Mon, 10 Jan 2022 13:04:54 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id c11sm8830698wmq.48.2022.01.10.13.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:04:54 -0800 (PST)
Date: Mon, 10 Jan 2022 16:04:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/10] Revert "virtio-mmio: add support for configure
 interrupt"
Message-ID: <20220110210416.18779-3-mst@redhat.com>
References: <20220110210416.18779-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110210416.18779-1-mst@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit d48185f1a40d4e4ed2fa2873a42b2a5eb8748256.

Fixes: d48185f1a4 ("virtio-mmio: add support for configure interrupt")
Cc: "Cindy Lu" <lulu@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mmio.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 809132018b..72da12fea5 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -673,30 +673,7 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
 
     return 0;
 }
-static int virtio_mmio_set_config_guest_notifier(DeviceState *d, bool assign)
-{
-    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
-    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
-    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
-    bool with_irqfd = false;
-    EventNotifier *notifier = virtio_config_get_guest_notifier(vdev);
-    int r = 0;
 
-    if (assign) {
-        r = event_notifier_init(notifier, 0);
-        if (r < 0) {
-            return r;
-        }
-        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
-    } else {
-        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
-        event_notifier_cleanup(notifier);
-    }
-    if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
-        vdc->guest_notifier_mask(vdev, VIRTIO_CONFIG_IRQ_IDX, !assign);
-    }
-    return r;
-}
 static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
                                            bool assign)
 {
@@ -718,10 +695,6 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
             goto assign_error;
         }
     }
-    r = virtio_mmio_set_config_guest_notifier(d, assign);
-    if (r < 0) {
-        goto assign_error;
-    }
 
     return 0;
 
-- 
MST


