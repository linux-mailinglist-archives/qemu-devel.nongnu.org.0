Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1B450F915
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:48:27 +0200 (CEST)
Received: from localhost ([::1]:41616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHo2-0007DB-9l
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVM-0003n7-4k
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHVK-0006Jc-JD
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O77p14frUEXiv52Jlavcp1Wq244ltrLPD4c3UbHtCms=;
 b=S+Rxqhijzw/Dk6x285ibywSrHh+HxxZI4ZAFVWYyLGTYF/ySXWvaiJe1FgMPKsc4xK0qQ7
 0axsyTqwoljvGc888ZFzeJUB1rqo8G90V/fIhA9dDEsagaYazGAeN7hG/eV6pCymlEjIb6
 Xtq6y63s29CxUcIKWP3wk6Y61CroHD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-ggsG4bt3MiOby-ZEJ7cVjg-1; Tue, 26 Apr 2022 05:29:04 -0400
X-MC-Unique: ggsG4bt3MiOby-ZEJ7cVjg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBFA3811E75
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:29:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C4F114152E3;
 Tue, 26 Apr 2022 09:29:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/26] tests: replace pipe() with g_unix_open_pipe(CLOEXEC)
Date: Tue, 26 Apr 2022 13:27:02 +0400
Message-Id: <20220426092715.3931705-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/ivshmem-test.c        | 5 +++--
 tests/unit/test-io-channel-file.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index bfc91d1719d2..e23a97fa8ef4 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -304,6 +304,7 @@ static void setup_vm_with_server(IVState *s, int nvectors)
 
 static void test_ivshmem_server(void)
 {
+    g_autoptr(GError) err = NULL;
     IVState state1, state2, *s1, *s2;
     ServerThread thread;
     IvshmemServer server;
@@ -320,8 +321,8 @@ static void test_ivshmem_server(void)
     g_assert_cmpint(ret, ==, 0);
 
     thread.server = &server;
-    ret = pipe(thread.pipe);
-    g_assert_cmpint(ret, ==, 0);
+    g_unix_open_pipe(thread.pipe, FD_CLOEXEC, &err);
+    g_assert_no_error(err);
     thread.thread = g_thread_new("ivshmem-server", server_thread, &thread);
     g_assert(thread.thread != NULL);
 
diff --git a/tests/unit/test-io-channel-file.c b/tests/unit/test-io-channel-file.c
index 29038e67b64d..1977006ce922 100644
--- a/tests/unit/test-io-channel-file.c
+++ b/tests/unit/test-io-channel-file.c
@@ -109,7 +109,7 @@ static void test_io_channel_pipe(bool async)
     QIOChannelTest *test;
     int fd[2];
 
-    if (pipe(fd) < 0) {
+    if (!g_unix_open_pipe(fd, FD_CLOEXEC, NULL)) {
         perror("pipe");
         abort();
     }
-- 
2.36.0


