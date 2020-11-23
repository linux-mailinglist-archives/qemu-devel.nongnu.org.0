Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7702C0D71
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:28:29 +0100 (CET)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCpQ-0005Ax-LO
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcN-000350-0q
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCcI-0007nw-JH
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBRPegfxRDUN+YxiiiIzCseZErrn9Vc4ABjB31Iu6Ks=;
 b=aVec8/rAch74t7E7Ya3fo0PSjhWGD/LCCMwjSC9JFY62S3Mn5ZP1tVLYcIDZ+8JMVlxiaI
 YSnRKhBsWXpsX5v6dOzY1/OYe1TOcQDLf4/7ueRocRA7uUn4kmTff4ZhMyAjMblzkgMvB9
 eBEhphEJEItt7BHpxxMRb72AAfKJ8Nw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-cUzHmYDKNrCX1OS672ODig-1; Mon, 23 Nov 2020 09:14:50 -0500
X-MC-Unique: cUzHmYDKNrCX1OS672ODig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B9D0100C60B
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFBEA5D9E2;
 Mon, 23 Nov 2020 14:14:47 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/36] vl: separate qemu_create_early_backends
Date: Mon, 23 Nov 2020 09:14:15 -0500
Message-Id: <20201123141435.2726558-17-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Early" backends are created before the machine and can be used as
machine options.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 123 +++++++++++++++++++++++++++------------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index dc0cdc3417..0a61df55b8 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -117,6 +117,14 @@
 
 #define MAX_VIRTIO_CONSOLES 1
 
+typedef struct BlockdevOptionsQueueEntry {
+    BlockdevOptions *bdo;
+    Location loc;
+    QSIMPLEQ_ENTRY(BlockdevOptionsQueueEntry) entry;
+} BlockdevOptionsQueueEntry;
+
+typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
+
 static const char *cpu_option;
 static const char *data_dir[16];
 static int data_dir_idx;
@@ -126,7 +134,9 @@ static const char *boot_once;
 static const char *incoming;
 static const char *loadvm;
 static int display_remote;
+static int snapshot;
 static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
+static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 static bool nographic = false;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 static int mem_prealloc; /* force preallocation of physical target memory */
@@ -1043,14 +1053,6 @@ static void default_drive(int enable, int snapshot, BlockInterfaceType type,
 
 }
 
-typedef struct BlockdevOptionsQueueEntry {
-    BlockdevOptions *bdo;
-    Location loc;
-    QSIMPLEQ_ENTRY(BlockdevOptionsQueueEntry) entry;
-} BlockdevOptionsQueueEntry;
-
-typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
-
 static void configure_blockdev(BlockdevOptionsQueue *bdo_queue,
                                MachineClass *machine_class, int snapshot)
 {
@@ -2640,7 +2642,7 @@ static int machine_set_property(void *opaque,
  * cannot be created here, as it depends on the chardev
  * already existing.
  */
-static bool object_create_initial(const char *type, QemuOpts *opts)
+static bool object_create_early(const char *type, QemuOpts *opts)
 {
     if (user_creatable_print_help(type, opts)) {
         exit(0);
@@ -2696,6 +2698,58 @@ static bool object_create_initial(const char *type, QemuOpts *opts)
     return true;
 }
 
+static void qemu_create_early_backends(void)
+{
+    MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
+
+    if ((alt_grab || ctrl_grab) && dpy.type != DISPLAY_TYPE_SDL) {
+        error_report("-alt-grab and -ctrl-grab are only valid "
+                     "for SDL, ignoring option");
+    }
+    if (dpy.has_window_close &&
+        (dpy.type != DISPLAY_TYPE_GTK && dpy.type != DISPLAY_TYPE_SDL)) {
+        error_report("-no-quit is only valid for GTK and SDL, "
+                     "ignoring option");
+    }
+
+    qemu_display_early_init(&dpy);
+    qemu_console_early_init();
+
+    if (dpy.has_gl && dpy.gl != DISPLAYGL_MODE_OFF && display_opengl == 0) {
+#if defined(CONFIG_OPENGL)
+        error_report("OpenGL is not supported by the display");
+#else
+        error_report("OpenGL support is disabled");
+#endif
+        exit(1);
+    }
+
+    qemu_opts_foreach(qemu_find_opts("object"),
+                      user_creatable_add_opts_foreach,
+                      object_create_early, &error_fatal);
+
+    /* spice needs the timers to be initialized by this point */
+    /* spice must initialize before audio as it changes the default auiodev */
+    /* spice must initialize before chardevs (for spicevmc and spiceport) */
+    qemu_spice.init();
+
+    qemu_opts_foreach(qemu_find_opts("chardev"),
+                      chardev_init_func, NULL, &error_fatal);
+
+#ifdef CONFIG_VIRTFS
+    qemu_opts_foreach(qemu_find_opts("fsdev"),
+                      fsdev_init_func, NULL, &error_fatal);
+#endif
+
+    /*
+     * Note: we need to create audio and block backends before
+     * machine_set_property(), so machine properties can refer to
+     * them.
+     */
+    configure_blockdev(&bdo_queue, machine_class, snapshot);
+    audio_init_audiodevs();
+}
+
 
 /*
  * The remainder of object creation happens after the
@@ -2703,7 +2757,7 @@ static bool object_create_initial(const char *type, QemuOpts *opts)
  */
 static bool object_create_delayed(const char *type, QemuOpts *opts)
 {
-    return !object_create_initial(type, opts);
+    return !object_create_early(type, opts);
 }
 
 
@@ -3314,7 +3368,6 @@ static void qemu_machine_creation_done(void)
 
 void qemu_init(int argc, char **argv, char **envp)
 {
-    int snapshot = 0;
     QemuOpts *opts, *machine_opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
     QemuOptsList *olist;
@@ -3327,7 +3380,6 @@ void qemu_init(int argc, char **argv, char **envp)
     FILE *vmstate_dump_file = NULL;
     Error *err = NULL;
     bool have_custom_ram_size;
-    BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -4299,52 +4351,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
     qemu_disable_default_devices();
     qemu_create_default_devices();
-    if ((alt_grab || ctrl_grab) && dpy.type != DISPLAY_TYPE_SDL) {
-        error_report("-alt-grab and -ctrl-grab are only valid "
-                     "for SDL, ignoring option");
-    }
-    if (dpy.has_window_close &&
-        (dpy.type != DISPLAY_TYPE_GTK && dpy.type != DISPLAY_TYPE_SDL)) {
-        error_report("-no-quit is only valid for GTK and SDL, "
-                     "ignoring option");
-    }
-
-    qemu_display_early_init(&dpy);
-    qemu_console_early_init();
-
-    if (dpy.has_gl && dpy.gl != DISPLAYGL_MODE_OFF && display_opengl == 0) {
-#if defined(CONFIG_OPENGL)
-        error_report("OpenGL is not supported by the display");
-#else
-        error_report("OpenGL support is disabled");
-#endif
-        exit(1);
-    }
-
-    qemu_opts_foreach(qemu_find_opts("object"),
-                      user_creatable_add_opts_foreach,
-                      object_create_initial, &error_fatal);
-
-    /* spice needs the timers to be initialized by this point */
-    /* spice must initialize before audio as it changes the default auiodev */
-    /* spice must initialize before chardevs (for spicevmc and spiceport) */
-    qemu_spice.init();
-
-    qemu_opts_foreach(qemu_find_opts("chardev"),
-                      chardev_init_func, NULL, &error_fatal);
-
-#ifdef CONFIG_VIRTFS
-    qemu_opts_foreach(qemu_find_opts("fsdev"),
-                      fsdev_init_func, NULL, &error_fatal);
-#endif
-
-    /*
-     * Note: we need to create audio and block backends before
-     * machine_set_property(), so machine properties can refer to
-     * them.
-     */
-    configure_blockdev(&bdo_queue, machine_class, snapshot);
-    audio_init_audiodevs();
+    qemu_create_early_backends();
 
     machine_opts = qemu_get_machine_opts();
     qemu_opt_foreach(machine_opts, machine_set_property, current_machine,
-- 
2.26.2



