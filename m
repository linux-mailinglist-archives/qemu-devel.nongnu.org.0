Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED375ED88C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:12:28 +0200 (CEST)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odT7C-0005JY-0x
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRM9-000193-RH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRM7-00006J-IY
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6lylWEVzM1bPmim+OJ7MiExdxqOuyQXFQ8H5ZIwpYE=;
 b=YSOJDQ/n9R1EXUH4kuXXidUud+Q8Y7OfCuXRgMZHbtrpUjhXAsevTmhbihehZsp/+rhMKr
 XYxGx7JOYkCyk4E4SDtj5qZTrsJ2aG7vOTHKd1ifGzgg6kClewtj+ScGb8pmXe+Dpplv1B
 qR+ImpdOctKhCSYSXXK5ycl3kbJavKc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-LvCET8oXONinA3mJnp2hQw-1; Wed, 28 Sep 2022 03:19:39 -0400
X-MC-Unique: LvCET8oXONinA3mJnp2hQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2B0F882822;
 Wed, 28 Sep 2022 07:19:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D65E040C83BB;
 Wed, 28 Sep 2022 07:19:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 28/37] tests/qtest: libqtest: Replace the call to close a
 socket with closesocket()
Date: Wed, 28 Sep 2022 09:18:34 +0200
Message-Id: <20220928071843.1468323-29-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

close() is a *nix function. It works on any file descriptor, and
sockets in *nix are an example of a file descriptor.

closesocket() is a Windows-specific function, which works only
specifically with sockets. Sockets on Windows do not use *nix-style
file descriptors, and socket() returns a handle to a kernel object
instead, so it must be closed with closesocket().

In QEMU there is already a logic to handle such platform difference
in os-posix.h and os-win32.h, that:

  * closesocket maps to close on POSIX
  * closesocket maps to a wrapper that calls the real closesocket()
    on Windows

Replace the call to close a socket with closesocket() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220925113032.1949844-46-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5c4a509c58..4f4b2d6477 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -97,7 +97,7 @@ static int socket_accept(int sock)
                    (void *)&timeout, sizeof(timeout))) {
         fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
                 __func__, strerror(errno));
-        close(sock);
+        closesocket(sock);
         return -1;
     }
 
@@ -108,7 +108,7 @@ static int socket_accept(int sock)
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
     }
-    close(sock);
+    closesocket(sock);
 
     return ret;
 }
@@ -421,8 +421,8 @@ void qtest_quit(QTestState *s)
     qtest_remove_abrt_handler(s);
 
     qtest_kill_qemu(s);
-    close(s->fd);
-    close(s->qmp_fd);
+    closesocket(s->fd);
+    closesocket(s->qmp_fd);
     g_string_free(s->rx, true);
 
     for (GList *it = s->pending_events; it != NULL; it = it->next) {
-- 
2.31.1


