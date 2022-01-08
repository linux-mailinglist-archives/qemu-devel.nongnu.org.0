Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764F5488060
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:18:34 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60NN-00018z-IR
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:18:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609J-0003HS-3B
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609H-0002Km-Dx
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gv52akJFHQiv170C8mObbPapN00kjPRMbnaS61dDiXs=;
 b=JFCGd++wFkzLy7yH0HjFRrK7VFJzC51hk5F3a+Iq00s43xRbiCsmiEquLvVKDjFZ7/DVc7
 uwR8GIomLSNEh7y7rKkHvvzIv5iBFK6XGvgdfXGIxHVSLqk4kjVa/U0Sj4cra0SuGOZLwO
 oGMmF0uKwoaYDoH2F1XxoqxZ6ND9eOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-jvCmsSCPOie0KAKeme-QIg-1; Fri, 07 Jan 2022 20:03:58 -0500
X-MC-Unique: jvCmsSCPOie0KAKeme-QIg-1
Received: by mail-wm1-f70.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so2502562wmq.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gv52akJFHQiv170C8mObbPapN00kjPRMbnaS61dDiXs=;
 b=hwzpRSFOV0/FntOZHllWJ5Mnk635nzvo8GJEUDJ5+GlQ1q0g/hsstRMATaJjnOsDJR
 T5oA8nf5xQQvbU831PL2RQKce7RDwvaShf0JwYBSHOL595wzhR6440DQ/Jr+7+UdLZSy
 ElosGKE/uSYhPeaN0enbty/XcA0o7AaLjnhOuFoCfYFGOhbudvXBnZsmroeUid93JmiM
 3LGlNaMBj/c1CkK+prBnIUwgbnDJCUqdu8NX8oIVglZSbT2htafuofiYVnt9wGWWBlJ+
 nMk8Yv1vK/VM2svfLgCIfQ+NswK2CTZQJVD26jEZ6n8UW4+qCxobUGjcnLnVz4c8mLA/
 oF2Q==
X-Gm-Message-State: AOAM532t2CnThQuTXUlkaDoAH2TByB7ERXnfJS96blAqfuK+fKrbtj/p
 w3K+OwRZBH5a+TmAKqXST+MGexnZD6qd3WrcsSAVIcQ+8KRDqQ6mjIKPKq+BtdEMr8ilr/XYtUX
 VaY4qLw7thI/mgCYhjiPpRfkJfi+1pWRcdYPSAEkDo3TMbaICxB8M3wu9NPKs
X-Received: by 2002:a1c:f316:: with SMTP id q22mr12916008wmq.33.1641603836557; 
 Fri, 07 Jan 2022 17:03:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBntMgA/w4J05z7a1uBxzZQDNgqvO6pJn+Cn0nRm4B554HeYwKuKEn2j1ZQ+VfdbiQB07/Jg==
X-Received: by 2002:a1c:f316:: with SMTP id q22mr12915998wmq.33.1641603836338; 
 Fri, 07 Jan 2022 17:03:56 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id o13sm208256wrc.111.2022.01.07.17.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:03:55 -0800 (PST)
Date: Fri, 7 Jan 2022 20:03:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 07/55] vhost-vdpa: add support for config interrupt
Message-ID: <20220108003423.15830-8-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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


