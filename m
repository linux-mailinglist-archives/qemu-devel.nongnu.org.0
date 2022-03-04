Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16C24CD85A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:54:16 +0100 (CET)
Received: from localhost ([::1]:40608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAFz-0003Pu-Ob
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9qt-0003r9-8b
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:28:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nQ9qr-00051w-JR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646407697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9Ezg3SoBLNIiYQXy/QeYboxFvin78kHN6KT16YCW+k=;
 b=ZglDFoxAk8GJ0Xp3AmESO9dXFcDv2ACoGbpAjpmY7oXRzaRH5mBUD3wVcgw/lfv2aDaAOt
 0rzlQ0MihXxxbX4q74J+4A33gCwImpaa0Lcopi+1+owz6zHeJH8OKa6CvULRJ7sN7D/i0W
 1izoUhhw+7irIBkAmSy0DX8KoqwAQDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-ROSoKTbkPBSo2S-KbMKpmA-1; Fri, 04 Mar 2022 10:28:14 -0500
X-MC-Unique: ROSoKTbkPBSo2S-KbMKpmA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 576A48070ED;
 Fri,  4 Mar 2022 15:28:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BA6F83C01;
 Fri,  4 Mar 2022 15:27:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] qtest: replace gettimeofday with GTimer
Date: Fri,  4 Mar 2022 19:27:02 +0400
Message-Id: <20220304152704.3466036-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

glib provides a convenience helper to measure elapsed time. It isn't
subject to wall-clock time changes.

Note that this changes the initial OPENED time, which used to print the
current time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 softmmu/qtest.c | 39 ++++++++++-----------------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 8b7cb6aa8e46..b2bb7777d17d 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -58,12 +58,12 @@ static FILE *qtest_log_fp;
 static QTest *qtest;
 static GString *inbuf;
 static int irq_levels[MAX_IRQ];
-static qemu_timeval start_time;
+static GTimer *timer;
 static bool qtest_opened;
 static void (*qtest_server_send)(void*, const char*);
 static void *qtest_server_send_opaque;
 
-#define FMT_timeval "%ld.%06ld"
+#define FMT_timeval "%.06f"
 
 /**
  * DOC: QTest Protocol
@@ -264,28 +264,13 @@ static int hex2nib(char ch)
     }
 }
 
-static void qtest_get_time(qemu_timeval *tv)
-{
-    qemu_gettimeofday(tv);
-    tv->tv_sec -= start_time.tv_sec;
-    tv->tv_usec -= start_time.tv_usec;
-    if (tv->tv_usec < 0) {
-        tv->tv_usec += 1000000;
-        tv->tv_sec -= 1;
-    }
-}
-
 static void qtest_send_prefix(CharBackend *chr)
 {
-    qemu_timeval tv;
-
     if (!qtest_log_fp || !qtest_opened) {
         return;
     }
 
-    qtest_get_time(&tv);
-    fprintf(qtest_log_fp, "[S +" FMT_timeval "] ",
-            (long) tv.tv_sec, (long) tv.tv_usec);
+    fprintf(qtest_log_fp, "[S +" FMT_timeval "] ", g_timer_elapsed(timer, NULL));
 }
 
 static void GCC_FMT_ATTR(1, 2) qtest_log_send(const char *fmt, ...)
@@ -386,12 +371,9 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
     command = words[0];
 
     if (qtest_log_fp) {
-        qemu_timeval tv;
         int i;
 
-        qtest_get_time(&tv);
-        fprintf(qtest_log_fp, "[R +" FMT_timeval "]",
-                (long) tv.tv_sec, (long) tv.tv_usec);
+        fprintf(qtest_log_fp, "[R +" FMT_timeval "]", g_timer_elapsed(timer, NULL));
         for (i = 0; words[i]; i++) {
             fprintf(qtest_log_fp, " %s", words[i]);
         }
@@ -846,21 +828,20 @@ static void qtest_event(void *opaque, QEMUChrEvent event)
         for (i = 0; i < ARRAY_SIZE(irq_levels); i++) {
             irq_levels[i] = 0;
         }
-        qemu_gettimeofday(&start_time);
+
+        g_clear_pointer(&timer, g_timer_destroy);
+        timer = g_timer_new();
         qtest_opened = true;
         if (qtest_log_fp) {
-            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n",
-                    (long) start_time.tv_sec, (long) start_time.tv_usec);
+            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n", g_timer_elapsed(timer, NULL));
         }
         break;
     case CHR_EVENT_CLOSED:
         qtest_opened = false;
         if (qtest_log_fp) {
-            qemu_timeval tv;
-            qtest_get_time(&tv);
-            fprintf(qtest_log_fp, "[I +" FMT_timeval "] CLOSED\n",
-                    (long) tv.tv_sec, (long) tv.tv_usec);
+            fprintf(qtest_log_fp, "[I +" FMT_timeval "] CLOSED\n", g_timer_elapsed(timer, NULL));
         }
+        g_clear_pointer(&timer, g_timer_destroy);
         break;
     default:
         break;
-- 
2.35.1.273.ge6ebfd0e8cbb


