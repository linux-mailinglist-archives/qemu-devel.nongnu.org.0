Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ED62B0C5D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:10:51 +0100 (CET)
Received: from localhost ([::1]:47950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH3a-00056P-Ae
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:10:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt7-0001L6-4q
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:00:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt3-0000ni-9p
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VQPi4yy940Ey6avasAaK49Dq3ioMsgywOo60wT0Si4I=;
 b=T1FQiskBCGQZqF+vZ9RQjJWbZV5t0YDN346hmD/kiBqteNDSpVCV0bf42WNBZpGxlhkrQC
 9Lz+idzop+jfYQaylImFTAN7LO447e11hlQYDbMrammFQe5YhgyoPBMYutZ8q/VmvxF1+P
 CyzLou6WgN2cjJTlsp7tP8jEX29RPNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-O-dKilhGMjqtaPKatleCbg-1; Thu, 12 Nov 2020 12:59:47 -0500
X-MC-Unique: O-dKilhGMjqtaPKatleCbg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93C3D802B51
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:46 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E417E1002C1A;
 Thu, 12 Nov 2020 17:59:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/13] char: Remove ChardevClass.parse
Date: Thu, 12 Nov 2020 18:59:05 +0100
Message-Id: <20201112175905.404472-14-kwolf@redhat.com>
In-Reply-To: <20201112175905.404472-1-kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QemuOpts based ChardevClass.parse has been replaced by the QAPI
parser and is unused now, remove it.

After removing all .parse implementations, qemu_chr_parse_common() is
unused, too, so remove that one as well.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/chardev/char.h  | 10 -----
 chardev/char-file.c     | 20 ---------
 chardev/char-mux.c      | 17 --------
 chardev/char-parallel.c | 17 --------
 chardev/char-pipe.c     | 17 --------
 chardev/char-ringbuf.c  | 18 --------
 chardev/char-serial.c   | 17 --------
 chardev/char-socket.c   | 92 -----------------------------------------
 chardev/char-stdio.c    | 13 ------
 chardev/char-udp.c      | 60 ---------------------------
 chardev/char.c          | 11 -----
 chardev/spice.c         | 34 ---------------
 ui/console.c            | 35 ----------------
 ui/gtk.c                |  1 -
 ui/spice-app.c          |  1 -
 15 files changed, 363 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index 761c521bd8..ea095dd998 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -137,15 +137,6 @@ ChardevOptions *qemu_chr_parse_cli_str(const char *optarg, Error **errp);
  */
 void qemu_chr_translate_legacy_options(QDict *args);
 
-/**
- * qemu_chr_parse_common:
- * @opts: the options that still need parsing
- * @backend: a new backend
- *
- * Parse the common options available to all character backends.
- */
-void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend);
-
 /**
  * qemu_chr_new:
  * @label: the name of the backend
@@ -294,7 +285,6 @@ struct ChardevClass {
     ObjectClass parent_class;
 
     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
-    void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
     void (*translate_legacy_options)(QDict *args);
 
     void (*open)(Chardev *chr, ChardevBackend *backend,
diff --git a/chardev/char-file.c b/chardev/char-file.c
index 2fd80707e5..5684bfb9b1 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -96,30 +96,10 @@ static void qmp_chardev_open_file(Chardev *chr,
 #endif
 }
 
-static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
-                                    Error **errp)
-{
-    const char *path = qemu_opt_get(opts, "path");
-    ChardevFile *file;
-
-    backend->type = CHARDEV_BACKEND_KIND_FILE;
-    if (path == NULL) {
-        error_setg(errp, "chardev: file: no filename given");
-        return;
-    }
-    file = backend->u.file.data = g_new0(ChardevFile, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevFile_base(file));
-    file->out = g_strdup(path);
-
-    file->has_append = true;
-    file->append = qemu_opt_get_bool(opts, "append", false);
-}
-
 static void char_file_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_file_out;
     cc->open = qmp_chardev_open_file;
 }
 
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 6f980bb836..91542bb3e3 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -332,22 +332,6 @@ static void qemu_chr_open_mux(Chardev *chr,
     qemu_chr_fe_init(&d->chr, drv, errp);
 }
 
-static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
-                               Error **errp)
-{
-    const char *chardev = qemu_opt_get(opts, "chardev");
-    ChardevMux *mux;
-
-    if (chardev == NULL) {
-        error_setg(errp, "chardev: mux: no chardev given");
-        return;
-    }
-    backend->type = CHARDEV_BACKEND_KIND_MUX;
-    mux = backend->u.mux.data = g_new0(ChardevMux, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevMux_base(mux));
-    mux->chardev = g_strdup(chardev);
-}
-
 /**
  * Called after processing of default and command-line-specified
  * chardevs to deliver CHR_EVENT_OPENED events to any FEs attached
@@ -377,7 +361,6 @@ static void char_mux_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_mux;
     cc->open = qemu_chr_open_mux;
     cc->chr_write = mux_chr_write;
     cc->chr_accept_input = mux_chr_accept_input;
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 05e7efbd6c..066f1fc7ba 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -254,27 +254,10 @@ static void qmp_chardev_open_parallel(Chardev *chr,
     qemu_chr_open_pp_fd(chr, fd, be_opened, errp);
 }
 
-static void qemu_chr_parse_parallel(QemuOpts *opts, ChardevBackend *backend,
-                                    Error **errp)
-{
-    const char *device = qemu_opt_get(opts, "path");
-    ChardevHostdev *parallel;
-
-    if (device == NULL) {
-        error_setg(errp, "chardev: parallel: no device path given");
-        return;
-    }
-    backend->type = CHARDEV_BACKEND_KIND_PARALLEL;
-    parallel = backend->u.parallel.data = g_new0(ChardevHostdev, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevHostdev_base(parallel));
-    parallel->device = g_strdup(device);
-}
-
 static void char_parallel_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_parallel;
     cc->open = qmp_chardev_open_parallel;
 #if defined(__linux__)
     cc->chr_ioctl = pp_ioctl;
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index 7eca5d9a56..97143c67fc 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -154,27 +154,10 @@ static void qemu_chr_open_pipe(Chardev *chr,
 
 #endif /* !_WIN32 */
 
-static void qemu_chr_parse_pipe(QemuOpts *opts, ChardevBackend *backend,
-                                Error **errp)
-{
-    const char *device = qemu_opt_get(opts, "path");
-    ChardevHostdev *dev;
-
-    if (device == NULL) {
-        error_setg(errp, "chardev: pipe: no device path given");
-        return;
-    }
-    backend->type = CHARDEV_BACKEND_KIND_PIPE;
-    dev = backend->u.pipe.data = g_new0(ChardevHostdev, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevHostdev_base(dev));
-    dev->device = g_strdup(device);
-}
-
 static void char_pipe_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_pipe;
     cc->open = qemu_chr_open_pipe;
 }
 
diff --git a/chardev/char-ringbuf.c b/chardev/char-ringbuf.c
index d40d21d3cf..16eb46e971 100644
--- a/chardev/char-ringbuf.c
+++ b/chardev/char-ringbuf.c
@@ -206,28 +206,10 @@ char *qmp_ringbuf_read(const char *device, int64_t size,
     return data;
 }
 
-static void qemu_chr_parse_ringbuf(QemuOpts *opts, ChardevBackend *backend,
-                                   Error **errp)
-{
-    int val;
-    ChardevRingbuf *ringbuf;
-
-    backend->type = CHARDEV_BACKEND_KIND_RINGBUF;
-    ringbuf = backend->u.ringbuf.data = g_new0(ChardevRingbuf, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevRingbuf_base(ringbuf));
-
-    val = qemu_opt_get_size(opts, "size", 0);
-    if (val != 0) {
-        ringbuf->has_size = true;
-        ringbuf->size = val;
-    }
-}
-
 static void char_ringbuf_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_ringbuf;
     cc->open = qemu_chr_open_ringbuf;
     cc->chr_write = ringbuf_chr_write;
 }
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 7c3d84ae24..7e207339dc 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -279,27 +279,10 @@ static void qmp_chardev_open_serial(Chardev *chr,
 #endif /* __linux__ || __sun__ */
 
 #ifdef HAVE_CHARDEV_SERIAL
-static void qemu_chr_parse_serial(QemuOpts *opts, ChardevBackend *backend,
-                                  Error **errp)
-{
-    const char *device = qemu_opt_get(opts, "path");
-    ChardevHostdev *serial;
-
-    if (device == NULL) {
-        error_setg(errp, "chardev: serial/tty: no device path given");
-        return;
-    }
-    backend->type = CHARDEV_BACKEND_KIND_SERIAL;
-    serial = backend->u.serial.data = g_new0(ChardevHostdev, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevHostdev_base(serial));
-    serial->device = g_strdup(device);
-}
-
 static void char_serial_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_serial;
     cc->open = qmp_chardev_open_serial;
 #ifndef _WIN32
     cc->chr_ioctl = tty_serial_ioctl;
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 6bf916a3e4..a38b9d939f 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1394,97 +1394,6 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
 }
 
-static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
-                                  Error **errp)
-{
-    const char *path = qemu_opt_get(opts, "path");
-    const char *host = qemu_opt_get(opts, "host");
-    const char *port = qemu_opt_get(opts, "port");
-    const char *fd = qemu_opt_get(opts, "fd");
-#ifdef CONFIG_LINUX
-    bool tight = qemu_opt_get_bool(opts, "tight", true);
-    bool abstract = qemu_opt_get_bool(opts, "abstract", false);
-#endif
-    SocketAddressLegacy *addr;
-    ChardevSocket *sock;
-
-    if ((!!path + !!fd + !!host) != 1) {
-        error_setg(errp,
-                   "Exactly one of 'path', 'fd' or 'host' required");
-        return;
-    }
-
-    if (host && !port) {
-        error_setg(errp, "chardev: socket: no port given");
-        return;
-    }
-
-    backend->type = CHARDEV_BACKEND_KIND_SOCKET;
-    sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
-
-    sock->has_nodelay = qemu_opt_get(opts, "delay");
-    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
-    /*
-     * We have different default to QMP for 'server', hence
-     * we can't just check for existence of 'server'
-     */
-    sock->has_server = true;
-    sock->server = qemu_opt_get_bool(opts, "server", false);
-    sock->has_telnet = qemu_opt_get(opts, "telnet");
-    sock->telnet = qemu_opt_get_bool(opts, "telnet", false);
-    sock->has_tn3270 = qemu_opt_get(opts, "tn3270");
-    sock->tn3270 = qemu_opt_get_bool(opts, "tn3270", false);
-    sock->has_websocket = qemu_opt_get(opts, "websocket");
-    sock->websocket = qemu_opt_get_bool(opts, "websocket", false);
-    /*
-     * We have different default to QMP for 'wait' when 'server'
-     * is set, hence we can't just check for existence of 'wait'
-     */
-    sock->has_wait = qemu_opt_find(opts, "wait") || sock->server;
-    sock->wait = qemu_opt_get_bool(opts, "wait", true);
-    sock->has_reconnect = qemu_opt_find(opts, "reconnect");
-    sock->reconnect = qemu_opt_get_number(opts, "reconnect", 0);
-    sock->has_tls_creds = qemu_opt_get(opts, "tls-creds");
-    sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
-    sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
-    sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
-
-    addr = g_new0(SocketAddressLegacy, 1);
-    if (path) {
-        UnixSocketAddress *q_unix;
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_UNIX;
-        q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
-        q_unix->path = g_strdup(path);
-#ifdef CONFIG_LINUX
-        q_unix->has_tight = true;
-        q_unix->tight = tight;
-        q_unix->has_abstract = true;
-        q_unix->abstract = abstract;
-#endif
-    } else if (host) {
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
-        addr->u.inet.data = g_new(InetSocketAddress, 1);
-        *addr->u.inet.data = (InetSocketAddress) {
-            .host = g_strdup(host),
-            .port = g_strdup(port),
-            .has_to = qemu_opt_get(opts, "to"),
-            .to = qemu_opt_get_number(opts, "to", 0),
-            .has_ipv4 = qemu_opt_get(opts, "ipv4"),
-            .ipv4 = qemu_opt_get_bool(opts, "ipv4", 0),
-            .has_ipv6 = qemu_opt_get(opts, "ipv6"),
-            .ipv6 = qemu_opt_get_bool(opts, "ipv6", 0),
-        };
-    } else if (fd) {
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_FD;
-        addr->u.fd.data = g_new(String, 1);
-        addr->u.fd.data->str = g_strdup(fd);
-    } else {
-        g_assert_not_reached();
-    }
-    sock->addr = addr;
-}
-
 static void qemu_chr_translate_socket(QDict *args)
 {
     const char *path = qdict_get_try_str(args, "path");
@@ -1557,7 +1466,6 @@ static void char_socket_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_socket;
     cc->translate_legacy_options = qemu_chr_translate_socket;
     cc->open = qmp_chardev_open_socket;
     cc->chr_wait_connected = tcp_chr_wait_connected;
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 403da308c9..74e2b25e9b 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -117,23 +117,10 @@ static void qemu_chr_open_stdio(Chardev *chr,
 }
 #endif
 
-static void qemu_chr_parse_stdio(QemuOpts *opts, ChardevBackend *backend,
-                                 Error **errp)
-{
-    ChardevStdio *stdio;
-
-    backend->type = CHARDEV_BACKEND_KIND_STDIO;
-    stdio = backend->u.stdio.data = g_new0(ChardevStdio, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevStdio_base(stdio));
-    stdio->has_signal = true;
-    stdio->signal = qemu_opt_get_bool(opts, "signal", true);
-}
-
 static void char_stdio_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_stdio;
 #ifndef _WIN32
     cc->open = qemu_chr_open_stdio;
     cc->chr_set_echo = qemu_chr_set_echo_stdio;
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 61752b1c51..1543fbca0c 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -133,65 +133,6 @@ static void char_udp_finalize(Object *obj)
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
 }
 
-static void qemu_chr_parse_udp(QemuOpts *opts, ChardevBackend *backend,
-                               Error **errp)
-{
-    const char *host = qemu_opt_get(opts, "host");
-    const char *port = qemu_opt_get(opts, "port");
-    const char *localaddr = qemu_opt_get(opts, "localaddr");
-    const char *localport = qemu_opt_get(opts, "localport");
-    bool has_local = false;
-    SocketAddressLegacy *addr;
-    ChardevUdp *udp;
-
-    backend->type = CHARDEV_BACKEND_KIND_UDP;
-    if (host == NULL || strlen(host) == 0) {
-        host = "localhost";
-    }
-    if (port == NULL || strlen(port) == 0) {
-        error_setg(errp, "chardev: udp: remote port not specified");
-        return;
-    }
-    if (localport == NULL || strlen(localport) == 0) {
-        localport = "0";
-    } else {
-        has_local = true;
-    }
-    if (localaddr == NULL || strlen(localaddr) == 0) {
-        localaddr = "";
-    } else {
-        has_local = true;
-    }
-
-    udp = backend->u.udp.data = g_new0(ChardevUdp, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevUdp_base(udp));
-
-    addr = g_new0(SocketAddressLegacy, 1);
-    addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
-    addr->u.inet.data = g_new(InetSocketAddress, 1);
-    *addr->u.inet.data = (InetSocketAddress) {
-        .host = g_strdup(host),
-        .port = g_strdup(port),
-        .has_ipv4 = qemu_opt_get(opts, "ipv4"),
-        .ipv4 = qemu_opt_get_bool(opts, "ipv4", 0),
-        .has_ipv6 = qemu_opt_get(opts, "ipv6"),
-        .ipv6 = qemu_opt_get_bool(opts, "ipv6", 0),
-    };
-    udp->remote = addr;
-
-    if (has_local) {
-        udp->has_local = true;
-        addr = g_new0(SocketAddressLegacy, 1);
-        addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
-        addr->u.inet.data = g_new(InetSocketAddress, 1);
-        *addr->u.inet.data = (InetSocketAddress) {
-            .host = g_strdup(localaddr),
-            .port = g_strdup(localport),
-        };
-        udp->local = addr;
-    }
-}
-
 static void qemu_chr_translate_udp(QDict *args)
 {
     QDict *remote;
@@ -256,7 +197,6 @@ static void char_udp_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_udp;
     cc->translate_legacy_options = qemu_chr_translate_udp;
     cc->open = qmp_chardev_open_udp;
     cc->chr_write = udp_chr_write;
diff --git a/chardev/char.c b/chardev/char.c
index c3cfd473b4..a26fe5555e 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -497,17 +497,6 @@ fail:
     return NULL;
 }
 
-void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
-{
-    const char *logfile = qemu_opt_get(opts, "logfile");
-
-    backend->has_logfile = logfile != NULL;
-    backend->logfile = g_strdup(logfile);
-
-    backend->has_logappend = true;
-    backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
-}
-
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
 {
     ObjectClass *oc;
diff --git a/chardev/spice.c b/chardev/spice.c
index 1104426e3a..c87bd7e18e 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -317,38 +317,6 @@ static void qemu_chr_open_spice_port(Chardev *chr,
     vmc_register_interface(s);
 }
 
-static void qemu_chr_parse_spice_vmc(QemuOpts *opts, ChardevBackend *backend,
-                                     Error **errp)
-{
-    const char *name = qemu_opt_get(opts, "name");
-    ChardevSpiceChannel *spicevmc;
-
-    if (name == NULL) {
-        error_setg(errp, "chardev: spice channel: no name given");
-        return;
-    }
-    backend->type = CHARDEV_BACKEND_KIND_SPICEVMC;
-    spicevmc = backend->u.spicevmc.data = g_new0(ChardevSpiceChannel, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevSpiceChannel_base(spicevmc));
-    spicevmc->type = g_strdup(name);
-}
-
-static void qemu_chr_parse_spice_port(QemuOpts *opts, ChardevBackend *backend,
-                                      Error **errp)
-{
-    const char *name = qemu_opt_get(opts, "name");
-    ChardevSpicePort *spiceport;
-
-    if (name == NULL) {
-        error_setg(errp, "chardev: spice port: no name given");
-        return;
-    }
-    backend->type = CHARDEV_BACKEND_KIND_SPICEPORT;
-    spiceport = backend->u.spiceport.data = g_new0(ChardevSpicePort, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevSpicePort_base(spiceport));
-    spiceport->fqdn = g_strdup(name);
-}
-
 static void char_spice_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
@@ -371,7 +339,6 @@ static void char_spicevmc_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_spice_vmc;
     cc->open = qemu_chr_open_spice_vmc;
     cc->chr_set_fe_open = spice_vmc_set_fe_open;
 }
@@ -386,7 +353,6 @@ static void char_spiceport_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_spice_port;
     cc->open = qemu_chr_open_spice_port;
     cc->chr_set_fe_open = spice_port_set_fe_open;
 }
diff --git a/ui/console.c b/ui/console.c
index e8e59707d3..7d8c1d1306 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2386,40 +2386,6 @@ void qemu_display_help(void)
     }
 }
 
-void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp)
-{
-    int val;
-    ChardevVC *vc;
-
-    backend->type = CHARDEV_BACKEND_KIND_VC;
-    vc = backend->u.vc.data = g_new0(ChardevVC, 1);
-    qemu_chr_parse_common(opts, qapi_ChardevVC_base(vc));
-
-    val = qemu_opt_get_number(opts, "width", 0);
-    if (val != 0) {
-        vc->has_width = true;
-        vc->width = val;
-    }
-
-    val = qemu_opt_get_number(opts, "height", 0);
-    if (val != 0) {
-        vc->has_height = true;
-        vc->height = val;
-    }
-
-    val = qemu_opt_get_number(opts, "cols", 0);
-    if (val != 0) {
-        vc->has_cols = true;
-        vc->cols = val;
-    }
-
-    val = qemu_opt_get_number(opts, "rows", 0);
-    if (val != 0) {
-        vc->has_rows = true;
-        vc->rows = val;
-    }
-}
-
 static const TypeInfo qemu_console_info = {
     .name = TYPE_QEMU_CONSOLE,
     .parent = TYPE_OBJECT,
@@ -2431,7 +2397,6 @@ static void char_vc_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_vc;
     cc->open = vc_chr_open;
     cc->chr_write = vc_chr_write;
     cc->chr_set_echo = vc_chr_set_echo;
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be..7a5702c28b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1738,7 +1738,6 @@ static void char_gd_vc_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_vc;
     cc->open = gd_vc_open;
     cc->chr_write = gd_vc_chr_write;
     cc->chr_set_echo = gd_vc_chr_set_echo;
diff --git a/ui/spice-app.c b/ui/spice-app.c
index 026124ef56..f3418111fb 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -101,7 +101,6 @@ static void char_vc_class_init(ObjectClass *oc, void *data)
 
     vc->parent_open = cc->open;
 
-    cc->parse = qemu_chr_parse_vc;
     cc->open = vc_chr_open;
     cc->chr_set_echo = vc_chr_set_echo;
 }
-- 
2.28.0


