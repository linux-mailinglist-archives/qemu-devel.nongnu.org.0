Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4BD4D0B92
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:58:46 +0100 (CET)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMJS-0000l2-1d
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6T-0006FG-Kw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6S-0005TU-30
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiwXEThr1SLQJqLQ68T7zcCUyaMzcHqcL8oJCLXsU/A=;
 b=CSSGy1frmrossNBQm+UoblqAcJlljwXg7n11YnSHTf/EJbSgLnz4dmm9Zuxgf7PxVty8ar
 QxjdGqGWWaLbFeytVTyqMvNYsBmkm0kqCedH56527wi2qOe/S+1us+lw0HWxnljVmBrnSM
 P5NIye+XgODwgCrZtOVlRz1USoGlVRk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-kiVZolHiN9a5z7dKPrjRkg-1; Mon, 07 Mar 2022 17:45:18 -0500
X-MC-Unique: kiVZolHiN9a5z7dKPrjRkg-1
Received: by mail-wr1-f69.google.com with SMTP id
 w17-20020adfec51000000b001f068bc3342so2735709wrn.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XiwXEThr1SLQJqLQ68T7zcCUyaMzcHqcL8oJCLXsU/A=;
 b=qORBpoGqHKe8XdcrrQqYG/mZpQ9Za+s1mt6am1N1ZCu3giDzIFWp9bCK8zAxJioQzb
 TUnczpgu0/UfLTquVMQ9zGULvZ2yFPJ85kW8XvW3Xyh6HPZL21+oH6+2rr5th3BIJp/+
 6jt2sCqmwcDQtKptvRl3W+he/UeZE/oYbxppGFI9K9bLnP6LifciCuzSAOkzVL46CapC
 GsyZ0xnp157UhZxaZBBaRoPjce84Lo7gJmWu9XbwrgEhOskCzU2Q/UAOoZ/Pqx3gnY1h
 H///+2lpVuCzttC12vlPJrv25407//+su3cE/55caJlc5XrwYZjZTpvq2VGFVCFpYDYs
 zU9w==
X-Gm-Message-State: AOAM532xrevDgZav2ufOJlI5ko+QW6GKdi5XkipzUSwF51HOZFYQrsD2
 aXKjC3M5z9Ga5Fp4eB4LiIeIc36CFic9siT/L/rf3MgsJOW6oinVTAfORWYZIdy79dOdbPhSk7S
 CVZiL2rWiu0CLOOnizCem3p5kZTe9r7rgzkASrT4D4xEd8hz3ijtd3N1ew627
X-Received: by 2002:adf:a109:0:b0:1ed:c2bd:8a57 with SMTP id
 o9-20020adfa109000000b001edc2bd8a57mr9792491wro.612.1646693116934; 
 Mon, 07 Mar 2022 14:45:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvm61ZXnHOtG+Ro6jtOZO7HiSpPcytwU0cNM0e0fFCDGODMEr8VPkYCouAf0/nzXhqMDNQ5Q==
X-Received: by 2002:adf:a109:0:b0:1ed:c2bd:8a57 with SMTP id
 o9-20020adfa109000000b001edc2bd8a57mr9792475wro.612.1646693116633; 
 Mon, 07 Mar 2022 14:45:16 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 q23-20020a1cf317000000b003815206a638sm516801wmq.15.2022.03.07.14.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:16 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 14/47] vhost-vdpa: make notifiers _init()/_uninit() symmetric
Message-ID: <20220307224357.682101-15-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, jasowang@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

vhost_vdpa_host_notifiers_init() initializes queue notifiers
for queues "dev->vq_index" to queue "dev->vq_index + dev->nvqs",
whereas vhost_vdpa_host_notifiers_uninit() uninitializes the
same notifiers for queue "0" to queue "dev->nvqs".

This asymmetry seems buggy, fix that by using dev->vq_index
as the base for both.

Fixes: d0416d487bd5 ("vhost-vdpa: map virtqueue notification area if possible")
Cc: jasowang@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20220211161309.1385839-1-lvivier@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 11f696468d..6c67d5f034 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -395,15 +395,6 @@ static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
     }
 }
 
-static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
-{
-    int i;
-
-    for (i = 0; i < n; i++) {
-        vhost_vdpa_host_notifier_uninit(dev, i);
-    }
-}
-
 static int vhost_vdpa_host_notifier_init(struct vhost_dev *dev, int queue_index)
 {
     size_t page_size = qemu_real_host_page_size;
@@ -443,6 +434,15 @@ err:
     return -1;
 }
 
+static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
+{
+    int i;
+
+    for (i = dev->vq_index; i < dev->vq_index + n; i++) {
+        vhost_vdpa_host_notifier_uninit(dev, i);
+    }
+}
+
 static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
 {
     int i;
@@ -456,7 +456,7 @@ static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
     return;
 
 err:
-    vhost_vdpa_host_notifiers_uninit(dev, i);
+    vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
     return;
 }
 
-- 
MST


