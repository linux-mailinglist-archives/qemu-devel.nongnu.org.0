Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1E439486
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:12:11 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexti-0003hK-CM
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mexri-0002nz-BY
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.153.124]:32361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mexrf-0003io-L8
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635160202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rHS/SiEYGWt3UwElG9d7AZ++K4uQxrv+/xonv2j8tzI=;
 b=SSBbFu96tCcdHLAxc6SNOL0r/87GsPnPFzHEKIZNa6EvHTOZV7CsVDEuddx/hHPHgn5CTv
 Zoc19fCQNVYuVGDPPpp/YnA3FkG6pNjIO9+yOotsG57eHrpnBOhnl1uzk73vrGfxbBX0Fj
 BHJKNAmmYAgp1hiRZ28q37yWqW33XkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-HipuOq-INIO1WVqTpP20wA-1; Mon, 25 Oct 2021 07:08:17 -0400
X-MC-Unique: HipuOq-INIO1WVqTpP20wA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43FB4101AFBF
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 11:08:16 +0000 (UTC)
Received: from maggie.redhat.com (unknown [10.43.2.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEF0F57CAB
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 11:08:15 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qmp: Stabilize preconfig
Date: Mon, 25 Oct 2021 13:08:05 +0200
Message-Id: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.153.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The -preconfig option and exit-preconfig command are around for
quite some time now. However, they are still marked as unstable.
This is suboptimal because it may block some upper layer in
consuming it. In this specific case - Libvirt avoids using
experimental features.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 docs/system/managed-startup.rst | 2 +-
 monitor/hmp-cmds.c              | 2 +-
 qapi/misc.json                  | 6 +++---
 qemu-options.hx                 | 5 ++---
 softmmu/vl.c                    | 4 ++--
 tests/qtest/numa-test.c         | 8 ++++----
 tests/qtest/qmp-test.c          | 6 +++---
 7 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/docs/system/managed-startup.rst b/docs/system/managed-startup.rst
index 9bcf98ea79..f3291b867b 100644
--- a/docs/system/managed-startup.rst
+++ b/docs/system/managed-startup.rst
@@ -32,4 +32,4 @@ machine, including but not limited to:
 - ``query-qmp-schema``
 - ``query-commands``
 - ``query-status``
-- ``x-exit-preconfig``
+- ``exit-preconfig``
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bcaa41350e..5ccb823b97 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1001,7 +1001,7 @@ void hmp_exit_preconfig(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    qmp_x_exit_preconfig(&err);
+    qmp_exit_preconfig(&err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/qapi/misc.json b/qapi/misc.json
index 5c2ca3b556..0f75d60996 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -175,7 +175,7 @@
 { 'command': 'cont' }
 
 ##
-# @x-exit-preconfig:
+# @exit-preconfig:
 #
 # Exit from "preconfig" state
 #
@@ -191,11 +191,11 @@
 #
 # Example:
 #
-# -> { "execute": "x-exit-preconfig" }
+# -> { "execute": "exit-preconfig" }
 # <- { "return": {} }
 #
 ##
-{ 'command': 'x-exit-preconfig', 'allow-preconfig': true }
+{ 'command': 'exit-preconfig', 'allow-preconfig': true }
 
 ##
 # @human-monitor-command:
diff --git a/qemu-options.hx b/qemu-options.hx
index 5f375bbfa6..d27778869b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3936,10 +3936,9 @@ SRST
 ``--preconfig``
     Pause QEMU for interactive configuration before the machine is
     created, which allows querying and configuring properties that will
-    affect machine initialization. Use QMP command 'x-exit-preconfig' to
+    affect machine initialization. Use QMP command 'exit-preconfig' to
     exit the preconfig state and move to the next state (i.e. run guest
-    if -S isn't used or pause the second time if -S is used). This
-    option is experimental.
+    if -S isn't used or pause the second time if -S is used).
 ERST
 
 DEF("S", 0, QEMU_OPTION_S, \
diff --git a/softmmu/vl.c b/softmmu/vl.c
index af0c4cbd99..09a9ec06f9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2730,7 +2730,7 @@ static void qemu_machine_creation_done(void)
     }
 }
 
-void qmp_x_exit_preconfig(Error **errp)
+void qmp_exit_preconfig(Error **errp)
 {
     if (phase_check(PHASE_MACHINE_INITIALIZED)) {
         error_setg(errp, "The command is permitted only before machine initialization");
@@ -3770,7 +3770,7 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (!preconfig_requested) {
-        qmp_x_exit_preconfig(&error_fatal);
+        qmp_exit_preconfig(&error_fatal);
     }
     qemu_init_displays();
     accel_setup_post(current_machine);
diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index 90bf68a5b3..bea95b1832 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -285,7 +285,7 @@ static void pc_dynamic_cpu_cfg(const void *data)
         " 'arguments': { 'type': 'cpu', 'node-id': 1, 'socket-id': 0 } }")));
 
     /* let machine initialization to complete and run */
-    g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'x-exit-preconfig' }")));
+    g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'exit-preconfig' }")));
     qtest_qmp_eventwait(qs, "RESUME");
 
     /* check that CPUs are mapped as expected */
@@ -443,7 +443,7 @@ static void pc_hmat_build_cfg(const void *data)
 
     /* let machine initialization to complete and run */
     g_assert_false(qmp_rsp_is_err(qtest_qmp(qs,
-        "{ 'execute': 'x-exit-preconfig' }")));
+        "{ 'execute': 'exit-preconfig' }")));
     qtest_qmp_eventwait(qs, "RESUME");
 
     qtest_quit(qs);
@@ -482,7 +482,7 @@ static void pc_hmat_off_cfg(const void *data)
 
     /* let machine initialization to complete and run */
     g_assert_false(qmp_rsp_is_err(qtest_qmp(qs,
-        "{ 'execute': 'x-exit-preconfig' }")));
+        "{ 'execute': 'exit-preconfig' }")));
     qtest_qmp_eventwait(qs, "RESUME");
 
     qtest_quit(qs);
@@ -533,7 +533,7 @@ static void pc_hmat_erange_cfg(const void *data)
 
     /* let machine initialization to complete and run */
     g_assert_false(qmp_rsp_is_err(qtest_qmp(qs,
-        "{ 'execute': 'x-exit-preconfig' }")));
+        "{ 'execute': 'exit-preconfig' }")));
     qtest_qmp_eventwait(qs, "RESUME");
 
     qtest_quit(qs);
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index cd27fae3de..f0aaa94d8a 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -299,7 +299,7 @@ static void test_qmp_preconfig(void)
     qobject_unref(rsp);
 
     /* exit preconfig state */
-    g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'x-exit-preconfig' }")));
+    g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'exit-preconfig' }")));
     qtest_qmp_eventwait(qs, "RESUME");
 
     /* check that query-status returns running state */
@@ -309,8 +309,8 @@ static void test_qmp_preconfig(void)
     g_assert_cmpstr(qdict_get_try_str(ret, "status"), ==, "running");
     qobject_unref(rsp);
 
-    /* check that x-exit-preconfig returns error after exiting preconfig */
-    g_assert(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'x-exit-preconfig' }")));
+    /* check that exit-preconfig returns error after exiting preconfig */
+    g_assert(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'exit-preconfig' }")));
 
     /* enabled commands, no error expected  */
     g_assert(!qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'query-cpus-fast' }")));
-- 
2.32.0


