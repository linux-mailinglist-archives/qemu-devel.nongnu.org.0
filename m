Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F84C51BAC7
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:40:53 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmX2Z-0006EB-1B
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWfB-0007c2-KM
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:42 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:43407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWf9-00081L-Aq
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2DQcg2f7d6Ls9Ryi5RaJ5AgskrjL/TQo/dulXyKwCY=;
 b=F4HXvkaRVkRjqxw84prhoeoAwXT6rTa3JUeHOTPr4MBG23DxCl0YjRCoOugBsJqlZLdFLs
 7wURSrE9Oal9zEBm7pLP9WlNPpXIV2ARonmpkSk3NOc0zH0dK9T0DqqZDkvZw0Ew1vfBZ6
 7zU22cTV6UTDyvV0OVWV2QNHd71pURk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-dEQNTk1bNeWmkkIaNdW6GQ-1; Thu, 05 May 2022 04:16:35 -0400
X-MC-Unique: dEQNTk1bNeWmkkIaNdW6GQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A882B8339C1;
 Thu,  5 May 2022 08:16:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9927C2813A;
 Thu,  5 May 2022 08:16:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 15/15] test/qga: use g_auto wherever sensible
Date: Thu,  5 May 2022 12:14:31 +0400
Message-Id: <20220505081431.934739-16-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-1-marcandre.lureau@redhat.com>
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.74;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-qga.c | 125 +++++++++++++++---------------------------
 1 file changed, 45 insertions(+), 80 deletions(-)

diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index ab0b12a2dd16..53cefc2c2649 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -51,8 +51,11 @@ static void
 fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
 {
     const gchar *extra_arg = data;
-    GError *error = NULL;
-    gchar *cwd, *path, *cmd, **argv = NULL;
+    g_autoptr(GError) error = NULL;
+    g_autofree char *cwd = NULL;
+    g_autofree char *path = NULL;
+    g_autofree char *cmd = NULL;
+    g_auto(GStrv) argv = NULL;
 
     fixture->loop = g_main_loop_new(NULL, FALSE);
 
@@ -78,17 +81,12 @@ fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
 
     fixture->fd = connect_qga(path);
     g_assert_cmpint(fixture->fd, !=, -1);
-
-    g_strfreev(argv);
-    g_free(cmd);
-    g_free(cwd);
-    g_free(path);
 }
 
 static void
 fixture_tear_down(TestFixture *fixture, gconstpointer data)
 {
-    gchar *tmp;
+    g_autofree char *tmp = NULL;
 
     kill(fixture->pid, SIGTERM);
 
@@ -107,7 +105,6 @@ fixture_tear_down(TestFixture *fixture, gconstpointer data)
 
     tmp = g_build_filename(fixture->test_dir, "sock", NULL);
     g_unlink(tmp);
-    g_free(tmp);
 
     g_rmdir(fixture->test_dir);
     g_free(fixture->test_dir);
@@ -122,7 +119,7 @@ static void qmp_assertion_message_error(const char     *domain,
                                         QDict          *dict)
 {
     const char *class, *desc;
-    char *s;
+    g_autofree char *s = NULL;
     QDict *error;
 
     error = qdict_get_qdict(dict, "error");
@@ -131,7 +128,6 @@ static void qmp_assertion_message_error(const char     *domain,
 
     s = g_strdup_printf("assertion failed %s: %s %s", expr, class, desc);
     g_assertion_message(domain, file, line, func, s);
-    g_free(s);
 }
 
 #define qmp_assert_no_error(err) do {                                   \
@@ -146,7 +142,7 @@ static void test_qga_sync_delimited(gconstpointer fix)
     const TestFixture *fixture = fix;
     guint32 v, r = g_test_rand_int();
     unsigned char c;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
 
     qmp_fd_send_raw(fixture->fd, "\xff");
     qmp_fd_send(fixture->fd,
@@ -180,15 +176,13 @@ static void test_qga_sync_delimited(gconstpointer fix)
 
     v = qdict_get_int(ret, "return");
     g_assert_cmpint(r, ==, v);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_sync(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
     guint32 v, r = g_test_rand_int();
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
 
     /*
      * TODO guest-sync is inherently limited: we cannot distinguish
@@ -210,33 +204,27 @@ static void test_qga_sync(gconstpointer fix)
 
     v = qdict_get_int(ret, "return");
     g_assert_cmpint(r, ==, v);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_ping(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-ping'}");
     g_assert_nonnull(ret);
     qmp_assert_no_error(ret);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_id(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-ping', 'id': 1}");
     g_assert_nonnull(ret);
     qmp_assert_no_error(ret);
     g_assert_cmpint(qdict_get_int(ret, "id"), ==, 1);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_invalid_oob(gconstpointer fix)
@@ -253,7 +241,8 @@ static void test_qga_invalid_oob(gconstpointer fix)
 static void test_qga_invalid_args(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *error;
+    g_autoptr(QDict) ret = NULL;
+    QDict *error;
     const gchar *class, *desc;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-ping', "
@@ -266,14 +255,13 @@ static void test_qga_invalid_args(gconstpointer fix)
 
     g_assert_cmpstr(class, ==, "GenericError");
     g_assert_cmpstr(desc, ==, "Parameter 'foo' is unexpected");
-
-    qobject_unref(ret);
 }
 
 static void test_qga_invalid_cmd(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *error;
+    g_autoptr(QDict) ret = NULL;
+    QDict *error;
     const gchar *class, *desc;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-invalid-cmd'}");
@@ -285,14 +273,13 @@ static void test_qga_invalid_cmd(gconstpointer fix)
 
     g_assert_cmpstr(class, ==, "CommandNotFound");
     g_assert_cmpint(strlen(desc), >, 0);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_info(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *val;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
     const gchar *version;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-info'}");
@@ -302,14 +289,12 @@ static void test_qga_info(gconstpointer fix)
     val = qdict_get_qdict(ret, "return");
     version = qdict_get_try_str(val, "version");
     g_assert_cmpstr(version, ==, QEMU_VERSION);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_get_vcpus(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
     QList *list;
     const QListEntry *entry;
 
@@ -322,14 +307,12 @@ static void test_qga_get_vcpus(gconstpointer fix)
     entry = qlist_first(list);
     g_assert(qdict_haskey(qobject_to(QDict, entry->value), "online"));
     g_assert(qdict_haskey(qobject_to(QDict, entry->value), "logical-id"));
-
-    qobject_unref(ret);
 }
 
 static void test_qga_get_fsinfo(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
     QList *list;
     const QListEntry *entry;
 
@@ -346,14 +329,13 @@ static void test_qga_get_fsinfo(gconstpointer fix)
         g_assert(qdict_haskey(qobject_to(QDict, entry->value), "type"));
         g_assert(qdict_haskey(qobject_to(QDict, entry->value), "disk"));
     }
-
-    qobject_unref(ret);
 }
 
 static void test_qga_get_memory_block_info(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *val;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
     int64_t size;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-get-memory-block-info'}");
@@ -366,14 +348,12 @@ static void test_qga_get_memory_block_info(gconstpointer fix)
         size = qdict_get_int(val, "size");
         g_assert_cmpint(size, >, 0);
     }
-
-    qobject_unref(ret);
 }
 
 static void test_qga_get_memory_blocks(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
     QList *list;
     const QListEntry *entry;
 
@@ -391,14 +371,12 @@ static void test_qga_get_memory_blocks(gconstpointer fix)
             g_assert(qdict_haskey(qobject_to(QDict, entry->value), "online"));
         }
     }
-
-    qobject_unref(ret);
 }
 
 static void test_qga_network_get_interfaces(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
     QList *list;
     const QListEntry *entry;
 
@@ -410,8 +388,6 @@ static void test_qga_network_get_interfaces(gconstpointer fix)
     list = qdict_get_qlist(ret, "return");
     entry = qlist_first(list);
     g_assert(qdict_haskey(qobject_to(QDict, entry->value), "name"));
-
-    qobject_unref(ret);
 }
 
 static void test_qga_file_ops(gconstpointer fix)
@@ -642,7 +618,7 @@ static void test_qga_file_write_read(gconstpointer fix)
 static void test_qga_get_time(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
     int64_t time;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-get-time'}");
@@ -651,8 +627,6 @@ static void test_qga_get_time(gconstpointer fix)
 
     time = qdict_get_int(ret, "return");
     g_assert_cmpint(time, >, 0);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_blacklist(gconstpointer data)
@@ -692,19 +666,23 @@ static void test_qga_blacklist(gconstpointer data)
 
 static void test_qga_config(gconstpointer data)
 {
-    GError *error = NULL;
-    char *cwd, *cmd, *out, *err, *str, **strv, **argv = NULL;
+    g_autoptr(GError) error = NULL;
+    g_autofree char *out = NULL;
+    g_autofree char *err = NULL;
+    g_autofree char *cwd = NULL;
+    g_autofree char *cmd = NULL;
+    g_auto(GStrv) argv = NULL;
+    g_auto(GStrv) strv = NULL;
+    g_autoptr(GKeyFile) kf = NULL;
+    char *str;
     char *env[2];
     int status;
     gsize n;
-    GKeyFile *kf;
 
     cwd = g_get_current_dir();
     cmd = g_strdup_printf("%s%cqga%cqemu-ga -D",
                           cwd, G_DIR_SEPARATOR, G_DIR_SEPARATOR);
-    g_free(cwd);
     g_shell_parse_argv(cmd, NULL, &argv, &error);
-    g_free(cmd);
     g_assert_no_error(error);
 
     env[0] = g_strdup_printf("QGA_CONF=tests%cdata%ctest-qga-config",
@@ -712,7 +690,6 @@ static void test_qga_config(gconstpointer data)
     env[1] = NULL;
     g_spawn_sync(NULL, argv, env, 0,
                  NULL, NULL, &out, &err, &status, &error);
-    g_strfreev(argv);
 
     g_assert_no_error(error);
     g_assert_cmpstr(err, ==, "");
@@ -759,18 +736,14 @@ static void test_qga_config(gconstpointer data)
     g_assert_true(g_strv_contains((const char * const *)strv,
                                   "guest-get-time"));
     g_assert_no_error(error);
-    g_strfreev(strv);
 
-    g_free(out);
-    g_free(err);
     g_free(env[0]);
-    g_key_file_free(kf);
 }
 
 static void test_qga_fsfreeze_status(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
     const gchar *status;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-fsfreeze-status'}");
@@ -779,16 +752,15 @@ static void test_qga_fsfreeze_status(gconstpointer fix)
 
     status = qdict_get_try_str(ret, "return");
     g_assert_cmpstr(status, ==, "thawed");
-
-    qobject_unref(ret);
 }
 
 static void test_qga_guest_exec(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *val;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
     const gchar *out;
-    guchar *decoded;
+    g_autofree guchar *decoded = NULL;
     int64_t pid, now, exitcode;
     gsize len;
     bool exited;
@@ -827,14 +799,13 @@ static void test_qga_guest_exec(gconstpointer fix)
     decoded = g_base64_decode(out, &len);
     g_assert_cmpint(len, ==, 12);
     g_assert_cmpstr((char *)decoded, ==, "\" test_str \"");
-    g_free(decoded);
-    qobject_unref(ret);
 }
 
 static void test_qga_guest_exec_invalid(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *error;
+    g_autoptr(QDict) ret = NULL;
+    QDict *error;
     const gchar *class, *desc;
 
     /* invalid command */
@@ -859,13 +830,13 @@ static void test_qga_guest_exec_invalid(gconstpointer fix)
     desc = qdict_get_str(error, "desc");
     g_assert_cmpstr(class, ==, "GenericError");
     g_assert_cmpint(strlen(desc), >, 0);
-    qobject_unref(ret);
 }
 
 static void test_qga_guest_get_host_name(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *val;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-get-host-name'}");
     g_assert_nonnull(ret);
@@ -873,14 +844,13 @@ static void test_qga_guest_get_host_name(gconstpointer fix)
 
     val = qdict_get_qdict(ret, "return");
     g_assert(qdict_haskey(val, "host-name"));
-
-    qobject_unref(ret);
 }
 
 static void test_qga_guest_get_timezone(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret, *val;
+    g_autoptr(QDict) ret = NULL;
+    QDict *val;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-get-timezone'}");
     g_assert_nonnull(ret);
@@ -889,14 +859,12 @@ static void test_qga_guest_get_timezone(gconstpointer fix)
     /* Make sure there's at least offset */
     val = qdict_get_qdict(ret, "return");
     g_assert(qdict_haskey(val, "offset"));
-
-    qobject_unref(ret);
 }
 
 static void test_qga_guest_get_users(gconstpointer fix)
 {
     const TestFixture *fixture = fix;
-    QDict *ret;
+    g_autoptr(QDict) ret = NULL;
     QList *val;
 
     ret = qmp_fd(fixture->fd, "{'execute': 'guest-get-users'}");
@@ -906,15 +874,13 @@ static void test_qga_guest_get_users(gconstpointer fix)
     /* There is not much to test here */
     val = qdict_get_qlist(ret, "return");
     g_assert_nonnull(val);
-
-    qobject_unref(ret);
 }
 
 static void test_qga_guest_get_osinfo(gconstpointer data)
 {
     TestFixture fixture;
     const gchar *str;
-    QDict *ret = NULL;
+    g_autoptr(QDict) ret = NULL;
     char *env[2];
     QDict *val;
 
@@ -958,7 +924,6 @@ static void test_qga_guest_get_osinfo(gconstpointer data)
     g_assert_nonnull(str);
     g_assert_cmpstr(str, ==, "unit-test");
 
-    qobject_unref(ret);
     g_free(env[0]);
     fixture_tear_down(&fixture, NULL);
 }
-- 
2.36.0.44.g0f828332d5ac


