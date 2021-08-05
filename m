Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9593E1532
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:58:22 +0200 (CEST)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBcx3-00027R-Go
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBctE-0004Yw-72
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBctC-0003v4-Fa
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628168061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIusRbK4mcCsa+aAzzku5IJXkIspoDVZ1JBeMb4VblU=;
 b=jGva6ZZ2/4mbAhZzOI4lI1pv767JDPoOEF0XIntImWfv/t1Z+1h37jj3bDhJPw7GmC4ANf
 wcs4RX/LwJmal8LU4YbCw7bNuuo/K96rmz4FqD1oOS4B2Icue/UHsE6EsfM445rAm2RKbC
 iFuGsOx+kIksIEbg/KeSQlQzIQ2SWRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-0wiH1S9SMACMCaKD60k8FQ-1; Thu, 05 Aug 2021 08:54:20 -0400
X-MC-Unique: 0wiH1S9SMACMCaKD60k8FQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0E3F801A92;
 Thu,  5 Aug 2021 12:54:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE0F55D9DD;
 Thu,  5 Aug 2021 12:54:17 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] chardev: fix qemu_chr_open_fd() being called with fd=-1
Date: Thu,  5 Aug 2021 16:53:28 +0400
Message-Id: <20210805125331.826741-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210805125331.826741-1-marcandre.lureau@redhat.com>
References: <20210805125331.826741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The "file" chardev may call qemu_chr_open_fd() with fd_in=-1. This may
cause invalid system calls, as the QIOChannel is assumed to be properly
initialized later on.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 chardev/char-fd.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/chardev/char-fd.c b/chardev/char-fd.c
index 743d3989b4..c11b1037f9 100644
--- a/chardev/char-fd.c
+++ b/chardev/char-fd.c
@@ -39,6 +39,10 @@ static int fd_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
     FDChardev *s = FD_CHARDEV(chr);
 
+    if (!s->ioc_out) {
+        return -1;
+    }
+
     return io_channel_send(s->ioc_out, buf, len);
 }
 
@@ -209,15 +213,19 @@ void qemu_chr_open_fd(Chardev *chr,
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


