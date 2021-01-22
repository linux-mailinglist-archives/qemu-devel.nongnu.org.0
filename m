Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6EE300014
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:22:46 +0100 (CET)
Received: from localhost ([::1]:57644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2taX-00006i-8b
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2tYj-0007eY-SP
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2tYf-0003Ck-G3
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611310848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c6JXnqq5+yY6B54adVDVWQ0ksapgrAB5ByF+8SLu3pk=;
 b=ha7SQFHHUJVsPePxrg52fi4eAoDdmyVlHCYUkbDktOwedYqFEW3+AcNP8ExoNWkzdUanjU
 ExhKMkRZuLGTiNlHL+Ftmk/SW/4xfULSJAeHnTqM4am3nVy7fRuQmWRQ5m87pM5bNoiZq7
 h2oedVxthjtYO5TkhSek/86w66Nkr9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-rA5vGG32Obyl7ziGGr_E3Q-1; Fri, 22 Jan 2021 05:20:47 -0500
X-MC-Unique: rA5vGG32Obyl7ziGGr_E3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414F68144E1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:20:46 +0000 (UTC)
Received: from localhost (ovpn-114-109.ams2.redhat.com [10.36.114.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C69B05D9CA;
 Fri, 22 Jan 2021 10:20:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
Date: Fri, 22 Jan 2021 11:20:41 +0100
Message-Id: <20210122102041.27031-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modifying signal handlers is a process-global operation.  When two
threads run coroutine-sigaltstack's qemu_coroutine_new() concurrently,
they may interfere with each other: One of them may revert the SIGUSR2
handler back to the default between the other thread setting up
coroutine_trampoline() as the handler and raising SIGUSR2.  That SIGUSR2
will then lead to the process exiting.

Outside of coroutine-sigaltstack, qemu does not use SIGUSR2.  We can
thus keep the signal handler installed all the time.
CoroutineThreadState.tr_handler tells coroutine_trampoline() whether its
stack is set up so a new coroutine is to be launched (i.e., it should
invoke sigsetjmp()), or not (i.e., the signal came from an external
source and we should just perform the default action, which is to exit
the process).

Note that in user-mode emulation, the guest can register signal handlers
for any signal but SIGSEGV and SIGBUS, so if it registers a SIGUSR2
handler, sigaltstack coroutines will break from then on.  However, we do
not use coroutines for user-mode emulation, so that is fine.

Suggested-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 util/coroutine-sigaltstack.c | 56 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
index aade82afb8..2d32afc322 100644
--- a/util/coroutine-sigaltstack.c
+++ b/util/coroutine-sigaltstack.c
@@ -59,6 +59,8 @@ typedef struct {
 
 static pthread_key_t thread_state_key;
 
+static void coroutine_trampoline(int signal);
+
 static CoroutineThreadState *coroutine_get_thread_state(void)
 {
     CoroutineThreadState *s = pthread_getspecific(thread_state_key);
@@ -80,6 +82,7 @@ static void qemu_coroutine_thread_cleanup(void *opaque)
 
 static void __attribute__((constructor)) coroutine_init(void)
 {
+    struct sigaction sa;
     int ret;
 
     ret = pthread_key_create(&thread_state_key, qemu_coroutine_thread_cleanup);
@@ -87,6 +90,20 @@ static void __attribute__((constructor)) coroutine_init(void)
         fprintf(stderr, "unable to create leader key: %s\n", strerror(errno));
         abort();
     }
+
+    /*
+     * Establish the SIGUSR2 signal handler.  This is a process-wide
+     * operation, and so will apply to all threads from here on.
+     */
+    sa = (struct sigaction) {
+        .sa_handler = coroutine_trampoline,
+        .sa_flags   = SA_ONSTACK,
+    };
+
+    if (sigaction(SIGUSR2, &sa, NULL) != 0) {
+        perror("Unable to install SIGUSR2 handler");
+        abort();
+    }
 }
 
 /* "boot" function
@@ -121,7 +138,17 @@ static void coroutine_trampoline(int signal)
     /* Get the thread specific information */
     coTS = coroutine_get_thread_state();
     self = coTS->tr_handler;
+
+    if (!self) {
+        /*
+         * This SIGUSR2 came from an external source, not from
+         * qemu_coroutine_new(), so perform the default action.
+         */
+        exit(0);
+    }
+
     coTS->tr_called = 1;
+    coTS->tr_handler = NULL;
     co = &self->base;
 
     /*
@@ -150,12 +177,9 @@ Coroutine *qemu_coroutine_new(void)
 {
     CoroutineSigAltStack *co;
     CoroutineThreadState *coTS;
-    struct sigaction sa;
-    struct sigaction osa;
     stack_t ss;
     stack_t oss;
     sigset_t sigs;
-    sigset_t osigs;
     sigjmp_buf old_env;
 
     /* The way to manipulate stack is with the sigaltstack function. We
@@ -172,24 +196,6 @@ Coroutine *qemu_coroutine_new(void)
     co->stack = qemu_alloc_stack(&co->stack_size);
     co->base.entry_arg = &old_env; /* stash away our jmp_buf */
 
-    coTS = coroutine_get_thread_state();
-    coTS->tr_handler = co;
-
-    /*
-     * Preserve the SIGUSR2 signal state, block SIGUSR2,
-     * and establish our signal handler. The signal will
-     * later transfer control onto the signal stack.
-     */
-    sigemptyset(&sigs);
-    sigaddset(&sigs, SIGUSR2);
-    pthread_sigmask(SIG_BLOCK, &sigs, &osigs);
-    sa.sa_handler = coroutine_trampoline;
-    sigfillset(&sa.sa_mask);
-    sa.sa_flags = SA_ONSTACK;
-    if (sigaction(SIGUSR2, &sa, &osa) != 0) {
-        abort();
-    }
-
     /*
      * Set the new stack.
      */
@@ -207,6 +213,8 @@ Coroutine *qemu_coroutine_new(void)
      * signal can be delivered the first time sigsuspend() is
      * called.
      */
+    coTS = coroutine_get_thread_state();
+    coTS->tr_handler = co;
     coTS->tr_called = 0;
     pthread_kill(pthread_self(), SIGUSR2);
     sigfillset(&sigs);
@@ -230,12 +238,6 @@ Coroutine *qemu_coroutine_new(void)
         sigaltstack(&oss, NULL);
     }
 
-    /*
-     * Restore the old SIGUSR2 signal handler and mask
-     */
-    sigaction(SIGUSR2, &osa, NULL);
-    pthread_sigmask(SIG_SETMASK, &osigs, NULL);
-
     /*
      * Now enter the trampoline again, but this time not as a signal
      * handler. Instead we jump into it directly. The functionally
-- 
2.29.2


