Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148AD65E823
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:45:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLh-0002Qu-Sa; Thu, 05 Jan 2023 04:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLN-00026I-QF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLM-00074h-6Z
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tUK5dfADqIwjkAFG0/90Q4aE1+3jpwQ7FcSG0ql53l0=;
 b=M8e5/UV8tgztm7okElZiHHWnGnB5rlowyaW6khuOfqO/IkBwbgPRN6QogKjDyCG1T67/Yv
 cfrIMQN/MlnhuOQGQt09tKty3+Xirbxjdkx/LBJPGFnR4YJtCaILA4ltAB43H89nohSJAy
 YwgMC/9czWMXYLf7e5W2I5pmdtYkWY0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-zJ7TQdIoMku0yesG46p3CA-1; Thu, 05 Jan 2023 04:15:22 -0500
X-MC-Unique: zJ7TQdIoMku0yesG46p3CA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u15-20020adfa18f000000b002b129dc55bfso175101wru.11
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUK5dfADqIwjkAFG0/90Q4aE1+3jpwQ7FcSG0ql53l0=;
 b=uooBy/vkJ3hjJFxbxKRcRxmX/D2yzdAE1H9i4QtAIK2yMgXei85yEhQe292NkmRT2D
 9stNelV1lxXKM2R3tQuRr8rPxCzuHQddYyoyZ8cwVSpAuKwy+GgQyo+ofsoEaKa9c43S
 BxdCXHEL2JuIEPCDpXRvJLERHEs9GKylP/1zSN3WS9OTLaXhhdqcY6tpdTX9rdgfei57
 q3q1+OLIGBTsa2TvUf07D7PuV0n7j9JtRaLx9Rp8oipUEeo1oHev+UB2Sj0AO5x2ESvm
 LYTpziHMsd3nYU+0LcTNvjJfyUuzJvwdkK9IDNYwEEoq8/XGkseXg8JjD6cO2nBRgx5H
 leqg==
X-Gm-Message-State: AFqh2koT+9TLvn3P4ZCPzrUQytFmQceh390T6n8oB5bZABEVh904eYUh
 BetDraLbpbf2hRDBcQ0lu9+wDXckHmQMKSuT8ZI6ysfx0dTeW9DWFxXtg7mm8aXKX3Py7bjWIae
 ueBgB4NAlzZ7zlloaKQs4ynpbxkFifqKecAL6KCvRpn4HBWjegBjwcC9hmjiC
X-Received: by 2002:a05:600c:1d1d:b0:3cf:81af:8b73 with SMTP id
 l29-20020a05600c1d1d00b003cf81af8b73mr35476252wms.23.1672910120945; 
 Thu, 05 Jan 2023 01:15:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu9ta0IrK6Dbx+rER/w8G7MkzUcCoJa9Wa7pbGELuCThbz0iU4XL3B4NXmkTaB1AX4V8qU1Pg==
X-Received: by 2002:a05:600c:1d1d:b0:3cf:81af:8b73 with SMTP id
 l29-20020a05600c1d1d00b003cf81af8b73mr35476238wms.23.1672910120703; 
 Thu, 05 Jan 2023 01:15:20 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003d237d60318sm1912166wmq.2.2023.01.05.01.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:20 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 19/51] vhost-vdpa: add support for config interrupt
Message-ID: <20230105091310.263867-20-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

Add new call back function in vhost-vdpa, The function
vhost_set_config_call can set the event fd to kernel.
This function will be called in the vhost_dev_start
and vhost_dev_stop

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-6-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 8 ++++++++
 hw/virtio/trace-events | 1 +
 2 files changed, 9 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index fd0c33b0e1..fcb1e96316 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -716,6 +716,13 @@ static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
     return 0;
 }
 
+static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
+                                       int fd)
+{
+    trace_vhost_vdpa_set_config_call(dev, fd);
+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
+}
+
 static void vhost_vdpa_dump_config(struct vhost_dev *dev, const uint8_t *config,
                                    uint32_t config_len)
 {
@@ -1298,4 +1305,5 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 96da58a41f..a87c5f39a2 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -62,6 +62,7 @@ vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRI
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
 vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
+vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
-- 
MST


