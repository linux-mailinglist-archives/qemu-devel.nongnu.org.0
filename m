Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE364807B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 10:57:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3a7f-0002Tx-VW; Fri, 09 Dec 2022 04:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7J-0002R1-80
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:29 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p3a7G-0006pH-RB
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 04:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oWg3bACyN27qCqd7T3bd4nHSMuqE7sDFmlT8U9gsszA=; b=YQJC49KCwQVlgCkZpbHO5Sjfz4
 kz9eq2zCs3/etUUdV5vFivgfGJ59Ukl6poGR92CXU7SSj/cGXJyJJ7E9y44E6mToaa6ZGSo5WPupf
 jRN46RkU59XKsxf7zii5P8urOzK39ynPC5bGFOmnluicZSQV99EdkgOMpy8faKrdIxnwAY6r5ekI9
 OmGh/SoYcRQqhh0poCRw7FM3f2Yf/eadLkT8YbqhgFgsTZXzN5xltVxxKDohJ3mwnV1zXtY7EtlgR
 y/fGYrUm+5Mj2qJx1qSYMbWbdfa7Q2QccThxJ6GW8+u8otJDkaEsucgFzQ0/vCQeG5j+e3dtWGdop
 Vo6ti1Kw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p3a7G-007tiQ-9l; Fri, 09 Dec 2022 09:56:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p3a77-002tYc-TT; Fri, 09 Dec 2022 09:56:17 +0000
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
Subject: [RFC PATCH v2 07/22] pc_piix: handle XEN_EMULATE backend init
Date: Fri,  9 Dec 2022 09:55:57 +0000
Message-Id: <20221209095612.689243-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221209095612.689243-1-dwmw2@infradead.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00235e7d7be18c3eb674+7047+infradead.org+dwmw2@casper.srs.infradead.org;
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

And use newly added xen_emulated_machine_init() to iniitalize
the xenstore and the sysdev bus for future emulated devices.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Move it to xen-legacy-backend.c]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc_piix.c                   |  5 +++++
 hw/xen/xen-legacy-backend.c         | 22 ++++++++++++++++------
 include/hw/xen/xen-legacy-backend.h |  2 ++
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 13286d0739..3dcac2f4b6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,6 +47,7 @@
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
+#include "hw/xen/xen-legacy-backend.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
@@ -155,6 +156,10 @@ static void pc_init1(MachineState *machine,
             x86ms->above_4g_mem_size = 0;
             x86ms->below_4g_mem_size = machine->ram_size;
         }
+
+        if (pcms->xen_version && !xen_be_xenstore_open()) {
+            xen_emulated_machine_init();
+        }
     }
 
     pc_machine_init_sgx_epc(pcms);
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 694e7bbc54..60a7bc7ab6 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -31,6 +31,7 @@
 #include "qapi/error.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pvdev.h"
+#include "hw/xen/xen-bus.h"
 #include "monitor/qdev.h"
 
 DeviceState *xen_sysdev;
@@ -294,13 +295,15 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     xendev->debug      = debug;
     xendev->local_port = -1;
 
-    xendev->evtchndev = xenevtchn_open(NULL, 0);
-    if (xendev->evtchndev == NULL) {
-        xen_pv_printf(NULL, 0, "can't open evtchn device\n");
-        qdev_unplug(DEVICE(xendev), NULL);
-        return NULL;
+    if (xen_mode != XEN_EMULATE) {
+        xendev->evtchndev = xenevtchn_open(NULL, 0);
+        if (xendev->evtchndev == NULL) {
+            xen_pv_printf(NULL, 0, "can't open evtchn device\n");
+            qdev_unplug(DEVICE(xendev), NULL);
+            return NULL;
+        }
+        qemu_set_cloexec(xenevtchn_fd(xendev->evtchndev));
     }
-    qemu_set_cloexec(xenevtchn_fd(xendev->evtchndev));
 
     xen_pv_insert_xendev(xendev);
 
@@ -859,3 +862,10 @@ static void xenbe_register_types(void)
 }
 
 type_init(xenbe_register_types)
+
+void xen_emulated_machine_init(void)
+{
+    xen_bus_init();
+    xen_be_sysdev_init();
+    xen_be_register_common();
+}
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index 0aa171f6c2..aa09015662 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -105,4 +105,6 @@ int xen_config_dev_vfb(int vdev, const char *type);
 int xen_config_dev_vkbd(int vdev);
 int xen_config_dev_console(int vdev);
 
+void xen_emulated_machine_init(void);
+
 #endif /* HW_XEN_LEGACY_BACKEND_H */
-- 
2.35.3


