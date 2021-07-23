Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848D3D38BC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:32:04 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sTL-0004wF-Hn
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQn-0002kx-4j
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:29:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1m6sQl-00026s-QF
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627036163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3oemvvROM+fkmJfeLREcmBsRbAxtZUZvrWGihqcfsk=;
 b=e5QiNQzgv1nvsD+TlZAtqu/pqBpr/e4P96XXj7CE4S+nc5xIMZhBavxKqoHByqU1dJdFKP
 X5jAeZXP2xUjpKzzyOd0rhs+EugNQFjofJ6qoQKg5++9wik9rKTBTxIIVoi7sXKPiBEboT
 ZmJpXDfgh8TXKoPYiJDfjXi5/wGOSX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-TwQM8pL5NiCFRRXlxvX5_g-1; Fri, 23 Jul 2021 06:29:21 -0400
X-MC-Unique: TwQM8pL5NiCFRRXlxvX5_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA3731015186
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:29:12 +0000 (UTC)
Received: from localhost (unknown [10.36.110.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0666069CBA;
 Fri, 23 Jul 2021 10:29:11 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] chardev: fix qemu_chr_open_fd() with fd_in==fd_out
Date: Fri, 23 Jul 2021 14:28:23 +0400
Message-Id: <20210723102825.1790112-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
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

The "serial" chardev calls qemu_chr_open_fd() with the same fd. This
may lead to double-close as each QIOChannel owns the fd.

Instead, share the reference to the same QIOChannel.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-fd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index ee85a52c06..32166182bf 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -139,13 +139,24 @@ void qemu_chr_open_fd(Chardev *chr,
         qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
         g_free(name);
     }
-    if (fd_out >= 0) {
+
+    if (fd_out < 0) {
+        return;
+    }
+
+    if (fd_out == fd_in) {
+        s->ioc_out = QIO_CHANNEL(object_ref(s->ioc_in));
+        name = g_strdup_printf("chardev-file-%s", chr->label);
+        qio_channel_set_name(QIO_CHANNEL(s->ioc_in), name);
+        g_free(name);
+    } else {
         s->ioc_out = QIO_CHANNEL(qio_channel_file_new_fd(fd_out));
         name = g_strdup_printf("chardev-file-out-%s", chr->label);
         qio_channel_set_name(QIO_CHANNEL(s->ioc_out), name);
         g_free(name);
-        qemu_set_nonblock(fd_out);
     }
+
+    qemu_set_nonblock(fd_out);
 }
 
 static void char_fd_class_init(ObjectClass *oc, void *data)
-- 
2.32.0.264.g75ae10bc75


