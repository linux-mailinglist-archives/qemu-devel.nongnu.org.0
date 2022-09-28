Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD535ED9AB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:01:37 +0200 (CEST)
Received: from localhost ([::1]:45918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTsm-0007Vt-Gk
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMI-0001D5-FI
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMG-00009T-U4
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GVsz4o/JuBb4gzbbJxB/v0brom9e0El5e5/9SiPkBE=;
 b=cUxxz+cS5ruB8ktPVt5SJF5v2WLNwQW0VQtbr5vY6pAV8Tcgi/dDAkEd0Jew9Q/TGAxfow
 V5nsVMDKfQnz605LI+HtOAMWVNnWdxR6Ud37PkKKw/jc381CKLX3917lnChpMdyecnv4yj
 gv8EHUwCVGkGC6WU8Ko5McIp0HKqzGY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-cvlKrjxPMOqPs573w3Tv0A-1; Wed, 28 Sep 2022 03:19:49 -0400
X-MC-Unique: cvlKrjxPMOqPs573w3Tv0A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52D3A857FB0;
 Wed, 28 Sep 2022 07:19:49 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BA6240C83BB;
 Wed, 28 Sep 2022 07:19:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 35/37] tests/qtest: vhost-user-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:41 +0200
Message-Id: <20220928071843.1468323-36-thuth@redhat.com>
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220927110632.1973965-19-bmeng.cn@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vhost-user-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index d7d6cfc9bd..84498941a6 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -482,8 +482,8 @@ static TestServer *test_server_new(const gchar *name,
         struct vhost_user_ops *ops)
 {
     TestServer *server = g_new0(TestServer, 1);
-    char template[] = "/tmp/vhost-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
+    GError *err = NULL;
 
     server->context = g_main_context_new();
     server->loop = g_main_loop_new(server->context, FALSE);
@@ -491,9 +491,11 @@ static TestServer *test_server_new(const gchar *name,
     /* run the main loop thread so the chardev may operate */
     server->thread = g_thread_new(NULL, thread_function, server->loop);
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       err->message);
+        g_error_free(err);
     }
     g_assert(tmpfs);
 
-- 
2.31.1


