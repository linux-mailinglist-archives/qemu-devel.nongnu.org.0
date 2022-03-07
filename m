Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7424CFA7C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:23:23 +0100 (CET)
Received: from localhost ([::1]:47326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAWQ-0003hU-6e
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:23:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABy-0000Xm-4Y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABu-0002i9-6d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiwXEThr1SLQJqLQ68T7zcCUyaMzcHqcL8oJCLXsU/A=;
 b=IL5uiEucXYHMtjMC7SqLKM1OxVNK0eKXrXbcW5pJP8tqAD+OOS9IOWoQtijOEjzCeXVF6P
 OewMZW+iEo+15tRf3TA+0qTPnto7RY+ZYHJQSD+8xWNv3+bSf/SEJG6GNbx1KU8+kSoIvb
 cohvJCEyoXUaboJVnItwSsEYt1vncrk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-D5pDOZzLO16mPAzojNIcpg-1; Mon, 07 Mar 2022 05:02:07 -0500
X-MC-Unique: D5pDOZzLO16mPAzojNIcpg-1
Received: by mail-ej1-f71.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so6746179ejc.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XiwXEThr1SLQJqLQ68T7zcCUyaMzcHqcL8oJCLXsU/A=;
 b=DpU+372EiWzRuZR2P/vF03deT/2duRlNA6jbGsyMN3hcR7KPSRCCkjLc8yGlXFqCbO
 q+Dq2e3F5zOZGX0cokdnm2B6qbas4Gyho7IOKA8riWWIEy+wTeNOG7oyToeYr+Zp3H6T
 uVPuCRPW5MOLHefXMhpTwqSsyQJtRzNopy4R/bZIofC5ueXvXb2/EfcwaZcpY+S0rtyk
 Zjcf5BHrxUnc3XluEQdrYR1+/XODdpDCJRg1GOhzibRU4AeoIW2Gxwxifm2CSe2CWnaZ
 tITYX55DKr5nTRzF796I9pvO69V3pbwfPfEIUA2Xp0ZWwhHJxm3B+oEu2ETztQHEfTKl
 sSqQ==
X-Gm-Message-State: AOAM531ru2yKZNOQv6nGjk158n/HCXCS58u7pNHzu/N3xZomNqyneX49
 3T4+w//WbJfBup/9aj7qZ907osJ19kQGTBBZT7hGAyPfa8y8h1vETg1z/Z96iSeIgV3mrsPu3PM
 qJR85/m1L7oRXyol7ulb2dpVHIGAkjPyuAIkxBVskKg/QAYVzYw+5npKFEaMD
X-Received: by 2002:a05:6402:4389:b0:410:9a9d:ab53 with SMTP id
 o9-20020a056402438900b004109a9dab53mr10594453edc.16.1646647325633; 
 Mon, 07 Mar 2022 02:02:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaBAOzzTyH2qQ5jxbIrRYOs97ZCsaa8qGyj4yIbDQqyXSrElZdIgDLMqJ9MvSe7XXGGfv8mw==
X-Received: by 2002:a05:6402:4389:b0:410:9a9d:ab53 with SMTP id
 o9-20020a056402438900b004109a9dab53mr10594430edc.16.1646647325367; 
 Mon, 07 Mar 2022 02:02:05 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 r11-20020a170906350b00b006dae77c09b3sm2952572eja.154.2022.03.07.02.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:02:04 -0800 (PST)
Date: Mon, 7 Mar 2022 05:02:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/47] vhost-vdpa: make notifiers _init()/_uninit() symmetric
Message-ID: <20220307100058.449628-15-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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


