Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDC66D79A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh1I-0002uV-Tv; Tue, 17 Jan 2023 03:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0j-0002pb-HZ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:08:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0h-0000SK-VU
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673942878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3xZlc7eqrE8EfA+fTVdxTZ+8cHR3tlPNZKDZmmLOI0U=;
 b=VCIqY3UFnXFT7dtV+sFXE8rDw7jcdWIpAdwCXtXNw7A22I0tnwGo8JvyQHbhL7vhgOpbnO
 k0ZqESp6hJBmcRSgp4q4qJj1vxQAXO2kbXTLE8TNFG+RCSUn7wcvEKhiLAz+uB8jv9L5xD
 F7drPN8gwt+P9cYen1rKy8CYv5sjzrU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-bOtHT4xlONC5q5uLW0Nkog-1; Tue, 17 Jan 2023 03:07:57 -0500
X-MC-Unique: bOtHT4xlONC5q5uLW0Nkog-1
Received: by mail-ed1-f72.google.com with SMTP id
 z8-20020a056402274800b0048a31c1746aso20398416edd.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3xZlc7eqrE8EfA+fTVdxTZ+8cHR3tlPNZKDZmmLOI0U=;
 b=1ducI6K/6G1z9MFlUDBYsBSK9M5xaSVE1jprl1ro/Qn2Ap1rUYlFZaAgyBvmZ6QzPX
 rLgVQtbLrK9KQus9nArtEc24Yu00Scyvwz+JLUhY83ncjGh2Yh3rdVDLE+YPv9AuNBvg
 jZHsqHF3Fk93+26bd9IsdEz9NwtooAZYwCrfXnrOgBDvX3G3tNmOT9PCWLNC7GHrKw7q
 4wWkrOkFd9vOI3rscMMYN5U7BRtoGK1TwxxfO3vtFlAOLk7iXDalDuyfYJYO5SOGFEd5
 XWH2TPcbMBUz5Nz6OonjKjRPjNsa3ElDqhKPszFmVU47KO4cj4/WVpzsfwYDa26jp96x
 sXaw==
X-Gm-Message-State: AFqh2kq+FvXkoGJqnFwx0PCIUkzrY2DqltyNvUiEyiDWtjB8XkF9Tega
 oPN+b/4d7Ao9bdeSV/nJpdX6iWQoLZ87S9Y1Bg/APAg7SfHqoZLF1wsPRJP7DbyQgwlo/+2JzS6
 dxqbxuLacgaM9miBZNx70HPvTZJCiKOMFF4zBOGxo6gV1MpyH74Vw3h+zQqjlTS51zqM=
X-Received: by 2002:a05:6402:28ca:b0:499:c294:77af with SMTP id
 ef10-20020a05640228ca00b00499c29477afmr2061901edb.12.1673942876084; 
 Tue, 17 Jan 2023 00:07:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuHDT3STKyPLlcpE6iNKOTf5dLg/9aPbdt4FFgwuJh8U4CjABN4ueo5QGWsuX6akQ+2IyZffg==
X-Received: by 2002:a05:6402:28ca:b0:499:c294:77af with SMTP id
 ef10-20020a05640228ca00b00499c29477afmr2061886edb.12.1673942875734; 
 Tue, 17 Jan 2023 00:07:55 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 b26-20020aa7dc1a000000b00499c3ca6a0dsm8289196edu.10.2023.01.17.00.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:07:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [PATCH 3/4] libqtest: ensure waitpid() is only called once
Date: Tue, 17 Jan 2023 09:07:44 +0100
Message-Id: <20230117080745.43247-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117080745.43247-1-pbonzini@redhat.com>
References: <20230117080745.43247-1-pbonzini@redhat.com>
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

If a test aborts after qtest_wait_qemu() is called, the SIGABRT hooks are
still in place and waitpid() is called again.  The second time it is called,
the process does not exist anymore and the system call fails.

Move the s->qemu_pid = -1 assignment to qtest_wait_qemu() to make it
idempotent, and anyway remove the SIGABRT hook as well to avoid that
qtest_check_status() is called twice.  Because of the extra call,
qtest_remove_abrt_handler() now has to be made idempotent as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqtest.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 4d9cf919b2f7..64ba98bc5853 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -156,6 +156,7 @@ bool qtest_probe_child(QTestState *s)
         CloseHandle((HANDLE)pid);
 #endif
         s->qemu_pid = -1;
+        qtest_remove_abrt_handler(s);
     }
     return false;
 }
@@ -167,6 +168,8 @@ void qtest_set_expected_status(QTestState *s, int status)
 
 static void qtest_check_status(QTestState *s)
 {
+    assert (s->qemu_pid == -1);
+
     /*
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
@@ -200,20 +203,24 @@ static void qtest_check_status(QTestState *s)
 
 void qtest_wait_qemu(QTestState *s)
 {
+    if (s->qemu_pid != -1) {
 #ifndef _WIN32
-    pid_t pid;
+        pid_t pid;
 
-    pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
-    assert(pid == s->qemu_pid);
+        pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
+        g_assert_cmpint(pid, ==, s->qemu_pid);
 #else
-    DWORD ret;
+        DWORD ret;
 
-    ret = WaitForSingleObject((HANDLE)s->qemu_pid, INFINITE);
-    assert(ret == WAIT_OBJECT_0);
-    GetExitCodeProcess((HANDLE)s->qemu_pid, &s->exit_code);
-    CloseHandle((HANDLE)s->qemu_pid);
+        ret = WaitForSingleObject((HANDLE)s->qemu_pid, INFINITE);
+        assert(ret == WAIT_OBJECT_0);
+        GetExitCodeProcess((HANDLE)s->qemu_pid, &s->exit_code);
+        CloseHandle((HANDLE)s->qemu_pid);
 #endif
 
+        s->qemu_pid = -1;
+        qtest_remove_abrt_handler(s);
+    }
     qtest_check_status(s);
 }
 
@@ -227,7 +234,6 @@ void qtest_kill_qemu(QTestState *s)
         TerminateProcess((HANDLE)s->qemu_pid, s->expected_status);
 #endif
         qtest_wait_qemu(s);
-        s->qemu_pid = -1;
         return;
     }
 
@@ -289,6 +295,11 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data)
 void qtest_remove_abrt_handler(void *data)
 {
     GHook *hook = g_hook_find_data(&abrt_hooks, TRUE, data);
+
+    if (!hook) {
+        return;
+    }
+
     g_hook_destroy_link(&abrt_hooks, hook);
 
     /* Uninstall SIGABRT handler on last instance */
-- 
2.38.1


