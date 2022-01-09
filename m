Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF97F488B73
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:51:51 +0100 (CET)
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6cMA-0001w1-G5
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:51:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6cJt-0001Bm-Ag
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6cJq-00038x-P2
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 12:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641750565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=WNUST86HWIMzLmP6YmJle/rFa/fm/A1i2Mu3Jr4aItI=;
 b=WlHh0sx28LEBGVSGW2A+rnAToECruIR4x/JCo3sQjpwSivQoFibvnm1cT4+DbWWO1KJW6P
 8kPe0PcEmvM4p5EG9vQBj9RzWVYjphYEX1yxrMh8SQw9ppnfED29EmxogQcGSUNecbddaL
 K2TnYZYP6+AIfWtcQT+++PKDoXGkgXE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-8kjqDR3aNgCxTopstonCgw-1; Sun, 09 Jan 2022 12:49:24 -0500
X-MC-Unique: 8kjqDR3aNgCxTopstonCgw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so7435328wma.2
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 09:49:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=WNUST86HWIMzLmP6YmJle/rFa/fm/A1i2Mu3Jr4aItI=;
 b=VZuE57XaH8N6C/o7hn+k2YGZAI6BGBRVAEn7a4X+0oyLbhayTefWhwhwcl+dUx1l8S
 Ene3N3zs8+K6pUcmB92cVERqvIwhBYXFxTFAuLZkH9fS7k3prKxXaVFWhH2SQGJKmwlO
 jS5FBMnNfYLJvEAonAkDy2qr28kSNf607Tptx47qSy1rIC8LqiKmxkEb2nwoh62h1tHJ
 WnUmI8jnHmSr/cnoRiU5K3ISRvpjdyKKrsb0Q+p5fMdDSBTT8rGBKSs0vufKrUVFkMEp
 U5EKUJnTMW/3dEypm9JGSKVjLwPxp7C6dRUNqdFLDFCYpGlF+MljfH5Vf9w3KL7isV72
 aePQ==
X-Gm-Message-State: AOAM531hJvVTkX8RtI9hCGqzY3ggTX1GR9nQoecwoEr8C+/jFJqN2w++
 fzf2XUUZPfH3JAmoaIYpISgsREfpclPBXE7m0HoGVdITaWc2Vv8o6hD6Q2jFEz5fC15zW4AicXL
 WXOBz558caEFL4TZ3s8tvB/6fKuCwBnniEzweALXqsFXiEn/xMiCtfiRA2TzF
X-Received: by 2002:a05:6000:1c05:: with SMTP id
 ba5mr13168834wrb.298.1641750563126; 
 Sun, 09 Jan 2022 09:49:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzEZu9/tX/MBHRo4T15O1xifiXHW7TXIKs+p8LQoAFait6p03wllbTTf8316ZuwdSBq9jlXw==
X-Received: by 2002:a05:6000:1c05:: with SMTP id
 ba5mr13168816wrb.298.1641750562851; 
 Sun, 09 Jan 2022 09:49:22 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107e:c07a:cd29:1c16:894b:6b07])
 by smtp.gmail.com with ESMTPSA id m35sm8307849wms.1.2022.01.09.09.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:49:22 -0800 (PST)
Date: Sun, 9 Jan 2022 12:49:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtio-pci: fix up config interrupt handling
Message-ID: <20220109173136.35848-1-mst@redhat.com>
MIME-Version: 1.0
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes a couple of issues with irqfd use by config interrupt:
- Rearrange initialization so cleanup happens in the reverse order
- Don't use irqfd for config when not in use for data path
I am not sure this is a complete fix though: I think we
are better off limiting the effect to vdpa devices
with config interrupt support. Or even bypass irqfd
for config completely and inject into KVM using ioctl?
The advantage would be less FDs used.
This would mean mostly reverting the patchset though.

Fixes: d5d24d859c ("virtio-pci: add support for configure interrupt")
Cc: "Cindy Lu" <lulu@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 98fb5493ae..b77cd69f97 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1130,15 +1130,15 @@ static int virtio_pci_set_guest_notifiers(DeviceState *d, int nvqs, bool assign)
             proxy->vector_irqfd =
                 g_malloc0(sizeof(*proxy->vector_irqfd) *
                           msix_nr_vectors_allocated(&proxy->pci_dev));
+            r = kvm_virtio_pci_vector_config_use(proxy);
+            if (r < 0) {
+                goto config_error;
+            }
             r = kvm_virtio_pci_vector_use(proxy, nvqs);
             if (r < 0) {
                 goto config_assign_error;
             }
         }
-        r = kvm_virtio_pci_vector_config_use(proxy);
-        if (r < 0) {
-            goto config_error;
-        }
         r = msix_set_vector_notifiers(&proxy->pci_dev, virtio_pci_vector_unmask,
                                       virtio_pci_vector_mask,
                                       virtio_pci_vector_poll);
@@ -1155,7 +1155,9 @@ notifiers_error:
         kvm_virtio_pci_vector_release(proxy, nvqs);
     }
 config_error:
-    kvm_virtio_pci_vector_config_release(proxy);
+    if (with_irqfd) {
+        kvm_virtio_pci_vector_config_release(proxy);
+    }
 config_assign_error:
     virtio_pci_set_guest_notifier(d, VIRTIO_CONFIG_IRQ_IDX, !assign,
                                   with_irqfd);
-- 
MST


