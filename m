Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663AD325EEA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:26:46 +0100 (CET)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYST-0004Rt-Ct
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8C-0001vO-Sf
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8B-0004ED-6d
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w11so7649733wrr.10
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Igm6ct5NehfHivXC2S4IhXhFpL7IzqtPsIoaglG2gD0=;
 b=PqaKfoPCugykF0otyhZj7JLLyAsJBT7e5hD0sOTQrp1Let3Sep71KN7iiVGl30Ay4R
 PVki4r15jhib0l2MiG++e0Jk4I1oZNzlV5CGaTbDiX+p9rX6tR8N18MxtJqYGnVVYGNO
 vKbUyWgMGJEoFd17PR/FMVU4R5OoQTpJAc3kIOITLovj/Wf82u1Q1QWolW3EWUtS7XsS
 kZpZrSalvqnHijEEJye8O2S4oFNaFXPScL8xSqDE+0L2I7HVw8rv+DsbFiZGwFJ3oc1d
 e3pZhrO+/i1ZB2ogOkI/eV1pk2SrZoAgbtpBCCpMObGFP3HyhvxyFtmJlbLhf5Bax/G3
 OtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Igm6ct5NehfHivXC2S4IhXhFpL7IzqtPsIoaglG2gD0=;
 b=Uq3mG7YgqSqC0YwkpK/cza9lla7zMX+qMJlgPt07S3PlEdxPrVZUa5pqDjA68Gcur0
 Z4ulHVG1b5teIDmNOZBwv5qJCMjciqaHML0oDrV04QxMBYHjqvHKsVxm+UG+sEoGSoBs
 et2KP1CeiXaYniBQmJw/TszALmkhdTKbT5sojeplJdxYnM+OTZ2rgF+NTMAQ4VlLxwfu
 IckYAnsxuExoR6K4biVnOWZZLGUky88HpvTPYNy/4i5E6HyggO+DGWekFWAoZfrj//U4
 t3NibsGmlqdwOF/gG4PBVitXJOhMJWQKoHwug+fCDYglJCkDUobWW71Ye9lfgw9ta25V
 9+oQ==
X-Gm-Message-State: AOAM532MDN0LGCcEaLCQSddbuX+hgHMuHB+cxy8gZ2MGUqJZ3W23reOI
 C77jVx6FHoEeYX0i5NawwXl9cmEUxMg=
X-Google-Smtp-Source: ABdhPJw+YqzI46Th+rkLAJlKdR4Zc5f/d5vYakSPlAK2/B1E3F0ZyH+OTYb3c9i9lCs7x2wJpJHTYg==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id
 f12mr1810358wry.173.1614326745988; 
 Fri, 26 Feb 2021 00:05:45 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/29] chardev: do not use short form boolean options in
 non-QemuOpts character device descriptions
Date: Fri, 26 Feb 2021 09:05:25 +0100
Message-Id: <20210226080526.651705-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Options such as "-gdb" or "-serial" accept a part-QemuOpts part-parsed-by-hand
character device description.  Do not use short form boolean options in the
QemuOpts part.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/char-socket.c         | 10 +++++-----
 qapi/char.json                |  4 ++--
 tests/guest-debug/run-test.py |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index b7863b8aae..06a37c0cc8 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -452,7 +452,7 @@ static char *qemu_chr_socket_address(SocketChardev *s, const char *prefix)
                                qemu_chr_socket_protocol(s),
                                s->addr->u.inet.host,
                                s->addr->u.inet.port,
-                               s->is_listen ? ",server" : "");
+                               s->is_listen ? ",server=on" : "");
         break;
     case SOCKET_ADDRESS_TYPE_UNIX:
     {
@@ -470,12 +470,12 @@ static char *qemu_chr_socket_address(SocketChardev *s, const char *prefix)
 
         return g_strdup_printf("%sunix:%s%s%s%s", prefix, sa->path,
                                abstract, tight,
-                               s->is_listen ? ",server" : "");
+                               s->is_listen ? ",server=on" : "");
         break;
     }
     case SOCKET_ADDRESS_TYPE_FD:
         return g_strdup_printf("%sfd:%s%s", prefix, s->addr->u.fd.str,
-                               s->is_listen ? ",server" : "");
+                               s->is_listen ? ",server=on" : "");
         break;
     case SOCKET_ADDRESS_TYPE_VSOCK:
         return g_strdup_printf("%svsock:%s:%s", prefix,
@@ -607,7 +607,7 @@ static char *qemu_chr_compute_filename(SocketChardev *s)
     case AF_UNIX:
         return g_strdup_printf("unix:%s%s",
                                ((struct sockaddr_un *)(ss))->sun_path,
-                               s->is_listen ? ",server" : "");
+                               s->is_listen ? ",server=on" : "");
 #endif
     case AF_INET6:
         left  = "[";
@@ -621,7 +621,7 @@ static char *qemu_chr_compute_filename(SocketChardev *s)
         return g_strdup_printf("%s:%s%s%s:%s%s <-> %s%s%s:%s",
                                qemu_chr_socket_protocol(s),
                                left, shost, right, sserv,
-                               s->is_listen ? ",server" : "",
+                               s->is_listen ? ",server=on" : "",
                                left, phost, right, pserv);
 
     default:
diff --git a/qapi/char.json b/qapi/char.json
index 58338ed62d..6413970fa7 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -47,12 +47,12 @@
 #       "return": [
 #          {
 #             "label": "charchannel0",
-#             "filename": "unix:/var/lib/libvirt/qemu/seabios.rhel6.agent,server",
+#             "filename": "unix:/var/lib/libvirt/qemu/seabios.rhel6.agent,server=on",
 #             "frontend-open": false
 #          },
 #          {
 #             "label": "charmonitor",
-#             "filename": "unix:/var/lib/libvirt/qemu/seabios.rhel6.monitor,server",
+#             "filename": "unix:/var/lib/libvirt/qemu/seabios.rhel6.monitor,server=on",
 #             "frontend-open": true
 #          },
 #          {
diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 8b91ff95af..2e58795a10 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -64,10 +64,10 @@ def log(output, msg):
 
     # Launch QEMU with binary
     if "system" in args.qemu:
-        cmd = "%s %s %s -gdb unix:path=%s,server" % (args.qemu,
-                                                     args.qargs,
-                                                     args.binary,
-                                                     socket_name)
+        cmd = "%s %s %s -gdb unix:path=%s,server=on" % (args.qemu,
+                                                        args.qargs,
+                                                        args.binary,
+                                                        socket_name)
     else:
         cmd = "%s %s -g %s %s" % (args.qemu, args.qargs, socket_name,
                                   args.binary)
-- 
2.29.2



