Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7154D64E563
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 01:50:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5ynN-0005Dr-I5; Thu, 15 Dec 2022 19:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5yn8-0005D5-CP
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:36 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p5yn5-0006c1-FB
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 19:41:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RO1GgqSiEtjgr0AaYpO5Ge7U63e0Y/fq9edf1weTkbc=; b=O9NPinrEAdVqEvG0TUvQRVPTkj
 AlOabZKqkW0Q/0VdvmPT3Evy3BFdUTv3U/YhyFWIhHu9bg8BKI1O46Yc8P9/isujeNWEFVjq5VC+T
 t0qAnC/NIXYs/4rMu8+IrsOcCs8Dvk3AdMRHznhPR7Sj57aGTseEoF9fNjL1qcPRDT7//VRN8j6vU
 dIZ5u3EOIvAaOSUdh+qjDfjOS6ZBel7Wm8aUKokJmuyIHZ3FWOb7jgvbPV+kxdebMGuw9xxBSRmzK
 bjjAvyPVp3S+LiG7W7t2mQbargkl2g8O2mOb3K6sdBT1XrxGkHXe9uKt/0nXPZ1to3zaGQdxDa5Bt
 FEPsBR7w==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5ymx-00Azz0-9d; Fri, 16 Dec 2022 00:41:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p5ymw-003cQK-Gh; Fri, 16 Dec 2022 00:41:22 +0000
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
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v3 35/38] i386/xen: add monitor commands to test event
 injection
Date: Fri, 16 Dec 2022 00:41:14 +0000
Message-Id: <20221216004117.862106-36-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216004117.862106-1-dwmw2@infradead.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+54656a84ae694b50c6d0+7054+infradead.org+dwmw2@desiato.srs.infradead.org;
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
---
 hmp-commands.hx          | 30 +++++++++++++++
 hw/i386/kvm/xen_evtchn.c | 83 ++++++++++++++++++++++++++++++++++++++++
 hw/i386/kvm/xen_evtchn.h |  3 ++
 monitor/misc.c           |  4 ++
 4 files changed, 120 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 673e39a697..a36516c287 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1815,3 +1815,33 @@ SRST
   Dump the FDT in dtb format to *filename*.
 ERST
 #endif
+
+#if defined(CONFIG_XEN_EMU)
+
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
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 225d984371..9292602c09 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -19,6 +19,8 @@
 #include "exec/target_page.h"
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
+#include "qapi/qmp/qdict.h"
 
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
@@ -955,3 +957,84 @@ int xen_evtchn_send_op(struct evtchn_send *send)
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
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    void *shinfo, *pending, *mask;
+    int i;
+
+    if (!s) {
+        monitor_printf(mon, "Xen event channel emulation not enabled\n");
+        return;
+    }
+
+    shinfo = xen_overlay_page_ptr(XENMAPSPACE_shared_info, 0);
+    if (!shinfo) {
+        monitor_printf(mon, "Xen shared info page not allocated\n");
+        return;
+    }
+    if (xen_is_long_mode()) {
+        pending = shinfo + offsetof(struct shared_info, evtchn_pending);
+        mask = shinfo + offsetof(struct shared_info, evtchn_mask);
+    } else {
+        pending = shinfo + offsetof(struct compat_shared_info, evtchn_pending);
+        mask = shinfo + offsetof(struct compat_shared_info, evtchn_mask);
+    }
+
+    qemu_mutex_lock(&s->port_lock);
+
+    for (i = 0; i < s->nr_ports; i++) {
+        XenEvtchnPort *p = &s->port_table[i];
+
+        if (p->type == EVTCHNSTAT_closed) {
+            continue;
+        }
+
+        monitor_printf(mon, "port %4u %s/%d vcpu:%d pending:%d mask:%d\n", i,
+                       type_names[p->type], p->type_val, p->vcpu,
+                       test_bit(i, pending), test_bit(i, mask));
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+}
+
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict)
+{
+    XenEvtchnState *s = xen_evtchn_singleton;
+    int port = qdict_get_int(qdict, "port");
+    XenEvtchnPort *p;
+
+    if (!s) {
+        monitor_printf(mon, "Xen event channel emulation not enabled\n");
+        return;
+    }
+
+    if (!valid_port(port)) {
+        monitor_printf(mon, "Invalid port %d\n", port);
+        return;
+    }
+    p = &s->port_table[port];
+
+    qemu_mutex_lock(&s->port_lock);
+
+    monitor_printf(mon, "port %4u %s/%d vcpu:%d\n", port,
+                   type_names[p->type], p->type_val, p->vcpu);
+
+    if (set_port_pending(s, port)) {
+        monitor_printf(mon, "Failed to set port %d\n", port);
+    } else {
+        monitor_printf(mon, "Delivered port %d\n", port);
+    }
+
+    qemu_mutex_unlock(&s->port_lock);
+}
+
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index b93f534bee..2acbaeabaa 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -13,6 +13,9 @@
 void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
 
+void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
+void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
+
 struct evtchn_status;
 struct evtchn_close;
 struct evtchn_unmask;
diff --git a/monitor/misc.c b/monitor/misc.c
index 205487e2b9..2b11c0f86a 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -88,6 +88,10 @@
 /* Make devices configuration available for use in hmp-commands*.hx templates */
 #include CONFIG_DEVICES
 
+#ifdef CONFIG_XEN_EMU
+#include "hw/i386/kvm/xen_evtchn.h"
+#endif
+
 /* file descriptors passed via SCM_RIGHTS */
 typedef struct mon_fd_t mon_fd_t;
 struct mon_fd_t {
-- 
2.35.3


