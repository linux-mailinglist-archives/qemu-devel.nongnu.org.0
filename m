Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08C96A6D8B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:56:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMwT-0006x8-7N; Wed, 01 Mar 2023 08:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f4e15e254fb7e3cd38fc+7129+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pXMt1-00008G-25
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:55 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f4e15e254fb7e3cd38fc+7129+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pXMsu-0002nb-0N
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:52:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=PXtwvsna5dorPJo9H5YLW/hQZ/dfg7Xk4MrAisJeZxE=; b=MsSsvqHlHTjnU3O1b/76cTF2yt
 zz8JUDCFZszz8GqiVNhUN5Krk+EoNFGS+nkDeTuV4ocWM0xfN86+p6T0HTYa6F962AWlA3+cSlJu9
 rxpfrri5ZSl6uzXHcouxwFXYavOiuSrL4NUwcVlN6QcZPZ+BLnzRyWQabanqJr09zEtwCYzW9pycI
 lzOlCx6CGD11YGH23vZILChihsejiKSSMtm0WtKQ78EqS6YVqvuXBIpJob3W4x/VJuUxc0qcWm7AC
 xfAMUnG9nMsCq2T91DplxmQxC8Uh54DR13ggVdNwbTFleU5Ul9Qav7SMbx8p6FnTI90KVx3Dahc/f
 Le+VAXZg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pXMsd-001f4m-Ib; Wed, 01 Mar 2023 13:52:30 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pXMsd-0049WG-1r; Wed, 01 Mar 2023 13:52:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com
Subject: [PATCH v15 39/60] i386/xen: add monitor commands to test event
 injection
Date: Wed,  1 Mar 2023 13:52:02 +0000
Message-Id: <20230301135223.988336-40-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230301135223.988336-1-dwmw2@infradead.org>
References: <20230301135223.988336-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+f4e15e254fb7e3cd38fc+7129+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hmp-commands.hx            |  29 ++++++++
 hw/i386/kvm/meson.build    |   7 ++
 hw/i386/kvm/xen-stubs.c    |  28 ++++++++
 hw/i386/kvm/xen_evtchn.c   | 137 +++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h      |   2 +
 qapi/misc-target.json      | 116 +++++++++++++++++++++++++++++++
 tests/qtest/qmp-cmd-test.c |   1 +
 7 files changed, 320 insertions(+)
 create mode 100644 hw/i386/kvm/xen-stubs.c

diff --git a/hmp-commands.hx b/hmp-commands.hx
index fbb5daf09b..b87c250e23 100644
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
index cab64df339..325c901496 100644
--- a/hw/i386/kvm/meson.build
+++ b/hw/i386/kvm/meson.build
@@ -10,3 +10,10 @@ i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files(
   ))
 
 i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
+
+xen_stubs_ss = ss.source_set()
+xen_stubs_ss.add(when: 'CONFIG_XEN_EMU', if_false: files(
+  'xen-stubs.c',
+))
+
+specific_ss.add_all(when: 'CONFIG_SOFTMMU', if_true: xen_stubs_ss)
diff --git a/hw/i386/kvm/xen-stubs.c b/hw/i386/kvm/xen-stubs.c
new file mode 100644
index 0000000000..720590aedd
--- /dev/null
+++ b/hw/i386/kvm/xen-stubs.c
@@ -0,0 +1,28 @@
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
+
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc-target.h"
+
+#ifdef TARGET_I386
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
+#endif
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index c804a315e0..e937de7a93 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -15,7 +15,11 @@
 #include "qemu/lockable.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "qapi/error.h"
+#include "qapi/qapi-commands-misc-target.h"
+#include "qapi/qmp/qdict.h"
 #include "qom/object.h"
 #include "exec/target_page.h"
 #include "exec/address-spaces.h"
@@ -1069,3 +1073,136 @@ int xen_evtchn_send_op(struct evtchn_send *send)
     return ret;
 }
 
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
+
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
+        qemu_build_assert(EVTCHN_PORT_TYPE_CLOSED == EVTCHNSTAT_closed);
+        qemu_build_assert(EVTCHN_PORT_TYPE_UNBOUND == EVTCHNSTAT_unbound);
+        qemu_build_assert(EVTCHN_PORT_TYPE_INTERDOMAIN == EVTCHNSTAT_interdomain);
+        qemu_build_assert(EVTCHN_PORT_TYPE_PIRQ == EVTCHNSTAT_pirq);
+        qemu_build_assert(EVTCHN_PORT_TYPE_VIRQ == EVTCHNSTAT_virq);
+        qemu_build_assert(EVTCHN_PORT_TYPE_IPI == EVTCHNSTAT_ipi);
+
+        info->type = p->type;
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
+        monitor_printf(mon, "port %4u: vcpu: %d %s", info->port, info->vcpu,
+                       EvtchnPortType_str(info->type));
+        if (info->type != EVTCHN_PORT_TYPE_IPI) {
+            monitor_printf(mon,  "(");
+            if (info->remote_domain) {
+                monitor_printf(mon, "%s:", info->remote_domain);
+            }
+            monitor_printf(mon, "%d)", info->target);
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
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 2220f14fc9..efae6b06bc 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -114,6 +114,8 @@ void hmp_virtio_status(Monitor *mon, const QDict *qdict);
 void hmp_virtio_queue_status(Monitor *mon, const QDict *qdict);
 void hmp_vhost_queue_status(Monitor *mon, const QDict *qdict);
 void hmp_virtio_queue_element(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
 void object_add_completion(ReadLineState *rs, int nb_args, const char *str);
 void object_del_completion(ReadLineState *rs, int nb_args, const char *str);
 void device_add_completion(ReadLineState *rs, int nb_args, const char *str);
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5b6a8e9185..de91054523 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -380,3 +380,119 @@
 #
 ##
 { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
+
+
+##
+# @EvtchnPortType:
+#
+# An enumeration of Xen event channel port types.
+#
+# @closed: The port is unused.
+#
+# @unbound: The port is allocated and ready to be bound.
+#
+# @interdomain: The port is connected as an interdomain interrupt.
+#
+# @pirq: The port is bound to a physical IRQ (PIRQ).
+#
+# @virq: The port is bound to a virtual IRQ (VIRQ).
+#
+# @ipi: The post is an inter-processor interrupt (IPI).
+#
+# Since: 8.0
+##
+{ 'enum': 'EvtchnPortType',
+  'data': ['closed', 'unbound', 'interdomain', 'pirq', 'virq', 'ipi'],
+  'if': 'TARGET_I386' }
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
+# Since: 8.0
+##
+{ 'struct': 'EvtchnInfo',
+  'data': {'port': 'uint16',
+           'vcpu': 'uint32',
+           'type': 'EvtchnPortType',
+           'remote-domain': 'str',
+           'target': 'uint16',
+           'pending': 'bool',
+           'masked': 'bool'},
+  'if': 'TARGET_I386' }
+
+
+##
+# @xen-event-list:
+#
+# Query the Xen event channels opened by the guest.
+#
+# Returns: list of open event channel ports.
+#
+# Since: 8.0
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
+  'returns': ['EvtchnInfo'],
+  'if': 'TARGET_I386' }
+
+##
+# @xen-event-inject:
+#
+# Inject a Xen event channel port (interrupt) to the guest.
+#
+# @port: The port number
+#
+# Returns: - Nothing on success.
+#
+# Since: 8.0
+#
+# Example:
+#
+# -> { "execute": "xen-event-inject", "arguments": { "port": 1 } }
+# <- { "return": { } }
+#
+##
+{ 'command': 'xen-event-inject',
+  'data': { 'port': 'uint32' },
+  'if': 'TARGET_I386' }
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 98caf6fef6..a58de48d2a 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -54,6 +54,7 @@ static int query_error_class(const char *cmd)
         /* Only valid with accel=tcg */
         { "x-query-jit", ERROR_CLASS_GENERIC_ERROR },
         { "x-query-opcount", ERROR_CLASS_GENERIC_ERROR },
+        { "xen-event-list", ERROR_CLASS_GENERIC_ERROR },
         { NULL, -1 }
     };
     int i;
-- 
2.39.0


