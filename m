Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D98519009
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:23:48 +0200 (CEST)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzzn-0002ST-BS
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyuL-0000WI-Sc
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:14:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyuK-0002y7-1w
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vddiXhm6AjciFnp+PAgjI6tNEAIpZ19o/JjvTz+HyqA=;
 b=LYUyKEL7C64Yv0eG50hpPnoxrRnolUGr9xnsadEzrhgvd/wiuLo3aTAGu8loevtk2aAeoc
 rxeJoAz/7k41WhSJhxr4cV55a0J4pZPM/YeRvCLtseeEibMsi/EqgwnGM7KuaUv1ZZv9xr
 ai/HiORnXv4FSmMlJylYE/sMpLDBpJ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186--cEiGPJ0Nwm9PqlGux4WNA-1; Tue, 03 May 2022 11:35:42 -0400
X-MC-Unique: -cEiGPJ0Nwm9PqlGux4WNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F189519308BB;
 Tue,  3 May 2022 13:00:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6D6D40CFD19;
 Tue,  3 May 2022 13:00:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 02/23] Use QEMU_SANITIZE_ADDRESS
Date: Tue,  3 May 2022 17:00:02 +0400
Message-Id: <20220503130023.180544-3-marcandre.lureau@redhat.com>
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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
2.36.0.44.g0f828332d5ac


