Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99028329B43
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 12:06:39 +0100 (CET)
Received: from localhost ([::1]:51102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2rO-0003i0-Mj
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 06:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lH2pe-0002gF-6l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:04:50 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lH2pc-0006N7-1l
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 06:04:49 -0500
Received: by mail-ej1-x631.google.com with SMTP id w1so34454338ejf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 03:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lgar7T90j+C8NcbPuVdSy1Hed0C7L3TuhND2OoyhQUs=;
 b=Rt8uu/0kDKmxZgau0FqPozPkjP5YVRYiPp3iqPSny7EzfMfHAWDL4m3WzfHtrRMYRX
 99jL03yj6k4d5HDIbHMsQwbJtvOtKBtLyPueFEFkwDoydULjjKy+gO1+/A0B8ex3fcZA
 d79bviihGDfTkckerGAU6sPqaPPqfB7MdcbCdltKmoIR6nueQgrSayjyvHZetFmVOgob
 JSeFBOW9nix1ScGUBUW/ZZkcXjs3EUvmnbnGfvklXK8goErHKpd3tkvHVYV//cBGtekQ
 YqG7ZdsWRDFiugCKkbSToFVvX/y85HJn7956XE9exmAfU7gGWGYGsVH9LihhgMIDVAtJ
 0dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lgar7T90j+C8NcbPuVdSy1Hed0C7L3TuhND2OoyhQUs=;
 b=cAjd46ysaguMxToE2DdYbuzO7DtHajJEUKLHfcWOz6avgGSROQ+7tzg0K3EJaHNdZD
 PzOUoIS4SSU2gDY7nh/DclvzTlHOPGf7SRlfspEl5UjjFiqmYpvmAUBTiPG50PxGbY8A
 N2fgUnK4blqw/KXQix4KG2Lizcp9V921uEKLJq1Y54W4g1wW81N0s59yw+X62UkPN7XY
 oliqbxiXfZFZ+8oa3VMigE91eh1jIGuxU0KvwGBs3u1R+xYPwvass8PzOmPVWEpiUQpQ
 6OuMwtml7zvJm+O6QzeiLAU5GWFtdycRUXac9ClxShYYMDCr+KyvkGMxpZGx1BA/lvg1
 UL4Q==
X-Gm-Message-State: AOAM5338KFru1eOvq0YVqQPBMm9TbUOY4MEOtkjKkCvrb67zqqia18PW
 INxZPhLhlhVR+jnocRW9s9A+ev5YQ+g=
X-Google-Smtp-Source: ABdhPJxUNl0h+MWu4Qk6jWaY4Jl8iBaayfxGDn3YrxvcPqj9t+ns9rBhToy73k0n+kURd4w87LZd3g==
X-Received: by 2002:a17:906:1447:: with SMTP id
 q7mr21028672ejc.27.1614683085844; 
 Tue, 02 Mar 2021 03:04:45 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v13sm19713588ede.5.2021.03.02.03.04.45 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 03:04:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] chardev: add nodelay option
Date: Tue,  2 Mar 2021 12:04:44 +0100
Message-Id: <20210302110444.39084-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-socket.c |  9 +++++++--
 gdbstub.c             |  2 +-
 qemu-options.hx       | 14 +++++++-------
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 06a37c0cc8..73a7afe5a0 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1472,8 +1472,13 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
     sock = backend->u.socket.data = g_new0(ChardevSocket, 1);
     qemu_chr_parse_common(opts, qapi_ChardevSocket_base(sock));
 
-    sock->has_nodelay = qemu_opt_get(opts, "delay");
-    sock->nodelay = !qemu_opt_get_bool(opts, "delay", true);
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


