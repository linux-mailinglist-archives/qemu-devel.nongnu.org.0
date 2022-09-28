Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233105ED996
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:56:09 +0200 (CEST)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTnU-0002zJ-4k
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMN-0001EM-Ga
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRML-0000A0-KR
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B+IC1umu97akBFliso5U2R0JE92XccKU7LWEx4ShM7M=;
 b=cUxNJ45se8Ivfe+Y0kVLwNdp9E0kRcs9fEhxw9AC+Xxj+06DniOmUExD66pynLuRYaJiBc
 im5IUl1ja5gMttVUrGV448n3t4Z5fNA9Fw5C1rldpvW/XD2v9ZzfMJ3AkIxf8c0KrJ0PzN
 +ZVnUWTsumq2t+qkJaw6aHi/zZRdvfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-ZqrNtnSGNRSVAfKPDrJiZQ-1; Wed, 28 Sep 2022 03:19:51 -0400
X-MC-Unique: ZqrNtnSGNRSVAfKPDrJiZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A897185A7A3;
 Wed, 28 Sep 2022 07:19:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E791240C83BB;
 Wed, 28 Sep 2022 07:19:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 36/37] tests/qtest: boot-serial-test: Close the serial file
 before starting QEMU
Date: Wed, 28 Sep 2022 09:18:42 +0200
Message-Id: <20220928071843.1468323-37-thuth@redhat.com>
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

This qtest executable created a serial chardev file to be passed to
the QEMU executable. The serial file was created by g_file_open_tmp(),
which internally opens the file with FILE_SHARE_WRITE security attribute
on Windows. Based on [1], there is only one case that allows the first
call to CreateFile() with GENERIC_READ & FILE_SHARE_WRITE, and second
call to CreateFile() with GENERIC_WRITE & FILE_SHARE_READ. All other
combinations require FILE_SHARE_WRITE in the second call. But there is
no way for the second call (in this case the QEMU executable) to know
what combination was passed to the first call, unless FILE_SHARE_WRITE
is passed to the second call.

Two processes shouldn't share the same file for writing with a chardev.
Let's close the serial file before starting QEMU.

[1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20220927110632.1973965-40-bmeng.cn@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/boot-serial-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 72310ba30e..b216519b62 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -233,6 +233,7 @@ static void test_machine(const void *data)
 
     ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
+    close(ser_fd);
 
     if (test->kernel) {
         code = test->kernel;
@@ -266,6 +267,8 @@ static void test_machine(const void *data)
         unlink(codetmp);
     }
 
+    ser_fd = open(serialtmp, O_RDONLY);
+    g_assert(ser_fd != -1);
     if (!check_guest_output(qts, test, ser_fd)) {
         g_error("Failed to find expected string. Please check '%s'",
                 serialtmp);
-- 
2.31.1


