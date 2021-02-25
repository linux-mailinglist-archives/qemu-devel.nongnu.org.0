Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A317D324EEB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:16:00 +0100 (CET)
Received: from localhost ([::1]:48066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFEch-00051z-Iv
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:15:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFEYr-0000VE-Fd
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:12:01 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFEYp-0004q3-VA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 06:12:01 -0500
Received: by mail-ed1-x52a.google.com with SMTP id h19so6302762edb.9
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 03:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Igm6ct5NehfHivXC2S4IhXhFpL7IzqtPsIoaglG2gD0=;
 b=L2MRgeT3QE02c/VQZ5o4IuVj1JIr9u68XXDP63egUEANrZU1MK4NT1xxSnjQKeOYHx
 gpFTaCpOPt/q+k0UDza0C87GKEYyrbP64V6eag6uvY7eDR1ErVbiUIUq9xEHekWjc96D
 xKNMjt0Z42r/aFyLqPEd1sOXQoBRLoMzLuJuEKD+Vw7X5oQs+j+8ISX4AYh6BoPdCpYv
 f6d8uNZlM8s36Bx8lW5fDi/kdFuQvjt6dcuq0A0Z0kS/4jqBpoJ82p/9w+BRLeFXQPEy
 kkmk/6aZA3RxZhhGPf/dTKl5DpjeslOVL+DYPwL1WaEXqFpKkn271/blcwIwzmrexUNj
 4diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Igm6ct5NehfHivXC2S4IhXhFpL7IzqtPsIoaglG2gD0=;
 b=Ux9H1FZbITqh3UpDRtw2DOEeQmF4fMRJ1NbHzqCLjv6NUXWRxdQ1SKynTh5n3d3Wi7
 jMLL2+JES+tdDa8qosg3tRKvdp5qjvsSkEum1LhxFuk0n+CN8a2T8m9g1UEAFXhqXeFW
 B5PGHgrc0RHX0yvkNrr4hl8XB5PnMvHKgOLuRwD/FmiMVvDugGVzi7wNBFHC7G/FHJgR
 NJmoOhr/1LUS5FNKa/bBYcVT3mbcAPO0sZnocKviSjtl7JAzaWLL4t1DdBene4Y5KaMu
 bxQg3CTTWBvJpjuUtnYgx1I8RLpKfms/jKNINIOSSASimhmY3YsecwuNUoo0gi+WRxHH
 hy9g==
X-Gm-Message-State: AOAM530HAzQ8+wpjUHQNCMDsbWQq1Q9GiEanGroUtChZGPFq7POo5pN7
 ic30yIlbfAB3xvwY3JnItu7RLYTTylQ=
X-Google-Smtp-Source: ABdhPJxHBQbfmUQnw2zl2rB6U0F1s4GDOuiG7Lo0ud5Jpsg50rFhBkNlBbRS5cypIgXFnbTkGBoNBg==
X-Received: by 2002:a50:cd8c:: with SMTP id p12mr2352297edi.114.1614251518639; 
 Thu, 25 Feb 2021 03:11:58 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s13sm542460edr.86.2021.02.25.03.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 03:11:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] chardev: do not use short form boolean options in
 non-QemuOpts character device descriptions
Date: Thu, 25 Feb 2021 12:11:57 +0100
Message-Id: <20210225111157.619188-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


