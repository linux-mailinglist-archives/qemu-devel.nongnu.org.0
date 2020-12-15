Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D32DB33B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:06:01 +0100 (CET)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEi0-0000Ih-DW
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXM-00036p-Mf
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXE-0001SE-5U
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiqBqGgj2Pt+uyp0hqGrI1y1F6Iczvq/n9Ax+PBJZ4I=;
 b=WUFSEKgYh2GEvsv86ngFFFlpmlJCUxISDaYQPaYXbHs/rXByWSBK0HnHrEEw1McDsgRMp1
 tDj9NuqYJurOIVtTV1ynU5hrr5hDFSUn2OxRW1PwVLWLIzKrgDPvA0HhI34PtPaAahWs3+
 50ZCa3OYE5q5aXzOLM2LVE0zg0VjE1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-vqDdcW-0NcixwEAlccXf4A-1; Tue, 15 Dec 2020 12:54:49 -0500
X-MC-Unique: vqDdcW-0NcixwEAlccXf4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4F9718B37E2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73C7F60C15;
 Tue, 15 Dec 2020 17:54:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/45] chardev: do not use machine_init_done
Date: Tue, 15 Dec 2020 12:54:07 -0500
Message-Id: <20201215175445.1272776-8-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

machine_init_done is not the right flag to check when preconfig
is taken into account; for example "./qemu-system-x86_64 -serial
mon:stdio -preconfig" does not print the QEMU monitor header until after
exit_preconfig.  Add back a custom bool for mux character devices.  This
partially undoes commit c7278b4355 ("chardev: introduce chr_machine_done
hook", 2018-03-12), but it keeps the cleaner logic using a function
pointer in ChardevClass.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-mux.c        | 38 ++++++++++++++++++---
 chardev/chardev-sysemu.c  | 69 ---------------------------------------
 chardev/meson.build       |  2 +-
 hw/core/machine.c         |  2 +-
 include/chardev/char.h    |  6 ++--
 include/sysemu/sysemu.h   |  2 --
 softmmu/vl.c              |  3 ++
 stubs/machine-init-done.c |  8 -----
 stubs/meson.build         |  1 -
 9 files changed, 43 insertions(+), 88 deletions(-)
 delete mode 100644 chardev/chardev-sysemu.c
 delete mode 100644 stubs/machine-init-done.c

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 6f980bb836..72beef29d2 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -33,6 +33,13 @@
 
 /* MUX driver for serial I/O splitting */
 
+/*
+ * Set to false by suspend_mux_open.  Open events are delayed until
+ * resume_mux_open.  Usually suspend_mux_open is called before
+ * command line processing and resume_mux_open afterwards.
+ */
+static bool muxes_opened = true;
+
 /* Called with chr_write_lock held.  */
 static int mux_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
@@ -237,7 +244,7 @@ void mux_chr_send_all_event(Chardev *chr, QEMUChrEvent event)
     MuxChardev *d = MUX_CHARDEV(chr);
     int i;
 
-    if (!machine_init_done) {
+    if (!muxes_opened) {
         return;
     }
 
@@ -328,7 +335,7 @@ static void qemu_chr_open_mux(Chardev *chr,
     /* only default to opened state if we've realized the initial
      * set of muxes
      */
-    *be_opened = machine_init_done;
+    *be_opened = muxes_opened;
     qemu_chr_fe_init(&d->chr, drv, errp);
 }
 
@@ -360,19 +367,42 @@ static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
  * mux will receive CHR_EVENT_OPENED notifications for the BE
  * immediately.
  */
-static int open_muxes(Chardev *chr)
+static void open_muxes(Chardev *chr)
 {
     /* send OPENED to all already-attached FEs */
     mux_chr_send_all_event(chr, CHR_EVENT_OPENED);
+
     /*
      * mark mux as OPENED so any new FEs will immediately receive
      * OPENED event
      */
     chr->be_open = 1;
+}
+
+void suspend_mux_open(void)
+{
+    muxes_opened = false;
+}
+
+static int chardev_options_parsed_cb(Object *child, void *opaque)
+{
+    Chardev *chr = (Chardev *)child;
+    ChardevClass *class = CHARDEV_GET_CLASS(chr);
+
+    if (!chr->be_open && class->chr_options_parsed) {
+        class->chr_options_parsed(chr);
+    }
 
     return 0;
 }
 
+void resume_mux_open(void)
+{
+    muxes_opened = true;
+    object_child_foreach(get_chardevs_root(),
+                         chardev_options_parsed_cb, NULL);
+}
+
 static void char_mux_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
@@ -383,7 +413,7 @@ static void char_mux_class_init(ObjectClass *oc, void *data)
     cc->chr_accept_input = mux_chr_accept_input;
     cc->chr_add_watch = mux_chr_add_watch;
     cc->chr_be_event = mux_chr_be_event;
-    cc->chr_machine_done = open_muxes;
+    cc->chr_options_parsed = open_muxes;
     cc->chr_update_read_handler = mux_chr_update_read_handlers;
 }
 
diff --git a/chardev/chardev-sysemu.c b/chardev/chardev-sysemu.c
deleted file mode 100644
index eecdc615ee..0000000000
--- a/chardev/chardev-sysemu.c
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- * QEMU System Emulator
- *
- * Copyright (c) 2003-2008 Fabrice Bellard
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "sysemu/sysemu.h"
-#include "chardev/char.h"
-#include "qemu/error-report.h"
-#include "chardev-internal.h"
-
-static int chardev_machine_done_notify_one(Object *child, void *opaque)
-{
-    Chardev *chr = (Chardev *)child;
-    ChardevClass *class = CHARDEV_GET_CLASS(chr);
-
-    if (class->chr_machine_done) {
-        return class->chr_machine_done(chr);
-    }
-
-    return 0;
-}
-
-static void chardev_machine_done_hook(Notifier *notifier, void *unused)
-{
-    int ret = object_child_foreach(get_chardevs_root(),
-                                   chardev_machine_done_notify_one, NULL);
-
-    if (ret) {
-        error_report("Failed to call chardev machine_done hooks");
-        exit(1);
-    }
-}
-
-
-static Notifier chardev_machine_done_notify = {
-    .notify = chardev_machine_done_hook,
-};
-
-static void register_types(void)
-{
-    /*
-     * This must be done after machine init, since we register FEs with muxes
-     * as part of realize functions like serial_isa_realizefn when -nographic
-     * is specified.
-     */
-    qemu_add_machine_init_done_notifier(&chardev_machine_done_notify);
-}
-
-type_init(register_types);
diff --git a/chardev/meson.build b/chardev/meson.build
index 859d8b04d4..4e19722c5e 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -25,7 +25,7 @@ chardev_ss.add(when: 'CONFIG_WIN32', if_true: files(
 
 chardev_ss = chardev_ss.apply(config_host, strict: false)
 
-softmmu_ss.add(files('chardev-sysemu.c', 'msmouse.c', 'wctablet.c', 'testdev.c'))
+softmmu_ss.add(files('msmouse.c', 'wctablet.c', 'testdev.c'))
 
 chardev_modules = {}
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 036609d9f3..07268afe52 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1179,7 +1179,7 @@ void machine_run_board_init(MachineState *machine)
 static NotifierList machine_init_done_notifiers =
     NOTIFIER_LIST_INITIALIZER(machine_init_done_notifiers);
 
-bool machine_init_done;
+static bool machine_init_done;
 
 void qemu_add_machine_init_done_notifier(Notifier *notify)
 {
diff --git a/include/chardev/char.h b/include/chardev/char.h
index db42f0a8c6..4181a2784a 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -270,8 +270,7 @@ struct ChardevClass {
     void (*chr_set_echo)(Chardev *chr, bool echo);
     void (*chr_set_fe_open)(Chardev *chr, int fe_open);
     void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
-    /* Return 0 if succeeded, 1 if failed */
-    int (*chr_machine_done)(Chardev *chr);
+    void (*chr_options_parsed)(Chardev *chr);
 };
 
 Chardev *qemu_chardev_new(const char *id, const char *typename,
@@ -283,6 +282,9 @@ extern int term_escape_char;
 GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
                                  GSourceFunc func, void *private);
 
+void suspend_mux_open(void);
+void resume_mux_open(void);
+
 /* console.c */
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 0e7b405d22..9b47cdca55 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -16,8 +16,6 @@ extern bool qemu_uuid_set;
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
-extern bool machine_init_done;
-
 void qemu_run_machine_init_done_notifiers(void);
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 void qemu_remove_machine_init_done_notifier(Notifier *notify);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index d8af26c281..8e18c52f6e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3462,6 +3462,8 @@ void qemu_init(int argc, char **argv, char **envp)
 
     qemu_create_machine(select_machine());
 
+    suspend_mux_open();
+
     qemu_disable_default_devices();
     qemu_create_default_devices();
     qemu_create_early_backends();
@@ -3525,4 +3527,5 @@ void qemu_init(int argc, char **argv, char **envp)
     }
     accel_setup_post(current_machine);
     os_setup_post();
+    resume_mux_open();
 }
diff --git a/stubs/machine-init-done.c b/stubs/machine-init-done.c
deleted file mode 100644
index cd8e81392d..0000000000
--- a/stubs/machine-init-done.c
+++ /dev/null
@@ -1,8 +0,0 @@
-#include "qemu/osdep.h"
-#include "sysemu/sysemu.h"
-
-bool machine_init_done = true;
-
-void qemu_add_machine_init_done_notifier(Notifier *notify)
-{
-}
diff --git a/stubs/meson.build b/stubs/meson.build
index cc56c83063..80b1d81a31 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -21,7 +21,6 @@ stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
 stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
-stub_ss.add(files('machine-init-done.c'))
 stub_ss.add(files('migr-blocker.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
-- 
2.26.2



