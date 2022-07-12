Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF5557164D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:58:55 +0200 (CEST)
Received: from localhost ([::1]:60912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCfO-0005T6-Bi
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCKa-0006HV-Le
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oBCKE-0001gj-Ai
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 05:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657618621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECB1rjXtaOld755Ej47L1U6FtyhUddpB7HqdBC6SqTw=;
 b=IUmwh0JOprIoHiRnxbRb6tS/3adkHefq61/R4ETtmmGxzROsfZVEQFy3y7LuCIHBcOhHGu
 +2ajWTEJklJidJOdofU2jrC5uaxV1JNJt4HCvmfNHzs2PgDqW5g+F+zZGskeub2SZVqaiP
 V1xl7x3Anh22KS/PLK/lm0Ltd4nwbYM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-E0IAtwoQNEWSS5ZUlZhvuA-1; Tue, 12 Jul 2022 05:36:55 -0400
X-MC-Unique: E0IAtwoQNEWSS5ZUlZhvuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9744D85A584;
 Tue, 12 Jul 2022 09:36:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A4241415117;
 Tue, 12 Jul 2022 09:36:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Warner Losh <imp@bsdimp.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 12/15] qemu-common: move glib-compat.h
Date: Tue, 12 Jul 2022 13:35:25 +0400
Message-Id: <20220712093528.4144184-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qemu-common will have compatible dependency requirements with QEMU.

Since qemu-common won't have a toplevel qemu/osdep.h which would include
various system headers, include stdbool.h (bool is used for some
declarations here).

Replace getenv() with g_getenv() to avoid extra header inclusion.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 {include => subprojects/qemu-common/include}/glib-compat.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename {include => subprojects/qemu-common/include}/glib-compat.h (97%)

diff --git a/include/glib-compat.h b/subprojects/qemu-common/include/glib-compat.h
similarity index 97%
rename from include/glib-compat.h
rename to subprojects/qemu-common/include/glib-compat.h
index 43a562974d80..2b0f2962f322 100644
--- a/include/glib-compat.h
+++ b/subprojects/qemu-common/include/glib-compat.h
@@ -30,6 +30,8 @@
 #pragma GCC diagnostic ignored "-Wdeprecated-declarations"
 
 #include <glib.h>
+#include <stdbool.h>
+
 #if defined(G_OS_UNIX)
 #include <glib-unix.h>
 #include <sys/types.h>
@@ -133,7 +135,7 @@ qemu_g_test_slow(void)
 {
     static int cached = -1;
     if (cached == -1) {
-        cached = g_test_slow() || getenv("G_TEST_SLOW") != NULL;
+        cached = g_test_slow() || g_getenv("G_TEST_SLOW") != NULL;
     }
     return cached;
 }
-- 
2.37.0.rc0


