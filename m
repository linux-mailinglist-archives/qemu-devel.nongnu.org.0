Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BAC434935
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:44:59 +0200 (CEST)
Received: from localhost ([::1]:59274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md95c-0001vo-Os
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:44:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iJ-0004rl-DJ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iH-0003sV-MS
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p0wp6QQXK0B/oRobBtVecuCtguwgYRX9yyTp76ndhxE=;
 b=iwEXczAU5rz9eScB0+y9OuLsLV6cFDSyXb7AWBsAAYHG7147my2DyyC4ac1oHsjDXOct3N
 wzJJZ4OFQW3Ln/mAIeMbGhuyJGv8FTzYMKYcOlfcvqnvnKw3+364oc6tBgwf0cpA8cTwfj
 AWQPWVo9na7bEB9lAeiQWI/nh8uR+X8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-rpQuufJ8NYmtaX2prK38KA-1; Wed, 20 Oct 2021 06:20:47 -0400
X-MC-Unique: rpQuufJ8NYmtaX2prK38KA-1
Received: by mail-ed1-f72.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so17062439edx.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p0wp6QQXK0B/oRobBtVecuCtguwgYRX9yyTp76ndhxE=;
 b=Mv3N5KPz2WfqB6Ny+v8hCgQ0wDmpDSyYzqNoSexY/3HTjjgjj6+6jZBPbUXrqYwppR
 3PlLVcwdHzAl01F42h2kCO810WYSV0GvARX5ezZGFRg3jzt17o8hHMzoE8DcewKXTmXG
 fiP+BncYukuZ6NxXn7rpDQG+nv+FmApc7jX5v8LxjI6B/vS1M37G0MBqEN1Nc3k9ZiNX
 i1ACkg+wnGL/Ss6mbymri4lJrz/iSJDzSse1Tlv0l5H8l61YlUmlehGIbHKaWxzkmBZf
 U/kxAjMTxMtB5UfsRyctnQ+qffOCiTWzQZU/e4asMiQmydEOiBx0g8pMC1avO3i46EQO
 HtiQ==
X-Gm-Message-State: AOAM5338/VNKcpkMU02lzWFJuX/GtvucH4ApMMqdwewVfnojCCKUwvl2
 k0vN1sYTSXVlVusUabb8xnC4epjcDWjuaE12Jj/tWxxxzMZSVgwrvhtnD3fw/QOdrVAiV8ccc9f
 rUsKhkXK2vcVevTtZjBAGigb9pkace8AbzYwXe60Qxeo/xl66Bgar5NusJ7WL
X-Received: by 2002:a17:906:9554:: with SMTP id
 g20mr43656538ejy.173.1634725245856; 
 Wed, 20 Oct 2021 03:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk435jWqTYFzmcfdMaXD7wSn+9wfSpkhcPJD0ASpl1dgW3zc2uctn7+XadVq9w7qWIJg21QQ==
X-Received: by 2002:a17:906:9554:: with SMTP id
 g20mr43656513ejy.173.1634725245643; 
 Wed, 20 Oct 2021 03:20:45 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id u16sm824580ejy.16.2021.10.20.03.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:20:45 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:20:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 32/44] vhost-vdpa: classify one time request
Message-ID: <20211020101844.988480-33-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Vhost-vdpa uses one device multiqueue queue (pairs) model. So we need
to classify the one time request (e.g SET_OWNER) and make sure those
request were only called once per device.

This is used for multiqueue support.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-3-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 53 ++++++++++++++++++++++++++++++----
 2 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index c288cf7ecb..3ce79a646d 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -22,6 +22,7 @@ typedef struct VhostVDPAHostNotifier {
 
 typedef struct vhost_vdpa {
     int device_fd;
+    int index;
     uint32_t msg_type;
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 47c48f4ba8..ceb53613ba 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -319,6 +319,13 @@ static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
                                     v->iova_range.last);
 }
 
+static bool vhost_vdpa_one_time_request(struct vhost_dev *dev)
+{
+    struct vhost_vdpa *v = dev->opaque;
+
+    return v->index != 0;
+}
+
 static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
 {
     struct vhost_vdpa *v;
@@ -332,6 +339,11 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->msg_type = VHOST_IOTLB_MSG_V2;
 
     vhost_vdpa_get_iova_range(v);
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                VIRTIO_CONFIG_S_DRIVER);
 
@@ -442,6 +454,10 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
 static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
                                     struct vhost_memory *mem)
 {
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_mem_table(dev, mem->nregions, mem->padding);
     if (trace_event_get_state_backends(TRACE_VHOST_VDPA_SET_MEM_TABLE) &&
         trace_event_get_state_backends(TRACE_VHOST_VDPA_DUMP_REGIONS)) {
@@ -465,6 +481,11 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
                                    uint64_t features)
 {
     int ret;
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
     uint8_t status = 0;
@@ -489,9 +510,12 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
     }
 
     features &= f;
-    r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
-    if (r) {
-        return -EFAULT;
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
+        if (r) {
+            return -EFAULT;
+        }
     }
 
     dev->backend_cap = features;
@@ -600,11 +624,21 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 {
     struct vhost_vdpa *v = dev->opaque;
     trace_vhost_vdpa_dev_start(dev, started);
+
+    if (started) {
+        vhost_vdpa_host_notifiers_init(dev);
+        vhost_vdpa_set_vring_ready(dev);
+    } else {
+        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
+    }
+
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     if (started) {
         uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
-        vhost_vdpa_host_notifiers_init(dev);
-        vhost_vdpa_set_vring_ready(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
         vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
 
@@ -613,7 +647,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
-        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
         memory_listener_unregister(&v->listener);
 
         return 0;
@@ -623,6 +656,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_log_base(dev, base, log->size, log->refcnt, log->fd,
                                   log->log);
     return vhost_vdpa_call(dev, VHOST_SET_LOG_BASE, &base);
@@ -688,6 +725,10 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
 
 static int vhost_vdpa_set_owner(struct vhost_dev *dev)
 {
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     trace_vhost_vdpa_set_owner(dev);
     return vhost_vdpa_call(dev, VHOST_SET_OWNER, NULL);
 }
-- 
MST


