Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B0450641D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:02:43 +0200 (CEST)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggwk-0001ey-GT
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglg-00013A-Fr
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:16 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggle-0004Mn-GZ
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso753262wmz.4
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4cZ/5yYlF+5qg8dpUFnjdhAuVIYXjGBqkXlY12xX7o=;
 b=JWbkofRswE+jBVKsdsxgOEDZPQgpvtpeBcQQtTG4/Kan82GGyo5XG7/HDqln/cq3gm
 Q6K6TgE6iuJPoIUuqh7ypBuhwibHYdi+o2gO9APyM/RkUft1x8fE17hKOFnZcGe4izLa
 NmAefA+YmkJExr5IAGQbd2L9spdBPzLRaynZTmNOGRKxmosWdwvrgcfVN7TBkgp0qYEW
 KrOtFaYpSVxp1NlrTVwwK21U8KqXcuF6lqkEPltqliRSDLyoKsB72AccJXw4R/dP8MUB
 KMjgPTf5Y8nLa18IChW8gHuGHXBNMX34yqWvLkpS1dD8kTPZSg/H9Btb6vgKZvdV+ADA
 5zXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n4cZ/5yYlF+5qg8dpUFnjdhAuVIYXjGBqkXlY12xX7o=;
 b=Sf5ye0iSpNnKyCfDUsZfPh8Y8PdSCW50l8qzL9Ft7jGXNPcBH3QSp+wQQqL6FCYO8m
 sI4wrdLgOUsRCPUViqGDBPsbc6yrok/x0fvJj1GWKFswpuHb0Ba4UZMxPcCLp7KGPg/H
 it6tcwq8teNp+jvA0TuopwM//bgSb3cydXtb+ionqDJiBU6gT8qc3aeFjSLeiHvb2Wzl
 6AiSVt2XRav707jBOvmesaoGQsd3LLOWFCOvdvD+VbQwExZnO1EGdBAtAaHxyiHzJC8e
 +iSkeVvdx/By728bfypaBZmgmYyLj94htWAFROFBpGx6iKRAmonbJ2L6aobUaAN3wDut
 e1dQ==
X-Gm-Message-State: AOAM5332KIU4icnRGyHFfNkGqW6pJRDq1vdZcdnYGprcMcNPYdSMljxM
 +BBOMRfUFWGFDUIg2OrcWA/IQ5wSPghDog==
X-Google-Smtp-Source: ABdhPJwBPbMpPA3IZ71JGRTMg1Rfnnq35xsXHmUYcPGywWIVH/V44rINGU50Fn1u3RLLPm52QWeRSQ==
X-Received: by 2002:a7b:cbc9:0:b0:390:4f85:cef1 with SMTP id
 n9-20020a7bcbc9000000b003904f85cef1mr14149196wmi.154.1650347473108; 
 Mon, 18 Apr 2022 22:51:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/53] qtest: replace gettimeofday with GTimer
Date: Tue, 19 Apr 2022 07:50:18 +0200
Message-Id: <20220419055109.142788-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

glib provides a convenience helper to measure elapsed time. It isn't
subject to wall-clock time changes.

Note that this changes the initial OPENED time, which used to print the
current time.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220307070401.171986-3-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/qtest.c | 39 ++++++++++-----------------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index cc586233a9..010d11513d 100644
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
 
 static void G_GNUC_PRINTF(1, 2) qtest_log_send(const char *fmt, ...)
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
2.35.1



