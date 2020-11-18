Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F5A2B79C7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:00:33 +0100 (CET)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJKK-0007Xo-5y
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyo-0002kP-O3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIym-0005aB-Nu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdTOdTsL0DiSoAF/9pIsiWi1rLD7PCVN16ZBBTE6i60=;
 b=JphY4aMicEPWKOmm305QjWxZCpyNzAVTVfUVgQHF/keNk1T4ScHQJknhDPA+sFyZydJtam
 vc55RMMU0sxIOIBbK3YLH6FXfwpFSrPRtzLckdjmYPHI+VlYvM49ZZLdNYLXhTgNzbYF+v
 KxJ9eX9r1JAyPyiWNz9xLOvcTzetjdY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-4onaqdxzPAuC8EMTLGz7nQ-1; Wed, 18 Nov 2020 03:38:14 -0500
X-MC-Unique: 4onaqdxzPAuC8EMTLGz7nQ-1
Received: by mail-wr1-f69.google.com with SMTP id w5so610146wrm.22
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdTOdTsL0DiSoAF/9pIsiWi1rLD7PCVN16ZBBTE6i60=;
 b=AkfalJeSHPpFNiRu9+1VGBWgjOgAyOZ6RrrT/D3wFMa6sGo2OEKYqWQKijXVqpaiLe
 AxbWFLpogJiDoYSE1Ih6i3BYt2WqhNxhmhzEjU8D6l78wdWsMbS2tiTFGgv9ZNL9oMVp
 Fowy5QNqO+hkEKIVXNcrT6yzT92Q7Scd2GWUg3yrqVoRTUvo3UesgLjWHpbxb1GYSfNI
 Uaer3gAoZASbvCBoxxm2hSRXxN+gupKV5JmwUnpw+xk/9J0R0M/k7Zf87SiV3SCzzpAo
 QFSWl2wQLRK9asvD7oEc0wPdfJ2uvXM9sVXFlE1z4Ha+iLFlZwgEPbL1+gja+ByGATlu
 8MsQ==
X-Gm-Message-State: AOAM533DSwOpYXVQkN5qkYtgBkF1gTJ4ppo5kgESocNuiAwak8oeZzCo
 BxOcTWy+H1bK8OHXRvxNbj261c9CIUlS7r/Tm6EQDVDWEABTZ4/IyPp2e+OAbCk5EWdG8cHawrG
 R7E5wE6mEKB9gPyp7IpqjUYpuLIJhNzxDWX6vAWJuqOymPsPmDXj8EM0wovhSEASOK24=
X-Received: by 2002:a1c:4055:: with SMTP id n82mr3449450wma.68.1605688693359; 
 Wed, 18 Nov 2020 00:38:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpMLwnPIc7DA6OXupYKuqd5mnHuD/0CRWoqx5+Np7469OeohzduUAbFvgoB0e4rgRFj8QQ/A==
X-Received: by 2002:a1c:4055:: with SMTP id n82mr3449428wma.68.1605688693120; 
 Wed, 18 Nov 2020 00:38:13 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id g4sm32516779wrp.0.2020.11.18.00.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:12 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/27] failover: should_be_hidden() should take a bool
Date: Wed, 18 Nov 2020 09:37:36 +0100
Message-Id: <20201118083748.1328-16-quintela@redhat.com>
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

We didn't use at all the -1 value, and we don't really care.  It was
only used for the cases when this is not the device that we are
searching for.  And in that case we should not hide the device.

Once there, simplify virtio-Snet_primary_should_be_hidden.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/qdev-core.h |  2 +-
 hw/core/qdev.c         | 19 +++++--------------
 hw/net/virtio-net.c    | 27 +++++++--------------------
 3 files changed, 13 insertions(+), 35 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 5e737195b5..250f4edef6 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -200,7 +200,7 @@ struct DeviceListener {
      * inform qdev that a device should be hidden, depending on the device
      * opts, for example, to hide a standby device.
      */
-    int (*should_be_hidden)(DeviceListener *listener, QemuOpts *device_opts);
+    bool (*should_be_hidden)(DeviceListener *listener, QemuOpts *device_opts);
     QTAILQ_ENTRY(DeviceListener) link;
 };
 
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 262bca716f..8f4b8f3cc1 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -214,26 +214,17 @@ void device_listener_unregister(DeviceListener *listener)
 
 bool qdev_should_hide_device(QemuOpts *opts)
 {
-    int rc = -1;
     DeviceListener *listener;
 
     QTAILQ_FOREACH(listener, &device_listeners, link) {
-       if (listener->should_be_hidden) {
-            /*
-             * should_be_hidden_will return
-             *  1 if device matches opts and it should be hidden
-             *  0 if device matches opts and should not be hidden
-             *  -1 if device doesn't match ops
-             */
-            rc = listener->should_be_hidden(listener, opts);
-        }
-
-        if (rc > 0) {
-            break;
+        if (listener->should_be_hidden) {
+            if (listener->should_be_hidden(listener, opts)) {
+                return true;
+            }
         }
     }
 
-    return rc > 0;
+    return false;
 }
 
 void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 881907d1bd..9f12d33da0 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3161,24 +3161,19 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
     virtio_net_handle_migration_primary(n, s);
 }
 
-static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
-                                               QemuOpts *device_opts)
+static bool virtio_net_primary_should_be_hidden(DeviceListener *listener,
+                                                QemuOpts *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
-    bool match_found = false;
-    bool hide = false;
+    bool hide;
     const char *standby_id;
 
     if (!device_opts) {
-        return -1;
+        return false;
     }
     standby_id = qemu_opt_get(device_opts, "failover_pair_id");
-    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
-        match_found = true;
-    } else {
-        match_found = false;
-        hide = false;
-        goto out;
+    if (g_strcmp0(standby_id, n->netclient_name) != 0) {
+        return false;
     }
 
     /* failover_primary_hidden is set during feature negotiation */
@@ -3188,15 +3183,7 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     if (!n->primary_device_id) {
         warn_report("primary_device_id not set");
     }
-
-out:
-    if (match_found && hide) {
-        return 1;
-    } else if (match_found && !hide) {
-        return 0;
-    } else {
-        return -1;
-    }
+    return hide;
 }
 
 static void virtio_net_device_realize(DeviceState *dev, Error **errp)
-- 
2.26.2


