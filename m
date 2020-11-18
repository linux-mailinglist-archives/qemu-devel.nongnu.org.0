Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C02B7906
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:46:48 +0100 (CET)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ71-0003pP-UP
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyW-000220-T2
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyT-0005Uw-EL
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UEx0whCz0mLvY9uxkc6IoWWcbp6CVeC5vBqQGd8fODw=;
 b=PkDwzb1vL+95hlH1SElaFGZrOqDwqw+wpH6YO7K0Okedef8yYxq5Ocwd9kVQgIDYgJRNm3
 6ldMRVWBCfjueRiQEzagUqXOD5bu8dMEJdzh3yQIS89SFLPlbfYAWAk+K0DS0FOA29Ve/5
 V0hichAhnE0Ucd6/nlfM51ErvYLvr3o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-_zxRrx-eMC2Z1NTW-AcEzA-1; Wed, 18 Nov 2020 03:37:55 -0500
X-MC-Unique: _zxRrx-eMC2Z1NTW-AcEzA-1
Received: by mail-wm1-f72.google.com with SMTP id c131so106247wma.0
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:37:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UEx0whCz0mLvY9uxkc6IoWWcbp6CVeC5vBqQGd8fODw=;
 b=cdNqgD8d0NptuyAZFG2f1O4o+dGptEpsqZ8AvgTOPQLNubgjI+Z0j7/ogOJdBx7Pmv
 nAnxw0ZwLoUuuEM0/DXrzBiqZA437xeyz1ZXXLYqq9GXcCM8USCjeo43D/ZfGdyGrRVt
 m08qmAF4LK9SabCL2s2J//hn7sA/1LvIKOUvmFxukTxQXEPUT2Hme4KpeEWPx4qI+Kzy
 U9pGJU6eWzsyZEUjBOlpuppRfmcadD3UVdgZDVYyxF21BmqlG2SJ+mU3q9+uHzq9MGaj
 uYNGheTeaZ3wvRCEDHnvEoxKOUhxn4uH5JH5C1Pxrbftsxa34HzFF7jOcHv3BsYaLQEn
 ggAg==
X-Gm-Message-State: AOAM533X6QNM72XbrexHHkm15Z2/unwia9O35kbW0CaEKxkWBdukKJ4q
 EAhCDHqA42PN5eJ9IYc5bx7uLLw7Yj04zJSshsV1QZ8PVb3wuvez3z9Bg0l8+/7MvTM843dMBAU
 wqIkyGXAP636ZGJbSFiH+8qfESHnJ3bOJVIrG5aptXsCtckEPIsnPXIOc7veJMP0YCcQ=
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr3072989wme.43.1605688673742; 
 Wed, 18 Nov 2020 00:37:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMvj7/0v6pehfrxoLbRMl2WCdda37+kpipLxuriNXcz2sPgJ+K3PVKqHKyK6vbjmVG58WSkg==
X-Received: by 2002:a1c:9ad3:: with SMTP id c202mr3072969wme.43.1605688673583; 
 Wed, 18 Nov 2020 00:37:53 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id 109sm33234725wra.29.2020.11.18.00.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:37:52 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/27] failover: fix indentantion
Date: Wed, 18 Nov 2020 09:37:23 +0100
Message-Id: <20201118083748.1328-3-quintela@redhat.com>
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

Once there, remove not needed cast.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c    | 33 +++++++++++++++------------------
 softmmu/qdev-monitor.c |  4 ++--
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9179013ac4..1011a524bf 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -797,7 +797,7 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     }
 
     n->primary_device_opts = qemu_opts_find(qemu_find_opts("device"),
-            n->primary_device_id);
+                                            n->primary_device_id);
     if (n->primary_device_opts) {
         n->primary_dev = qdev_device_add(n->primary_device_opts, &err);
         if (err) {
@@ -814,9 +814,9 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     } else {
         error_setg(errp, "Primary device not found");
         error_append_hint(errp, "Virtio-net failover will not work. Make "
-            "sure primary device has parameter"
-            " failover_pair_id=<virtio-net-id>\n");
-}
+                          "sure primary device has parameter"
+                          " failover_pair_id=<virtio-net-id>\n");
+    }
     error_propagate(errp, err);
 }
 
@@ -824,7 +824,6 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
 {
     VirtIONet *n = opaque;
     int ret = 0;
-
     const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
 
     if (standby_id != NULL && (g_strcmp0(standby_id, n->netclient_name) == 0)) {
@@ -841,14 +840,14 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     Error *err = NULL;
 
     if (qemu_opts_foreach(qemu_find_opts("device"),
-                         is_my_primary, n, &err)) {
+                          is_my_primary, n, &err)) {
         if (err) {
             error_propagate(errp, err);
             return NULL;
         }
         if (n->primary_device_id) {
             dev = qdev_find_recursive(sysbus_get_default(),
-                    n->primary_device_id);
+                                      n->primary_device_id);
         } else {
             error_setg(errp, "Primary device id not found");
             return NULL;
@@ -857,8 +856,6 @@ static DeviceState *virtio_net_find_primary(VirtIONet *n, Error **errp)
     return dev;
 }
 
-
-
 static DeviceState *virtio_connect_failover_devices(VirtIONet *n,
                                                     DeviceState *dev,
                                                     Error **errp)
@@ -3126,9 +3123,9 @@ static bool failover_replug_primary(VirtIONet *n, Error **errp)
         return true;
     }
     if (!n->primary_device_opts) {
-        n->primary_device_opts = qemu_opts_from_qdict(
-                qemu_find_opts("device"),
-                n->primary_device_dict, errp);
+        n->primary_device_opts = qemu_opts_from_qdict(qemu_find_opts("device"),
+                                                      n->primary_device_dict,
+                                                      errp);
         if (!n->primary_device_opts) {
             return false;
         }
@@ -3176,8 +3173,8 @@ static void virtio_net_handle_migration_primary(VirtIONet *n,
     if (migration_in_setup(s) && !should_be_hidden) {
         if (failover_unplug_primary(n)) {
             vmstate_unregister(VMSTATE_IF(n->primary_dev),
-                    qdev_get_vmsd(n->primary_dev),
-                    n->primary_dev);
+                               qdev_get_vmsd(n->primary_dev),
+                               n->primary_dev);
             qapi_event_send_unplug_primary(n->primary_device_id);
             qatomic_set(&n->primary_should_be_hidden, true);
         } else {
@@ -3201,7 +3198,7 @@ static void virtio_net_migration_state_notifier(Notifier *notifier, void *data)
 }
 
 static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
-            QemuOpts *device_opts)
+                                               QemuOpts *device_opts)
 {
     VirtIONet *n = container_of(listener, VirtIONet, primary_listener);
     bool match_found = false;
@@ -3211,11 +3208,11 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
         return -1;
     }
     n->primary_device_dict = qemu_opts_to_qdict(device_opts,
-            n->primary_device_dict);
+                                                n->primary_device_dict);
     if (n->primary_device_dict) {
         g_free(n->standby_id);
         n->standby_id = g_strdup(qdict_get_try_str(n->primary_device_dict,
-                    "failover_pair_id"));
+                                                   "failover_pair_id"));
     }
     if (g_strcmp0(n->standby_id, n->netclient_name) == 0) {
         match_found = true;
@@ -3235,7 +3232,7 @@ static int virtio_net_primary_should_be_hidden(DeviceListener *listener,
     if (n->primary_device_dict) {
         g_free(n->primary_device_id);
         n->primary_device_id = g_strdup(qdict_get_try_str(
-                    n->primary_device_dict, "id"));
+                                            n->primary_device_dict, "id"));
         if (!n->primary_device_id) {
             warn_report("primary_device_id not set");
         }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bf79d0bbcd..a25f5d612c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -573,10 +573,10 @@ void qdev_set_id(DeviceState *dev, const char *id)
 }
 
 static int is_failover_device(void *opaque, const char *name, const char *value,
-                        Error **errp)
+                              Error **errp)
 {
     if (strcmp(name, "failover_pair_id") == 0) {
-        QemuOpts *opts = (QemuOpts *)opaque;
+        QemuOpts *opts = opaque;
 
         if (qdev_should_hide_device(opts)) {
             return 1;
-- 
2.26.2


