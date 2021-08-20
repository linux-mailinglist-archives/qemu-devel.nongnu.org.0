Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4053F2E15
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:29:40 +0200 (CEST)
Received: from localhost ([::1]:57546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5Wd-0005I5-5s
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5Nl-00040q-5W
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:20:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mH5Ni-0004Sr-RS
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629469226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fcYNrRcabklWXiefBQ5jnoeP/vl7VaBO52IHwHBjbRM=;
 b=BOtQkEyuc409gtjo/uz5YFslySraWnxTXyAuEs3LfiOW2AKqPUAtdLLR3R/9z6CeeQvgDk
 pWjfPKnukMhAUzW0VEM0xZnR/AXjbBD+wb4Xh+Wg7kaVkqB3ZjTS2MpngaMA4+jlbNhCuC
 dsMKPXyhZpsbD1QuQjkaGQoo1ed7oAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Zcv-XJ5bPR6AiE2m_RfteA-1; Fri, 20 Aug 2021 10:20:25 -0400
X-MC-Unique: Zcv-XJ5bPR6AiE2m_RfteA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A66F1966320;
 Fri, 20 Aug 2021 14:20:24 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C3446EF4F;
 Fri, 20 Aug 2021 14:20:21 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/8] qdev/qbus: remove failover specific code
Date: Fri, 20 Aug 2021 16:19:56 +0200
Message-Id: <20210820142002.152994-3-lvivier@redhat.com>
In-Reply-To: <20210820142002.152994-1-lvivier@redhat.com>
References: <20210820142002.152994-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f3a850565693 ("qdev/qbus: add hidden device support") has
introduced a generic way to hide a device but it has modified
qdev_device_add() to check a specific option of the failover device,
"failover_pair_id", before calling the generic mechanism.

It's not needed (and not generic) to do that in qdev_device_add() because
this is also checked by the failover_hide_primary_device() function that
uses the generic mechanism to hide the device.

Cc: Jens Freimann <jfreimann@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c    |  7 +++++++
 softmmu/qdev-monitor.c | 14 ++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 542f9e167eb4..0c5ec930356b 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3288,6 +3288,13 @@ static bool failover_hide_primary_device(DeviceListener *listener,
         return false;
     }
     standby_id = qemu_opt_get(device_opts, "failover_pair_id");
+    if (standby_id == NULL) {
+        return false;
+    }
+    if (device_opts->id == NULL) {
+        error_setg(errp, "Device with failover_pair_id don't have id");
+        return true;
+    }
     if (g_strcmp0(standby_id, n->netclient_name) != 0) {
         return false;
     }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 7adf0d22beb1..5c92dbed3139 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -622,17 +622,11 @@ DeviceState *qdev_device_add(QemuOpts *opts, Error **errp)
         }
     }
 
-    if (qemu_opt_get(opts, "failover_pair_id")) {
-        if (!opts->id) {
-            error_setg(errp, "Device with failover_pair_id don't have id");
-            return NULL;
-        }
-        if (qdev_should_hide_device(opts, errp)) {
-            if (errp && !*errp && bus && !qbus_is_hotpluggable(bus)) {
-                error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
-            }
-            return NULL;
+    if (qdev_should_hide_device(opts, errp)) {
+        if (errp && !*errp && bus && !qbus_is_hotpluggable(bus)) {
+            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         }
+        return NULL;
     }
 
     if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
-- 
2.31.1


