Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB6B66D1C0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:23:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXq0-0007aK-Vu; Mon, 16 Jan 2023 17:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpP-0007Qj-AK
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:43 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+491b11caf3ce55304f6a+7085+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pHXpF-00070R-2q
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=I4cPdJhZGCs89YzkPdbpocnQ4ODuupuPO2GXs0o7Zaw=; b=ZObz3IoDCy62E5bJTCzKYWtrZo
 nWXRi/0FnMCJBbdr7US7ceQnjYX7SCxcEAOMw7zoIQFc9wJgGKdVA0qi/RkM7B7+v3CY46ViZ3ZoS
 bOkzmWGWOYRrNrqrh7Ad0DI9OCA4f8Dnzk6UToCsU8p8nbU4SqFIS2NTihDUQr1a6lJBLGeU//Ne6
 TcCzS2wQQ8LQmDX9ARwb/oLD3wSxhhFMQ9EBLsDvlclX6QzwNpTY5Aoc2cYLoa1hgIPzj6ejkmzm+
 DwyfVMPfXeba9UQr2X4JiI8mZ6gvKN51cqNp8UfeQgiMxPdSX4Oht6zwDtUTVp9KHnhiWMduBQZPy
 kMXyGyvA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHXoy-005juf-2P; Mon, 16 Jan 2023 22:19:17 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pHXp8-004iYB-0V; Mon, 16 Jan 2023 22:19:26 +0000
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
Subject: [RFC PATCH v7bis 15/19] i386/xen: Initialize XenBus and legacy
 backends from pc_init1()
Date: Mon, 16 Jan 2023 22:19:15 +0000
Message-Id: <20230116221919.1124201-16-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116221919.1124201-1-dwmw2@infradead.org>
References: <20230116215805.1123514-1-dwmw2@infradead.org>
 <20230116221919.1124201-1-dwmw2@infradead.org>
MIME-Version: 1.0
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

From: David Woodhouse <dwmw@amazon.co.uk>

Now that we're close to being able to use the PV backends without actual
Xen, move the bus instantiation out from xen_hvm_init_pc() to pc_init1().

However, still only do it for (xen_mode == XEN_ATTACH) (i.e. when running
on true Xen) because we don't have XenStore ops for emulation yet, and
the XenBus instantiation failure is fatal. Once we have a functional
XenStore for emulated mode, this will become (xen_mode != XEN_DISABLED).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc_piix.c     | 17 +++++++++++++++++
 hw/i386/xen/xen-hvm.c | 11 -----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..d6e61b47b4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -59,6 +59,10 @@
 #include <xen/hvm/hvm_info_table.h>
 #include "hw/xen/xen_pt.h"
 #endif
+#ifdef CONFIG_XENFV_MACHINE
+#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen-bus.h"
+#endif
 #include "migration/global_state.h"
 #include "migration/misc.h"
 #include "sysemu/numa.h"
@@ -170,6 +174,19 @@ static void pc_init1(MachineState *machine,
         }
     }
 
+#ifdef CONFIG_XENFV_MACHINE
+    if (xen_mode == XEN_ATTACH) {
+        /* Initialize backend core & drivers */
+        xen_bus_init();
+
+        if (xen_be_init() != 0) {
+            error_report("xen backend core setup failed");
+            exit(1);
+        }
+        xen_be_register_common();
+    }
+#endif
+
     pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 779d923e10..48f289f8ee 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -20,8 +20,6 @@
 #include "hw/i386/apic-msidef.h"
 #include "hw/xen/xen_native.h"
 #include "hw/xen/xen_backend_ops.h"
-#include "hw/xen/xen-legacy-backend.h"
-#include "hw/xen/xen-bus.h"
 #include "hw/xen/xen-x86.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
@@ -1505,15 +1503,6 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     QLIST_INIT(&state->dev_list);
     device_listener_register(&state->device_listener);
 
-    xen_bus_init();
-
-    /* Initialize backend core & drivers */
-    if (xen_be_init() != 0) {
-        error_report("xen backend core setup failed");
-        goto err;
-    }
-    xen_be_register_common();
-
     QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);
 
-- 
2.39.0


