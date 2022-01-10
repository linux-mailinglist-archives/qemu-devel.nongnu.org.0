Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5444890AA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:21:16 +0100 (CET)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ozS-0001c8-RM
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6ouf-0007Bg-IN
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oud-0001iq-Py
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fmd4hVUWpHW/ohBMb7hZhM27Td7QwVWl637W51ZyW5o=;
 b=e3aHHtb/73UzMYqg6tIqwTO/BcWuqEWzBNLdTvVjS81T16Gh/JZ0EM7aEyEgzb2m9eZVX0
 yk17Sm1XYkItyqJlI8+ochIAy7yUQUJiTeVf/jE8qRQIcq5r/tLaoqa0amXqtEGol26iZy
 SPSc9FmtsROAtvlGYwf8MIDtydEmhss=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-3jgA6DHRPOm8UY7JpTWjRA-1; Mon, 10 Jan 2022 02:16:12 -0500
X-MC-Unique: 3jgA6DHRPOm8UY7JpTWjRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so5900902wmc.8
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fmd4hVUWpHW/ohBMb7hZhM27Td7QwVWl637W51ZyW5o=;
 b=7A+88v/0hs32yUWtFZCsIqhcFOruyXIHqZ8TSZQ42fcw7s4YaIkNuyGQJQ9IoBOh/u
 F964QZVYsarydTHBQbLme6mdtWhMptKOsJJ/49K08+Qz2jipHxwuQjaI4edBNcmdqokU
 wyM3OtIrutcHlwHPi0u0nuLlpQp04xY/hOQPCH+cK3eODqXkhOdTyKIGDWQrUd0AoSji
 dPkqJCuoPkBA/jaohbjakKXritqXFwa3gjr2S0V+G8tyBCFkRZauwDws6xngYrh1WB0v
 luOriIJKmdkutqZdbQXwPQGDU8QfkMQ1ck0RHPzVxSO0ge7U4SdNgFdtFy3fXL0BK6HE
 lGIQ==
X-Gm-Message-State: AOAM532KnKGDdnxFBVH9rCXU2WX1TjeU5XWgf7dax/OOCeCZTebcmH7N
 aDutogQ5CNw9vGn3X9vD1SsrAJH9/xTO0ZC/6htmdlApzk5vLO0n1BBSfUAIH6klhHBPNrQnYYj
 nRyqj8vIXLFlBEZR1C5a4p7D61aIh6VOq+uyBd40PzH2NfYEKsTudOwm/VRjd
X-Received: by 2002:a1c:4c11:: with SMTP id z17mr342171wmf.0.1641798970497;
 Sun, 09 Jan 2022 23:16:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykGD6Exr0Mr3Il/Zqiim9JyjwzWoAwe2tPg++KwWh81spK0rTuzOVvzsYKDKnc0gY+ktQ3sA==
X-Received: by 2002:a1c:4c11:: with SMTP id z17mr342166wmf.0.1641798970220;
 Sun, 09 Jan 2022 23:16:10 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id o1sm5918606wmc.38.2022.01.09.23.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:09 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] Revert "virtio-mmio: add support for configure interrupt"
Message-ID: <20220110071547.195669-3-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit d48185f1a40d4e4ed2fa2873a42b2a5eb8748256.
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


