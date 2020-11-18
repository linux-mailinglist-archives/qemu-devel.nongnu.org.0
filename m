Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9192B79BB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:59:57 +0100 (CET)
Received: from localhost ([::1]:44578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJJk-0006tQ-Dv
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz2-0003Ks-Ka
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIz0-0005f2-Pw
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4u/G4VgwO4KYIr2oyq3QhfAIkQUBpe92eiudE1xPv4c=;
 b=i4CJb6X06JLxJweER9eE2Tol4S0X7+O4tPdujVEzIwyU9+11hKwveIwT5RSNQJfWtQmi1Q
 MSwYcaoK2D0mctoplLGBLnQF8c3y7zui7/NCVFRISWGVXEUmC27MPDiQDkqrr7ngp4GSf+
 qa3PolxCnqLCb4NETirXvTh3d38R8NU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-Qp7J-6y8P0iPb21ohkkoSQ-1; Wed, 18 Nov 2020 03:38:28 -0500
X-MC-Unique: Qp7J-6y8P0iPb21ohkkoSQ-1
Received: by mail-wm1-f69.google.com with SMTP id j62so725365wma.4
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4u/G4VgwO4KYIr2oyq3QhfAIkQUBpe92eiudE1xPv4c=;
 b=H3almbA+eNQkx9388QYQVDYZec6jg9htLWrdiO8hxo81E9jMd6P1ozr+XTWcUuREJI
 zLNrKf9xCuhDQsFcCgxr1UUSPUWGkGxf9GuKNuoJfN0KeO4oVtioGd3J7H0Yx5JocDF5
 l2VHjcVLeUyWPUV86aNjaHpECOVwc4rNvPxb4Hl+GCpksF3QkemxIHQsUmUWQ3h3oW6q
 yEUP2TYWHH0GsWMeCZnnTvYj3r5H4ovw7Zr9iV5nR7k+33VFciSYX4kNkWq9zR/378s4
 TsNMMvszce49VIirUtCjBhvJB8VXzDcpCnoTeQerzazYM4FKeWEdNZUEwEBdySaBYXNj
 cTmA==
X-Gm-Message-State: AOAM530rgbQWfKgpQ0lxY00LeBOK6HpRM+qWL+4pWRBLpXXpH1eB7dZi
 CMm2rbzm2l0/PwbbwyuTuIW57nItTTFmcskKU++Jt2xyq+42iUqQIQ77fLHPeX0cX71SnMsUXxM
 MGeeCndKINFU8ANliZtdPsPnNE6PANAen8cgdzM+VQRjCcoMR1d+mbzk4dPlVW4WAP0Y=
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr3812746wrv.326.1605688706932; 
 Wed, 18 Nov 2020 00:38:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgfGjvnGNsubNaiE/d6pAcl+bUzCodj2NTICTdZmEivMc89rShZpHM2fIaSqiea7KfjpYQfw==
X-Received: by 2002:a5d:51c2:: with SMTP id n2mr3812724wrv.326.1605688706751; 
 Wed, 18 Nov 2020 00:38:26 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id l3sm2749419wmf.0.2020.11.18.00.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/27] failover: We don't need to cache primary_device_id
 anymore
Date: Wed, 18 Nov 2020 09:37:45 +0100
Message-Id: <20201118083748.1328-25-quintela@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
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
2.26.2


