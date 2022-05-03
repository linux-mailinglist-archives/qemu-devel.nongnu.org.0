Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D7519195
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:44:05 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1FU-0007B1-2z
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzE6-000397-R1
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:34:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlzE5-0000T8-8Q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651610068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWa9f4ka4YuAHq4UDl7U25CVSPUkZoYaRrxqfWzujgo=;
 b=SfJZrA+42xYAw1fgj/kiIpxvUKtxMY33i+gYMZX0e4X/mhWGK2YxOBy95FNOcpoHiJtRuN
 xjpYwskiIVl4qXQ9DpVNIPEVs8KLYmGriNyt6h+YYM7rC9GCQB4lyweJPyameTsS8NM61j
 v2FzTz69nd0QHIbmVHj+mKX4f8dXjLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-KEWVcJGZOZKjqMTL-_MiPA-1; Tue, 03 May 2022 10:55:13 -0400
X-MC-Unique: KEWVcJGZOZKjqMTL-_MiPA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59CF0AE5088;
 Tue,  3 May 2022 13:14:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86F7A42B94C;
 Tue,  3 May 2022 13:14:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 17/23] io: replace qemu_set{_non}block()
Date: Tue,  3 May 2022 17:12:50 +0400
Message-Id: <20220503131256.187238-18-marcandre.lureau@redhat.com>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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


