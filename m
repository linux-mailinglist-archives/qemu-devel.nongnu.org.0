Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788D6E8FB4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:13:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHa-0000ot-3t; Thu, 20 Apr 2023 06:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHP-0000cp-JO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHE-0007zz-NW
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2QLrZjn/OknsMQll+23B6jfxbvFU3SjWJOMn7h956Ys=;
 b=CIshjdPPD4JQjlUY8dlANi3HCq8lvbYhWAaDzkIQndj1AxrYLi6wkEX8U1dV5VYWwfL2JE
 S42d1H6cjdx93OlPqSqLA8V7IV9+WIqIFGq9Y8Up13mFwcO0td2p1YB0YyRGxO7f8NtP4c
 opwB3Scu3d8Ozee3CSNPRyS8IpoUT7A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-yig7hIAZPbiTg-W80kWzkg-1; Thu, 20 Apr 2023 06:12:27 -0400
X-MC-Unique: yig7hIAZPbiTg-W80kWzkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7774B85A588;
 Thu, 20 Apr 2023 10:12:27 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87EA7440BC;
 Thu, 20 Apr 2023 10:12:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 05/23] qtest: Don't assert on "-qtest chardev:myid"
Date: Thu, 20 Apr 2023 12:11:58 +0200
Message-Id: <20230420101216.786304-6-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

If the -qtest command line argument is passed a string that says
"use this chardev for I/O", then it will assert:

$ ./build/clang/qemu-system-i386 -chardev file,path=/dev/null,id=myid -qtest chardev:myid
Unexpected error in qtest_set_chardev() at ../../softmmu/qtest.c:1011:
qemu-system-i386: Cannot find character device 'qtest'
Aborted (core dumped)

This is because in qtest_server_init() we assume that when we create
the chardev with qemu_chr_new() it will always have the name "qtest".
This is true if qemu_chr_new() had to create a new chardev, but not
true if one already existed and is being referred to with
"chardev:myid".

Use the name of the chardev we get back from qemu_chr_new() as the
string to set the qtest 'chardev' property to, instead of hardcoding
it to "qtest".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230413150724.404304-2-peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/qtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 34bd2a33a7..26852996b5 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -867,7 +867,7 @@ void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **
     }
 
     qtest = object_new(TYPE_QTEST);
-    object_property_set_str(qtest, "chardev", "qtest", &error_abort);
+    object_property_set_str(qtest, "chardev", chr->label, &error_abort);
     if (qtest_log) {
         object_property_set_str(qtest, "log", qtest_log, &error_abort);
     }
-- 
2.31.1


