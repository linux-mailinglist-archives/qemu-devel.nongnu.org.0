Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE081D491B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 11:10:13 +0200 (CEST)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZWM8-0005hY-M2
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 05:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jZWIi-00086o-AC
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:06:40 -0400
Received: from mail-m973.mail.163.com ([123.126.97.3]:56404)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jZWId-0002LE-KD
 for qemu-devel@nongnu.org; Fri, 15 May 2020 05:06:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=x/4Un
 BkFDAaZe3wvIUYC36nOqk/QIjjtb/dZzAJ/HQE=; b=VeIykbK74/DQjxhXhd7Gy
 ce3gvtKZ90Vwa96O+WgdS3++iCypqbhpS9Q3Wl1NlwtRasFd5Olvfgk4pmVyJN/a
 u2ca6sbbmpq3er+xAEKdeb4JG4AXOhLsbOSiseZ3ibw5isitbJtqqS34VSJnOwSS
 MUdnc06G0As/QbaYGIlOT0=
Received: from localhost.localdomain (unknown [114.240.93.195])
 by smtp3 (Coremail) with SMTP id G9xpCgBnt5uKW75eMHSGBQ--.172S3;
 Fri, 15 May 2020 17:06:25 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/3] qemu-sockets: add abstract UNIX domain socket support
Date: Fri, 15 May 2020 17:06:06 +0800
Message-Id: <20200515090608.5373-2-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515090608.5373-1-zxq_yx_007@163.com>
References: <20200515090608.5373-1-zxq_yx_007@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgBnt5uKW75eMHSGBQ--.172S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF1xJFy3GFWfKF45Kr43Awb_yoW7Kw4kpr
 y5Kas8KayrJr4IgrsxXa1UCr1fAan5XryUW3y8JwnY9ws8Ww18Za4UKryYgry5JrW3W347
 urn0gr4UCF9xJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzVbkUUUUU=
X-Originating-IP: [114.240.93.195]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiqBElxlc7PM4nagAAsJ
Received-SPF: pass client-ip=123.126.97.3; envelope-from=zxq_yx_007@163.com;
 helo=mail-m973.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 05:06:29
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 armbru@redhat.com, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

unix_listen/connect_saddr now support abstract address types

two aditional BOOL switches are introduced:
tight: whether to set @addrlen to the minimal string length,
       or the maximum sun_path length. default is TRUE
abstract: whether we use abstract address. default is FALSE

cli example:
-monitor unix:/tmp/unix.socket,abstract,tight=off
OR
-chardev socket,path=/tmp/unix.socket,id=unix1,abstract,tight=on

Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char-socket.c |  4 ++++
 chardev/char.c        |  7 +++++++
 qapi/sockets.json     |  8 +++++++-
 util/qemu-sockets.c   | 39 ++++++++++++++++++++++++++++++++-------
 4 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 185fe38dda..16f2211091 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1380,6 +1380,8 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     const char *host = qemu_opt_get(opts, "host");
     const char *port = qemu_opt_get(opts, "port");
     const char *fd = qemu_opt_get(opts, "fd");
+    bool tight = qemu_opt_get_bool(opts, "tight", true);
+    bool abstract = qemu_opt_get_bool(opts, "abstract", false);
     SocketAddressLegacy *addr;
     ChardevSocket *sock;
 
@@ -1431,6 +1433,8 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
         addr->type = SOCKET_ADDRESS_LEGACY_KIND_UNIX;
         q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
         q_unix->path = g_strdup(path);
+        q_unix->tight = tight;
+        q_unix->abstract = abstract;
     } else if (host) {
         addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
         addr->u.inet.data = g_new(InetSocketAddress, 1);
diff --git a/chardev/char.c b/chardev/char.c
index e77564060d..f44fda3a92 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -939,6 +939,13 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "logappend",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "tight",
+            .type = QEMU_OPT_BOOL,
+            .def_value_str = "on",
+        },{
+            .name = "abstract",
+            .type = QEMU_OPT_BOOL,
         },
         { /* end of list */ }
     },
diff --git a/qapi/sockets.json b/qapi/sockets.json
index ea933ed4b2..cbd6ef35d0 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -73,12 +73,18 @@
 # Captures a socket address in the local ("Unix socket") namespace.
 #
 # @path: filesystem path to use
+# @tight: pass a socket address length confined to the minimum length of the
+#         abstract string, rather than the full sockaddr_un record length
+#         (only matters for abstract sockets, default true). (Since 5.1)
+# @abstract: whether this is an abstract address, default false. (Since 5.1)
 #
 # Since: 1.3
 ##
 { 'struct': 'UnixSocketAddress',
   'data': {
-    'path': 'str' } }
+    'path': 'str',
+    '*tight': 'bool',
+    '*abstract': 'bool' } }
 
 ##
 # @VsockSocketAddress:
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 86c48b9fa5..b37d288866 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -863,6 +863,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     char *pathbuf = NULL;
     const char *path;
     size_t pathlen;
+    size_t addrlen;
 
     sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
     if (sock < 0) {
@@ -879,9 +880,11 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     }
 
     pathlen = strlen(path);
-    if (pathlen > sizeof(un.sun_path)) {
+    if (pathlen > sizeof(un.sun_path) ||
+        (saddr->abstract && pathlen > (sizeof(un.sun_path) - 1))) {
         error_setg(errp, "UNIX socket path '%s' is too long", path);
         error_append_hint(errp, "Path must be less than %zu bytes\n",
+                          saddr->abstract ? sizeof(un.sun_path) - 1 :
                           sizeof(un.sun_path));
         goto err;
     }
@@ -903,7 +906,7 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
         close(fd);
     }
 
-    if (unlink(path) < 0 && errno != ENOENT) {
+    if (!saddr->abstract && unlink(path) < 0 && errno != ENOENT) {
         error_setg_errno(errp, errno,
                          "Failed to unlink socket %s", path);
         goto err;
@@ -911,9 +914,19 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
 
     memset(&un, 0, sizeof(un));
     un.sun_family = AF_UNIX;
-    memcpy(un.sun_path, path, pathlen);
+    addrlen = sizeof(un);
 
-    if (bind(sock, (struct sockaddr*) &un, sizeof(un)) < 0) {
+    if (saddr->abstract) {
+        un.sun_path[0] = '\0';
+        memcpy(&un.sun_path[1], path, pathlen);
+        if (saddr->tight) {
+            addrlen = offsetof(struct sockaddr_un, sun_path) + 1 + pathlen;
+        }
+    } else {
+        memcpy(un.sun_path, path, pathlen);
+    }
+
+    if (bind(sock, (struct sockaddr *) &un, addrlen) < 0) {
         error_setg_errno(errp, errno, "Failed to bind socket to %s", path);
         goto err;
     }
@@ -936,6 +949,7 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     struct sockaddr_un un;
     int sock, rc;
     size_t pathlen;
+    size_t addrlen;
 
     if (saddr->path == NULL) {
         error_setg(errp, "unix connect: no path specified");
@@ -949,21 +963,32 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
     }
 
     pathlen = strlen(saddr->path);
-    if (pathlen > sizeof(un.sun_path)) {
+    if (pathlen > sizeof(un.sun_path) ||
+        (saddr->abstract && pathlen > (sizeof(un.sun_path) - 1))) {
         error_setg(errp, "UNIX socket path '%s' is too long", saddr->path);
         error_append_hint(errp, "Path must be less than %zu bytes\n",
+                          saddr->abstract ? sizeof(un.sun_path) - 1 :
                           sizeof(un.sun_path));
         goto err;
     }
 
     memset(&un, 0, sizeof(un));
     un.sun_family = AF_UNIX;
-    memcpy(un.sun_path, saddr->path, pathlen);
+    addrlen = sizeof(un);
 
+    if (saddr->abstract) {
+        un.sun_path[0] = '\0';
+        memcpy(&un.sun_path[1], saddr->path, pathlen);
+        if (saddr->tight) {
+            addrlen = offsetof(struct sockaddr_un, sun_path) + 1 + pathlen;
+        }
+    } else {
+        memcpy(un.sun_path, saddr->path, pathlen);
+    }
     /* connect to peer */
     do {
         rc = 0;
-        if (connect(sock, (struct sockaddr *) &un, sizeof(un)) < 0) {
+        if (connect(sock, (struct sockaddr *) &un, addrlen) < 0) {
             rc = -errno;
         }
     } while (rc == -EINTR);
-- 
2.17.1


