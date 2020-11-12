Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A26B2B0C46
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:06:15 +0100 (CET)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGz8-0007qp-Gb
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsf-00012j-NF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsd-0000iz-Of
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFTDr825FMzPBU3tjZJr268wIpQ/iffr0DrtR876y14=;
 b=LfDTufrxpOhi5ZO21jkHMp16pIoNswSCVST2d8JCXnYi+y7KRkf4nnFTXEZO6OQEj2AJuw
 WdhIYfwgXP889DJMQ6K+IzyBViSzi2QYq6OJ/vis2oWe2PLUJM8dsSZP1S1yQ+CHOlHXI4
 ifmvquqUvcm3pbqZ3S6HcX4t29FQdXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-Jpjv-h99N_y4LqsUvqIGww-1; Thu, 12 Nov 2020 12:59:29 -0500
X-MC-Unique: Jpjv-h99N_y4LqsUvqIGww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FB6210199A8
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:28 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E781A1002C1B;
 Thu, 12 Nov 2020 17:59:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/13] char-socket: Implement compat code for CLI QAPIfication
Date: Thu, 12 Nov 2020 18:58:57 +0100
Message-Id: <20201112175905.404472-6-kwolf@redhat.com>
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

Socket backends have a few differences between CLI and QMP. This adds
QAPI aliases and a .translate_legacy_options() implementation that
converts CLI inputs to a form that's usable for a QAPIfied --chardev.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/char.json         |  3 ++-
 qapi/sockets.json      |  6 ++++-
 include/chardev/char.h |  1 +
 chardev/char-socket.c  | 53 ++++++++++++++++++++++++++++++++++++++++++
 chardev/char.c         | 10 +++++++-
 5 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index 91c0dbfa1e..1930e90e95 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -287,7 +287,8 @@
             '*tn3270': 'bool',
             '*websocket': 'bool',
             '*reconnect': 'int' },
-  'base': 'ChardevCommon' }
+  'base': 'ChardevCommon',
+  'aliases': [ { 'source': ['addr'] } ] }
 
 ##
 # @ChardevUdp:
diff --git a/qapi/sockets.json b/qapi/sockets.json
index 2e83452797..8c61787311 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -125,7 +125,11 @@
     'inet': 'InetSocketAddress',
     'unix': 'UnixSocketAddress',
     'vsock': 'VsockSocketAddress',
-    'fd': 'String' } }
+    'fd': 'String' },
+  'aliases': [
+    {'source': ['data']},
+    {'alias': 'fd', 'source': ['data', 'str']}
+  ]}
 
 ##
 # @SocketAddressType:
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 7795e17ca5..c0944f5828 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -275,6 +275,7 @@ struct ChardevClass {
 
     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
+    void (*translate_legacy_options)(QDict *args);
 
     void (*open)(Chardev *chr, ChardevBackend *backend,
                  bool *be_opened, Error **errp);
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 213a4c8dd0..6bf916a3e4 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -34,6 +34,7 @@
 #include "qapi/error.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qapi/qmp/qdict.h"
 
 #include "chardev/char-io.h"
 #include "qom/object.h"
@@ -1484,6 +1485,57 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     sock->addr = addr;
 }
 
+static void qemu_chr_translate_socket(QDict *args)
+{
+    const char *path = qdict_get_try_str(args, "path");
+    const char *host = qdict_get_try_str(args, "host");
+    const char *fd = qdict_get_try_str(args, "fd");
+    const char *delay = qdict_get_try_str(args, "delay");
+    const char *server = qdict_get_try_str(args, "server");
+    const char *wait = qdict_get_try_str(args, "wait");
+    QDict *addr;
+
+    if ((!!path + !!fd + !!host) != 1) {
+        return;
+    }
+
+    /* If "addr" is not present, automatically set the type */
+    if (!qdict_haskey(args, "addr")) {
+        addr = qdict_new();
+        qdict_put(args, "addr", addr);
+
+        if (path) {
+            qdict_put_str(addr, "type", "unix");
+        } else if (host) {
+            qdict_put_str(addr, "type", "inet");
+        } else if (fd) {
+            qdict_put_str(addr, "type", "fd");
+        }
+    }
+
+    /* "delay" is translated into "nodelay" */
+    if (delay && !qdict_haskey(args, "nodelay")) {
+        if (!strcmp(delay, "on")) {
+            qdict_put_str(args, "nodelay", "off");
+            qdict_del(args, "delay");
+        } else if (!strcmp(delay, "off")) {
+            qdict_put_str(args, "nodelay", "on");
+            qdict_del(args, "delay");
+        }
+    }
+
+    /* "server=off" is the CLI default */
+    if (!server) {
+        server = "off";
+        qdict_put_str(args, "server", server);
+    }
+
+    /* "wait=on" is the default if "server=on" */
+    if (!wait && !strcmp(server, "on")) {
+        qdict_put_str(args, "wait", "on");
+    }
+}
+
 static void
 char_socket_get_addr(Object *obj, Visitor *v, const char *name,
                      void *opaque, Error **errp)
@@ -1506,6 +1558,7 @@ static void char_socket_class_init(ObjectClass *oc, void *data)
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
     cc->parse = qemu_chr_parse_socket;
+    cc->translate_legacy_options = qemu_chr_translate_socket;
     cc->open = qmp_chardev_open_socket;
     cc->chr_wait_connected = tcp_chr_wait_connected;
     cc->chr_write = tcp_chr_write;
diff --git a/chardev/char.c b/chardev/char.c
index 40c3f02ec9..91b44e53b6 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -720,6 +720,7 @@ out:
 
 void qemu_chr_translate_legacy_options(QDict *args)
 {
+    const ChardevClass *cc;
     const char *name;
 
     /* "backend" instead of "type" enables legacy CLI compatibility */
@@ -730,12 +731,19 @@ void qemu_chr_translate_legacy_options(QDict *args)
 
     name = chardev_alias_translate(name);
     qdict_put_str(args, "type", name);
+
+    cc = char_get_class(name, NULL);
+    if (cc != NULL && cc->translate_legacy_options) {
+        QDict *backend_data = qdict_get_qdict(args, "data") ?: args;
+        cc->translate_legacy_options(backend_data);
+    }
+
+    /* name may refer to a QDict entry, so delete it only now */
     qdict_del(args, "backend");
 
     /*
      * TODO:
      * All backend types: "mux"
-     * socket: "addr.type", "delay", "server", "wait", "fd"
      * udp: defaults for "host"/"localaddr"/"localport"
      */
 }
-- 
2.28.0


