Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752C5089EE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:00:01 +0200 (CEST)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhAsC-0000nL-Bx
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhALy-0005Lr-Ax
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhALv-0004M8-QO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmBovi1Ujwp+9sAT0P/mFAUlxIKGku9Jpkb66Oe9kSM=;
 b=e3nMbq77ZCvFAIi9yzfcT510m0cM0YOssdSUKR1hUyZHU5hnEYBI3fRoag7FoK3H0Hoat0
 D5kdc0JPSATe0JIT/vcVOZGXAdz/hhPq3j7ls+gCii103xP11tWR/TYup1zbWUPCt4xT6j
 wGY/VT51IZ8xzZV2KgExzRq+iCvlVw4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-yrgUYtp_Nn2qoe2tSWoovQ-1; Wed, 20 Apr 2022 09:26:37 -0400
X-MC-Unique: yrgUYtp_Nn2qoe2tSWoovQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 342E63C025B5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:26:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E62D40D282F;
 Wed, 20 Apr 2022 13:26:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 02/41] glib-compat: isolate g_date_time_format_iso8601
 version-bypass
Date: Wed, 20 Apr 2022 17:25:45 +0400
Message-Id: <20220420132624.2439741-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The solution was discussed with Markus Armbruster during the review:
https://patchew.org/QEMU/20220323155743.1585078-1-marcandre.lureau@redhat.com/20220323155743.1585078-14-marcandre.lureau@redhat.com/

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/glib-compat.h | 10 ----------
 util/error-report.c   |  6 +++++-
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index dc14d3ec0d1e..3113a7d2af84 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -145,16 +145,6 @@ qemu_g_test_slow(void)
 #define g_test_thorough() qemu_g_test_slow()
 #define g_test_quick() (!qemu_g_test_slow())
 
-#if GLIB_CHECK_VERSION(2,62,0)
-static inline gchar *
-g_date_time_format_iso8601_compat(GDateTime *datetime)
-{
-    return g_date_time_format_iso8601(datetime);
-}
-
-#define g_date_time_format_iso8601 g_date_time_format_iso8601_compat
-#endif
-
 #pragma GCC diagnostic pop
 
 #endif
diff --git a/util/error-report.c b/util/error-report.c
index d9d3ac30cfab..4ec7b30bcbcc 100644
--- a/util/error-report.c
+++ b/util/error-report.c
@@ -183,9 +183,13 @@ static void print_loc(void)
 static char *
 real_time_iso8601(void)
 {
-#if GLIB_CHECK_VERSION(2, 62, 0)
+#if GLIB_CHECK_VERSION(2,62,0)
     g_autoptr(GDateTime) dt = g_date_time_new_from_unix_utc(g_get_real_time());
+    /* ignore deprecation warning, since GLIB_VERSION_MAX_ALLOWED is 2.56 */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
     return g_date_time_format_iso8601(dt);
+#pragma GCC diagnostic pop
 #else
     GTimeVal tv;
     g_get_current_time(&tv);
-- 
2.35.1.693.g805e0a68082a


