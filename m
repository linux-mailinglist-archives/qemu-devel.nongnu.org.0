Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4362B7981
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:53:02 +0100 (CET)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJD3-0004zU-J4
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:53:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIye-0002MH-Vr
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyd-0005Wo-1P
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ufDql2Ya5R4LbrJR/qCOveRn++UqTWUAYCeIRx1GXs=;
 b=araE0f0ez9wi4LHpQz+75b3wX6/65EqFbERxQCDuZX1w0RUTswlIuy4vjcGnu3q4nDTetf
 MzvugyuKjD0vUY6TgJ4GpXUsp5EkTIn0sVYQfFfnBcrP5u1yuzMKCssbE1Qsg+X/V/FWaB
 mSRwkGXa3DxqJF0sIJe3D5TDr+9LiJM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-xPFOsDPXODqhnDJAw7AkAQ-1; Wed, 18 Nov 2020 03:38:04 -0500
X-MC-Unique: xPFOsDPXODqhnDJAw7AkAQ-1
Received: by mail-wm1-f70.google.com with SMTP id d2so716309wmd.8
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ufDql2Ya5R4LbrJR/qCOveRn++UqTWUAYCeIRx1GXs=;
 b=Rc4ZVyh1h/CYMP2kSuTpATAXWiTEkDFEureaVn6Gbydn8/UVPk02fz2G0IxuVWswnG
 eQNUnEHH+EP8PzHCjPuHe0TguAuj6m8Nk2qbucRinw56w78bpiqxTvamBSHdbSUuUg9d
 2VnDP9ZEXpliqZuP7L7IP5IvofP4xQKIQsw6VznSweAQTEDQV0cpXqJZmAv4YqmTbaig
 EWZKvMEENm63kNoYpzvvKKf2kLN98oUj1p1lIScW7vEgHL3cc4MJHflVCjVjZhGaqIAw
 iq2eh5ZoDabihAl+W0UtxWJCLAu3qnlrI0utGjA3iJzp1PL685QhegaSZYdQsL0GhE1q
 affw==
X-Gm-Message-State: AOAM532+3UYrXyBgdK6GQau2zMvxxYTG2fYfRuNAapKyNP/J/9tdZjXi
 pynegtmbI/pDAAv3yCKZU3nLJ/8XtE5Y4uF+bYfIJ2AUidFMar96so1BDSa78Sna49XYCBB6HRQ
 9JVk9He6pKsdP5T0ALVX5dkMHCl0GVg2blLEAB1Hh40qEjmdUjs8j6FFYRnQ8jo1p/9Y=
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr3113754wma.75.1605688682967; 
 Wed, 18 Nov 2020 00:38:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+DlUXFYy5J2Xj72xpu3WzJ6tNhk4mJktWNozypnhCcPfgAFa2yAc6QKcdPwK2nXf0gdlFEg==
X-Received: by 2002:a1c:3c8a:: with SMTP id j132mr3113732wma.75.1605688682739; 
 Wed, 18 Nov 2020 00:38:02 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id x2sm26291648wru.44.2020.11.18.00.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:01 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/27] failover: Rename bool to failover_primary_hidden
Date: Wed, 18 Nov 2020 09:37:29 +0100
Message-Id: <20201118083748.1328-9-quintela@redhat.com>
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

You should not use passive naming variables.
And once there, be able to search for them.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/virtio/virtio-net.h |  3 ++-
 hw/net/virtio-net.c            | 14 +++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index c8da637d40..ca68be759f 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -207,7 +207,8 @@ struct VirtIONet {
     DeviceState *primary_dev;
     char *primary_device_id;
     char *standby_id;
-    bool primary_should_be_hidden;
+    /* primary failover device is hidden*/
+    bool failover_primary_hidden;
     bool failover;
     DeviceListener primary_listener;
     Notifier migration_state;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3e82108d42..c221671852 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -916,7 +916,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 
     if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
         qapi_event_send_failover_negotiated(n->netclient_name);
-        qatomic_set(&n->primary_should_be_hidden, false);
+        qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
             n->primary_dev = virtio_connect_failover_devices(n, &err);
@@ -3127,7 +3127,7 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         return false;
     }
     qdev_set_parent_bus(n->primary_dev, primary_bus, &error_abort);
-    qatomic_set(&n->primary_should_be_hidden, false);
+    qatomic_set(&n->failover_primary_hidden, false);
     hotplug_ctrl = qdev_get_hotplug_handler(n->primary_dev);
     if (hotplug_ctrl) {
         hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
@@ -3148,7 +3148,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     bool should_be_hidden;
     Error *err = NULL;
 
-    should_be_hidden = qatomic_read(&n->primary_should_be_hidden);
+    should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (!n->primary_dev) {
         n->primary_dev = virtio_connect_failover_devices(n, &err);
@@ -3163,7 +3163,7 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
                                qdev_get_vmsd(n->primary_dev),
                                n->primary_dev);
             qapi_event_send_unplug_primary(n->primary_device_id);
-            qatomic_set(&n->primary_should_be_hidden, true);
+            qatomic_set(&n->failover_primary_hidden, true);
         } else {
             warn_report("couldn't unplug primary device");
         }
@@ -3213,8 +3213,8 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
 
     n->primary_device_opts = device_opts;
 
-    /* primary_should_be_hidden is set during feature negotiation */
-    hide = qatomic_read(&n->primary_should_be_hidden);
+    /* failover_primary_hidden is set during feature negotiation */
+    hide = qatomic_read(&n->failover_primary_hidden);
 
     if (n->primary_device_dict) {
         g_free(n->primary_device_id);
@@ -3271,7 +3271,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     if (n->failover) {
         n->primary_listener.should_be_hidden =
             virtio_net_primary_should_be_hidden;
-        qatomic_set(&n->primary_should_be_hidden, true);
+        qatomic_set(&n->failover_primary_hidden, true);
         device_listener_register(&n->primary_listener);
         n->migration_state.notify = virtio_net_migration_state_notifier;
         add_migration_state_change_notifier(&n->migration_state);
-- 
2.26.2


