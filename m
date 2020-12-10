Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE22D5D31
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:10:28 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMeJ-0007Gr-8c
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMKa-0003uZ-Td
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:50:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMKY-00033G-QW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607608201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uC8B/2alqBgSU7hoZ9+H0Qhhp1eKRr97cLOh0lFkCEo=;
 b=hgNp7FKyNlQ0CIiAOV0LJGJW81IdzpUdNhQab6fv5pWoqNLU18VGavlw2UrVubedadIE/P
 N+QFJ+jFKNqyu6IEF3AiXfkYkd9ketYdMTLvWbyl1W4e4Q2ReiROddEGCecgeXIBZ8RicT
 nbALtfHI11Hju5uqMOrf3FEisnIMreQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-d9qAt3hLPxmeeP3x39eJCw-1; Thu, 10 Dec 2020 08:49:56 -0500
X-MC-Unique: d9qAt3hLPxmeeP3x39eJCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A7811005504;
 Thu, 10 Dec 2020 13:49:55 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14C1010021AA;
 Thu, 10 Dec 2020 13:49:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/13] compiler.h: explicit case for Clang printf attribute
Date: Thu, 10 Dec 2020 17:47:46 +0400
Message-Id: <20201210134752.780923-8-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8, we could thus drop
earlier version checks. Except clang advertizes itself as GCC 4.2.1.

Since clang doesn't support gnu_printf, make that case explicitely and
drop GCC version check.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/compiler.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 226ead6c90..6212295e52 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -99,18 +99,18 @@
 #define QEMU_BUILD_BUG_ON_ZERO(x) (sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)) - \
                                    sizeof(QEMU_BUILD_BUG_ON_STRUCT(x)))
 
-#if defined __GNUC__
-# if !QEMU_GNUC_PREREQ(4, 4)
-   /* gcc versions before 4.4.x don't support gnu_printf, so use printf. */
-#  define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
-# else
-   /* Use gnu_printf when supported (qemu uses standard format strings). */
-#  define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
-#  if defined(_WIN32)
-    /* Map __printf__ to __gnu_printf__ because we want standard format strings
-     * even when MinGW or GLib include files use __printf__. */
-#   define __printf__ __gnu_printf__
-#  endif
+#if defined(__clang__)
+/* clang doesn't support gnu_printf, so use printf. */
+# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
+#elif defined(__GNUC__)
+/* Use gnu_printf (qemu uses standard format strings). */
+# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
+# if defined(_WIN32)
+/*
+ * Map __printf__ to __gnu_printf__ because we want standard format strings even
+ * when MinGW or GLib include files use __printf__.
+ */
+#  define __printf__ __gnu_printf__
 # endif
 #else
 #define GCC_FMT_ATTR(n, m)
-- 
2.29.0


