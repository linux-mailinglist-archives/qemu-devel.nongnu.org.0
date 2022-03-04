Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6734CD642
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:22:43 +0100 (CET)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8pO-0007YU-Uz
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:22:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89w-0001zi-Ch
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89u-0000bg-LR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XiwXEThr1SLQJqLQ68T7zcCUyaMzcHqcL8oJCLXsU/A=;
 b=J1ARAOsEvVziw0CHwCTn8nZ2Dopzi25T0Xq9xBlP4ME6FYUNYePQYDy5lFCIH+r/aE9Nju
 WK17qAJiJHG5cHMaglPD1dcqDj81jRlSFq2AqWAyPw46vUuBIHr1VkAMpmiMFAZ57r+sds
 IJpFJbDhFcf2nYb/s9CzZgU/SuKIHSA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-So7H2Y8-Nvi66QHCt-sJsA-1; Fri, 04 Mar 2022 08:39:49 -0500
X-MC-Unique: So7H2Y8-Nvi66QHCt-sJsA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l2-20020a1ced02000000b0038482a47e7eso2823995wmh.5
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XiwXEThr1SLQJqLQ68T7zcCUyaMzcHqcL8oJCLXsU/A=;
 b=aQ5NMdiviNlFSQcNdfwR2SKTd/xYWOcCDzFtvRcVJUF51teheI2+kvFNOvT/FRC6D0
 ONYru88P+l7kdEzCshbdGM+cpm2CQlbfesXXRP3MIv0qojotmrDG16blSXYxoQWsvQqG
 8gk6DInz7haSynzT/EswVIeJsyWEC9fcYv+eDGDxSwmg9gvOCVpwhAHorqydDNX37QzF
 5OkcToVZYfPkl2J9Mg7VPRJmpKYsHzmuYe+S6YKIYxDLBSTQI839p+AgClUFJWHLQqI5
 X286nSrGgLZZ9NAhijFAmBk+OmIP56d4xYQa9KSZgeKVNqf0x4GG6sSWiaKnjP94FgW5
 4cOA==
X-Gm-Message-State: AOAM530wwoPWwWWnySTzsm6mIgiEaUy1qZz0AmrOuvIZIg1ocyP3EQJe
 RYzrpbtyGg8PjYkx0HjlNyGAIKJXVDz7q4l1k8u/p3kIWxyVFyA029/hOZY4XoHewC7+4e6Z7lz
 Vm79J+rcoUYrQq2Eb5FtI4+8YC4udggf3XQkIq/+4xNYHb85YGZjmjUt3QolV
X-Received: by 2002:a5d:5981:0:b0:1ef:8304:d9c1 with SMTP id
 n1-20020a5d5981000000b001ef8304d9c1mr22496468wri.43.1646401187422; 
 Fri, 04 Mar 2022 05:39:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTjV1L6XDYVJKyO4kw95BVlvP/ImkrqEPK3rZw/OWHDPv3APntCKrpTCgGLlbEUF1PEtkyZQ==
X-Received: by 2002:a5d:5981:0:b0:1ef:8304:d9c1 with SMTP id
 n1-20020a5d5981000000b001ef8304d9c1mr22496450wri.43.1646401187164; 
 Fri, 04 Mar 2022 05:39:47 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c35ca00b0038981d85ae8sm1594052wmq.33.2022.03.04.05.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:39:45 -0800 (PST)
Date: Fri, 4 Mar 2022 08:39:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/45] vhost-vdpa: make notifiers _init()/_uninit() symmetric
Message-ID: <20220304133556.233983-19-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


