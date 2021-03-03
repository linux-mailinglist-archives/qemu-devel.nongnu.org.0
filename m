Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832E32B7D6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:33:40 +0100 (CET)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQh9-0002hk-32
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lHQgC-00026I-Co
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:32:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lHQgA-0002QW-JJ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:32:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m1so6188473wml.2
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 04:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HmpKRSDi8hV0X5C5VVHvdXceZLCh/ZRMUUfDHEBLHbI=;
 b=QoZOJabyJ5C7knde06th5Sz/IDOb0yKhHzpCQEVlVFYnafU9/R9e2uUH5JI//hAJ0X
 AKGkgvJ3ETcnRMF1MgoTMHjmEyj0zR2gsgJD2HbfPq6bsnBdte4o1+7YE3jwR4DCjeCj
 DEK8QeAs+kPJijl+yFxd5LI9cXzqzk3l7FsgNDGMoqKuU1zlu3h8xHCUfdGeg/poyRZ2
 uS5XDFhWdiICFynr4dG5njnl5//fjiNsmnpZ9ItjJ/ffLxkq/UtPAbVIA2es1UbXvTXm
 OtAJGl9nFDpTKLvbKseIHJQ3YhQb3hxuT5nk242diJSjsflSPiMPJG6+mqEIOQBUuM8g
 b0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HmpKRSDi8hV0X5C5VVHvdXceZLCh/ZRMUUfDHEBLHbI=;
 b=CkL+sggooWspqKV1TbVP8RgAH6k1mv3TZ3hvW5p8qQAn8yhLvP44IqtOVY/X+tplCM
 Of1GGMnTu2ojFY5nxLz8whmeT8h0M8LehvRkZZ/iOPgV+ORNxlUCMZ3TLcUK3+e2NH6s
 sGno0REgno1ukdShUaG7qYsyFiysSToxE2cCXbRqb7NUevD5vXGS+qiT1YfrC0EA5dY/
 9W0EVduMXs6gJDfKy2om4qMvRqfdaToik8OjWQna1TI565vGH664q9VbN3LOst/7Hn0E
 3T2mnJkwBlAs55u7DfC3qPhpzhmvexatl9Jn8XNbBu3KpAam3HK/ezbMGX6NLR0CVK0K
 4SGA==
X-Gm-Message-State: AOAM532BhwiJumOvbiUDuVIhjqM3eBSayaDnvY9m6GRABbAXsOVzlFra
 GgkQIJJn8VVzFT8jjH/GX5HGnmncwuY=
X-Google-Smtp-Source: ABdhPJweyE7KEtmnWGKxe8026gaG9yUaCuFKKBHNHCRP1hPQ9EKxdliPZOT2qkxQAW5QoFS02oxjwQ==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr8897970wma.37.1614774757029; 
 Wed, 03 Mar 2021 04:32:37 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c3sm31422532wrr.29.2021.03.03.04.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:32:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] chardev: add nodelay option
Date: Wed,  3 Mar 2021 13:32:35 +0100
Message-Id: <20210303123235.63171-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "delay" option was introduced as a way to enable Nagle's algorithm
with ",nodelay".  Since the short form for boolean options has now been
deprecated, introduce a more properly named "nodelay" option.  The "delay"
option remains as an undocumented option.

"delay" and "nodelay" are mutually exclusive.  Because the check is
done at consumption time, the code also rejects them if one of the
two is specified via -set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-socket.c | 13 +++++++++++--
 gdbstub.c             |  2 +-
 qemu-options.hx       | 14 +++++++-------
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 06a37c0cc8..c8bced76b7 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1472,8 +1472,17 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
     qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
 
-    sock->has_nodelay = qemu_opt_get(opts, "delay");
-    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
+    if (qemu_opt_get(opts, "delay") && qemu_opt_get(opts, "nodelay")) {
+        error_setg(errp, "'delay' and 'nodelay' are mutually exclusive");
+        return;
+    }
+    sock->has_nodelay =
+        qemu_opt_get(opts, "delay") ||
+        qemu_opt_get(opts, "nodelay");
+    sock->nodelay =
+        !qemu_opt_get_bool(opts, "delay", true) ||
+        qemu_opt_get_bool(opts, "nodelay", false);
+
     /*
      * We have different default to QMP for 'server', hence
      * we can't just check for existence of 'server'
diff --git a/gdbstub.c b/gdbstub.c
index 3ee40479b6..16d7c8f534 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3505,7 +3505,7 @@ int gdbserver_start(const char *device)
         if (strstart(device, "tcp:", NULL)) {
             /* enforce required TCP attributes */
             snprintf(gdbstub_device_name, sizeof(gdbstub_device_name),
-                     "%s,wait=off,delay=off,server=on", device);
+                     "%s,wait=off,nodelay=on,server=on", device);
             device = gdbstub_device_name;
         }
 #ifndef _WIN32
diff --git a/qemu-options.hx b/qemu-options.hx
index 252db9357c..90801286c6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3033,7 +3033,7 @@ DEFHEADING(Character device options:)
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
     "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,delay=on|off][,reconnect=seconds]\n"
+    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
@@ -3184,7 +3184,7 @@ The available backends are:
 
     TCP and unix socket options are given below:
 
-    ``TCP options: port=port[,host=host][,to=to][,ipv4=on|off][,ipv6=on|off][,delay=on|off]``
+    ``TCP options: port=port[,host=host][,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off]``
         ``host`` for a listening socket specifies the local address to
         be bound. For a connecting socket species the remote host to
         connect to. ``host`` is optional for listening sockets. If not
@@ -3204,7 +3204,7 @@ The available backends are:
         or IPv6 must be used. If neither is specified the socket may
         use either protocol.
 
-        ``delay=on|off`` disables the Nagle algorithm.
+        ``nodelay=on|off`` disables the Nagle algorithm.
 
     ``unix options: path=path[,abstract=on|off][,tight=on|off]``
         ``path`` specifies the local path of the unix socket. ``path``
@@ -3593,13 +3593,13 @@ SRST
         ``telnet options:``
             localhost 5555
 
-    ``tcp:[host]:port[,server=on|off][,wait=on|off][,delay=on|off][,reconnect=seconds]``
+    ``tcp:[host]:port[,server=on|off][,wait=on|off][,nodelay=on|off][,reconnect=seconds]``
         The TCP Net Console has two modes of operation. It can send the
         serial I/O to a location or wait for a connection from a
         location. By default the TCP Net Console is sent to host at the
         port. If you use the ``server=on`` option QEMU will wait for a client
         socket application to connect to the port before continuing,
-        unless the ``wait=on|off`` option was specified. The ``delay=on|off``
+        unless the ``wait=on|off`` option was specified. The ``nodelay=on|off``
         option disables the Nagle buffering algorithm. The ``reconnect=on``
         option only applies if ``server=no`` is set, if the connection goes
         down it will attempt to reconnect at the given interval. If host
@@ -3616,7 +3616,7 @@ SRST
         ``Example to not wait and listen on ip 192.168.0.100 port 4444``
             -serial tcp:192.168.0.100:4444,server=on,wait=off
 
-    ``telnet:host:port[,server=on|off][,wait=on|off][,delay=on|off]``
+    ``telnet:host:port[,server=on|off][,wait=on|off][,nodelay=on|off]``
         The telnet protocol is used instead of raw tcp sockets. The
         options work the same as if you had specified ``-serial tcp``.
         The difference is that the port acts like a telnet server or
@@ -3626,7 +3626,7 @@ SRST
         you do it with Control-] and then type "send break" followed by
         pressing the enter key.
 
-    ``websocket:host:port,server=on[,wait=on|off][,delay=on|off]``
+    ``websocket:host:port,server=on[,wait=on|off][,nodelay=on|off]``
         The WebSocket protocol is used instead of raw tcp socket. The
         port acts as a WebSocket server. Client mode is not supported.
 
-- 
2.29.2


