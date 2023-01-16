Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65FA66D141
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:04:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXWH-0008Vc-Ou; Mon, 16 Jan 2023 17:00:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXUy-0006q1-9a
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:36 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXUt-0003df-Cw
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=8O3ZS+DsmWlN6m3q4b/CTbOK/P7epEdVIU3C81M4NXQ=; b=Pi8mGI/pEtIZRHnMNseC3jaulb
 kP33go0CMpHs9Gr1NFSb9JLlpVU9C9D8E2j7awYcJkXJJRW8USmC5MO26ZLFiD3Tsy/W2TrSUjDAP
 lE6XsiyPzxh5Dy1GVCWgHS+K4PQx07nPx2cwZ6NYcRKu7ut2qUxlT/IFz1DYoqPbu+ETl1aDmYU+d
 jBpQG9DuF9d0tBDL7XuSAtPpMcCN5/Ele6M7xPCMTD1P9EylrvFjRXWw8xY7bUv1hnE3syLzuna5N
 CeQPMxw+IKJFsD6u7Tg2HWdIP3wtcE2P3lRlbT8bLfFzKG06U06qss0vt0BXg6uogPvfeTJ9nwvFA
 jGpjff9A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXUO-005jRq-0D; Mon, 16 Jan 2023 21:58:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXUX-004iQB-1c; Mon, 16 Jan 2023 21:58:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v7 38/51] i386/xen: add monitor commands to test event
 injection
Date: Mon, 16 Jan 2023 21:57:52 +0000
Message-Id: <20230116215805.1123514-39-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116215805.1123514-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

Specifically add listing, injection of event channels.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp-commands.hx          |  29 ++++++++
 hw/i386/kvm/meson.build  |   4 ++
 hw/i386/kvm/xen-stubs.c  |  25 +++++++
 hw/i386/kvm/xen_evtchn.c | 138 +++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h |   3 +
 monitor/misc.c           |   4 ++
 qapi/misc.json           |  91 ++++++++++++++++++++++++++
 7 files changed, 294 insertions(+)
 create mode 100644 hw/i386/kvm/xen-stubs.c

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 673e39a697..fd77c432c0 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1815,3 +1815,32 @@ SRST
   Dump the FDT in dtb format to *filename*.
 ERST
 #endif
+
+#if defined(CONFIG_XEN_EMU)
+    {
+        .name       = "xen-event-inject",
+        .args_type  = "port:i",
+        .params     = "port",
+        .help       = "inject event channel",
+        .cmd        = hmp_xen_event_inject,
+    },
+
+SRST
+``xen-event-inject`` *port*
+  Notify guest via event channel on port *port*.
+ERST
+
+
+    {
+        .name       = "xen-event-list",
+        .args_type  = "",
+        .params     = "",
+        .help       = "list event channel state",
+        .cmd        = hmp_xen_event_list,
+    },
+
+SRST
+``xen-event-list``
+  List event channels in the guest
+ERST
+#endif
diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
index cab64df339..577eb50a18 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -10,3 +10,7 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
+
+specific_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
+  'xen-stubs.c',
+))
diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
new file mode 100644
index 0000000000..6f433dc995
--- /dev/null
+++ b/hw/i386/kvm/xen-stubs.c
@@ -0,0 +1,25 @@
+/*
+ * QEMU Xen emulation: QMP stubs
+ *
+ * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
+
+EvtchnInfoList *qmp_xen_event_list(Error **errp)
+{
+    error_setg(errp, "Xen event channel emulation not enabled");
+    return NULL;
+}
+
+void qmp_xen_event_inject(uint32_t port, Error **errp)
+{
+    error_setg(errp, "Xen event channel emulation not enabled");
+}
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 6b6df39978..a73db5d2bc 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -14,7 +14,11 @@
 #include "qemu/module.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
+#include "qapi/qmp/qdict.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
 #include "exec/address-spaces.h"
@@ -1059,3 +1063,137 @@ int xen_evtchn_send_op(struct evtchn_send *send)
     return ret;
 }
 
+static const char *type_names[] = {
+    "closed",
+    "unbound",
+    "interdomain",
+    "pirq",
+    "virq",
+    "ipi"
+};
+
+EvtchnInfoList *qmp_xen_event_list(Error **errp)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    EvtchnInfoList *head = NULL, **tail = &head;
+    void *shinfo, *pending, *mask;
+    int i;
+
+    if (!s) {
+        error_setg(errp, "Xen event channel emulation not enabled");
+        return NULL;
+    }
+
+    shinfo = xen_overlay_get_shinfo_ptr();
+    if (!shinfo) {
+        error_setg(errp, "Xen shared info page not allocated");
+        return NULL;
+    }
+    if (xen_is_long_mode()) {
+        pending = shinfo + offsetof(struct shared_info, evtchn_pending);
+        mask = shinfo + offsetof(struct shared_info, evtchn_mask);
+    } else {
+        pending = shinfo + offsetof(struct compat_shared_info, evtchn_pending);
+        mask = shinfo + offsetof(struct compat_shared_info, evtchn_mask);
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    for (i = 0; i < s->nr_ports; i++) {
+        XenEvtchnPort *p = &s->port_table[i];
+        EvtchnInfo *info;
+
+        if (p->type == EVTCHNSTAT_closed) {
+            continue;
+        }
+
+        info = g_new0(EvtchnInfo, 1);
+
+        info->port = i;
+        info->type = g_strdup(type_names[p->type]);
+        if (p->type == EVTCHNSTAT_interdomain) {
+            info->remote_domain = g_strdup((p->type_val & PORT_INFO_TYPEVAL_REMOTE_QEMU) ?
+                                           "qemu" : "loopback");
+            info->target = p->type_val & PORT_INFO_TYPEVAL_REMOTE_PORT_MASK;
+        } else {
+            info->target = p->type_val;
+        }
+        info->vcpu = p->vcpu;
+        info->pending = test_bit(i, pending);
+        info->masked = test_bit(i, mask);
+
+        QAPI_LIST_APPEND(tail, info);
+    }
+
+    return head;
+}
+
+void qmp_xen_event_inject(uint32_t port, Error **errp)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+
+    if (!s) {
+        error_setg(errp, "Xen event channel emulation not enabled");
+        return;
+    }
+
+    if (!valid_port(port)) {
+        error_setg(errp, "Invalid port %u", port);
+    }
+
+    QEMU_LOCK_GUARD(&s->port_lock);
+
+    if (set_port_pending(s, port)) {
+        error_setg(errp, "Failed to set port %u", port);
+        return;
+    }
+}
+
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
+{
+    EvtchnInfoList *iter, *info_list;
+    Error *err = NULL;
+
+    info_list = qmp_xen_event_list(&err);
+    if (err) {
+        hmp_handle_error(mon, err);
+        return;
+    }
+
+    for (iter = info_list; iter; iter = iter->next) {
+        EvtchnInfo *info = iter->value;
+
+        monitor_printf(mon, "port %4lu: vcpu: %ld %s", info->port, info->vcpu,
+                       info->type);
+        if (strcmp(info->type, "ipi")) {
+            monitor_printf(mon,  "(");
+            if (info->remote_domain) {
+                monitor_printf(mon, "%s:", info->remote_domain);
+            }
+            monitor_printf(mon, "%ld)", info->target);
+        }
+        if (info->pending) {
+            monitor_printf(mon, " PENDING");
+        }
+        if (info->masked) {
+            monitor_printf(mon, " MASKED");
+        }
+        monitor_printf(mon, "\n");
+    }
+
+    qapi_free_EvtchnInfoList(info_list);
+}
+
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
+{
+    int port = qdict_get_int(qdict, "port");
+    Error *err = NULL;
+
+    qmp_xen_event_inject(port, &err);
+    if (err) {
+        hmp_handle_error(mon, err);
+    } else {
+        monitor_printf(mon, "Delivered port %d\n", port);
+    }
+}
+
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 5d3e03553f..670f8b3f7d 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -16,6 +16,9 @@ void xen_evtchn_create(void);
 int xen_evtchn_soft_reset(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
+
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
diff --git a/monitor/misc.c b/monitor/misc.c
index bf3f1c67ca..7d8c473ffb 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -82,6 +82,10 @@
 /* Make devices configuration available for use in hmp-commands*.hx templates */
 #include CONFIG_DEVICES
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/i386/kvm/xen_evtchn.h"
+#endif
+
 /* file descriptors passed via SCM_RIGHTS */
 typedef struct mon_fd_t mon_fd_t;
 struct mon_fd_t {
diff --git a/qapi/misc.json b/qapi/misc.json
index 27ef5a2b20..6284f86a5b 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -584,3 +584,94 @@
 { 'event': 'VFU_CLIENT_HANGUP',
   'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
             'dev-id': 'str', 'dev-qom-path': 'str' } }
+
+##
+# @EvtchnInfo:
+#
+# Information about a Xen event channel port
+#
+# @port: the port number
+#
+# @vcpu: target vCPU for this port
+#
+# @type: the port type
+#
+# @remote-domain: remote domain for interdomain ports
+#
+# @target: remote port ID, or virq/pirq number
+#
+# @pending: port is currently active pending delivery
+#
+# @masked: port is masked
+#
+# Since: x.xx
+##
+{ 'struct': 'EvtchnInfo',
+  'data': {'port': 'int',
+	   'vcpu': 'int',
+	   'type': 'str',
+	   'remote-domain': 'str',
+	   'target': 'int',
+	   'pending': 'bool',
+	   'masked': 'bool'}}
+
+
+##
+# @xen-event-list:
+#
+# Query the Xen event channels opened by the guest.
+#
+# Returns: list of open event channel ports.
+#
+# Since: x.xx
+#
+# Example:
+#
+# -> { "execute": "xen-event-list" }
+# <- { "return": [
+#         {
+#             "pending": false,
+#             "port": 1,
+#             "vcpu": 1,
+#             "remote-domain": "qemu",
+#             "masked": false,
+#             "type": "interdomain",
+#             "target": 1
+#         },
+#         {
+#             "pending": false,
+#             "port": 2,
+#             "vcpu": 0,
+#             "remote-domain": "",
+#             "masked": false,
+#             "type": "virq",
+#             "target": 0
+#         }
+#      ]
+#    }
+#
+##
+{ 'command': 'xen-event-list',
+  'returns': ['EvtchnInfo']
+}
+
+##
+# @xen-event-inject:
+#
+# Inject a Xen event channel port to the guest.
+#
+# @port: The port number
+#
+# Returns: - Nothing on success.
+#
+# Since: x.xx
+#
+# Example:
+#
+# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
+# <- { "return": { } }
+#
+##
+{ 'command': 'xen-event-inject',
+  'data': { 'port': 'uint32' }
+}
-- 
2.39.0


