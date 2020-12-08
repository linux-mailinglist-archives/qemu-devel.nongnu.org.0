Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89772D32FC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:10:14 +0100 (CET)
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjJN-0007Kw-S8
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:10:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimI-0006b0-Mv
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmimG-0005Uc-OQ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:36:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2BMOZfDtjZu0tqqgMznt2cenCUknJhSFUF1EIHeSHPI=;
 b=fo+53aRAQLqhK+11OQf091gJ5zC0ytdT/yonntKaeGhHtmXRAsF/1N69pZ5SBE0DN71VP1
 8v3MMU523PwL7dmv2AwA36okHs4TNfXhGgQ1KE8gZ6VFFdPysLaa/GZNBNvAPQbJdF08rf
 fITcDeuJFN2rgIEkceQ/BCaNLxnbKxU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-j0cUpSSoPLuJ0UIl3LBruw-1; Tue, 08 Dec 2020 14:35:57 -0500
X-MC-Unique: j0cUpSSoPLuJ0UIl3LBruw-1
Received: by mail-wr1-f72.google.com with SMTP id i4so3246550wrm.21
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2BMOZfDtjZu0tqqgMznt2cenCUknJhSFUF1EIHeSHPI=;
 b=SOuKdn67abuqEsbMAe1o5I7zNGSrTjwuPdA4SRkgCYwGtHxUlVE2wy6CuVriu83ROM
 04LBMIp9wB5ySuGMS/pJeaZn/m5LYL5Vq1JVOR2/hA2AVvt5tuoNmWfpNW6Gl0Zw1Ww/
 kypVpvW2jgQrfkBXFg7g9dBDH1PnPDccAidxbtQ1W6wQ34P2wM0wS+dq2VNbc5FXlE+m
 dS5l+H2CukPRb1jOfnquSxnHiPE6BT46QNYVN/w3aC4xBe1E6pK8P8pgl49hFeIpHrtj
 O+3B967NohhcLuUwegbX6Gl9qmk89pTRIiuGq3EpStyV8tvj+JnpCel9hCJLNCRUgBuF
 X2Lg==
X-Gm-Message-State: AOAM533B6OEpc73VcUG0HblEN67bT+OJr47423Ihcu4d1szWidBt1/cH
 cTp+/tdEHPZ8B1Sg3ZdJsX4Zn3tAszTQc0nW/3ct3hxuUZtL+ByDG+jaKh9jr74KS8Arydq/Pd9
 SD5MVVFXk23yjqtrZ9c7vB2Twn89+fUoWnVR1oKob+ZRD24vYstVSGTHAKl+8
X-Received: by 2002:a05:600c:224b:: with SMTP id
 a11mr5192788wmm.97.1607456155940; 
 Tue, 08 Dec 2020 11:35:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2MZ328AA/Ox4b4geabTA5+UPe3zx/tjXdOd9+wGQ9z9XHXcgNCyzzpzrpcZZjDA5yTQLOMw==
X-Received: by 2002:a05:600c:224b:: with SMTP id
 a11mr5192771wmm.97.1607456155694; 
 Tue, 08 Dec 2020 11:35:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id 125sm5626527wmc.27.2020.12.08.11.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:35:55 -0800 (PST)
Date: Tue, 8 Dec 2020 14:35:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/66] failover: We don't need to cache primary_device_id
 anymore
Message-ID: <20201208193307.646726-40-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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


