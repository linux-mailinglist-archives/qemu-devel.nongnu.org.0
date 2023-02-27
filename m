Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB26C6A4470
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:31:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeWw-0007sX-0U; Mon, 27 Feb 2023 09:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVe-0005Ns-7S
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:54 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pWeVN-0004WU-63
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=i4OsAetjSULZcljsIq8Trhu2StI+THADJDoctT3GjoQ=; b=jTTTWGP4Jwb/FfLN0nVc1GEDwH
 SIWgVVNVnn8k71Mu9rxHnVZWNM8R0w8RsMhrF7RNzeNWRrCf7xSbQrML66bt/GWy1E7Ax0/H2rBPL
 rekYtaCQSfe/6UKdyb/C8/RzKjAol6pPyZ8dtyJ5wHRe4kcidsM5v3TWQSB1EwrAnzHSI9eIwJE5H
 FpY3yvydjCSsK2adyuBivm0osIvrnWvvS/XcKt7nLsm+HLzlj3uceLobOg8StoWLR9EFiCNsvw8wJ
 yFAvPFJdGHzHYJW9HJ06FegvaMoNDSHy/WWT1QdePCurCZv25xaw17SgtJlCZBS16dGFvJMuxZm+O
 9jeBk0ow==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pWeV8-000AUZ-AI; Mon, 27 Feb 2023 14:29:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pWeV8-0027EJ-0y; Mon, 27 Feb 2023 14:29:14 +0000
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
Subject: [PATCH v14 60/60] hw/xen: Subsume xen_be_register_common() into
 xen_be_init()
Date: Mon, 27 Feb 2023 14:29:08 +0000
Message-Id: <20230227142908.503517-61-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227142908.503517-1-dwmw2@infradead.org>
References: <20230227142908.503517-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+00d7f2b94bb5c8854cf5+7127+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: David Woodhouse <dwmw@amazon.co.uk>

Every caller of xen_be_init() checks and exits on error, then calls
xen_be_register_common(). Just make xen_be_init() abort for itself and
return void, and register the common devices too.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/xen-hvm.c               |  8 +----
 hw/xen/xen-legacy-backend.c         | 56 ++++++++++++-----------------
 hw/xenpv/xen_machine_pv.c           |  6 +---
 include/hw/xen/xen-legacy-backend.h |  3 +-
 4 files changed, 25 insertions(+), 48 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index b9a6f7f538..e5a1dd19f4 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -1502,13 +1502,7 @@ void xen_hvm_init_pc(PCMachineState *pcms, MemoryRegion **ram_memory)
     device_listener_register(&state->device_listener);
 
     xen_bus_init();
-
-    /* Initialize backend core & drivers */
-    if (xen_be_init() != 0) {
-        error_report("xen backend core setup failed");
-        goto err;
-    }
-    xen_be_register_common();
+    xen_be_init();
 
     QLIST_INIT(&xen_physmap);
     xen_read_physmap(state);
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 085fd31ef7..afba71f6eb 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -676,21 +676,30 @@ void xenstore_update_fe(char *watch, struct XenLegacyDevice *xendev)
 }
 /* -------------------------------------------------------------------- */
 
-int xen_be_init(void)
+static void xen_set_dynamic_sysbus(void)
+{
+    Object *machine = qdev_get_machine();
+    ObjectClass *oc = object_get_class(machine);
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
+}
+
+void xen_be_init(void)
 {
     xengnttab_handle *gnttabdev;
 
     xenstore = xs_daemon_open();
     if (!xenstore) {
         xen_pv_printf(NULL, 0, "can't connect to xenstored\n");
-        return -1;
+        exit(1);
     }
 
     qemu_set_fd_handler(xs_fileno(xenstore), xenstore_update, NULL, NULL);
 
     if (xen_xc == NULL || xen_fmem == NULL) {
-        /* Check if xen_init() have been called */
-        goto err;
+        xen_pv_printf(NULL, 0, "Xen operations not set up\n");
+        exit(1);
     }
 
     gnttabdev = xengnttab_open(NULL, 0);
@@ -706,23 +715,16 @@ int xen_be_init(void)
     xen_sysbus = qbus_new(TYPE_XENSYSBUS, xen_sysdev, "xen-sysbus");
     qbus_set_bus_hotplug_handler(xen_sysbus);
 
-    return 0;
-
-err:
-    qemu_set_fd_handler(xs_fileno(xenstore), NULL, NULL, NULL);
-    xs_daemon_close(xenstore);
-    xenstore = NULL;
-
-    return -1;
-}
-
-static void xen_set_dynamic_sysbus(void)
-{
-    Object *machine = qdev_get_machine();
-    ObjectClass *oc = object_get_class(machine);
-    MachineClass *mc = MACHINE_CLASS(oc);
+    xen_set_dynamic_sysbus();
 
-    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_XENSYSDEV);
+    xen_be_register("console", &xen_console_ops);
+    xen_be_register("vkbd", &xen_kbdmouse_ops);
+#ifdef CONFIG_VIRTFS
+    xen_be_register("9pfs", &xen_9pfs_ops);
+#endif
+#ifdef CONFIG_USB_LIBUSB
+    xen_be_register("qusb", &xen_usb_ops);
+#endif
 }
 
 int xen_be_register(const char *type, struct XenDevOps *ops)
@@ -744,20 +746,6 @@ int xen_be_register(const char *type, struct XenDevOps *ops)
     return xenstore_scan(type, xen_domid, ops);
 }
 
-void xen_be_register_common(void)
-{
-    xen_set_dynamic_sysbus();
-
-    xen_be_register("console", &xen_console_ops);
-    xen_be_register("vkbd", &xen_kbdmouse_ops);
-#ifdef CONFIG_VIRTFS
-    xen_be_register("9pfs", &xen_9pfs_ops);
-#endif
-#ifdef CONFIG_USB_LIBUSB
-    xen_be_register("qusb", &xen_usb_ops);
-#endif
-}
-
 int xen_be_bind_evtchn(struct XenLegacyDevice *xendev)
 {
     if (xendev->local_port != -1) {
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 20c9611d71..2e759d0619 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -36,10 +36,7 @@ static void xen_init_pv(MachineState *machine)
     int i;
 
     /* Initialize backend core & drivers */
-    if (xen_be_init() != 0) {
-        error_report("%s: xen backend core setup failed", __func__);
-        exit(1);
-    }
+    xen_be_init();
 
     switch (xen_mode) {
     case XEN_ATTACH:
@@ -55,7 +52,6 @@ static void xen_init_pv(MachineState *machine)
         break;
     }
 
-    xen_be_register_common();
     xen_be_register("vfb", &xen_framebuffer_ops);
     xen_be_register("qnic", &xen_netdev_ops);
 
diff --git a/include/hw/xen/xen-legacy-backend.h b/include/hw/xen/xen-legacy-backend.h
index be281e1f38..e31cd3a068 100644
--- a/include/hw/xen/xen-legacy-backend.h
+++ b/include/hw/xen/xen-legacy-backend.h
@@ -42,8 +42,7 @@ int xenstore_read_fe_uint64(struct XenLegacyDevice *xendev, const char *node,
 void xen_be_check_state(struct XenLegacyDevice *xendev);
 
 /* xen backend driver bits */
-int xen_be_init(void);
-void xen_be_register_common(void);
+void xen_be_init(void);
 int xen_be_register(const char *type, struct XenDevOps *ops);
 int xen_be_set_state(struct XenLegacyDevice *xendev, enum xenbus_state state);
 int xen_be_bind_evtchn(struct XenLegacyDevice *xendev);
-- 
2.39.0


