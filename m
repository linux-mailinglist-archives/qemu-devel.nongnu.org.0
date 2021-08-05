Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11D13E1538
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:59:54 +0200 (CEST)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcyX-00065N-VZ
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBctQ-000579-I5
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBctO-0003z1-2j
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0anI4IGqHBxCD9LS8EcDvTLbpKfRWzackaI0GsDqMrI=;
 b=TtH7T9wEjf5Q/077NgXSAbwDALif5tBVDWe2YpVfsc8dx45tT8DBFXBe4japgeCNP97LZH
 lpMLq7664aHf/hRh63icOWbW1H8FBnVpsmulOpK3cL7LIZO6DNvnZA5prWTUIFLeC6WJrw
 aOxpkMH0If4esxtL7jbbSjg3EgtHaNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-fa3C9gx7MrCJdyvtnJXrGg-1; Thu, 05 Aug 2021 08:54:31 -0400
X-MC-Unique: fa3C9gx7MrCJdyvtnJXrGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3C4E100CA88;
 Thu,  5 Aug 2021 12:54:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B007B421F;
 Thu,  5 Aug 2021 12:54:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] chardev: fix qemu_chr_open_fd() with fd_in==fd_out
Date: Thu,  5 Aug 2021 16:53:29 +0400
Message-Id: <20210805125331.826741-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210805125331.826741-1-marcandre.lureau@redhat.com>
References: <20210805125331.826741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The "serial" chardev calls qemu_chr_open_fd() with the same fd. This
may lead to double-close as each QIOChannel owns the fd.

Instead, share the reference to the same QIOChannel.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char-fd.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index c11b1037f9..93c56913b4 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -211,20 +211,31 @@ void qemu_chr_open_fd(Chardev *chr,
                       int fd_in, int fd_out)
 {
     FDChardev *s = FD_CHARDEV(chr);
-    char *name;
+    g_autofree char *name = NULL;
+
+    if (fd_out >= 0) {
+        qemu_set_nonblock(fd_out);
+    }
+
+    if (fd_out == fd_in && fd_in >= 0) {
+        s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
+        name = g_strdup_printf("chardev-file-%s", chr->label);
+        qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
+        s->ioc_out = QIO_CHANNEL(object_ref(s->ioc_in));
+        return;
+    }
 
     if (fd_in >= 0) {
         s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
         name = g_strdup_printf("chardev-file-in-%s", chr->label);
         qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
-        g_free(name);
     }
+
     if (fd_out >= 0) {
         s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
+        g_free(name);
         name = g_strdup_printf("chardev-file-out-%s", chr->label);
         qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
-        g_free(name);
-        qemu_set_nonblock(fd_out);
     }
 }
 
-- 
2.32.0.264.g75ae10bc75


