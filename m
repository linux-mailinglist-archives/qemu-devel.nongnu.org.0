Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0806865E7CA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:28:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLj-0002Tp-8j; Thu, 05 Jan 2023 04:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLZ-0002MR-Oq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLY-0007AL-85
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GGklUbfsYOTwoJJjI6gv9XOzUxb3ETCwK876oF/HvWU=;
 b=Zk/vhR4h+5hgXaSCYF5Eu6ctFLfOxW4+O6yst5yt+PyDkgUr7MuNZLjdP/JxiHZLp7UQJq
 RjRLTtaqM+zDN97J9ZAxXFX/jwnqAFN8FsEUXclGOvhNwk6FeZ+3HKynx3KYK8ikDRACG0
 k10RLpk14ID14o34QnbzeFxz2VcCeWg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-HB0skVhXNNyPb3MHPQ51vw-1; Thu, 05 Jan 2023 04:15:34 -0500
X-MC-Unique: HB0skVhXNNyPb3MHPQ51vw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r15-20020a05600c35cf00b003d9a14517b2so735025wmq.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGklUbfsYOTwoJJjI6gv9XOzUxb3ETCwK876oF/HvWU=;
 b=W6fKjYzbahjMt8c76EaRyD8hKiorgwmH4im0xMIDvMgtUXwfgLevHJ38kqG4HDVuLu
 BOnTxMVX8oiPWk4ZtTpjRzuicB7Bs0F/VoQCqkEYGdPDVI0TRN1eXpqOo1fQvhCvCKfB
 MoBebw68qnSpbORtnGbYkU4pcux/+paa5cUFJ5EkZtEh+cxt4h2rugrGbmAAfqWD+COv
 K5NDIfdRMwzaRUJNt36jAArQDrZTG45EQ9r/5kr3OfzNWhg6Vc3pL0Vsr+pATIllKBg/
 haBQds5UJZJtDa3DHh0dT3FZRbB/Q3WAWWwtjJKu4ZhMlefCdW2FNVnRr2QZIuM40IFc
 KhmQ==
X-Gm-Message-State: AFqh2kpkogKaAgUxDetLG4JBGuy8KQ+7ayWs6Vo6tjggwkNfoTtgXvYf
 x60Dz0vjZsyy2AcFi4LgxPcEX+Yv3ayzlOacs6gf0KR34RhIRC1d4OnOBRaGqdRfepbNTgZKO3n
 XKQ9Ntpog+laiRB4Jq1VF3umLRuVd6/oZuIsIPxIOAZyuzAv8bN4MPTBpDTe1
X-Received: by 2002:a5d:544a:0:b0:290:7dfa:9582 with SMTP id
 w10-20020a5d544a000000b002907dfa9582mr12592322wrv.22.1672910132705; 
 Thu, 05 Jan 2023 01:15:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtyBw6XKQaoaUCY0yIltTgHxMGvTTR7MShgJdasrqv7snz50nRyN8FxK+Yq8tP3zOSUcM6jAA==
X-Received: by 2002:a5d:544a:0:b0:290:7dfa:9582 with SMTP id
 w10-20020a5d544a000000b002907dfa9582mr12592307wrv.22.1672910132440; 
 Thu, 05 Jan 2023 01:15:32 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d468d000000b00275970a85f4sm33881121wrq.74.2023.01.05.01.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:32 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 23/51] virtio-mmio: add support for configure interrupt
Message-ID: <20230105091310.263867-24-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Cindy Lu <lulu@redhat.com>

Add configure interrupt support in virtio-mmio bus.
add function to set configure guest notifier.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-10-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mmio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index d240efef97..103260ec15 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -670,7 +670,30 @@ static int virtio_mmio_set_guest_notifier(DeviceState *d, int n, bool assign,
 
     return 0;
 }
+static int virtio_mmio_set_config_guest_notifier(DeviceState *d, bool assign,
+                                                 bool with_irqfd)
+{
+    VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+    EventNotifier *notifier = virtio_config_get_guest_notifier(vdev);
+    int r = 0;
 
+    if (assign) {
+        r = event_notifier_init(notifier, 0);
+        if (r < 0) {
+            return r;
+        }
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+    } else {
+        virtio_config_set_guest_notifier_fd_handler(vdev, assign, with_irqfd);
+        event_notifier_cleanup(notifier);
+    }
+    if (vdc->guest_notifier_mask && vdev->use_guest_notifier_mask) {
+        vdc->guest_notifier_mask(vdev, VIRTIO_CONFIG_IRQ_IDX, !assign);
+    }
+    return r;
+}
 static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
                                            bool assign)
 {
@@ -692,6 +715,10 @@ static int virtio_mmio_set_guest_notifiers(DeviceState *d, int nvqs,
             goto assign_error;
         }
     }
+    r = virtio_mmio_set_config_guest_notifier(d, assign, with_irqfd);
+    if (r < 0) {
+        goto assign_error;
+    }
 
     return 0;
 
-- 
MST


