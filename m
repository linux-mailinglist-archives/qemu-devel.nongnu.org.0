Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671B1432F5F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:27:27 +0200 (CEST)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjWw-00026K-Hj
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcjMb-0003el-UH
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mcjMZ-0005dO-Qh
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+UMo1LKDpTkbziyuawa9Gn/ybfj1Pu+ugGQkq/8n7Nw=;
 b=VuMYFftwydS7Miakh62hlM2nUXtkR46XsFNjCdjjnFQS9r5q9ps3/9t6CnJjkBavdES/Wt
 QAqczFgQrHND0LgCrbMbtRuHWF+QnoIAxzdCaYbmrMJQaFtM/3KBVAxU3aoiHKVGanpC1Z
 HkDOmAlR4K5MNXam9hKJ7OvCr/vCkMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-V5vvo414Oia9vx_1vmRDwg-1; Tue, 19 Oct 2021 03:16:41 -0400
X-MC-Unique: V5vvo414Oia9vx_1vmRDwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33A92362FB
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 07:16:40 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 675BE69203;
 Tue, 19 Oct 2021 07:16:20 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qdev/qbus: remove failover specific code
Date: Tue, 19 Oct 2021 09:15:32 +0200
Message-Id: <20211019071532.682717-3-lvivier@redhat.com>
In-Reply-To: <20211019071532.682717-1-lvivier@redhat.com>
References: <20211019071532.682717-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
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
 hw/net/virtio-net.c    | 12 +++++++++++-
 softmmu/qdev-monitor.c | 18 ++++++------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 83642c85b2e5..3dd2896ff95c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3299,7 +3299,17 @@ static bool failover_hide_primary_device(DeviceListener *listener,
     if (!device_opts) {
         return false;
     }
-    standby_id = qdict_get_try_str(device_opts, "failover_pair_id");
+
+    if (!qdict_haskey(device_opts, "failover_pair_id")) {
+        return false;
+    }
+
+    if (!qdict_haskey(device_opts, "id")) {
+        error_setg(errp, "Device with failover_pair_id needs to have id");
+        return false;
+    }
+
+    standby_id = qdict_get_str(device_opts, "failover_pair_id");
     if (g_strcmp0(standby_id, n->netclient_name) != 0) {
         return false;
     }
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 89c473cb22a2..4851de51a5cb 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -639,19 +639,13 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
         }
     }
 
-    if (qdict_haskey(opts, "failover_pair_id")) {
-        if (!qdict_haskey(opts, "id")) {
-            error_setg(errp, "Device with failover_pair_id don't have id");
-            return NULL;
-        }
-        if (qdev_should_hide_device(opts, from_json, errp)) {
-            if (bus && !qbus_is_hotpluggable(bus)) {
-                error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
-            }
-            return NULL;
-        } else if (*errp) {
-            return NULL;
+    if (qdev_should_hide_device(opts, from_json, errp)) {
+        if (bus && !qbus_is_hotpluggable(bus)) {
+            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
         }
+        return NULL;
+    } else if (*errp) {
+        return NULL;
     }
 
     if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
-- 
2.31.1


