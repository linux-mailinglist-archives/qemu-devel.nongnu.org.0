Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F15ED8F0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:29:43 +0200 (CEST)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTNu-0003YY-90
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLh-0000yR-PB
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLd-0008Tt-NZ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rkz4eAcNK9l5w17uw7T4P7FC90vfCuJmxhWJJAstGqk=;
 b=eeKA0yhh9klDf/ut6TxbOe2Jm/esq1eNwUEJOG8rii5UTT2mYTCtxfUcNxOal1tKgl1WMp
 fps+zj1D4Z8ViwiAvpGPdp6/B6FtFeqM7cWUvEmJytTQkjNcucUsLOTkx4avuXwdpLXVbV
 mqlt3tPRxouy0mDK20A2PvNplzYp7rw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-bVF1rKzMNxiX6QBIS52sIA-1; Wed, 28 Sep 2022 03:19:09 -0400
X-MC-Unique: bVF1rKzMNxiX6QBIS52sIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1767E185A792;
 Wed, 28 Sep 2022 07:19:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFF7940C83C5;
 Wed, 28 Sep 2022 07:19:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 13/37] tests/qtest: libqtest: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:19 +0200
Message-Id: <20220928071843.1468323-14-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The qtest library was written to use hardcoded /tmp directory for
temporary files. Update to use g_get_tmp_dir() and g_dir_make_tmp()
for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220925113032.1949844-22-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7c9fc07de4..d8ffa0e7b1 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     s = g_new(QTestState, 1);
 
-    socket_path = g_strdup_printf("/tmp/qtest-%d.sock", getpid());
-    qmp_socket_path = g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
+    socket_path = g_strdup_printf("%s/qtest-%d.sock",
+                                  g_get_tmp_dir(), getpid());
+    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
+                                      g_get_tmp_dir(), getpid());
 
     /* It's possible that if an earlier test run crashed it might
      * have left a stale unix socket lying around. Delete any
@@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
 {
     int sock_fd_init;
-    char *sock_path, sock_dir[] = "/tmp/qtest-serial-XXXXXX";
+    g_autofree char *sock_dir = NULL;
+    char *sock_path;
     QTestState *qts;
 
-    g_assert_true(g_mkdtemp(sock_dir) != NULL);
+    sock_dir = g_dir_make_tmp("qtest-serial-XXXXXX", NULL);
+    g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
     sock_fd_init = init_socket(sock_path);
-- 
2.31.1


