Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47085298EBA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 15:00:48 +0100 (CET)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX33H-0007KP-C5
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 10:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX2up-0005lG-Ds
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX2uc-0001lJ-Vd
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 09:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603720300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z51Ktldx9kIvKUpeqPJm+0R9bQBbNqpKXcp5sHAs+rU=;
 b=d3pcdrTM63P/PatMh0kJ7KraCAwsoBQzHb502XtfHjISG7e07ht/7lktPB9bd8PkZzxHCJ
 qHjTgussPa6dht9mnnDBZSsnpjn7ZTackLBole0tf3ySnzulczPeKFoo7ErCNXUHjh1Fpn
 SNXOsu7volOIXgQd5WrheJZzzwSsVE4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-aA7xy2xRNoKHZA7W7xrL0A-1; Mon, 26 Oct 2020 09:51:35 -0400
X-MC-Unique: aA7xy2xRNoKHZA7W7xrL0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CF15804344;
 Mon, 26 Oct 2020 13:51:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F1B96EF40;
 Mon, 26 Oct 2020 13:51:34 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] replay: do not build if TCG is not available
Date: Mon, 26 Oct 2020 09:51:20 -0400
Message-Id: <20201026135131.3006712-7-pbonzini@redhat.com>
In-Reply-To: <20201026135131.3006712-1-pbonzini@redhat.com>
References: <20201026135131.3006712-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

this fixes non-TCG builds broken recently by replay reverse debugging.

Stub the needed functions in stub/, splitting roughly between functions
needed only by system emulation, by system emulation and tools,
and by everyone.  This includes duplicating some code in replay/, and
puts the logic for non-replay related events in the replay/ module (+
the stubs), so this should be revisited in the future.

Surprisingly, only _one_ qtest was affected by this, ide-test.c, which
resulted in a buzz as the bh events were never delivered, and the bh
never executed.

Many other subsystems _should_ have been affected.

This fixes the immediate issue, however a better way to group replay
functionality to TCG-only code could be developed in the long term.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20201013192123.22632-4-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build          |  3 +-
 net/meson.build            |  3 +-
 replay/meson.build         |  4 +-
 replay/stubs-system.c      | 96 ++++++++++++++++++++++++++++++++++++++
 stubs/meson.build          |  4 +-
 stubs/replay-tools.c       | 83 ++++++++++++++++++++++++++++++++
 stubs/replay-user.c        |  9 ----
 stubs/replay.c             | 78 -------------------------------
 tests/ptimer-test-stubs.c  |  5 --
 tests/qtest/qmp-cmd-test.c |  3 ++
 10 files changed, 191 insertions(+), 97 deletions(-)
 create mode 100644 replay/stubs-system.c
 create mode 100644 stubs/replay-tools.c
 delete mode 100644 stubs/replay-user.c

diff --git a/block/meson.build b/block/meson.build
index 78e8b25232..5dcc1e5cce 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -7,7 +7,6 @@ block_ss.add(files(
   'backup-top.c',
   'blkdebug.c',
   'blklogwrites.c',
-  'blkreplay.c',
   'blkverify.c',
   'block-backend.c',
   'block-copy.c',
@@ -42,6 +41,8 @@ block_ss.add(files(
   'write-threshold.c',
 ), zstd, zlib)
 
+softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
+
 block_ss.add(when: 'CONFIG_QCOW1', if_true: files('qcow.c'))
 block_ss.add(when: 'CONFIG_VDI', if_true: files('vdi.c'))
 block_ss.add(when: 'CONFIG_CLOOP', if_true: files('cloop.c'))
diff --git a/net/meson.build b/net/meson.build
index 1c7e3a3cb9..1076b0a7ab 100644
--- a/net/meson.build
+++ b/net/meson.build
@@ -7,7 +7,6 @@ softmmu_ss.add(files(
   'eth.c',
   'filter-buffer.c',
   'filter-mirror.c',
-  'filter-replay.c',
   'filter-rewriter.c',
   'filter.c',
   'hub.c',
@@ -17,6 +16,8 @@ softmmu_ss.add(files(
   'util.c',
 ))
 
+softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('filter-replay.c'))
+
 softmmu_ss.add(when: 'CONFIG_L2TPV3', if_true: files('l2tpv3.c'))
 softmmu_ss.add(when: slirp, if_true: files('slirp.c'))
 softmmu_ss.add(when: ['CONFIG_VDE', vde], if_true: files('vde.c'))
diff --git a/replay/meson.build b/replay/meson.build
index f91163fb1e..21aefad220 100644
--- a/replay/meson.build
+++ b/replay/meson.build
@@ -1,4 +1,4 @@
-softmmu_ss.add(files(
+softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'replay.c',
   'replay-internal.c',
   'replay-events.c',
@@ -10,4 +10,4 @@ softmmu_ss.add(files(
   'replay-audio.c',
   'replay-random.c',
   'replay-debugging.c',
-))
+), if_false: files('stubs-system.c'))
diff --git a/replay/stubs-system.c b/replay/stubs-system.c
new file mode 100644
index 0000000000..5c262b08f1
--- /dev/null
+++ b/replay/stubs-system.c
@@ -0,0 +1,96 @@
+#include "qemu/osdep.h"
+#include "sysemu/replay.h"
+#include "ui/input.h"
+
+void replay_input_event(QemuConsole *src, InputEvent *evt)
+{
+    qemu_input_event_send_impl(src, evt);
+}
+
+void replay_input_sync_event(void)
+{
+    qemu_input_event_sync_impl();
+}
+
+void replay_add_blocker(Error *reason)
+{
+}
+void replay_audio_in(size_t *recorded, void *samples, size_t *wpos, size_t size)
+{
+}
+void replay_audio_out(size_t *played)
+{
+}
+void replay_breakpoint(void)
+{
+}
+bool replay_can_snapshot(void)
+{
+    return true;
+}
+void replay_configure(struct QemuOpts *opts)
+{
+}
+void replay_flush_events(void)
+{
+}
+void replay_gdb_attached(void)
+{
+}
+bool replay_running_debug(void)
+{
+    return false;
+}
+void replay_shutdown_request(ShutdownCause cause)
+{
+}
+void replay_start(void)
+{
+}
+void replay_vmstate_init(void)
+{
+}
+
+#include "monitor/monitor.h"
+#include "monitor/hmp.h"
+#include "qapi/qapi-commands-replay.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+
+void hmp_info_replay(Monitor *mon, const QDict *qdict)
+{
+    error_report("replay support not available");
+}
+void hmp_replay_break(Monitor *mon, const QDict *qdict)
+{
+    error_report("replay support not available");
+}
+void hmp_replay_delete_break(Monitor *mon, const QDict *qdict)
+{
+    error_report("replay support not available");
+}
+void hmp_replay_seek(Monitor *mon, const QDict *qdict)
+{
+    error_report("replay support not available");
+}
+ReplayInfo *qmp_query_replay(Error **errp)
+{
+    error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+              "replay support not available");
+    return NULL;
+}
+void qmp_replay_break(int64_t icount, Error **errp)
+{
+    error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+              "replay support not available");
+}
+void qmp_replay_delete_break(Error **errp)
+{
+    error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+              "replay support not available");
+}
+void qmp_replay_seek(int64_t icount, Error **errp)
+{
+    error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+              "replay support not available");
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index 67f2a8c069..057d7682e5 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -32,7 +32,6 @@ stub_ss.add(files('qtest.c'))
 stub_ss.add(files('ram-block.c'))
 stub_ss.add(files('ramfb.c'))
 stub_ss.add(files('replay.c'))
-stub_ss.add(files('replay-user.c'))
 stub_ss.add(files('runstate-check.c'))
 stub_ss.add(files('set-fd-handler.c'))
 stub_ss.add(files('sysbus.c'))
@@ -46,6 +45,9 @@ stub_ss.add(files('vmstate.c'))
 stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
 stub_ss.add(files('cpu-synchronize-state.c'))
+if have_block
+  stub_ss.add(files('replay-tools.c'))
+endif
 if have_system
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('xen-hw-stub.c'))
diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
new file mode 100644
index 0000000000..c06b360e22
--- /dev/null
+++ b/stubs/replay-tools.c
@@ -0,0 +1,83 @@
+#include "qemu/osdep.h"
+#include "sysemu/replay.h"
+#include "block/aio.h"
+
+bool replay_events_enabled(void)
+{
+    return false;
+}
+
+int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
+{
+    abort();
+    return 0;
+}
+
+int64_t replay_read_clock(unsigned int kind)
+{
+    abort();
+    return 0;
+}
+
+uint64_t replay_get_current_icount(void)
+{
+    return 0;
+}
+
+void replay_bh_schedule_event(QEMUBH *bh)
+{
+    qemu_bh_schedule(bh);
+}
+
+void replay_bh_schedule_oneshot_event(AioContext *ctx,
+     QEMUBHFunc *cb, void *opaque)
+{
+    aio_bh_schedule_oneshot(ctx, cb, opaque);
+}
+
+bool replay_checkpoint(ReplayCheckpoint checkpoint)
+{
+    return true;
+}
+
+void replay_mutex_lock(void)
+{
+}
+
+void replay_mutex_unlock(void)
+{
+}
+
+void replay_register_char_driver(Chardev *chr)
+{
+}
+
+void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
+{
+    abort();
+}
+
+void replay_char_write_event_save(int res, int offset)
+{
+    abort();
+}
+
+void replay_char_write_event_load(int *res, int *offset)
+{
+    abort();
+}
+
+int replay_char_read_all_load(uint8_t *buf)
+{
+    abort();
+}
+
+void replay_char_read_all_save_error(int res)
+{
+    abort();
+}
+
+void replay_char_read_all_save_buf(uint8_t *buf, int offset)
+{
+    abort();
+}
diff --git a/stubs/replay-user.c b/stubs/replay-user.c
deleted file mode 100644
index 2ad9e27203..0000000000
--- a/stubs/replay-user.c
+++ /dev/null
@@ -1,9 +0,0 @@
-#include "qemu/osdep.h"
-#include "sysemu/replay.h"
-#include "sysemu/sysemu.h"
-
-void replay_bh_schedule_oneshot_event(AioContext *ctx,
-    QEMUBHFunc *cb, void *opaque)
-{
-    aio_bh_schedule_oneshot(ctx, cb, opaque);
-}
diff --git a/stubs/replay.c b/stubs/replay.c
index 45ebe77fb9..9d5b4be339 100644
--- a/stubs/replay.c
+++ b/stubs/replay.c
@@ -3,83 +3,10 @@
 
 ReplayMode replay_mode;
 
-int64_t replay_save_clock(unsigned int kind, int64_t clock, int64_t raw_icount)
-{
-    abort();
-    return 0;
-}
-
-int64_t replay_read_clock(unsigned int kind)
-{
-    abort();
-    return 0;
-}
-
-bool replay_checkpoint(ReplayCheckpoint checkpoint)
-{
-    return true;
-}
-
-bool replay_events_enabled(void)
-{
-    return false;
-}
-
 void replay_finish(void)
 {
 }
 
-void replay_register_char_driver(Chardev *chr)
-{
-}
-
-void replay_chr_be_write(Chardev *s, uint8_t *buf, int len)
-{
-    abort();
-}
-
-void replay_char_write_event_save(int res, int offset)
-{
-    abort();
-}
-
-void replay_char_write_event_load(int *res, int *offset)
-{
-    abort();
-}
-
-int replay_char_read_all_load(uint8_t *buf)
-{
-    abort();
-}
-
-void replay_char_read_all_save_error(int res)
-{
-    abort();
-}
-
-void replay_char_read_all_save_buf(uint8_t *buf, int offset)
-{
-    abort();
-}
-
-void replay_block_event(QEMUBH *bh, uint64_t id)
-{
-}
-
-uint64_t blkreplay_next_id(void)
-{
-    return 0;
-}
-
-void replay_mutex_lock(void)
-{
-}
-
-void replay_mutex_unlock(void)
-{
-}
-
 void replay_save_random(int ret, void *buf, size_t len)
 {
 }
@@ -89,11 +16,6 @@ int replay_read_random(void *buf, size_t len)
     return 0;
 }
 
-uint64_t replay_get_current_icount(void)
-{
-    return 0;
-}
-
 bool replay_reverse_step(void)
 {
     return false;
diff --git a/tests/ptimer-test-stubs.c b/tests/ptimer-test-stubs.c
index e935a1395e..7f801a4d09 100644
--- a/tests/ptimer-test-stubs.c
+++ b/tests/ptimer-test-stubs.c
@@ -122,8 +122,3 @@ void qemu_bh_delete(QEMUBH *bh)
 {
     g_free(bh);
 }
-
-void replay_bh_schedule_event(QEMUBH *bh)
-{
-    bh->cb(bh->opaque);
-}
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 8a4c570e83..1c7186e53c 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -31,6 +31,9 @@ static int query_error_class(const char *cmd)
 #ifndef CONFIG_SPICE
         { "query-spice", ERROR_CLASS_COMMAND_NOT_FOUND },
 #endif
+#ifndef CONFIG_TCG
+        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND },
+#endif
 #ifndef CONFIG_VNC
         { "query-vnc", ERROR_CLASS_GENERIC_ERROR },
         { "query-vnc-servers", ERROR_CLASS_GENERIC_ERROR },
-- 
2.26.2



