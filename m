Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E30C6892BE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriP-0000EE-9g; Fri, 03 Feb 2023 03:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhs-0008LV-2A
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhl-0007Tv-5x
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypMwVz9D+qA/iV/Zl74GXi+IB5dAlUIV4HVeWNorJfM=;
 b=CnUwIxjw9Zzp6C3ct8eMlIyzbmHNWt2tW6agvtCgzXOwH7oUoEpBCcQZX0v/0BvgBUBRvw
 tuhjmYUUvXzw0JV0SuWEmr5qyFHBu9ZU+bKKa/WxEqAwnV5+HRd15EhJDbAmvCIPOfJpDc
 RgxsT+ZeYDX+NwEbpXlqGasT1yGjGVY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-stbJipApM5KUPxlDKA3ukA-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: stbJipApM5KUPxlDKA3ukA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 116D81C05EB7;
 Fri,  3 Feb 2023 08:45:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3C1E492C3E;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E455221E6923; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 22/35] virtio: Move HMP commands from monitor/ to hw/virtio/
Date: Fri,  3 Feb 2023 09:45:36 +0100
Message-Id: <20230203084549.2622302-23-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This moves these commands from MAINTAINERS section "Human
Monitor (HMP)" to "virtio".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-20-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio-hmp-cmds.c | 321 ++++++++++++++++++++++++++++++++++++
 monitor/hmp-cmds.c          | 309 ----------------------------------
 hw/virtio/meson.build       |   1 +
 3 files changed, 322 insertions(+), 309 deletions(-)
 create mode 100644 hw/virtio/virtio-hmp-cmds.c

diff --git a/hw/virtio/virtio-hmp-cmds.c b/hw/virtio/virtio-hmp-cmds.c
new file mode 100644
index 0000000000..477c97dea2
--- /dev/null
+++ b/hw/virtio/virtio-hmp-cmds.c
@@ -0,0 +1,321 @@
+/*
+ * HMP commands related to virtio
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor/hmp.h"
+#include "monitor/monitor.h"
+#include "qapi/qapi-commands-virtio.h"
+#include "qapi/qmp/qdict.h"
+
+
+static void hmp_virtio_dump_protocols(Monitor *mon,
+                                      VhostDeviceProtocols *pcol)
+{
+    strList *pcol_list = pcol->protocols;
+    while (pcol_list) {
+        monitor_printf(mon, "\t%s", pcol_list->value);
+        pcol_list = pcol_list->next;
+        if (pcol_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (pcol->has_unknown_protocols) {
+        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
+                       pcol->unknown_protocols);
+    }
+}
+
+static void hmp_virtio_dump_status(Monitor *mon,
+                                   VirtioDeviceStatus *status)
+{
+    strList *status_list = status->statuses;
+    while (status_list) {
+        monitor_printf(mon, "\t%s", status_list->value);
+        status_list = status_list->next;
+        if (status_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    if (status->has_unknown_statuses) {
+        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
+                       status->unknown_statuses);
+    }
+}
+
+static void hmp_virtio_dump_features(Monitor *mon,
+                                     VirtioDeviceFeatures *features)
+{
+    strList *transport_list = features->transports;
+    while (transport_list) {
+        monitor_printf(mon, "\t%s", transport_list->value);
+        transport_list = transport_list->next;
+        if (transport_list != NULL) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+
+    monitor_printf(mon, "\n");
+    strList *list = features->dev_features;
+    if (list) {
+        while (list) {
+            monitor_printf(mon, "\t%s", list->value);
+            list = list->next;
+            if (list != NULL) {
+                monitor_printf(mon, ",\n");
+            }
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    if (features->has_unknown_dev_features) {
+        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
+                       features->unknown_dev_features);
+    }
+}
+
+void hmp_virtio_query(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    VirtioInfoList *list = qmp_x_query_virtio(&err);
+    VirtioInfoList *node;
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    if (list == NULL) {
+        monitor_printf(mon, "No VirtIO devices\n");
+        return;
+    }
+
+    node = list;
+    while (node) {
+        monitor_printf(mon, "%s [%s]\n", node->value->path,
+                       node->value->name);
+        node = node->next;
+    }
+    qapi_free_VirtioInfoList(list);
+}
+
+void hmp_virtio_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:             %s %s\n",
+                   s->name, s->vhost_dev ? "(vhost)" : "");
+    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
+    monitor_printf(mon, "  vhost_started:           %s\n",
+                   s->vhost_started ? "true" : "false");
+    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
+    monitor_printf(mon, "  broken:                  %s\n",
+                   s->broken ? "true" : "false");
+    monitor_printf(mon, "  disabled:                %s\n",
+                   s->disabled ? "true" : "false");
+    monitor_printf(mon, "  disable_legacy_check:    %s\n",
+                   s->disable_legacy_check ? "true" : "false");
+    monitor_printf(mon, "  started:                 %s\n",
+                   s->started ? "true" : "false");
+    monitor_printf(mon, "  use_started:             %s\n",
+                   s->use_started ? "true" : "false");
+    monitor_printf(mon, "  start_on_kick:           %s\n",
+                   s->start_on_kick ? "true" : "false");
+    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
+                   s->use_guest_notifier_mask ? "true" : "false");
+    monitor_printf(mon, "  vm_running:              %s\n",
+                   s->vm_running ? "true" : "false");
+    monitor_printf(mon, "  num_vqs:                 %"PRId64"\n", s->num_vqs);
+    monitor_printf(mon, "  queue_sel:               %d\n",
+                   s->queue_sel);
+    monitor_printf(mon, "  isr:                     %d\n", s->isr);
+    monitor_printf(mon, "  endianness:              %s\n",
+                   s->device_endian);
+    monitor_printf(mon, "  status:\n");
+    hmp_virtio_dump_status(mon, s->status);
+    monitor_printf(mon, "  Guest features:\n");
+    hmp_virtio_dump_features(mon, s->guest_features);
+    monitor_printf(mon, "  Host features:\n");
+    hmp_virtio_dump_features(mon, s->host_features);
+    monitor_printf(mon, "  Backend features:\n");
+    hmp_virtio_dump_features(mon, s->backend_features);
+
+    if (s->vhost_dev) {
+        monitor_printf(mon, "  VHost:\n");
+        monitor_printf(mon, "    nvqs:           %d\n",
+                       s->vhost_dev->nvqs);
+        monitor_printf(mon, "    vq_index:       %"PRId64"\n",
+                       s->vhost_dev->vq_index);
+        monitor_printf(mon, "    max_queues:     %"PRId64"\n",
+                       s->vhost_dev->max_queues);
+        monitor_printf(mon, "    n_mem_sections: %"PRId64"\n",
+                       s->vhost_dev->n_mem_sections);
+        monitor_printf(mon, "    n_tmp_sections: %"PRId64"\n",
+                       s->vhost_dev->n_tmp_sections);
+        monitor_printf(mon, "    backend_cap:    %"PRId64"\n",
+                       s->vhost_dev->backend_cap);
+        monitor_printf(mon, "    log_enabled:    %s\n",
+                       s->vhost_dev->log_enabled ? "true" : "false");
+        monitor_printf(mon, "    log_size:       %"PRId64"\n",
+                       s->vhost_dev->log_size);
+        monitor_printf(mon, "    Features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->features);
+        monitor_printf(mon, "    Acked features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
+        monitor_printf(mon, "    Backend features:\n");
+        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
+        monitor_printf(mon, "    Protocol features:\n");
+        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
+    }
+
+    qapi_free_VirtioStatus(s);
+}
+
+void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtVhostQueueStatus *s =
+        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s (vhost)\n",
+                   s->name);
+    monitor_printf(mon, "  kick:                 %"PRId64"\n", s->kick);
+    monitor_printf(mon, "  call:                 %"PRId64"\n", s->call);
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:         %"PRId64"\n", s->num);
+    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
+    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
+                   s->desc_phys);
+    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
+    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
+    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
+                   s->avail_phys);
+    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
+    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
+    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
+                   s->used_phys);
+    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
+
+    qapi_free_VirtVhostQueueStatus(s);
+}
+
+void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
+
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name:          %s\n", s->name);
+    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
+    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
+    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
+    monitor_printf(mon, "  signalled_used:       %d\n",
+                   s->signalled_used);
+    monitor_printf(mon, "  signalled_used_valid: %s\n",
+                   s->signalled_used_valid ? "true" : "false");
+    if (s->has_last_avail_idx) {
+        monitor_printf(mon, "  last_avail_idx:       %d\n",
+                       s->last_avail_idx);
+    }
+    if (s->has_shadow_avail_idx) {
+        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
+                       s->shadow_avail_idx);
+    }
+    monitor_printf(mon, "  VRing:\n");
+    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
+    monitor_printf(mon, "    num_default:  %"PRId32"\n",
+                   s->vring_num_default);
+    monitor_printf(mon, "    align:        %"PRId32"\n",
+                   s->vring_align);
+    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
+                   s->vring_desc);
+    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
+                   s->vring_avail);
+    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
+                   s->vring_used);
+
+    qapi_free_VirtQueueStatus(s);
+}
+
+void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *path = qdict_get_try_str(qdict, "path");
+    int queue = qdict_get_int(qdict, "queue");
+    int index = qdict_get_try_int(qdict, "index", -1);
+    VirtioQueueElement *e;
+    VirtioRingDescList *list;
+
+    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
+                                         index, &err);
+    if (err != NULL) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    monitor_printf(mon, "%s:\n", path);
+    monitor_printf(mon, "  device_name: %s\n", e->name);
+    monitor_printf(mon, "  index:   %d\n", e->index);
+    monitor_printf(mon, "  desc:\n");
+    monitor_printf(mon, "    descs:\n");
+
+    list = e->descs;
+    while (list) {
+        monitor_printf(mon, "        addr 0x%"PRIx64" len %d",
+                       list->value->addr, list->value->len);
+        if (list->value->flags) {
+            strList *flag = list->value->flags;
+            monitor_printf(mon, " (");
+            while (flag) {
+                monitor_printf(mon, "%s", flag->value);
+                flag = flag->next;
+                if (flag) {
+                    monitor_printf(mon, ", ");
+                }
+            }
+            monitor_printf(mon, ")");
+        }
+        list = list->next;
+        if (list) {
+            monitor_printf(mon, ",\n");
+        }
+    }
+    monitor_printf(mon, "\n");
+    monitor_printf(mon, "  avail:\n");
+    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
+    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
+    monitor_printf(mon, "  used:\n");
+    monitor_printf(mon, "    flags: %d\n", e->used->flags);
+    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
+
+    qapi_free_VirtioQueueElement(e);
+}
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 4da6b7cccc..6b1d5358f7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -23,7 +23,6 @@
 #include "qapi/qapi-commands-run-state.h"
 #include "qapi/qapi-commands-stats.h"
 #include "qapi/qapi-commands-tpm.h"
-#include "qapi/qapi-commands-virtio.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/cutils.h"
@@ -533,311 +532,3 @@ exit:
 exit_no_print:
     error_free(err);
 }
-
-static void hmp_virtio_dump_protocols(Monitor *mon,
-                                      VhostDeviceProtocols *pcol)
-{
-    strList *pcol_list = pcol->protocols;
-    while (pcol_list) {
-        monitor_printf(mon, "\t%s", pcol_list->value);
-        pcol_list = pcol_list->next;
-        if (pcol_list != NULL) {
-            monitor_printf(mon, ",\n");
-        }
-    }
-    monitor_printf(mon, "\n");
-    if (pcol->has_unknown_protocols) {
-        monitor_printf(mon, "  unknown-protocols(0x%016"PRIx64")\n",
-                       pcol->unknown_protocols);
-    }
-}
-
-static void hmp_virtio_dump_status(Monitor *mon,
-                                   VirtioDeviceStatus *status)
-{
-    strList *status_list = status->statuses;
-    while (status_list) {
-        monitor_printf(mon, "\t%s", status_list->value);
-        status_list = status_list->next;
-        if (status_list != NULL) {
-            monitor_printf(mon, ",\n");
-        }
-    }
-    monitor_printf(mon, "\n");
-    if (status->has_unknown_statuses) {
-        monitor_printf(mon, "  unknown-statuses(0x%016"PRIx32")\n",
-                       status->unknown_statuses);
-    }
-}
-
-static void hmp_virtio_dump_features(Monitor *mon,
-                                     VirtioDeviceFeatures *features)
-{
-    strList *transport_list = features->transports;
-    while (transport_list) {
-        monitor_printf(mon, "\t%s", transport_list->value);
-        transport_list = transport_list->next;
-        if (transport_list != NULL) {
-            monitor_printf(mon, ",\n");
-        }
-    }
-
-    monitor_printf(mon, "\n");
-    strList *list = features->dev_features;
-    if (list) {
-        while (list) {
-            monitor_printf(mon, "\t%s", list->value);
-            list = list->next;
-            if (list != NULL) {
-                monitor_printf(mon, ",\n");
-            }
-        }
-        monitor_printf(mon, "\n");
-    }
-
-    if (features->has_unknown_dev_features) {
-        monitor_printf(mon, "  unknown-features(0x%016"PRIx64")\n",
-                       features->unknown_dev_features);
-    }
-}
-
-void hmp_virtio_query(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    VirtioInfoList *list = qmp_x_query_virtio(&err);
-    VirtioInfoList *node;
-
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
-        return;
-    }
-
-    if (list == NULL) {
-        monitor_printf(mon, "No VirtIO devices\n");
-        return;
-    }
-
-    node = list;
-    while (node) {
-        monitor_printf(mon, "%s [%s]\n", node->value->path,
-                       node->value->name);
-        node = node->next;
-    }
-    qapi_free_VirtioInfoList(list);
-}
-
-void hmp_virtio_status(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    const char *path = qdict_get_try_str(qdict, "path");
-    VirtioStatus *s = qmp_x_query_virtio_status(path, &err);
-
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
-        return;
-    }
-
-    monitor_printf(mon, "%s:\n", path);
-    monitor_printf(mon, "  device_name:             %s %s\n",
-                   s->name, s->vhost_dev ? "(vhost)" : "");
-    monitor_printf(mon, "  device_id:               %d\n", s->device_id);
-    monitor_printf(mon, "  vhost_started:           %s\n",
-                   s->vhost_started ? "true" : "false");
-    monitor_printf(mon, "  bus_name:                %s\n", s->bus_name);
-    monitor_printf(mon, "  broken:                  %s\n",
-                   s->broken ? "true" : "false");
-    monitor_printf(mon, "  disabled:                %s\n",
-                   s->disabled ? "true" : "false");
-    monitor_printf(mon, "  disable_legacy_check:    %s\n",
-                   s->disable_legacy_check ? "true" : "false");
-    monitor_printf(mon, "  started:                 %s\n",
-                   s->started ? "true" : "false");
-    monitor_printf(mon, "  use_started:             %s\n",
-                   s->use_started ? "true" : "false");
-    monitor_printf(mon, "  start_on_kick:           %s\n",
-                   s->start_on_kick ? "true" : "false");
-    monitor_printf(mon, "  use_guest_notifier_mask: %s\n",
-                   s->use_guest_notifier_mask ? "true" : "false");
-    monitor_printf(mon, "  vm_running:              %s\n",
-                   s->vm_running ? "true" : "false");
-    monitor_printf(mon, "  num_vqs:                 %"PRId64"\n", s->num_vqs);
-    monitor_printf(mon, "  queue_sel:               %d\n",
-                   s->queue_sel);
-    monitor_printf(mon, "  isr:                     %d\n", s->isr);
-    monitor_printf(mon, "  endianness:              %s\n",
-                   s->device_endian);
-    monitor_printf(mon, "  status:\n");
-    hmp_virtio_dump_status(mon, s->status);
-    monitor_printf(mon, "  Guest features:\n");
-    hmp_virtio_dump_features(mon, s->guest_features);
-    monitor_printf(mon, "  Host features:\n");
-    hmp_virtio_dump_features(mon, s->host_features);
-    monitor_printf(mon, "  Backend features:\n");
-    hmp_virtio_dump_features(mon, s->backend_features);
-
-    if (s->vhost_dev) {
-        monitor_printf(mon, "  VHost:\n");
-        monitor_printf(mon, "    nvqs:           %d\n",
-                       s->vhost_dev->nvqs);
-        monitor_printf(mon, "    vq_index:       %"PRId64"\n",
-                       s->vhost_dev->vq_index);
-        monitor_printf(mon, "    max_queues:     %"PRId64"\n",
-                       s->vhost_dev->max_queues);
-        monitor_printf(mon, "    n_mem_sections: %"PRId64"\n",
-                       s->vhost_dev->n_mem_sections);
-        monitor_printf(mon, "    n_tmp_sections: %"PRId64"\n",
-                       s->vhost_dev->n_tmp_sections);
-        monitor_printf(mon, "    backend_cap:    %"PRId64"\n",
-                       s->vhost_dev->backend_cap);
-        monitor_printf(mon, "    log_enabled:    %s\n",
-                       s->vhost_dev->log_enabled ? "true" : "false");
-        monitor_printf(mon, "    log_size:       %"PRId64"\n",
-                       s->vhost_dev->log_size);
-        monitor_printf(mon, "    Features:\n");
-        hmp_virtio_dump_features(mon, s->vhost_dev->features);
-        monitor_printf(mon, "    Acked features:\n");
-        hmp_virtio_dump_features(mon, s->vhost_dev->acked_features);
-        monitor_printf(mon, "    Backend features:\n");
-        hmp_virtio_dump_features(mon, s->vhost_dev->backend_features);
-        monitor_printf(mon, "    Protocol features:\n");
-        hmp_virtio_dump_protocols(mon, s->vhost_dev->protocol_features);
-    }
-
-    qapi_free_VirtioStatus(s);
-}
-
-void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    const char *path = qdict_get_try_str(qdict, "path");
-    int queue = qdict_get_int(qdict, "queue");
-    VirtVhostQueueStatus *s =
-        qmp_x_query_virtio_vhost_queue_status(path, queue, &err);
-
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
-        return;
-    }
-
-    monitor_printf(mon, "%s:\n", path);
-    monitor_printf(mon, "  device_name:          %s (vhost)\n",
-                   s->name);
-    monitor_printf(mon, "  kick:                 %"PRId64"\n", s->kick);
-    monitor_printf(mon, "  call:                 %"PRId64"\n", s->call);
-    monitor_printf(mon, "  VRing:\n");
-    monitor_printf(mon, "    num:         %"PRId64"\n", s->num);
-    monitor_printf(mon, "    desc:        0x%016"PRIx64"\n", s->desc);
-    monitor_printf(mon, "    desc_phys:   0x%016"PRIx64"\n",
-                   s->desc_phys);
-    monitor_printf(mon, "    desc_size:   %"PRId32"\n", s->desc_size);
-    monitor_printf(mon, "    avail:       0x%016"PRIx64"\n", s->avail);
-    monitor_printf(mon, "    avail_phys:  0x%016"PRIx64"\n",
-                   s->avail_phys);
-    monitor_printf(mon, "    avail_size:  %"PRId32"\n", s->avail_size);
-    monitor_printf(mon, "    used:        0x%016"PRIx64"\n", s->used);
-    monitor_printf(mon, "    used_phys:   0x%016"PRIx64"\n",
-                   s->used_phys);
-    monitor_printf(mon, "    used_size:   %"PRId32"\n", s->used_size);
-
-    qapi_free_VirtVhostQueueStatus(s);
-}
-
-void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    const char *path = qdict_get_try_str(qdict, "path");
-    int queue = qdict_get_int(qdict, "queue");
-    VirtQueueStatus *s = qmp_x_query_virtio_queue_status(path, queue, &err);
-
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
-        return;
-    }
-
-    monitor_printf(mon, "%s:\n", path);
-    monitor_printf(mon, "  device_name:          %s\n", s->name);
-    monitor_printf(mon, "  queue_index:          %d\n", s->queue_index);
-    monitor_printf(mon, "  inuse:                %d\n", s->inuse);
-    monitor_printf(mon, "  used_idx:             %d\n", s->used_idx);
-    monitor_printf(mon, "  signalled_used:       %d\n",
-                   s->signalled_used);
-    monitor_printf(mon, "  signalled_used_valid: %s\n",
-                   s->signalled_used_valid ? "true" : "false");
-    if (s->has_last_avail_idx) {
-        monitor_printf(mon, "  last_avail_idx:       %d\n",
-                       s->last_avail_idx);
-    }
-    if (s->has_shadow_avail_idx) {
-        monitor_printf(mon, "  shadow_avail_idx:     %d\n",
-                       s->shadow_avail_idx);
-    }
-    monitor_printf(mon, "  VRing:\n");
-    monitor_printf(mon, "    num:          %"PRId32"\n", s->vring_num);
-    monitor_printf(mon, "    num_default:  %"PRId32"\n",
-                   s->vring_num_default);
-    monitor_printf(mon, "    align:        %"PRId32"\n",
-                   s->vring_align);
-    monitor_printf(mon, "    desc:         0x%016"PRIx64"\n",
-                   s->vring_desc);
-    monitor_printf(mon, "    avail:        0x%016"PRIx64"\n",
-                   s->vring_avail);
-    monitor_printf(mon, "    used:         0x%016"PRIx64"\n",
-                   s->vring_used);
-
-    qapi_free_VirtQueueStatus(s);
-}
-
-void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-    const char *path = qdict_get_try_str(qdict, "path");
-    int queue = qdict_get_int(qdict, "queue");
-    int index = qdict_get_try_int(qdict, "index", -1);
-    VirtioQueueElement *e;
-    VirtioRingDescList *list;
-
-    e = qmp_x_query_virtio_queue_element(path, queue, index != -1,
-                                         index, &err);
-    if (err != NULL) {
-        hmp_handle_error(mon, err);
-        return;
-    }
-
-    monitor_printf(mon, "%s:\n", path);
-    monitor_printf(mon, "  device_name: %s\n", e->name);
-    monitor_printf(mon, "  index:   %d\n", e->index);
-    monitor_printf(mon, "  desc:\n");
-    monitor_printf(mon, "    descs:\n");
-
-    list = e->descs;
-    while (list) {
-        monitor_printf(mon, "        addr 0x%"PRIx64" len %d",
-                       list->value->addr, list->value->len);
-        if (list->value->flags) {
-            strList *flag = list->value->flags;
-            monitor_printf(mon, " (");
-            while (flag) {
-                monitor_printf(mon, "%s", flag->value);
-                flag = flag->next;
-                if (flag) {
-                    monitor_printf(mon, ", ");
-                }
-            }
-            monitor_printf(mon, ")");
-        }
-        list = list->next;
-        if (list) {
-            monitor_printf(mon, ",\n");
-        }
-    }
-    monitor_printf(mon, "\n");
-    monitor_printf(mon, "  avail:\n");
-    monitor_printf(mon, "    flags: %d\n", e->avail->flags);
-    monitor_printf(mon, "    idx:   %d\n", e->avail->idx);
-    monitor_printf(mon, "    ring:  %d\n", e->avail->ring);
-    monitor_printf(mon, "  used:\n");
-    monitor_printf(mon, "    flags: %d\n", e->used->flags);
-    monitor_printf(mon, "    idx:   %d\n", e->used->idx);
-
-    qapi_free_VirtioQueueElement(e);
-}
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index f93be2e137..bdec78bfc6 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -67,5 +67,6 @@ softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('vhost-stub.c'))
 softmmu_ss.add(when: 'CONFIG_VIRTIO', if_false: files('virtio-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('vhost-stub.c'))
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
+softmmu_ss.add(files('virtio-hmp-cmds.c'))
 
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
-- 
2.39.0


