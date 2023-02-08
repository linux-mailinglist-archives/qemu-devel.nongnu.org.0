Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29D768F43F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:20:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo7B-0003og-4D; Wed, 08 Feb 2023 12:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6y-0003gl-3q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo6w-0000nJ-9k
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:19:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0WVQ2SCJikMfdhu6sifF8wS8VeWU3oti7JZabc1triw=;
 b=QO1/CerCD+rug1OfXcXtlGAaBdRw0Lm+fnMD9IiV7Tg5r8JdcH8nPie8UNOvJsC9w1xVZY
 qvVnzOoCAHvliyA8hH7dyJmyJz1Sno8HUIKDSJyL88juc/TwdVe2p+Ya7C+oYt7hMqJZRw
 l6vQqI+sDRT+r1t00i3vge1zLgxVtvI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-tserYXgsMqixeFv1WToS_g-1; Wed, 08 Feb 2023 12:19:55 -0500
X-MC-Unique: tserYXgsMqixeFv1WToS_g-1
Received: by mail-ed1-f70.google.com with SMTP id
 bo27-20020a0564020b3b00b004a6c2f6a226so12561894edb.15
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WVQ2SCJikMfdhu6sifF8wS8VeWU3oti7JZabc1triw=;
 b=jAl4e6Pn1dRmnbJwT8oXmZJBl6LTkyvWHyzD+gHZCrr7UmXWLPJignLts5nj60ZytS
 EmVZOrr/8StY2BZ9YZxQFeuHtU8QPr5J/l7Dz5mfuxTok4v64C9vBpytfb+E3hSNjjSB
 Efgb9GC3NI7AATHftac/Mq6TfRfWB0DYS9UijYnqHZG98Lf2xF+2EMIbqfnZ1B2Cpxpu
 6CZsUIAgOvZOaum0VUgntJE4GSFQtiNzhD6t6Mym8IQufZm+5zrQak10irx+6TqHxt3K
 bVV4dee+U9D/BHC7IL8/Shrn4eFZRCIZK/k8K0jADWd+D1tkNvFVHZNKogfNi2SCz4h/
 u3nw==
X-Gm-Message-State: AO0yUKX/3h41HIoZXXvzAcGE46/YzAwlTIMH2ZMMsPa9abMeDq9dkJ8r
 7G7V48+iKNHXAhDnNDbf6siXOqnsBq190d0WS+PTev63PnystP8w0NhXPE6c9XcIEcrcAgUEFhE
 sEHjYsahs3tKOKMoD0LDG17FqoxKnWGGw+hzDaNMakHJOifs2Wx8rwVBt3Sca/OFl8k+MWNNc
X-Received: by 2002:a17:906:7c91:b0:88c:b4c5:4006 with SMTP id
 w17-20020a1709067c9100b0088cb4c54006mr9796901ejo.45.1675876785987; 
 Wed, 08 Feb 2023 09:19:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8xP0pUKqRzA7LLZUJQ+HjskuJl/yz1V1nIbif0rgEuVl1PSz4bgMR3ibR3vApSPEfzvedwig==
X-Received: by 2002:a17:906:7c91:b0:88c:b4c5:4006 with SMTP id
 w17-20020a1709067c9100b0088cb4c54006mr9796879ejo.45.1675876785630; 
 Wed, 08 Feb 2023 09:19:45 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a170906408700b0081bfc79beaesm8517609ejj.75.2023.02.08.09.19.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/11] libqtest: ensure waitpid() is only called once
Date: Wed,  8 Feb 2023 18:19:17 +0100
Message-Id: <20230208171922.95048-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
 tests/qtest/libqtest.c | 55 +++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 4e1f4fb91c55..ce5f235e25f1 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -158,6 +158,7 @@ bool qtest_probe_child(QTestState *s)
         CloseHandle((HANDLE)pid);
 #endif
         s->qemu_pid = -1;
+        qtest_remove_abrt_handler(s);
     }
     return false;
 }
@@ -169,6 +170,8 @@ void qtest_set_expected_status(QTestState *s, int status)
 
 static void qtest_check_status(QTestState *s)
 {
+    assert (s->qemu_pid == -1);
+
     /*
      * Check whether qemu exited with expected exit status; anything else is
      * fishy and should be logged with as much detail as possible.
@@ -202,36 +205,40 @@ static void qtest_check_status(QTestState *s)
 
 void qtest_wait_qemu(QTestState *s)
 {
+    if (s->qemu_pid != -1) {
 #ifndef _WIN32
-    pid_t pid;
-    uint64_t end;
+        pid_t pid;
+        uint64_t end;
 
-    /* poll for a while until sending SIGKILL */
-    end = g_get_monotonic_time() + WAITPID_TIMEOUT * G_TIME_SPAN_SECOND;
+        /* poll for a while until sending SIGKILL */
+        end = g_get_monotonic_time() + WAITPID_TIMEOUT * G_TIME_SPAN_SECOND;
 
-    do {
-        pid = waitpid(s->qemu_pid, &s->wstatus, WNOHANG);
-        if (pid != 0) {
-            break;
+        do {
+            pid = waitpid(s->qemu_pid, &s->wstatus, WNOHANG);
+            if (pid != 0) {
+                break;
+            }
+            g_usleep(100 * 1000);
+        } while (g_get_monotonic_time() < end);
+
+        if (pid == 0) {
+            kill(s->qemu_pid, SIGKILL);
+            pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
         }
-        g_usleep(100 * 1000);
-    } while (g_get_monotonic_time() < end);
 
-    if (pid == 0) {
-        kill(s->qemu_pid, SIGKILL);
-        pid = RETRY_ON_EINTR(waitpid(s->qemu_pid, &s->wstatus, 0));
-    }
-
-    assert(pid == s->qemu_pid);
+        assert(pid == s->qemu_pid);
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
 
@@ -245,7 +252,6 @@ void qtest_kill_qemu(QTestState *s)
         TerminateProcess((HANDLE)s->qemu_pid, s->expected_status);
 #endif
         qtest_wait_qemu(s);
-        s->qemu_pid = -1;
         return;
     }
 
@@ -307,6 +313,11 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data)
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
2.39.1


