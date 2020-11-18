Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B02B79F9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:07:45 +0100 (CET)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJRI-00010v-Ro
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz7-0003WZ-2H
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz5-0005hD-AR
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CYb6fiPj5EFAv8ZxJdzIa0JaYihePB45/157vgEZlH0=;
 b=Pk/KWlEinncwrhri39jw+g9Es9+ci06sxJrXOyaGY4MehaKUwasrvFw7m7TwXdB2GO+NcM
 sl4WflEfKiyCIWQZTzEfPQQ7Yd442EIwYJ03WLetlVizqaxOt/MdTsMwmHINWtPAR+jc3b
 bN5DCRHsdx+2H8+sH1zAQIuBo94mzHM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-g2_iiMzqNnCXl1Q3i8I87A-1; Wed, 18 Nov 2020 03:38:32 -0500
X-MC-Unique: g2_iiMzqNnCXl1Q3i8I87A-1
Received: by mail-wr1-f69.google.com with SMTP id w5so610363wrm.22
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYb6fiPj5EFAv8ZxJdzIa0JaYihePB45/157vgEZlH0=;
 b=lPEIgN56Osc0ud0lzmWxffxSvaWC2gd+Sha6LQkHw+K1YGWcs1ButgSujZnBMwVdFV
 3T8tp8kJ5Bivef8k0k8QMEDVyVFllKd1KUjLooc80dPsqcY8N5OXx2Eoni54+10ZKwWW
 z4Vt00xd5Yim5pY3Sub2RXaK7JPRQNmAQ1xojMMPHSaqjJC/SajQBbbwvjZrcmReyAcl
 GD1ziwCeK/Qr+ur0JsYhXhQEvBTffqteZauXl+ruG75RzoZYDFCuX7f1hCUJFCtovwVW
 TDBo0vfw/fZsCbvBIKVG5HUl1taV+GOmnahKtr+NHDAaaXEpMFM/SYPkbw2HRPER/hOB
 e25g==
X-Gm-Message-State: AOAM531LZhd+OPR9VBJKuDsQStUPOXoRpW9A+XQd7Mp49CMKRd8cs/Az
 BLWlS7UBoDwNTGnqaCwKFev6cbZi9m1akpKm+D4gpenirERtIq0kRTwx25nX+/2oiYIMzfQxQnT
 6Hx202StIa3677rm7Ln1wVdNc1/egBlNvxDYqedsfQfgaddq/L9tovCJYnYrZvMjjoHs=
X-Received: by 2002:a1c:750b:: with SMTP id o11mr3323905wmc.32.1605688711552; 
 Wed, 18 Nov 2020 00:38:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxugSUA4uBg3uk8SP/RtEBJBx23bbmPmDtHdAdQ6CV2TuIyrUfZRpS3kgP4dyQ80Kcinc6XcQ==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr3323879wmc.32.1605688711326; 
 Wed, 18 Nov 2020 00:38:31 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id o197sm2383541wme.17.2020.11.18.00.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:30 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/27] failover: Remove primary_dev member
Date: Wed, 18 Nov 2020 09:37:48 +0100
Message-Id: <20201118083748.1328-28-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only three uses remained, and we can remove them on that case.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 -
 hw/net/virtio-net.c            | 55 +++++++++++++++-------------------
 2 files changed, 24 insertions(+), 32 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index efef64e02f..7e96d193aa 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -202,7 +202,6 @@ struct VirtIONet {
     AnnounceTimer announce_timer;
     bool needs_vnet_hdr_swap;
     bool mtu_bypass_backend;
-    DeviceState *primary_dev;
     /* primary failover device is hidden*/
     bool failover_primary_hidden;
     bool failover;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9203d81780..044ac95f6f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -832,13 +832,31 @@ static char *failover_find_primary_device_id(VirtIONet *n)
     return fid.id;
 }
 
+/**
+ * Find the primary device for this failover virtio-net
+ *
+ * @n: VirtIONet device
+ * @errp: returns an error if this function fails
+ */
+static DeviceState *failover_find_primary_device(VirtIONet *n)
+{
+    char *id = failover_find_primary_device_id(n);
+
+    if (!id) {
+        return NULL;
+    }
+
+    return qdev_find_recursive(sysbus_get_default(), id);
+}
+
 static void failover_add_primary(VirtIONet *n, Error **errp)
 {
     Error *err = NULL;
     QemuOpts *opts;
     char *id;
+    DeviceState *dev = failover_find_primary_device(n);
 
-    if (n->primary_dev) {
+    if (dev) {
         return;
     }
 
@@ -848,7 +866,7 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     }
     opts = qemu_opts_find(qemu_find_opts("device"), id);
     if (opts) {
-        n->primary_dev = qdev_device_add(opts, &err);
+        dev = qdev_device_add(opts, &err);
         if (err) {
             qemu_opts_del(opts);
         }
@@ -861,23 +879,6 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     error_propagate(errp, err);
 }
 
-/**
- * Find the primary device for this failover virtio-net
- *
- * @n: VirtIONet device
- * @errp: returns an error if this function fails
- */
-static DeviceState *failover_find_primary_device(VirtIONet *n)
-{
-    char *id = failover_find_primary_device_id(n);
-
-    if (!id) {
-        return NULL;
-    }
-
-    return qdev_find_recursive(sysbus_get_default(), id);
-}
-
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -933,19 +934,9 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            n->primary_dev = failover_find_primary_device(n);
-            failover_add_primary(n, &err);
-            if (err) {
-                goto out_err;
-            }
+            warn_report_err(err);
         }
     }
-    return;
-
-out_err:
-    if (err) {
-        warn_report_err(err);
-    }
 }
 
 static int virtio_net_handle_rx_mode(VirtIONet *n, uint8_t cmd,
@@ -3420,13 +3411,15 @@ static int virtio_net_pre_save(void *opaque)
 static bool primary_unplug_pending(void *opaque)
 {
     DeviceState *dev = opaque;
+    DeviceState *primary;
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIONet *n = VIRTIO_NET(vdev);
 
     if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
         return false;
     }
-    return n->primary_dev ? n->primary_dev->pending_deleted_event : false;
+    primary = failover_find_primary_device(n);
+    return primary ? primary->pending_deleted_event : false;
 }
 
 static bool dev_unplug_pending(void *opaque)
-- 
2.26.2


