Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE24422DC6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:21:11 +0200 (CEST)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnBm-0001dn-6d
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsN-0008O2-GF
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsJ-0004bK-LA
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fh2VpJXcxJxzBAVFO9OEfTC6q1W7DfmN4tRkON1Y0l0=;
 b=gWigkoRY88lRG9EY3+JM9eXNGNgVuARhbCgcsaUkbn8izrjqgFnJDZWtqI4zuSC1KCRjrz
 XtpViXfNXReyC1VTOC/H/k7VWweVKNNYIBJmzogAGc93/fmG9MdL9ibbAS89iBVnUpbpgj
 8wQquBGGs7zHfuDUDCAd628QsyIbv+A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-XpsgrE3sP1-H_pTJyA4mXg-1; Tue, 05 Oct 2021 12:01:00 -0400
X-MC-Unique: XpsgrE3sP1-H_pTJyA4mXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 75-20020a1c004e000000b00307b9b32cc9so1118435wma.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fh2VpJXcxJxzBAVFO9OEfTC6q1W7DfmN4tRkON1Y0l0=;
 b=yE6m5pUIGzo4kezeLJsZCeLmJa0CaZmlEvdbqdwSj4ZsiP2yMP3w4XQXzxwiMrijYv
 EvDYNtRI1kZfYBDPQ6cFMiqz/ZTvPr/8kfws1i2bXhqjLU/ED9lFzwsZBsyYkCXPONEn
 Gv6Tmb4otyKKuWQ26ioYdwUd4FnGeTE275lNQ3mxnfGtCDjaJbkcKbveDQbE9AWA5cDl
 WJ2i5O22gITPKNPk89mdPs4ML9W7dWgbaclCXdNnHFi7lPgoe6enCup3aMW5EbwttsJA
 TtciOKBRhNATnulV2Xtgq7CJr0VQpwdwhhbElxZNfRRdZcyq1FT2j7xUi5nEEWgYXPXq
 CFeA==
X-Gm-Message-State: AOAM533hrD+TM6B0U9dqNnPAboRqD7dx+j5apj1DyH7p9iGIF7w1hidX
 aPFQjeoG5m4QV3jlWwCQBEL+qDPN9L3xJl6v6EJqmmfuXSaQqwTnoVySGezoFc+0ADS1LGjvRpk
 CdkSITqfcwKxQKjPTf1IrOBxfe8TmYhzYWOhZBdLBnCb/yUE5tOMb0Wdkbc45
X-Received: by 2002:a05:600c:1553:: with SMTP id
 f19mr4364147wmg.66.1633449658826; 
 Tue, 05 Oct 2021 09:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl5yHJwhofQS9dq0CCX8L+VKJiWobW9rsU0NzAXMJmT6zS/EkcE7PDezTnrizjd6rF8uvfHQ==
X-Received: by 2002:a05:600c:1553:: with SMTP id
 f19mr4364125wmg.66.1633449658626; 
 Tue, 05 Oct 2021 09:00:58 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id y6sm7157068wro.63.2021.10.05.09.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:00:57 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:00:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/57] vhost-vdpa: classify one time request
Message-ID: <20211005155946.513818-5-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Message-Id: <20210907090322.1756-3-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-vdpa.h |  1 +
 hw/virtio/vhost-vdpa.c         | 52 ++++++++++++++++++++++++++++++----
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
index a8963da2d9..6b9288fef8 100644
--- a/include/hw/virtio/vhost-vdpa.h
+++ b/include/hw/virtio/vhost-vdpa.h
@@ -21,6 +21,7 @@ typedef struct VhostVDPAHostNotifier {
 
 typedef struct vhost_vdpa {
     int device_fd;
+    int index;
     uint32_t msg_type;
     bool iotlb_batch_begin_sent;
     MemoryListener listener;
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 47d7a5a23d..edac4017da 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -279,6 +279,13 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
     vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
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
@@ -291,6 +298,10 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     v->listener = vhost_vdpa_memory_listener;
     v->msg_type = VHOST_IOTLB_MSG_V2;
 
+    if (vhost_vdpa_one_time_request(dev)) {
+        return 0;
+    }
+
     vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                VIRTIO_CONFIG_S_DRIVER);
 
@@ -401,6 +412,10 @@ static int vhost_vdpa_memslots_limit(struct vhost_dev *dev)
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
@@ -424,6 +439,11 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
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
@@ -448,9 +468,12 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
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
@@ -559,11 +582,21 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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
 
@@ -572,7 +605,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
                                    VIRTIO_CONFIG_S_DRIVER);
-        vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
         memory_listener_unregister(&v->listener);
 
         return 0;
@@ -582,6 +614,10 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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
@@ -647,6 +683,10 @@ static int vhost_vdpa_get_features(struct vhost_dev *dev,
 
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


