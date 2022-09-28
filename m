Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF95ED8EC
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:27:55 +0200 (CEST)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTMA-0000uG-9V
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMF-0001By-On
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRME-00008q-6f
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkPb1wyoRfWJVk/j9+EPkP7duMGO4u4DTcVAUzqzg+Y=;
 b=DHQOwvaloiqihCWJe6Mf1BSL+Aa6FM7A9n3b/NsbpUPAUtOh5O7BebHGuuJyUixm1xjfJN
 YjlL8YeyRu7bFhEdruyN93dDvS0qxH+lqFh28q7yxsZ7sjBXdqTTOamcuCEXhQF5zlJhqN
 QWbj5QrnGY1bN6FyC2SLbXY8urqmlus=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-poBs2slVPj2q_4rcxveRig-1; Wed, 28 Sep 2022 03:19:48 -0400
X-MC-Unique: poBs2slVPj2q_4rcxveRig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8E0E882820;
 Wed, 28 Sep 2022 07:19:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94D1440C83BB;
 Wed, 28 Sep 2022 07:19:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 34/37] tests/qtest: qmp-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:40 +0200
Message-Id: <20220928071843.1468323-35-thuth@redhat.com>
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220927110632.1973965-17-bmeng.cn@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/qmp-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index 23b2a37942..22957fa49c 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -163,14 +163,15 @@ static void test_qmp_protocol(void)
 
 /* Out-of-band tests */
 
-char tmpdir[] = "/tmp/qmp-test-XXXXXX";
+char *tmpdir;
 char *fifo_name;
 
 static void setup_blocking_cmd(void)
 {
-    if (!g_mkdtemp(tmpdir)) {
-        g_error("g_mkdtemp: %s", strerror(errno));
-    }
+    GError *err = NULL;
+    tmpdir = g_dir_make_tmp("qmp-test-XXXXXX", &err);
+    g_assert_no_error(err);
+
     fifo_name = g_strdup_printf("%s/fifo", tmpdir);
     if (mkfifo(fifo_name, 0666)) {
         g_error("mkfifo: %s", strerror(errno));
@@ -181,6 +182,7 @@ static void cleanup_blocking_cmd(void)
 {
     unlink(fifo_name);
     rmdir(tmpdir);
+    g_free(tmpdir);
 }
 
 static void send_cmd_that_blocks(QTestState *s, const char *id)
-- 
2.31.1


