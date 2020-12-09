Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC982D4A07
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:25:40 +0100 (CET)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn55m-00014q-UD
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uR-0003ZX-MA
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uK-0008SV-26
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BMOZfDtjZu0tqqgMznt2cenCUknJhSFUF1EIHeSHPI=;
 b=Esy1os/a7fb675YLAt42ewBgArOhh6IIsPst8OQ+s3ylW9OASCzf9EEJTCQqYErSZ2QzzL
 zw0OKMRVDShj+1H8ELPBAI38YGvnFkpacrhKyakrCcImnoUILNRRAyXGQpOEsMKNHgGKU+
 RbMQRMbwxgkyL8OMphIaYy8SnLobbec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-QsnCBxWlMJursKtsr7EN-A-1; Wed, 09 Dec 2020 13:09:41 -0500
X-MC-Unique: QsnCBxWlMJursKtsr7EN-A-1
Received: by mail-wr1-f72.google.com with SMTP id o12so943849wrq.13
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2BMOZfDtjZu0tqqgMznt2cenCUknJhSFUF1EIHeSHPI=;
 b=VWf6vhd+dKFSzqYHqjRDOkGbiI38bKnEbkMiLOszJmmi8Y1/1NVsV7R5t8lPt21QUY
 BBbEW/QFcny5kfR/oOXYBfFmACuQ3VkMpdpSRbqyuMwaZnA4yKhWmJfeLaKubdBGg48n
 GmQtngm1wjd39b3gArhzsHguHqPsq90x0MiyCBl74X3jqRtYGc6a0S4fmN6WsoDmLBxn
 n4nOvTGMwkRjrifARDkMzoB3s2OdMTmy7wDJBh7rcZeb29wQ4kQ64NAMOB1vGqnidfhF
 YmwsGHkQ67q2AmncwOkESoH8Rcj9/VqSy/WFlcfZGFz+JtVoIeBvDnzV+3lyHmXZbp0N
 I4Vg==
X-Gm-Message-State: AOAM531B28wxm9dcpkEj1d+hkJK1UxhhfB7vgpgRcw2Fz/QJI9yfJVsP
 jPnQnBL30XZ0dHi8CMp0nywIJSs1RBh6AL4QeChz2izWxWOfdz7AXNvmDcsaPQWw3uEkAV8fIVV
 ktUKrVVBXAqKiUgQdNnw4UbMV7EtF8yoNQJ5uOjzyEUMig3CGZpiTKywIjPF9
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr4038660wrt.49.1607537379606; 
 Wed, 09 Dec 2020 10:09:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmJ80VwhO5Ked1HdI4bbASOtA+7wlMtEsB6GAyJaVKwwQ3Ln00fHk8ERx8vzNKYVUWJjFlFw==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr4038635wrt.49.1607537379393; 
 Wed, 09 Dec 2020 10:09:39 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id j15sm4808264wrr.85.2020.12.09.10.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:38 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 39/65] failover: We don't need to cache primary_device_id
 anymore
Message-ID: <20201209180546.721296-40-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-25-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 20 ++++++++++----------
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index fe353d8299..efef64e02f 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -203,7 +203,6 @@ struct VirtIONet {
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
     DeviceState *primary_dev;
-    char *primary_device_id;
     /* primary failover device is hidden*/
     bool failover_primary_hidden;
     bool failover;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 2c502c13fd..746ed3fb71 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -824,6 +824,7 @@ static char *failover_find_primary_device_id(VirtIONet *n)
     Error *err = NULL;
     FailoverId fid;
 
+    fid.n = n;
     if (!qemu_opts_foreach(qemu_find_opts("device"),
                            failover_set_primary, &fid, &err)) {
         return NULL;
@@ -835,12 +836,17 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
     QemuOpts *opts;
+    char *id;
 
     if (n->primary_dev) {
         return;
     }
 
-    opts = qemu_opts_find(qemu_find_opts("device"), n->primary_device_id);
+    id = failover_find_primary_device_id(n);
+    if (!id) {
+        return;
+    }
+    opts = qemu_opts_find(qemu_find_opts("device"), id);
     if (opts) {
         n->primary_dev = qdev_device_add(opts, &err);
         if (err) {
@@ -868,9 +874,8 @@ static DeviceState *failover_find_primary_device(VirtIONet *n)
     if (!id) {
         return NULL;
     }
-    n->primary_device_id = g_strdup(id);
 
-    return qdev_find_recursive(sysbus_get_default(), n->primary_device_id);
+    return qdev_find_recursive(sysbus_get_default(), id);
 }
 
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
@@ -3160,7 +3165,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
             vmstate_unregister(VMSTATE_IF(n->primary_dev),
                                qdev_get_vmsd(n->primary_dev),
                                n->primary_dev);
-            qapi_event_send_unplug_primary(n->primary_device_id);
+            qapi_event_send_unplug_primary(n->primary_dev->id);
             qatomic_set(&n->failover_primary_hidden, true);
         } else {
             warn_report("couldn't unplug primary device");
@@ -3186,7 +3191,6 @@ static bool failover_hide_primary_device(DeviceListener *listener,
                                          QemuOpts *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
-    bool hide;
     const char *standby_id;
 
     if (!device_opts) {
@@ -3198,10 +3202,7 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     }
 
     /* failover_primary_hidden is set during feature negotiation */
-    hide = qatomic_read(&n->failover_primary_hidden);
-    g_free(n->primary_device_id);
-    n->primary_device_id = g_strdup(device_opts->id);
-    return hide;
+    return qatomic_read(&n->failover_primary_hidden);
 }
 
 static void virtio_net_device_realize(DeviceState *dev, Error **errp)
@@ -3378,7 +3379,6 @@ static void virtio_net_device_unrealize(DeviceState *dev)
 
     if (n->failover) {
         device_listener_unregister(&n->primary_listener);
-        g_free(n->primary_device_id);
     }
 
     max_queues = n->multiqueue ? n->max_queues : 1;
-- 
MST


