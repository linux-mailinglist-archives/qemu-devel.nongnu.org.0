Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD942D4957
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:47:20 +0100 (CET)
Received: from localhost ([::1]:42540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4Uh-0002P2-TY
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3to-0002sU-0z
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3tl-0008GN-W7
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bYpqC60JxB3XDC5/IdZ1zt95y2s9bZdWYAE0X430Ko0=;
 b=HpuTicxqorhGvaqB6m3dfcoJVMQSoy5d8Vn17XBc3TeHsksRmzHAml21kL+xib8zacUDzd
 7eE19WPaRyV4I/qkKux4tzfjduzOGp986HEp/IOF6cS3pA+FmpolR4kMAejWhjCxbBWbNs
 aK13LKdg+Me3SXznVemsbV5zaEbZHGk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-E1WorT2xMgamtNxPbQV4dA-1; Wed, 09 Dec 2020 13:09:07 -0500
X-MC-Unique: E1WorT2xMgamtNxPbQV4dA-1
Received: by mail-wr1-f71.google.com with SMTP id o17so954316wra.8
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bYpqC60JxB3XDC5/IdZ1zt95y2s9bZdWYAE0X430Ko0=;
 b=q57kYvSNEAdxufSIGOpyY0Q1ftx8WWwVwNfC324bMAOW1jqWh//7TKTcPsER8ilZKP
 L2AXNrlbG3TwR0cydULkIaC21tWes52etoNajzsSFAd60yYs0hF5b5RlwlTYM3LT1Pgr
 j58T/a0A/bHTDWiMwFb13zVLwMvrokI6jU4tNRhvkJMeXm/W4tYrq0p0KlCKv2/k7fOk
 wK85n0Kw+FA6s162jd2adNEydBs1BidbKSk9jZ9GYDNp0DAVAlYGbPe1LPNYb1UGQdvK
 biZkOJpORXXrNYERiC0S5H873Gwf1hkMHB6VftCN3IrGTLbCa1K8mzfEbPVmGO5vTMh7
 szCw==
X-Gm-Message-State: AOAM5330Mv5twZi/Jq1LbELpwXGgKckCRzso7ovub+37/11gsdPWIjWg
 rW5BGiQAUMkmkr1IkyBbZEfY6ne/fqkFIu7tSlGx1spvPppYSvMHXL9nsgWNrHRNTF+7gmy8I/K
 fJAEWow+QKr+TF6cqSQeW6gqxZPqEg0j4Wuox9wJ0s21cx7x/YHTgon/sd5w4
X-Received: by 2002:adf:df08:: with SMTP id y8mr3983048wrl.278.1607537346397; 
 Wed, 09 Dec 2020 10:09:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsMQMt4hM89rAkZMNC2ZQG3qPRKFI9++4CNyo75YG1WQcufaWCw4eY22+d7V9bteDK9+xjtg==
X-Received: by 2002:adf:df08:: with SMTP id y8mr3983021wrl.278.1607537346166; 
 Wed, 09 Dec 2020 10:09:06 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id k18sm5680516wrd.45.2020.12.09.10.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:05 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/65] failover: should_be_hidden() should take a bool
Message-ID: <20201209180546.721296-31-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

We didn't use at all the -1 value, and we don't really care.  It was
only used for the cases when this is not the device that we are
searching for.  And in that case we should not hide the device.

Once there, simplify virtio-Snet_primary_should_be_hidden.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20201118083748.1328-16-quintela@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


