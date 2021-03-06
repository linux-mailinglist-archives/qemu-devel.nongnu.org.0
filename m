Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926FE32F97E
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 11:56:45 +0100 (CET)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUc0-0007fU-Ki
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 05:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZn-0005ld-OP
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZl-00084w-W2
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:27 -0500
Received: by mail-wm1-x334.google.com with SMTP id n22so3213051wmc.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ePf5Xm+2mM3AJyOz4KRHQebWqCb/bWbpeRmVlQcH6Aw=;
 b=BKijLWP3IHPzshvo5GfozjrLYU1UyWO7KREtzVMCfLBMkfQPLrqj6CmXbJHk/I+utj
 /C20RUx21Ir3JV3nOyFOoL5XF87D6EQl6KalSRwuIKt0SOnk6E9+g/+I+sUwKMBQ/tI8
 o1JIqNrpTchaZH+H8UyiHqw3HlcfH98eX2EPg/IyDumg49KjXyF+M1jnoWJjR6fDZr89
 zzN6TQ0WxwunSU+l6f/0GMGk/fJ6xRgKzrqmh7vz2FXma1mtBoah+nh5hd3wwwL4l7v6
 wzj1OtTebXP9jsDFtvAu9Q+JMTHofZ9ij1kUGIHz73SsOVizhEtbq7DYrYBPC6OVKeG2
 1Dbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ePf5Xm+2mM3AJyOz4KRHQebWqCb/bWbpeRmVlQcH6Aw=;
 b=nC0ebRqdOC9LVJ5Llk2I0wYvlylIivZ59NMOBE3sbAVxaH++fHJo19EHTee+tbhBDH
 ikozgJMFnYKCYztHngNtwQK+HE28XWjJkiYXUKFKftbgawIdG1qOD87QjCR+A+VKv2Ow
 YDUfSjKcUV5ge/Mzt04bodPBQKzLRkmhQqV4tYr1SniGZdTk0EPaTqNXoyaO0+Bxj1Kr
 8Xkwodn28pBxaW5+jZgvAujn0VkM0XgqgYoEHw+78dfMVKdzwU9xJ148lS6R+jrWbFcD
 2rBSbarH/o2TnKVL84d8nIrg0KSTo4A73RPNiiTNeu++UFhF+esotvzkHXUL0LoHHW1B
 0/aw==
X-Gm-Message-State: AOAM532b4yNpPAAxGj5xC+L580gjKkcesYbwNvpWZHB8O1MRrC14ZGeL
 QwAvEK2CgvkdWmpbK2jZKpAaKiPa8SQ=
X-Google-Smtp-Source: ABdhPJyPWaoboog5bRVotj3PFzpbA5wYC4864AYy2AQyxVtcFm2UThuSlfbBOqv5u8mJwqfd6N4aoA==
X-Received: by 2002:a1c:9d85:: with SMTP id
 g127mr13058264wme.161.1615028064816; 
 Sat, 06 Mar 2021 02:54:24 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] chardev: add nodelay option
Date: Sat,  6 Mar 2021 11:54:00 +0100
Message-Id: <20210306105419.110503-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "delay" option was introduced as a way to enable Nagle's algorithm
with ",nodelay".  Since the short form for boolean options has now been
deprecated, introduce a more properly named "nodelay" option.  The "delay"
option remains as an undocumented option.

"delay" and "nodelay" are mutually exclusive.  Because the check is
done at consumption time, the code also rejects them if one of the
two is specified via -set.

Based-on: <20210226080526.651705-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-socket.c | 13 +++++++++++--
 chardev/char.c        |  3 +++
 gdbstub.c             |  2 +-
 qemu-options.hx       | 14 +++++++-------
 4 files changed, 22 insertions(+), 10 deletions(-)

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
diff --git a/chardev/char.c b/chardev/char.c
index 288efebd12..97cafd6849 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -867,6 +867,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "delay",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "nodelay",
+            .type = QEMU_OPT_BOOL,
         },{
             .name = "reconnect",
             .type = QEMU_OPT_NUMBER,
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



