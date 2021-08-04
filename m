Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0523E0711
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:01:00 +0200 (CEST)
Received: from localhost ([::1]:42944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLCN-0006j3-JQ
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJAE-00010i-UQ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJA4-0006pl-2g
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:50:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOgHoYL0xH0SByObRMXU5nsKFdTNbFLIoFBWTw4YxNM=;
 b=GTsyAksrpu3OW4gKAUIdaiIxv8s6sJWwpy/A4CED5vkSVWq0M1u2d2daFXHNp9z2c8RNPy
 b0wuiDQVRny1AvsC5SlGc7ZzsPD/45veyWggRDeQ9JzmGt0M+9cGUG7aZeWISleDepNi7n
 l2Bweq2A5SXPUgSQ4nYrd7Hka0E4jCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-MWMeBJ6yOciJxYLMBC6aNg-1; Wed, 04 Aug 2021 11:50:22 -0400
X-MC-Unique: MWMeBJ6yOciJxYLMBC6aNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63623EC1AB
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 15:50:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E70DE10372F3;
 Wed,  4 Aug 2021 15:50:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/11] chardev: fix qemu_chr_open_fd() with fd_in==fd_out
Date: Wed,  4 Aug 2021 19:48:45 +0400
Message-Id: <20210804154848.557328-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210804154848.557328-1-marcandre.lureau@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The "serial" chardev calls qemu_chr_open_fd() with the same fd. This
may lead to double-close as each QIOChannel owns the fd.

Instead, share the reference to the same QIOChannel.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
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


