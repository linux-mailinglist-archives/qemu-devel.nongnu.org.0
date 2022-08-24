Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7402459F758
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:21:02 +0200 (CEST)
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnVN-0000ds-Hg
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmun-0004Qn-Tk
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:16 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmum-0001jM-3s
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:13 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso950691pjr.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hUl0ynk/tFixZOGM/lQ3GUXaTY7tp/lhfNkZoNncHPk=;
 b=EF9AIrePmYD2JceHt4BGbq+PRGTpecsKp+p6fyNfxYUsb+huoFjrZxf2xFbPfr0M/l
 prgyKNVmXTWE2/JQ04ZzlwUtEIsCODPgqLoHZDJGZ9OAnmDNEjw8PJAQ6KMIggcnZYJt
 jkCHqFGdUkWwUgvU1Q+UzTB8R0Cj4qzIo9Qpxi9Nqp8ryT1D/X82hX0Xnr/3UROmoG/F
 ZuHrdOMwNECJEYBxXOjA7w1zEgvSF5QXARXWUYcjrPgZ3NiJhw+sWZcAkT3wC5UArhPM
 hDVsbMG6hMZSvxsx9SGDI1vw8kYeWbC2GuJLlcdyyvdWDC9/tK4VRrO1UtWHghaGY3rq
 /rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hUl0ynk/tFixZOGM/lQ3GUXaTY7tp/lhfNkZoNncHPk=;
 b=LO4tn0wLk39rExv4yEWuF8H59gtkID0PJ9ZOIZfKhXP1x4bP7n7w2uJXSr7HlvQSw5
 bMSCauh+DIjG5uTzZ0FR4yYvifedgPiHYZZfVJgM5rkbfn+BvkcOXVSD/tpr2rfNflBb
 E78ehbPG6t+JMpFfBhLtLBaaDo8FKd44Kns4IzbJiw7LVfW7gxTZBTfVGZRK6seOZT+O
 vuJYf7UOZAgZ3wPwHpnvT7esdrJwlyo7CMVjH7tosGvk7clVxMsv66rzLYKklP78C2fE
 ODPiE6leovv4dbrLfiZ4sCRxyyIefvIjHq33VvozaSJdKY0AKcyVNRKG8r7aq465k263
 Vm5A==
X-Gm-Message-State: ACgBeo0YN89H967uKVslOIr7ICbquesLKPj/mFu+7OE1gIU6hysKrEjd
 Dylsm+N0li2EvubxfTgCjcEqJsl07Jw=
X-Google-Smtp-Source: AA6agR7rlNgKaUJlakGO1/J0so4uMaqd860TscxMeD9DxwvESwDi7a0+sWjPk2Z5WX6e8oVfcLkYYw==
X-Received: by 2002:a17:90b:378a:b0:1fa:f716:a427 with SMTP id
 mz10-20020a17090b378a00b001faf716a427mr7573477pjb.153.1661334190406; 
 Wed, 24 Aug 2022 02:43:10 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 37/51] tests/qtest: migration-test: Disable IO redirection for
 win32
Date: Wed, 24 Aug 2022 17:40:15 +0800
Message-Id: <20220824094029.1634519-38-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

On Windows the QEMU executable is created via CreateProcess() and IO
redirection does not work, so we need to set MigrateStart::hide_stderr
to false to disable adding IO redirection to the command line.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/migration-test.c | 39 +++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 2ae7498d5d..125d48d855 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -53,6 +53,17 @@ static bool uffd_feature_thread_id;
  */
 #define DIRTYLIMIT_TOLERANCE_RANGE  25  /* MB/s */
 
+/*
+ * On Windows the QEMU executable is created via CreateProcess() and IO
+ * redirection does not work, so we need to set MigrateStart::hide_stderr
+ * to false to disable adding IO redirection to the command line.
+ */
+#ifndef _WIN32
+# define HIDE_STDERR true
+#else
+# define HIDE_STDERR false
+#endif
+
 #if defined(__linux__)
 #include <sys/syscall.h>
 #include <sys/vfs.h>
@@ -1186,7 +1197,7 @@ static void test_postcopy_recovery_common(MigrateCommon *args)
     g_autofree char *uri = NULL;
 
     /* Always hide errors for postcopy recover tests since they're expected */
-    args->start.hide_stderr = true;
+    args->start.hide_stderr = HIDE_STDERR;
 
     if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
@@ -1287,7 +1298,7 @@ static void test_postcopy_preempt_all(void)
 static void test_baddest(void)
 {
     MigrateStart args = {
-        .hide_stderr = true
+        .hide_stderr = HIDE_STDERR
     };
     QTestState *from, *to;
 
@@ -1410,7 +1421,7 @@ static void test_precopy_unix_tls_x509_default_host(void)
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .connect_uri = uri,
         .listen_uri = uri,
@@ -1526,7 +1537,7 @@ static void test_precopy_tcp_tls_psk_mismatch(void)
 {
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .listen_uri = "tcp:127.0.0.1:0",
         .start_hook = test_migrate_tls_psk_start_mismatch,
@@ -1564,7 +1575,7 @@ static void test_precopy_tcp_tls_x509_mismatch_host(void)
 {
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .listen_uri = "tcp:127.0.0.1:0",
         .start_hook = test_migrate_tls_x509_start_mismatch_host,
@@ -1590,7 +1601,7 @@ static void test_precopy_tcp_tls_x509_hostile_client(void)
 {
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .listen_uri = "tcp:127.0.0.1:0",
         .start_hook = test_migrate_tls_x509_start_hostile_client,
@@ -1616,7 +1627,7 @@ static void test_precopy_tcp_tls_x509_reject_anon_client(void)
 {
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .listen_uri = "tcp:127.0.0.1:0",
         .start_hook = test_migrate_tls_x509_start_reject_anon_client,
@@ -1747,7 +1758,7 @@ static void test_validate_uuid_error(void)
     MigrateStart args = {
         .opts_source = "-uuid 11111111-1111-1111-1111-111111111111",
         .opts_target = "-uuid 22222222-2222-2222-2222-222222222222",
-        .hide_stderr = true,
+        .hide_stderr = HIDE_STDERR,
     };
 
     do_test_validate_uuid(&args, true);
@@ -1757,7 +1768,7 @@ static void test_validate_uuid_src_not_set(void)
 {
     MigrateStart args = {
         .opts_target = "-uuid 22222222-2222-2222-2222-222222222222",
-        .hide_stderr = true,
+        .hide_stderr = HIDE_STDERR,
     };
 
     do_test_validate_uuid(&args, false);
@@ -1767,7 +1778,7 @@ static void test_validate_uuid_dst_not_set(void)
 {
     MigrateStart args = {
         .opts_source = "-uuid 11111111-1111-1111-1111-111111111111",
-        .hide_stderr = true,
+        .hide_stderr = HIDE_STDERR,
     };
 
     do_test_validate_uuid(&args, false);
@@ -1990,7 +2001,7 @@ static void test_multifd_tcp_tls_psk_mismatch(void)
 {
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .listen_uri = "defer",
         .start_hook = test_migrate_multifd_tcp_tls_psk_start_mismatch,
@@ -2038,7 +2049,7 @@ static void test_multifd_tcp_tls_x509_mismatch_host(void)
      */
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .listen_uri = "defer",
         .start_hook = test_migrate_multifd_tls_x509_start_mismatch_host,
@@ -2062,7 +2073,7 @@ static void test_multifd_tcp_tls_x509_reject_anon_client(void)
 {
     MigrateCommon args = {
         .start = {
-            .hide_stderr = true,
+            .hide_stderr = HIDE_STDERR,
         },
         .listen_uri = "defer",
         .start_hook = test_migrate_multifd_tls_x509_start_reject_anon_client,
@@ -2088,7 +2099,7 @@ static void test_multifd_tcp_tls_x509_reject_anon_client(void)
 static void test_multifd_tcp_cancel(void)
 {
     MigrateStart args = {
-        .hide_stderr = true,
+        .hide_stderr = HIDE_STDERR,
     };
     QTestState *from, *to, *to2;
     QDict *rsp;
-- 
2.34.1


