Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A82DB378
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:18:20 +0100 (CET)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEtv-0000yb-Q6
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXk-0003Ld-Mv
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXW-0001YK-7E
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aONf320n0jzBkwIOFniRVUh1zx2iNhlaJLQk1FAoHPs=;
 b=ChpflRL3RHChKYnDfMDkW3ONHXZe7oUkhh/hMYRE1QUmRy9gCcDYl9UQD0rDUD7llmcX6h
 A64IwrfPSnJJBt8rq7rotL1kLrRRHuShATZAsR77eqULUu55u1D31w/yF/etyuqd3oIArB
 GJRCwpQpuiFZ/V/LJT6zeMxKvXypk1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-2YgHFlTsMwWVA-bsc6bIQg-1; Tue, 15 Dec 2020 12:55:07 -0500
X-MC-Unique: 2YgHFlTsMwWVA-bsc6bIQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BC7118B37E4;
 Tue, 15 Dec 2020 17:55:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD4D35D6BA;
 Tue, 15 Dec 2020 17:55:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/45] compiler.h: explicit case for Clang printf attribute
Date: Tue, 15 Dec 2020 12:54:38 -0500
Message-Id: <20201215175445.1272776-39-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
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
Message-Id: <20201210134752.780923-8-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.26.2



