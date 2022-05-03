Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AF51900F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:28:01 +0200 (CEST)
Received: from localhost ([::1]:41708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm03r-0000IN-VG
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlypg-0000wK-Ay
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlype-0000eV-1o
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kh5wpND6rfzlVoSuObqAw+C4AMVRJDb7YQyc66fcC3E=;
 b=hn44R2eRPIM+Wvnwzm/xQicC+2P3bZQBahYopeAev/Q4zb7SLklEMpmWSy5ij4+TI8Zt3+
 4hiSG6XbfSD7cLkHlUNnRpUQG1emEDNsqA70agxs8V/C0sJwSNTqexghYscdBhG/Q9WBv3
 W73Qgh635AeK4LYxOGUNF98c7A2ZtJQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-VluoNF9BOeuSVSSKZqg1dQ-1; Tue, 03 May 2022 11:35:03 -0400
X-MC-Unique: VluoNF9BOeuSVSSKZqg1dQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0CC828C8023;
 Tue,  3 May 2022 13:01:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF14C28100;
 Tue,  3 May 2022 13:01:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 16/23] chardev: replace qemu_set_nonblock()
Date: Tue,  3 May 2022 17:00:16 +0400
Message-Id: <20220503130023.180544-17-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Those calls are either for non-socket fd, or are POSIX-specific. Use the
dedicated GLib API. (qemu_set_nonblock() is for socket-like)

(this is a preliminary patch before renaming qemu_set_nonblock())

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.36.0.44.g0f828332d5ac


