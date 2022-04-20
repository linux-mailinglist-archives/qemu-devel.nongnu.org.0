Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0270508AC6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:28:02 +0200 (CEST)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBJK-00008z-0z
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOr-0001Ca-2D
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAOp-0004sZ-B0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oy2tA69wX45RkoPV1ut+oW01tsDRb4EkYzn52xAv8t0=;
 b=GZQzJEszlQVGY7NNnXOkJePLfdo8jMbTPMFSJFCMgurCTtAjsZqtePquma7jvH0CClikHx
 i31LIVbGyqMOh81k+TzZig7phVhgbmhLhCpkmn6Agn3IloCIC5290tm1NLcBGWqezy0bie
 mUdrW4+aTqntlEzH70H1YcySIbnaCwY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-wdQfvFvEOqWfSwnK-hrzGA-1; Wed, 20 Apr 2022 09:29:34 -0400
X-MC-Unique: wdQfvFvEOqWfSwnK-hrzGA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 197E0803D65;
 Wed, 20 Apr 2022 13:29:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3633B4C36DA;
 Wed, 20 Apr 2022 13:29:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 28/41] Use QEMU_SANITIZE_ADDRESS
Date: Wed, 20 Apr 2022 17:26:11 +0400
Message-Id: <20220420132624.2439741-29-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index 904b375192ca..52725f5344fb 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -30,7 +30,7 @@
 #include <valgrind/valgrind.h>
 #endif
 
-#if defined(__SANITIZE_ADDRESS__) || __has_feature(address_sanitizer)
+#ifdef QEMU_SANITIZE_THREAD
 #ifdef CONFIG_ASAN_IFACE_FIBER
 #define CONFIG_ASAN 1
 #include <sanitizer/asan_interface.h>
-- 
2.35.1.693.g805e0a68082a


