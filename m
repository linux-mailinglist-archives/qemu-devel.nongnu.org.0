Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A0B58ECDC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:14:05 +0200 (CEST)
Received: from localhost ([::1]:39302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLlXA-00081K-AU
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAV-0001uJ-4N
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oLlAC-0007r0-Pg
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660135817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9he5H3XIAFx+28xTXCytUMSLUaO3/+gi4NHH9/XvKw=;
 b=MaGK/MO4zWVpUiiUjwddNb+qG7TlJP7jaD9M8d0cEUTJUDumhgX/9JCCBfH83Fl6d6YP8p
 /GlzMEopadObuo+nHstGkLRbngTRKlVbS6c5cQo5Jjz7nb2PbgX7KS6elXBULo8t6P7llN
 dT/IrKA7d4r24/O3TDJi3bnOCBXjjYg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-xyh6rb4QMtm2s1I9iusCNA-1; Wed, 10 Aug 2022 08:50:16 -0400
X-MC-Unique: xyh6rb4QMtm2s1I9iusCNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C4E63817A90;
 Wed, 10 Aug 2022 12:50:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05E511415124;
 Wed, 10 Aug 2022 12:50:07 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 13/16] qemu-common: move glib-compat.h
Date: Wed, 10 Aug 2022 16:48:54 +0400
Message-Id: <20220810124857.1360211-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
References: <20220810124857.1360211-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

qemu-common will have compatible dependency requirements with QEMU.

Since qemu-common won't have a toplevel qemu/osdep.h which would include
various system headers, include stdbool.h (bool is used for some
declarations here).

Replace getenv() with g_getenv() to avoid extra header inclusion.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
---
 {include => subprojects/qemu-common/include}/glib-compat.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename {include => subprojects/qemu-common/include}/glib-compat.h (97%)

diff --git a/include/glib-compat.h b/subprojects/qemu-common/include/glib-compat.h
similarity index 97%
rename from include/glib-compat.h
rename to subprojects/qemu-common/include/glib-compat.h
index 43a562974d..2b0f2962f3 100644
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
2.37.1


