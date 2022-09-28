Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B084A5ED6E1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:54:50 +0200 (CEST)
Received: from localhost ([::1]:44258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odRu5-0005BY-BF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLS-0000ui-4R
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLP-0008RX-Az
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DiXSYRKVY/K37b0MnbCYz/QSL2IO2/H/ATo4+OcCqv4=;
 b=OgKEGP4MGFcJPyylDJygD1DJA5WgnY2IznImMPZgT9hRsXWToJjEe81DzYUrOTyLAdHaBY
 V3gVltQGWP6PyspAp2RR4z4KbFFk/4PW8hipVn1iANMUtR2Cd3lKztJOSKFVZ6MsE7pJFk
 CLbrGfWxeEB2BC/ZJIJCR9V7/Fm463Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-yJpx6LX0Nx2RCPi-gS9HbQ-1; Wed, 28 Sep 2022 03:18:55 -0400
X-MC-Unique: yJpx6LX0Nx2RCPi-gS9HbQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 106293800C20;
 Wed, 28 Sep 2022 07:18:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8E7340C83BB;
 Wed, 28 Sep 2022 07:18:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 04/37] tests/qtest: boot-serial-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:10 +0200
Message-Id: <20220928071843.1468323-5-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
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
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220925113032.1949844-8-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/boot-serial-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 2f99d71cab..72310ba30e 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -224,14 +224,14 @@ static bool check_guest_output(QTestState *qts, const testdef_t *test, int fd)
 static void test_machine(const void *data)
 {
     const testdef_t *test = data;
-    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
-    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
+    g_autofree char *serialtmp = NULL;
+    g_autofree char *codetmp = NULL;
     const char *codeparam = "";
     const uint8_t *code = NULL;
     QTestState *qts;
     int ser_fd;
 
-    ser_fd = mkstemp(serialtmp);
+    ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
 
     if (test->kernel) {
@@ -246,7 +246,7 @@ static void test_machine(const void *data)
         ssize_t wlen;
         int code_fd;
 
-        code_fd = mkstemp(codetmp);
+        code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
         g_assert(code_fd != -1);
         wlen = write(code_fd, code, test->codesize);
         g_assert(wlen == test->codesize);
-- 
2.31.1


