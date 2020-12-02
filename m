Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F322CB80C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:03:35 +0100 (CET)
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkO2w-0001Wi-RO
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND0-0003SR-V1
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCQ-0003lT-8a
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWqme3AoyP8MgGDFY1gVUpTA5xFQw+YG5gnh7aXki9M=;
 b=TbBWl/95JMVnKY+2jQPd/1d4cnFOMfvaYzTC9JB9yNg7/aEM9kZ2tqEt0YWrfTX8aVVz2g
 NQNz9jd57qT3W6XPbxjyiftzvK3TwH6tQl7DTBwCtVk09Hv5QyRNl899k9lmUmtg7opgAu
 N4JowBsR59TfXAwvXO8ublWF5DNCj1A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-xYhPZLdIPc6bUIZNbV-mpw-1; Wed, 02 Dec 2020 03:09:14 -0500
X-MC-Unique: xYhPZLdIPc6bUIZNbV-mpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D359D80364B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97C2010013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 064/113] vl: extract default devices to separate functions
Date: Wed,  2 Dec 2020 03:08:00 -0500
Message-Id: <20201202080849.4125477-65-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 216 +++++++++++++++++++++++++++------------------------
 1 file changed, 114 insertions(+), 102 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index cb4b870f09..1a80a9a68d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -125,7 +125,9 @@ static const char *boot_order;
 static const char *boot_once;
 static const char *incoming;
 static const char *loadvm;
+static int display_remote;
 static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
+static bool nographic = false;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 static int mem_prealloc; /* force preallocation of physical target memory */
 int display_opengl;
@@ -147,6 +149,7 @@ static int rtc_host_datetime_offset = -1; /* valid & used only with
                                              RTC_BASE_DATETIME */
 QEMUClockType rtc_clock;
 int vga_interface_type = VGA_NONE;
+static const char *vga_model = NULL;
 static DisplayOptions dpy;
 static int num_serial_hds;
 static Chardev **serial_hds;
@@ -2224,6 +2227,115 @@ static int foreach_device_config(int type, int (*func)(const char *cmdline))
     return 0;
 }
 
+static void qemu_disable_default_devices(void)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
+    qemu_opts_foreach(qemu_find_opts("device"),
+                      default_driver_check, NULL, NULL);
+    qemu_opts_foreach(qemu_find_opts("global"),
+                      default_driver_check, NULL, NULL);
+
+    if (!vga_model && !default_vga) {
+        vga_interface_type = VGA_DEVICE;
+    }
+    if (!has_defaults || machine_class->no_serial) {
+        default_serial = 0;
+    }
+    if (!has_defaults || machine_class->no_parallel) {
+        default_parallel = 0;
+    }
+    if (!has_defaults || machine_class->no_floppy) {
+        default_floppy = 0;
+    }
+    if (!has_defaults || machine_class->no_cdrom) {
+        default_cdrom = 0;
+    }
+    if (!has_defaults || machine_class->no_sdcard) {
+        default_sdcard = 0;
+    }
+    if (!has_defaults) {
+        default_monitor = 0;
+        default_net = 0;
+        default_vga = 0;
+    }
+}
+
+static void qemu_create_default_devices(void)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
+    if (is_daemonized()) {
+        /* According to documentation and historically, -nographic redirects
+         * serial port, parallel port and monitor to stdio, which does not work
+         * with -daemonize.  We can redirect these to null instead, but since
+         * -nographic is legacy, let's just error out.
+         * We disallow -nographic only if all other ports are not redirected
+         * explicitly, to not break existing legacy setups which uses
+         * -nographic _and_ redirects all ports explicitly - this is valid
+         * usage, -nographic is just a no-op in this case.
+         */
+        if (nographic
+            && (default_parallel || default_serial || default_monitor)) {
+            error_report("-nographic cannot be used with -daemonize");
+            exit(1);
+        }
+    }
+
+    if (nographic) {
+        if (default_parallel)
+            add_device_config(DEV_PARALLEL, "null");
+        if (default_serial && default_monitor) {
+            add_device_config(DEV_SERIAL, "mon:stdio");
+        } else {
+            if (default_serial)
+                add_device_config(DEV_SERIAL, "stdio");
+            if (default_monitor)
+                monitor_parse("stdio", "readline", false);
+        }
+    } else {
+        if (default_serial)
+            add_device_config(DEV_SERIAL, "vc:80Cx24C");
+        if (default_parallel)
+            add_device_config(DEV_PARALLEL, "vc:80Cx24C");
+        if (default_monitor)
+            monitor_parse("vc:80Cx24C", "readline", false);
+    }
+
+    if (default_net) {
+        QemuOptsList *net = qemu_find_opts("net");
+        qemu_opts_parse(net, "nic", true, &error_abort);
+#ifdef CONFIG_SLIRP
+        qemu_opts_parse(net, "user", true, &error_abort);
+#endif
+    }
+
+#if defined(CONFIG_VNC)
+    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
+        display_remote++;
+    }
+#endif
+    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
+        if (!qemu_display_find_default(&dpy)) {
+            dpy.type = DISPLAY_TYPE_NONE;
+#if defined(CONFIG_VNC)
+            vnc_parse("localhost:0,to=99,id=default", &error_abort);
+#endif
+        }
+    }
+    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
+        dpy.type = DISPLAY_TYPE_NONE;
+    }
+
+    /* If no default VGA is requested, the default is "none".  */
+    if (default_vga) {
+        vga_model = get_default_vga_model(machine_class);
+    }
+    if (vga_model) {
+        select_vgahw(machine_class, vga_model);
+    }
+}
+
 static int serial_parse(const char *devname)
 {
     int index = num_serial_hds;
@@ -3208,10 +3320,7 @@ void qemu_init(int argc, char **argv, char **envp)
     int optind;
     const char *optarg;
     MachineClass *machine_class;
-    const char *vga_model = NULL;
     bool userconfig = true;
-    bool nographic = false;
-    int display_remote = 0;
     ram_addr_t maxram_size;
     uint64_t ram_slots = 0;
     FILE *vmstate_dump_file = NULL;
@@ -4187,97 +4296,8 @@ void qemu_init(int argc, char **argv, char **envp)
                                machine_class->default_machine_opts, 0);
     }
 
-    qemu_opts_foreach(qemu_find_opts("device"),
-                      default_driver_check, NULL, NULL);
-    qemu_opts_foreach(qemu_find_opts("global"),
-                      default_driver_check, NULL, NULL);
-
-    if (!vga_model && !default_vga) {
-        vga_interface_type = VGA_DEVICE;
-    }
-    if (!has_defaults || machine_class->no_serial) {
-        default_serial = 0;
-    }
-    if (!has_defaults || machine_class->no_parallel) {
-        default_parallel = 0;
-    }
-    if (!has_defaults || machine_class->no_floppy) {
-        default_floppy = 0;
-    }
-    if (!has_defaults || machine_class->no_cdrom) {
-        default_cdrom = 0;
-    }
-    if (!has_defaults || machine_class->no_sdcard) {
-        default_sdcard = 0;
-    }
-    if (!has_defaults) {
-        default_monitor = 0;
-        default_net = 0;
-        default_vga = 0;
-    }
-
-    if (is_daemonized()) {
-        /* According to documentation and historically, -nographic redirects
-         * serial port, parallel port and monitor to stdio, which does not work
-         * with -daemonize.  We can redirect these to null instead, but since
-         * -nographic is legacy, let's just error out.
-         * We disallow -nographic only if all other ports are not redirected
-         * explicitly, to not break existing legacy setups which uses
-         * -nographic _and_ redirects all ports explicitly - this is valid
-         * usage, -nographic is just a no-op in this case.
-         */
-        if (nographic
-            && (default_parallel || default_serial || default_monitor)) {
-            error_report("-nographic cannot be used with -daemonize");
-            exit(1);
-        }
-    }
-
-    if (nographic) {
-        if (default_parallel)
-            add_device_config(DEV_PARALLEL, "null");
-        if (default_serial && default_monitor) {
-            add_device_config(DEV_SERIAL, "mon:stdio");
-        } else {
-            if (default_serial)
-                add_device_config(DEV_SERIAL, "stdio");
-            if (default_monitor)
-                monitor_parse("stdio", "readline", false);
-        }
-    } else {
-        if (default_serial)
-            add_device_config(DEV_SERIAL, "vc:80Cx24C");
-        if (default_parallel)
-            add_device_config(DEV_PARALLEL, "vc:80Cx24C");
-        if (default_monitor)
-            monitor_parse("vc:80Cx24C", "readline", false);
-    }
-
-    if (default_net) {
-        QemuOptsList *net = qemu_find_opts("net");
-        qemu_opts_parse(net, "nic", true, &error_abort);
-#ifdef CONFIG_SLIRP
-        qemu_opts_parse(net, "user", true, &error_abort);
-#endif
-    }
-
-#if defined(CONFIG_VNC)
-    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
-        display_remote++;
-    }
-#endif
-    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
-        if (!qemu_display_find_default(&dpy)) {
-            dpy.type = DISPLAY_TYPE_NONE;
-#if defined(CONFIG_VNC)
-            vnc_parse("localhost:0,to=99,id=default", &error_abort);
-#endif
-        }
-    }
-    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
-        dpy.type = DISPLAY_TYPE_NONE;
-    }
-
+    qemu_disable_default_devices();
+    qemu_create_default_devices();
     if ((alt_grab || ctrl_grab) && dpy.type != DISPLAY_TYPE_SDL) {
         error_report("-alt-grab and -ctrl-grab are only valid "
                      "for SDL, ignoring option");
@@ -4423,14 +4443,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_semihosting_connect_chardevs();
     qemu_semihosting_console_init();
 
-    /* If no default VGA is requested, the default is "none".  */
-    if (default_vga) {
-        vga_model = get_default_vga_model(machine_class);
-    }
-    if (vga_model) {
-        select_vgahw(machine_class, vga_model);
-    }
-
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
        clock values from the log. */
-- 
2.26.2



