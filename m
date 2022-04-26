Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E650F91A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:52:00 +0200 (CEST)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHrT-0003or-Lz
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVw-0003ta-AB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVu-0006Or-3q
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBsFZbCIModFxrfSbjiIhd8Jwn+/Up2dEEfU3ungScE=;
 b=M9TUgJm9HgN+1lx+CZWvg3uQRzsFCd+ZGDtnl97QDZGKHJeW2lOq50Oug5NI4zgKvcyfKV
 4V4QydJUFXjTA1+dOsknj6Brn6oLQ5JxfVD5v/RXqDEgCnlsYziV9TJ3DoW1cvY74Gtu7d
 Qhq0wafXMpmyPve4CFTuwoCGkZPJTaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-UtHzYKYQPzycZu68YSW4kQ-1; Tue, 26 Apr 2022 05:29:40 -0400
X-MC-Unique: UtHzYKYQPzycZu68YSW4kQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 315AB1014A61
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:29:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF78B40470DF;
 Tue, 26 Apr 2022 09:29:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/26] chardev: replace qemu_set_nonblock()
Date: Tue, 26 Apr 2022 13:27:08 +0400
Message-Id: <20220426092715.3931705-20-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Those calls are either for non-socket fd, or are POSIX-specific. Use the
dedicated GLib API. (qemu_set_nonblock() is for socket-like)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-fd.c     | 4 ++--
 chardev/char-pty.c    | 5 ++++-
 chardev/char-serial.c | 5 ++++-
 chardev/char-stdio.c  | 5 ++++-
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index 6ec9682b22f2..cf7845484174 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -212,8 +212,8 @@ void qemu_chr_open_fd(Chardev *chr,
     FDChardev *s = FD_CHARDEV(chr);
     g_autofree char *name = NULL;
 
-    if (fd_out >= 0) {
-        qemu_set_nonblock(fd_out);
+    if (fd_out >= 0 && !g_unix_set_fd_nonblocking(fd_out, true, NULL)) {
+        assert(!"Failed to set FD nonblocking");
     }
 
     if (fd_out == fd_in && fd_in >= 0) {
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 1e2863f532a8..53f25c6bbd0c 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -324,7 +324,10 @@ static void char_pty_open(Chardev *chr,
     }
 
     close(slave_fd);
-    qemu_set_nonblock(master_fd);
+    if (!g_unix_set_fd_nonblocking(master_fd, true, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return;
+    }
 
     chr->filename = g_strdup_printf("pty:%s", pty_name);
     qemu_printf("char device redirected to %s (label %s)\n",
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 7c3d84ae243e..4b0b83d5b45e 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -271,7 +271,10 @@ static void qmp_chardev_open_serial(Chardev *chr,
     if (fd < 0) {
         return;
     }
-    qemu_set_nonblock(fd);
+    if (!g_unix_set_fd_nonblocking(fd, true, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return;
+    }
     tty_serial_init(fd, 115200, 'N', 8, 1);
 
     qemu_chr_open_fd(chr, fd, fd);
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 403da308c980..3c648678ab14 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -103,7 +103,10 @@ static void qemu_chr_open_stdio(Chardev *chr,
     stdio_in_use = true;
     old_fd0_flags = fcntl(0, F_GETFL);
     tcgetattr(0, &oldtty);
-    qemu_set_nonblock(0);
+    if (!g_unix_set_fd_nonblocking(0, true, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return;
+    }
     atexit(term_exit);
 
     memset(&act, 0, sizeof(act));
-- 
2.36.0


