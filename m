Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA1464C4CC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:14:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUO-0003TQ-Dl; Wed, 14 Dec 2022 02:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUK-0003R6-AK
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUG-0003e7-PG
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWLNTjgXu8jR0MRakAY25tFDEETQkSqbquBCbwr8QKw=;
 b=JA1uHGTNP1MZ0l7qVNIKprLorBf0xRginzosVMwLxeShxmwRXYjGHQvthszgDdC3Pg+4MJ
 gEPfqArZNxX6EAzT4yUvnJaNjgh+2zyU+kwKgAjSkTqjThiJ/c5IfD5e8hK2lX65GV9NkC
 8LFMQeys8YgIeNaecJRpGzBPBqDnTDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-8i-pERD8OKSouwkyBDVtJg-1; Wed, 14 Dec 2022 02:47:28 -0500
X-MC-Unique: 8i-pERD8OKSouwkyBDVtJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55A258588E9;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F6640C2004;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B11921E649E; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/30] qapi chardev: Elide redundant has_FOO in generated C
Date: Wed, 14 Dec 2022 08:47:02 +0100
Message-Id: <20221214074721.731441-14-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/char.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221104160712.3005652-12-armbru@redhat.com>
---
 chardev/char-file.c    |  4 ++--
 chardev/char-socket.c  | 10 ++++------
 chardev/char-udp.c     |  1 -
 chardev/char.c         |  6 +-----
 tests/unit/test-char.c |  1 -
 scripts/qapi/schema.py |  1 -
 6 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/chardev/char-file.c b/chardev/char-file.c
index 2fd80707e5..3a7b9caf6f 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -45,7 +45,7 @@ static void qmp_chardev_open_file(Chardev *chr,
     DWORD accessmode;
     DWORD flags;
 
-    if (file->has_in) {
+    if (file->in) {
         error_setg(errp, "input file not supported");
         return;
     }
@@ -83,7 +83,7 @@ static void qmp_chardev_open_file(Chardev *chr,
         return;
     }
 
-    if (file->has_in) {
+    if (file->in) {
         flags = O_RDONLY;
         in = qmp_chardev_open_file_source(file->in, flags, errp);
         if (in < 0) {
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 879564aa8a..29ffe5075e 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1251,7 +1251,7 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
                        "'fd' address type");
             return false;
         }
-        if (sock->has_tls_creds &&
+        if (sock->tls_creds &&
             !(sock->has_server && sock->server)) {
             error_setg(errp,
                        "'tls_creds' option is incompatible with "
@@ -1261,7 +1261,7 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
         break;
 
     case SOCKET_ADDRESS_TYPE_UNIX:
-        if (sock->has_tls_creds) {
+        if (sock->tls_creds) {
             error_setg(errp,
                        "'tls_creds' option is incompatible with "
                        "'unix' address type");
@@ -1273,7 +1273,7 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
         break;
 
     case SOCKET_ADDRESS_TYPE_VSOCK:
-        if (sock->has_tls_creds) {
+        if (sock->tls_creds) {
             error_setg(errp,
                        "'tls_creds' option is incompatible with "
                        "'vsock' address type");
@@ -1284,7 +1284,7 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
         break;
     }
 
-    if (sock->has_tls_authz && !sock->has_tls_creds) {
+    if (sock->tls_authz && !sock->tls_creds) {
         error_setg(errp, "'tls_authz' option requires 'tls_creds' option");
         return false;
     }
@@ -1465,9 +1465,7 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     sock->wait = qemu_opt_get_bool(opts, "wait", true);
     sock->has_reconnect = qemu_opt_find(opts, "reconnect");
     sock->reconnect = qemu_opt_get_number(opts, "reconnect", 0);
-    sock->has_tls_creds = qemu_opt_get(opts, "tls-creds");
     sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
-    sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
     sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
 
     addr = g_new0(SocketAddressLegacy, 1);
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 6756e69924..3d9a2d5e77 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -178,7 +178,6 @@ static void qemu_chr_parse_udp(QemuOpts *opts, ChardevBackend *backend,
     udp->remote = addr;
 
     if (has_local) {
-        udp->has_local = true;
         addr = g_new0(SocketAddressLegacy, 1);
         addr->type = SOCKET_ADDRESS_TYPE_INET;
         addr->u.inet.data = g_new(InetSocketAddress, 1);
diff --git a/chardev/char.c b/chardev/char.c
index b005df3ccf..4c5de16402 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -240,7 +240,7 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
 
-    if (common && common->has_logfile) {
+    if (common && common->logfile) {
         int flags = O_WRONLY;
         if (common->has_logappend &&
             common->logappend) {
@@ -496,9 +496,7 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 {
     const char *logfile = qemu_opt_get(opts, "logfile");
 
-    backend->has_logfile = logfile != NULL;
     backend->logfile = g_strdup(logfile);
-
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
 }
@@ -1057,7 +1055,6 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     ret = g_new0(ChardevReturn, 1);
     if (CHARDEV_IS_PTY(chr)) {
         ret->pty = g_strdup(chr->filename + 4);
-        ret->has_pty = true;
     }
 
     return ret;
@@ -1160,7 +1157,6 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
     ret = g_new0(ChardevReturn, 1);
     if (CHARDEV_IS_PTY(chr_new)) {
         ret->pty = g_strdup(chr_new->filename + 4);
-        ret->has_pty = true;
     }
 
     return ret;
diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index 5b3b48ebac..649fdf64e1 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -1212,7 +1212,6 @@ static void char_file_fifo_test(void)
     char *fifo = g_build_filename(tmp_path, "fifo", NULL);
     char *out = g_build_filename(tmp_path, "out", NULL);
     ChardevFile file = { .in = fifo,
-                         .has_in = true,
                          .out = out };
     ChardevBackend backend = { .type = CHARDEV_BACKEND_KIND_FILE,
                                .u.file.data = &file };
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index a205aae1e3..707c671133 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,7 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/char.json',
             'qapi/crypto.json',
             'qapi/dump.json',
             'qapi/job.json',
-- 
2.37.3


