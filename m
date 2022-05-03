Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD1519113
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:13:02 +0200 (CEST)
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0lR-0007pX-AN
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz2s-0006LF-VW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:22:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz2r-0005CM-9V
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWa9f4ka4YuAHq4UDl7U25CVSPUkZoYaRrxqfWzujgo=;
 b=VLDrmIjYOqg+QW11ynq226M+gGJN7bz6l9cgZ5VXQePI8SkT1wSEM0Cw6T+W/ITVMSOX+8
 CQRdDxanjJs2bTpOt21o0kzcaU1v0FkmeSuwnzyH2qTWx75Bp/r6GxF4MCl0W0+knWS5x/
 vcWoC/gjedB7tleM/8FAcG7LqY1HYz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-90jdjp_ZMFqcj7iRXpZnHg-1; Tue, 03 May 2022 11:34:51 -0400
X-MC-Unique: 90jdjp_ZMFqcj7iRXpZnHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5E27131AE55;
 Tue,  3 May 2022 13:01:58 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED8AB400F75E;
 Tue,  3 May 2022 13:01:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 17/23] io: replace qemu_set{_non}block()
Date: Tue,  3 May 2022 17:00:17 +0400
Message-Id: <20220503130023.180544-18-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

Those calls are non-socket fd, or are POSIX-specific. Use the dedicated
GLib API. (qemu_set_nonblock() is for socket-like)

(this is a preliminary patch before renaming qemu_set_nonblock())

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/channel-command.c | 16 +++++++++-------
 io/channel-file.c    | 13 +++++++++----
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/io/channel-command.c b/io/channel-command.c
index 0790ac7895c0..4a1f969aaa8e 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -301,16 +301,18 @@ static int qio_channel_command_set_blocking(QIOChannel *ioc,
                                             bool enabled,
                                             Error **errp)
 {
+#ifdef WIN32
+    /* command spawn is not supported on win32 */
+    g_assert_not_reached();
+#else
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
 
-    if (enabled) {
-        qemu_set_block(cioc->writefd);
-        qemu_set_block(cioc->readfd);
-    } else {
-        qemu_set_nonblock(cioc->writefd);
-        qemu_set_nonblock(cioc->readfd);
+    if (!g_unix_set_fd_nonblocking(cioc->writefd, !enabled, NULL) ||
+        !g_unix_set_fd_nonblocking(cioc->readfd, !enabled, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return -1;
     }
-
+#endif
     return 0;
 }
 
diff --git a/io/channel-file.c b/io/channel-file.c
index d7cf6d278ff9..d146ace7db9f 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -139,14 +139,19 @@ static int qio_channel_file_set_blocking(QIOChannel *ioc,
                                          bool enabled,
                                          Error **errp)
 {
+#ifdef WIN32
+    /* not implemented */
+    error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+    return -1;
+#else
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
 
-    if (enabled) {
-        qemu_set_block(fioc->fd);
-    } else {
-        qemu_set_nonblock(fioc->fd);
+    if (!g_unix_set_fd_nonblocking(fioc->fd, !enabled, NULL)) {
+        error_setg_errno(errp, errno, "Failed to set FD nonblocking");
+        return -1;
     }
     return 0;
+#endif
 }
 
 
-- 
2.36.0.44.g0f828332d5ac


