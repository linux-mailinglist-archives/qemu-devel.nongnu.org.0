Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBB16A8306
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:59:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiAN-0006ck-0U; Thu, 02 Mar 2023 07:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi8H-0003Ks-Im
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7v-00040M-6c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePpU+9DWBFidDiH7G3nMZbS+NzKRiMzrSlAzgKM7aJk=;
 b=T9wyTmXnPSL6BU7ShETwAnli8hApSM8PJUdvSlK0pIbCKoN5VT2jG7PqFVTipnVk5H3EfL
 kehTDT9npbyqjPcWzPfF7vzss2LCmx880Lqcfg0GUFyFbwS8yjHpIlx77CMq3j9N2PqM63
 3SGXwW854OqQ3SLt7kNf5s6w+FK6R6A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-6CPzGeweNvWT4ZR7mfRjLA-1; Thu, 02 Mar 2023 07:33:29 -0500
X-MC-Unique: 6CPzGeweNvWT4ZR7mfRjLA-1
Received: by mail-wr1-f69.google.com with SMTP id
 bx25-20020a5d5b19000000b002c7ce4ce3c3so3198589wrb.13
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePpU+9DWBFidDiH7G3nMZbS+NzKRiMzrSlAzgKM7aJk=;
 b=F31z4h0KxlmMmt9aEDrYrFfXyq7MTS09VA8BKnkqyccZ1cCl8/o2v9v9WhxKjsDCml
 cIUnkC+OTqMF+OwqM9yyr8H9QeTi0WpZ5eeMHLjhiumSKX9Chp1M9nV0/k86ZD234ZHs
 uJvTS9ly9bY0qZuuMHC6uqkyKMx0zSUqQ3ZBNjUKY50kuCjSr0QX8x+cAi4vVj+v4SCp
 rmyMlayuKhgwWTmxOaftOFV47bgOcd2t9LfpCSs+conMJpk7OpZF37i/7DgWyDoO0ytf
 Uk7lZ7wiJPUbtTrUNLuaG2VQKgbgmPo/88nk8zT8NPog3aoDlGa/GXXpRtk6HIz+Ubi4
 C7VA==
X-Gm-Message-State: AO0yUKVKhhL+DTtu4ZefaVugghJd9qp1vg3C7N64tiT3RkrnHiuB2i9/
 QX5NwHbvI9qKLkmGYNaUpB8lH/p0Lp77gvZWfxudivPvUz9d7m+XacEIMydauTzdJrfRR1i0mqB
 J7ZZB9BSQsn2eDWSq8RMuE2n92nmQx+4wkGW3vqGXWnyqEW87AyWzyGyoh6jKQ8up6AXPb0tOIA
 w=
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr7505550wmp.0.1677760408235; 
 Thu, 02 Mar 2023 04:33:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ui5wPSmfzZCPaKE3XjDGsQiBjd/xztOLJXOUP3YZhjXntL3H9f0qSKWN10bv3+KQSTRldEw==
X-Received: by 2002:a05:600c:4b30:b0:3df:fbc7:5b10 with SMTP id
 i48-20020a05600c4b3000b003dffbc75b10mr7505528wmp.0.1677760407856; 
 Thu, 02 Mar 2023 04:33:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003eb369abd92sm3374728wmo.2.2023.03.02.04.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 60/62] hw/xen: Subsume xen_be_register_common() into
 xen_be_init()
Date: Thu,  2 Mar 2023 13:30:27 +0100
Message-Id: <20230302123029.153265-61-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
index b9a6f7f5381e..e5a1dd19f45a 100644
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
index 085fd31ef7ab..afba71f6eb7e 100644
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
+    xen_set_dynamic_sysbus();
 
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
-
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
index 20c9611d7181..2e759d0619c6 100644
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
index be281e1f38eb..e31cd3a068d3 100644
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
2.39.1


