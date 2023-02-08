Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E549968F440
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:20:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo7E-0003wB-SV; Wed, 08 Feb 2023 12:20:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6z-0003gu-V8
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6y-0000q8-B9
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3jKWUVNkgNe/yvskNRzJo8AnQAUPutISJ0+zSYfHtwc=;
 b=KtOlOeFLKyf1xWrbFsMTBkf2CxJUcDRz1lfXAA7SD1O+rdmZpLok5rc2eEwrj0uT4rOtTk
 CXuumJf+wpmMM1anqBedftEqYfSsQ69Zqq8mGiAGiakZ52BBeM4ce1TcRlvtQTFQCr0wsW
 JOQw9Q+5q1/jqkLw5icgLYR/8QPQlb4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-168-8tAzswdQPXu3PUM8yj8agw-1; Wed, 08 Feb 2023 12:19:48 -0500
X-MC-Unique: 8tAzswdQPXu3PUM8yj8agw-1
Received: by mail-ed1-f70.google.com with SMTP id
 eo7-20020a056402530700b004aab4319cedso6369375edb.2
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3jKWUVNkgNe/yvskNRzJo8AnQAUPutISJ0+zSYfHtwc=;
 b=5F3xZCo32XHcS6329cXDMeRxdZubci3cPPRPJ5XXzuTmS9VI5F0/lpwWXtl/lSht2K
 ubngrqBxd577pxKYh73Qnn6fUOKOfiaEmbd1SnEoN3y3vDkH/hgMSThkjyNNARWeBbCT
 FXBd1VHiZjkfqUQDApo47VzoWhG612l12WT068rW/3VnJycIHJ5+wXnTD3d58zp++GRX
 4TvL11rnzH85B4k0tcky1lO5BQgjwpFddUNfSMf00sXvID9uHzwLRKyEFjdBLav3mW2n
 F0+bA3HJNQMbexpAe94libMNDM5WaqEBPLE9h5u2kkHUDtdsOGuLEHgu8GsFBgXduZda
 c87A==
X-Gm-Message-State: AO0yUKXG2sg6/GTTvzPESmHiwcY75iHvksg80H1Nddy/P+kNicy0semm
 zYdOn0wT4JPz9RIy8MtIDE1coL3RqvIe0TZgC5CVB2+MZCAzJ5HPEhuDsy64w/+LE/nV8hjDJuT
 nUzx/NUHR0ACqPWc/ZWXUjTORXwPdw3pKA+xGn3b8kSlshklxksTsyRfx5pH/wq7iNWvECHmn
X-Received: by 2002:a17:907:3f91:b0:8ae:bb1d:45e4 with SMTP id
 hr17-20020a1709073f9100b008aebb1d45e4mr2463168ejc.26.1675876783539; 
 Wed, 08 Feb 2023 09:19:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/lZdcduHeXdEceUbMEE9MmDz1pQ6P8PLDIU4L9QBWpm/Ux3C+KEi1nE4yr/RoTj92DNngkNQ==
X-Received: by 2002:a17:907:3f91:b0:8ae:bb1d:45e4 with SMTP id
 hr17-20020a1709073f9100b008aebb1d45e4mr2463151ejc.26.1675876783165; 
 Wed, 08 Feb 2023 09:19:43 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a17090603d300b0088519b9206bsm8493272eja.130.2023.02.08.09.19.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] libqtest: split qtest_spawn_qemu function
Date: Wed,  8 Feb 2023 18:19:16 +0100
Message-Id: <20230208171922.95048-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to create a function that allows testing of invalid command
lines, extract the parts of qtest_init_without_qmp_handshake that do
not require any successful set up of sockets.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqtest.c | 103 ++++++++++++++++++++++-------------------
 1 file changed, 55 insertions(+), 48 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index d658222a191d..4e1f4fb91c55 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -360,60 +360,25 @@ static pid_t qtest_create_process(char *cmd)
 }
 #endif /* _WIN32 */
 
-QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
+static QTestState *G_GNUC_PRINTF(1, 2) qtest_spawn_qemu(const char *fmt, ...)
 {
-    QTestState *s;
-    int sock, qmpsock, i;
-    gchar *socket_path;
-    gchar *qmp_socket_path;
-    gchar *command;
-    const char *qemu_binary = qtest_qemu_binary();
+    va_list ap;
+    QTestState *s = g_new0(QTestState, 1);
     const char *trace = g_getenv("QTEST_TRACE");
     g_autofree char *tracearg = trace ?
         g_strdup_printf("-trace %s ", trace) : g_strdup("");
+    g_autoptr(GString) command = g_string_new("");
 
-    s = g_new(QTestState, 1);
-
-    socket_path = g_strdup_printf("%s/qtest-%d.sock",
-                                  g_get_tmp_dir(), getpid());
-    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
-                                      g_get_tmp_dir(), getpid());
-
-    /* It's possible that if an earlier test run crashed it might
-     * have left a stale unix socket lying around. Delete any
-     * stale old socket to avoid spurious test failures with
-     * tests/libqtest.c:70:init_socket: assertion failed (ret != -1): (-1 != -1)
-     */
-    unlink(socket_path);
-    unlink(qmp_socket_path);
-
-    socket_init();
-    sock = init_socket(socket_path);
-    qmpsock = init_socket(qmp_socket_path);
-
-    qtest_client_set_rx_handler(s, qtest_client_socket_recv_line);
-    qtest_client_set_tx_handler(s, qtest_client_socket_send);
+    va_start(ap, fmt);
+    g_string_append_printf(command, CMD_EXEC "%s %s",
+                           qtest_qemu_binary(), tracearg);
+    g_string_append_vprintf(command, fmt, ap);
+    va_end(ap);
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    command = g_strdup_printf(CMD_EXEC "%s %s"
-                              "-qtest unix:%s "
-                              "-qtest-log %s "
-                              "-chardev socket,path=%s,id=char0 "
-                              "-mon chardev=char0,mode=control "
-                              "-display none "
-                              "%s"
-                              " -accel qtest",
-                              qemu_binary, tracearg, socket_path,
-                              getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
-                              qmp_socket_path,
-                              extra_args ?: "");
+    g_test_message("starting QEMU: %s", command->str);
 
-    g_test_message("starting QEMU: %s", command);
-
-    s->pending_events = NULL;
-    s->wstatus = 0;
-    s->expected_status = 0;
 #ifndef _WIN32
     s->qemu_pid = fork();
     if (s->qemu_pid == 0) {
@@ -434,14 +399,56 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
         if (!g_setenv("QEMU_AUDIO_DRV", "none", true)) {
             exit(1);
         }
-        execlp("/bin/sh", "sh", "-c", command, NULL);
+        execlp("/bin/sh", "sh", "-c", command->str, NULL);
         exit(1);
     }
 #else
-    s->qemu_pid = qtest_create_process(command);
+    s->qemu_pid = qtest_create_process(command->str);
 #endif /* _WIN32 */
 
-    g_free(command);
+    return s;
+}
+
+QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
+{
+    QTestState *s;
+    int sock, qmpsock, i;
+    gchar *socket_path;
+    gchar *qmp_socket_path;
+
+    socket_path = g_strdup_printf("%s/qtest-%d.sock",
+                                  g_get_tmp_dir(), getpid());
+    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
+                                      g_get_tmp_dir(), getpid());
+
+    /*
+     * It's possible that if an earlier test run crashed it might
+     * have left a stale unix socket lying around. Delete any
+     * stale old socket to avoid spurious test failures with
+     * tests/libqtest.c:70:init_socket: assertion failed (ret != -1): (-1 != -1)
+     */
+    unlink(socket_path);
+    unlink(qmp_socket_path);
+
+    socket_init();
+    sock = init_socket(socket_path);
+    qmpsock = init_socket(qmp_socket_path);
+
+    s = qtest_spawn_qemu("-qtest unix:%s "
+                         "-qtest-log %s "
+                         "-chardev socket,path=%s,id=char0 "
+                         "-mon chardev=char0,mode=control "
+                         "-display none "
+                         "%s"
+                         " -accel qtest",
+                         socket_path,
+                         getenv("QTEST_LOG") ? DEV_STDERR : DEV_NULL,
+                         qmp_socket_path,
+                         extra_args ?: "");
+
+    qtest_client_set_rx_handler(s, qtest_client_socket_recv_line);
+    qtest_client_set_tx_handler(s, qtest_client_socket_send);
+
     s->fd = socket_accept(sock);
     if (s->fd >= 0) {
         s->qmp_fd = socket_accept(qmpsock);
-- 
2.39.1


