Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B58030747B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:14:39 +0100 (CET)
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55G2-0003dE-En
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:14:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l55F2-00038K-Hj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l55F0-0004Ym-EW
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611832412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=88ZNUFrRGgJ9WJUNXEpNzJYO5ICshVzXKHMBN4ImbqM=;
 b=ai7mmipMq5a3Sob0tFwvTTy+kvuzx0KRGxPmPRT2/OvgZuZu4rwM0gL6QfYuTBrEq6QEPz
 GJF2fw0nf4NKI4e0DlfRYU78lHaC7kDCwOCo9iKHf0/VbLoIbA2SJgZSADTPSgN4p49ViH
 oarazerzvX0AqnJdn+rYRC5ZC7qedjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-nu-F0k_QMSCMZikPpdn2nw-1; Thu, 28 Jan 2021 06:13:30 -0500
X-MC-Unique: nu-F0k_QMSCMZikPpdn2nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3C31802B42
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 11:13:29 +0000 (UTC)
Received: from localhost (unknown [10.36.110.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA11919D7C;
 Thu, 28 Jan 2021 11:13:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] spice: delay starting until display are initialized
Date: Thu, 28 Jan 2021 15:13:19 +0400
Message-Id: <20210128111319.329755-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU used to run qemu_spice.display_init() before vm_start(), and
QXL/display interfaces where started then. Now, vm_start() happens
before QXL/display interfaces are added and Spice server doesn't
automatically start them in this case (fixed in spice git)

Fixes Spice regression introduced after 5.2, with refactoring commits
b4e1a34211 ("vl: remove separate preconfig main_loop") and
facf7c60ee ("vl: initialize displays _after_ exiting preconfiguration"),
probably others.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/sysemu/runstate.h | 1 +
 include/ui/qemu-spice.h   | 1 +
 softmmu/runstate.c        | 5 +++++
 ui/spice-core.c           | 9 ++++++++-
 ui/spice-display.c        | 2 ++
 5 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index e557f470d4..40b3083008 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -6,6 +6,7 @@
 
 bool runstate_check(RunState state);
 void runstate_set(RunState new_state);
+RunState runstate_get(void);
 int runstate_is_running(void);
 bool runstate_needs_reset(void);
 bool runstate_store(char *str, size_t size);
diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 2beb792972..71ecd6cfd1 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -28,6 +28,7 @@
 
 void qemu_spice_input_init(void);
 void qemu_spice_display_init(void);
+void qemu_spice_display_init_done(void);
 bool qemu_spice_have_display_interface(QemuConsole *con);
 int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con);
 int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index beee050815..92ef7444d0 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -195,6 +195,11 @@ static void runstate_init(void)
     qemu_mutex_init(&vmstop_lock);
 }
 
+RunState runstate_get(void)
+{
+    return current_run_state;
+}
+
 /* This function will abort() on invalid state transitions */
 void runstate_set(RunState new_state)
 {
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 5746d0aae7..b621dd86b6 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -46,6 +46,7 @@ static const char *auth = "spice";
 static char *auth_passwd;
 static time_t auth_expires = TIME_MAX;
 static int spice_migration_completed;
+static int spice_display_init_done;
 static int spice_display_is_running;
 static int spice_have_target_host;
 
@@ -625,13 +626,19 @@ static int add_channel(void *opaque, const char *name, const char *value,
 static void vm_change_state_handler(void *opaque, int running,
                                     RunState state)
 {
-    if (running) {
+    if (running && spice_display_init_done) {
         qemu_spice_display_start();
     } else if (state != RUN_STATE_PAUSED) {
         qemu_spice_display_stop();
     }
 }
 
+void qemu_spice_display_init_done(void)
+{
+    spice_display_init_done = true;
+    vm_change_state_handler(NULL, runstate_is_running(), runstate_get());
+}
+
 static void qemu_spice_init(void)
 {
     QemuOpts *opts = QTAILQ_FIRST(&qemu_spice_opts.head);
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0178d5766d..3d3e3bcb22 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)
         }
         qemu_spice_display_init_one(con);
     }
+
+    qemu_spice_display_init_done();
 }
-- 
2.29.0


