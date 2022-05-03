Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122E51900E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:27:47 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm03e-0008ML-0M
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyvO-0001jJ-I4
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyvL-0003Ei-SY
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9m1Y+nOorLPIX/35eqXi8Mnicnq6DPaZ0KxNncP/Vgw=;
 b=SNw0I7gsrHS/RUMx+S6nTkVIL9DI/XQsIugifCQ5CCWFgCacDRY2iDTkIRjBZGfbfI1h9N
 9RcpnkLQq8eXTiWLH4v/0FKB6yTNzueFrufOoRRgN+QIK/ejLM9IEQTkBmpKJTLs99P/a9
 JhRaaY1w9MQPxVUcVPIJjYUC8QLeqC0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-letgppWKO1aA-vWQj55NYw-1; Tue, 03 May 2022 11:35:56 -0400
X-MC-Unique: letgppWKO1aA-vWQj55NYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F850ADE88D;
 Tue,  3 May 2022 13:01:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D7844010121;
 Tue,  3 May 2022 13:01:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 10/23] tests: replace pipe() with g_unix_open_pipe(CLOEXEC)
Date: Tue,  3 May 2022 17:00:10 +0400
Message-Id: <20220503130023.180544-11-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
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

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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
2.36.0.44.g0f828332d5ac


