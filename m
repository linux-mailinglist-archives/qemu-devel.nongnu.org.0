Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23CD48654F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:34:17 +0100 (CET)
Received: from localhost ([::1]:41058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SuH-0004qB-1p
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdD-000430-Gm
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdB-0000nf-PF
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641474996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=MFf4jo2oVapJinEjfccQ+NqcgGaEzMenvoIiFVDe7rVZ/FRT3JdWtuFFv1WOxURzW3MBje
 rdooXoOH6vDRXO0hmoUY8SUzS2zpudLMRm4pWwjkQ3ZOk9Ux3tV7q84rff4oJG5rzfVfCC
 gZAOslFIA/bbUNrqXxVGnwJ7shRelr4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-yVP_dRDDMQKmsxkLWZPihw-1; Thu, 06 Jan 2022 08:16:35 -0500
X-MC-Unique: yVP_dRDDMQKmsxkLWZPihw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so1226491wrh.23
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=873JIwL0Ssx4x2GI9hqUqv8te9fEzO/xVfFKyB9oXJQ=;
 b=tJ1tq/KENY8peugxEUrXYFrsDtyKamN9vg4TXrD+tPEH4I/kGKmVT7SizhLnH5Cqzh
 Jt0a3Xg5maqwX4EQaZTDXUCvH4lLZx3I3mDGZmjpL/cckOQaTogW03S9ghduKUDBgUWh
 ImRizv7obTMKI9uJ6nV4S5R/a0EWHWoILGwn/jtVIv5NSX2rTpnIXUKiTThEK3gPRhsp
 eZjRqSF4mGhUT8P3U29jvQgzAAghnhEnmTSGbRszEfHrztFqXajedFf9oLNvmvIE36/I
 OgFARi+xY6P3Uh1a1UvaBP+KyAypKjPTXjri1P/nY8qTZ4yc8FGschcoXuyhxOgJsvge
 WBwQ==
X-Gm-Message-State: AOAM531POadlnK0tW63eYfw6m6R1IHLFxE1AiuC5hQmi6wvtVL4V9Jo/
 Pl8LILAzpv5UB9zgMGbgYIg2t06kaMa9juXt77b1o0g3GIh0Tpts0xRL+0acPoxCJUnhbKkFFHC
 ZkAGOadWzfSUwDgnV/gsXZktrRTQ+2WxJKA6+bX8ALW4Phh4keVj63wxT4WtY
X-Received: by 2002:a5d:698c:: with SMTP id g12mr1997027wru.69.1641474994382; 
 Thu, 06 Jan 2022 05:16:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwat/pZUfiX15cypImFWbngHmZHLilyyUZLSLa80u9Yxs2xgbghz+82ojbMJDgArIMKZxgmGg==
X-Received: by 2002:a5d:698c:: with SMTP id g12mr1997006wru.69.1641474994129; 
 Thu, 06 Jan 2022 05:16:34 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id u3sm2591977wrs.0.2022.01.06.05.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:33 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/52] vhost: introduce new VhostOps vhost_set_config_call
Message-ID: <20220106131534.423671-7-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

This patch introduces new VhostOps vhost_set_config_call. This function allows the
vhost to set the event fd to kernel

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-5-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 81bf3109f8..ff34eb7c8a 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -126,6 +126,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -171,6 +173,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
MST


