Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534903D38C5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:33:33 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sUm-0007qp-Cj
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQa-0002Sm-SA
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQZ-0001xh-8L
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627036150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/IvjpArO+VdA1g0iNp2hSCgKmNlOoS8ISY9SoJiSj0=;
 b=Dx/df8Ltgr2241O2/Qcs7eMX8516/iopSHXeX3tKNJAe12flj9XW360dp+qzYcsRP+2JAm
 7YnORm9ay3F0xz5777C6ZkXQ6U/iJjfCkbgW2RxFP+50bKITvD9LL0JryMgv8Csbj2Q3WJ
 c2L/Rt3lISPQSRcflzG4veCUv/Eg8Q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-b8vxeMp_MOKz0CZh7y8WTw-1; Fri, 23 Jul 2021 06:29:09 -0400
X-MC-Unique: b8vxeMp_MOKz0CZh7y8WTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F939C742C
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:29:08 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DC575DD68;
 Fri, 23 Jul 2021 10:28:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] chardev: fix qemu_chr_open_fd() being called with fd=-1
Date: Fri, 23 Jul 2021 14:28:22 +0400
Message-Id: <20210723102825.1790112-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 berrange@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The "file" chardev may call qemu_chr_open_fd() with fd_in=-1. This may
cause invalid system calls, as the QIOChannel is assumed to be properly
initialized later on.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-fd.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index 1cd62f2779..ee85a52c06 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -133,15 +133,19 @@ void qemu_chr_open_fd(Chardev *chr,
     FDChardev *s = FD_CHARDEV(chr);
     char *name;
 
-    s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
-    name = g_strdup_printf("chardev-file-in-%s", chr->label);
-    qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
-    g_free(name);
-    s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
-    name = g_strdup_printf("chardev-file-out-%s", chr->label);
-    qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
-    g_free(name);
-    qemu_set_nonblock(fd_out);
+    if (fd_in >= 0) {
+        s->ioc_in = QIO_CHANNEL(qio_channel_file_new_fd(fd_in));
+        name = g_strdup_printf("chardev-file-in-%s", chr->label);
+        qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
+        g_free(name);
+    }
+    if (fd_out >= 0) {
+        s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
+        name = g_strdup_printf("chardev-file-out-%s", chr->label);
+        qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
+        g_free(name);
+        qemu_set_nonblock(fd_out);
+    }
 }
 
 static void char_fd_class_init(ObjectClass *oc, void *data)
-- 
2.32.0.264.g75ae10bc75


