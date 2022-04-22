Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9F50B323
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:43:40 +0200 (CEST)
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhot9-0006Dn-Vc
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhome-00054w-1I
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhomc-00062m-Ce
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65WsSuWppks5Ue7SIYVsun8luE0frPcPywGnEBSzcos=;
 b=TSEOuC1ap2i5YnCgfvAL01x3wLtlnVOEfxRoWaDWROhsMk2CqomA0g9QASK0CnbfIx1A6E
 GBNQ4anQx0vR7+2jDIU1VkjiRPvA2wo+jO6tPqzAQxEOgkO3eB13zmlnbLiUKT+I8OU6Jj
 8ut9/6ncofyp7SF73rvqdJlPMMmWIHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-14JHE2jzMRqGc04tGiBCMQ-1; Fri, 22 Apr 2022 04:36:52 -0400
X-MC-Unique: 14JHE2jzMRqGc04tGiBCMQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40729101AA42;
 Fri, 22 Apr 2022 08:36:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54B3143E390;
 Fri, 22 Apr 2022 08:36:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] Use QEMU_SANITIZE_ADDRESS
Date: Fri, 22 Apr 2022 12:36:31 +0400
Message-Id: <20220422083639.3156978-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "open list:Floppy" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/fdc-test.c    | 2 +-
 util/coroutine-ucontext.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 4aa72f36431f..0b3c2c0d523f 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -550,7 +550,7 @@ static void fuzz_registers(void)
 
 static bool qtest_check_clang_sanitizer(void)
 {
-#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
+#ifdef QEMU_SANITIZE_ADDRESS
     return true;
 #else
     g_test_skip("QEMU not configured using --enable-sanitizers");
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index 904b375192ca..ed368e1a3ec3 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -30,7 +30,7 @@
 #include <valgrind/valgrind.h>
 #endif
 
-#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
+#ifdef QEMU_SANITIZE_ADDRESS
 #ifdef CONFIG_ASAN_IFACE_FIBER
 #define CONFIG_ASAN 1
 #include <sanitizer/asan_interface.h>
-- 
2.36.0


