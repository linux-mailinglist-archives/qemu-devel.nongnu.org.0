Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A36952CB782
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:45:58 +0100 (CET)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNlt-0005I2-IC
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkND7-0003VL-75
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCR-0003lm-3A
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rP6OUvjx4v7+K7ARm6JuYlhQiEZ8+rlZHB8RtHnnsmQ=;
 b=Vsrti59wfFJn6V0xKJgPst6Trw6UOQWZ4YeXo42OA09627S0qoR4hPsPJ4LDRHEJ6sAipw
 mJafJp3G994vwFoCq2UWRMEJRbofeoFG+Z/73LR40Hb05+xEf4Q3UJdeGLdrvhM/Kfx/QO
 QH9UjCygeoZ2Fbc9cvFvxoY9rKmGiiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-eeaM1bJ8PFiJX-DlmK_kHQ-1; Wed, 02 Dec 2020 03:09:15 -0500
X-MC-Unique: eeaM1bJ8PFiJX-DlmK_kHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A4DE80364D
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D57610013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 066/113] vl: separate qemu_create_early_backends
Date: Wed,  2 Dec 2020 03:08:02 -0500
Message-Id: <20201202080849.4125477-67-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

"Early" backends are created before the machine and can be used as
machine options.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 123 +++++++++++++++++++++++++++------------------------
 1 file changed, 65 insertions(+), 58 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 91ef21833b..aafcbec356 100644
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
@@ -2644,7 +2646,7 @@ static int machine_set_property(void *opaque,
  * cannot be created here, as it depends on the chardev
  * already existing.
  */
-static bool object_create_initial(const char *type, QemuOpts *opts)
+static bool object_create_early(const char *type, QemuOpts *opts)
 {
     if (user_creatable_print_help(type, opts)) {
         exit(0);
@@ -2700,6 +2702,58 @@ static bool object_create_initial(const char *type, QemuOpts *opts)
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
@@ -2707,7 +2761,7 @@ static bool object_create_initial(const char *type, QemuOpts *opts)
  */
 static bool object_create_delayed(const char *type, QemuOpts *opts)
 {
-    return !object_create_initial(type, opts);
+    return !object_create_early(type, opts);
 }
 
 
@@ -3313,7 +3367,6 @@ static void qemu_machine_creation_done(void)
 
 void qemu_init(int argc, char **argv, char **envp)
 {
-    int snapshot = 0;
     QemuOpts *opts, *machine_opts;
     QemuOpts *icount_opts = NULL, *accel_opts = NULL;
     QemuOptsList *olist;
@@ -3326,7 +3379,6 @@ void qemu_init(int argc, char **argv, char **envp)
     FILE *vmstate_dump_file = NULL;
     Error *err = NULL;
     bool have_custom_ram_size;
-    BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -4298,52 +4350,7 @@ void qemu_init(int argc, char **argv, char **envp)
 
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



