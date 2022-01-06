Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E07486549
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:28:27 +0100 (CET)
Received: from localhost ([::1]:32876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Soc-0007YH-CX
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:28:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdH-00043z-6B
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdF-0000oH-HI
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gv52akJFHQiv170C8mObbPapN00kjPRMbnaS61dDiXs=;
 b=F9DmEmHx2VRwo2Ax7XNEL3WJoN/DMfVBQH+qM8SLMdZyD7IOs88KmfS2+gSP3/komQiNd9
 GaDeLUA02RWTmgGzWA6CxKqK1Q28nXXgcXQxuuG8AYpAoJ3WfBf9t6c69WY0NFSqBvap5F
 jqFEjIw82MEjV4eEfX+O/G4y+aoTuYI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-gpyPDDBEMBq5g9kOojNQ7A-1; Thu, 06 Jan 2022 08:16:39 -0500
X-MC-Unique: gpyPDDBEMBq5g9kOojNQ7A-1
Received: by mail-wm1-f71.google.com with SMTP id
 m21-20020a7bcf35000000b00346ddc490efso179127wmg.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gv52akJFHQiv170C8mObbPapN00kjPRMbnaS61dDiXs=;
 b=k5Reir9nJxztTMoM41OGNV8noNkn+ZA97gPGq7KSyYYl1Ci0u8KbwNe+N2kg/T6kCe
 W4muQsnDQsTVzKmDO3f8bu1rj3Vogf/X+MxG2NlRXV8YT3kMNDz3WPNHfYMw468UxC51
 K3h0HJOlZ/a6chqmoiri/9Ou3J4zE43op3d9m949QLXkQO99jpCjcjFMBLDkzaH6nvfZ
 uJSxauqTq5eIVgzY1yREvOURwlt4iCyxnYyuEdhVLw643ZPIn+eTDWRGVdnfXhWOS69P
 MfgtICOMHf70fwFXES77q+k+fDTYepFbDdlL78n9xkbKsorKt8aSL9KsbiDOwfHZ7QCk
 PB5g==
X-Gm-Message-State: AOAM533YKn9T3mpWTJLcKFs7JVlpLmtWexm5tCdfZM67mrXARkpajyY6
 Yw3tCTOpV8CdvwcdIUxWymGI985UlDkhaRf2ruR0jydo8kzmaIh2xxUhax6SiZzcnPTgEZinMUM
 WMvEOZT6qBXibiL5rQu2V4XLqVgUJVYuojxfsSBlQZaWZaj+Ft+PgoedFM8/F
X-Received: by 2002:adf:f5d2:: with SMTP id k18mr3323647wrp.567.1641474997046; 
 Thu, 06 Jan 2022 05:16:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZcp1AUNLDR2xl0TbDGORZI7yH31u+XB5AZ/vo0D5rE9cofxpSa7Lmr9RjwzuUMpPR1gPxhg==
X-Received: by 2002:adf:f5d2:: with SMTP id k18mr3323624wrp.567.1641474996809; 
 Thu, 06 Jan 2022 05:16:36 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id z22sm6117302wmp.40.2022.01.06.05.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:36 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/52] vhost-vdpa: add support for config interrupt
Message-ID: <20220106131534.423671-8-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Add new call back function in vhost-vdpa, this function will
set the event fd to kernel. This function will be called
in the vhost_dev_start and vhost_dev_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-6-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 7 +++++++
 hw/virtio/trace-events | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bcaf00e09f..0a4a83713c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -725,6 +725,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
+static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
+                                       int fd)
+{
+    trace_vhost_vdpa_set_config_call(dev, fd);
+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
+}
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
@@ -795,4 +801,5 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index f7ad6be5fb..595ce015ff 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -53,6 +53,7 @@ vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRI
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
 vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
+vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
-- 
MST


