Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE153011C2
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 01:44:06 +0100 (CET)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3725-0001y8-4T
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 19:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l36zT-00016h-9Z
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:41:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l36zP-0004ky-C5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 19:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611362477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AzXggxHOccyWacE/HaxdEgpdWWyi9J8D1f4lsH7y9Rg=;
 b=iDrPyd7RZhNDeDLv/TeGmfpFj40UJN/i+5P8vo8dnswfB3GNG5rqzIwAAVYqF0eiChfL1H
 0cS1RlnnO6tpXoQfFuj1otvxtXVOtDfblR9qXWthgRs6IuyykUCBETt7RgZIJQeQlN7tNs
 0i3gMaQUv+EBjOtvF/yB334aZmoQwuk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-gi9YoUm5NLqcNNQlPWw3nQ-1; Fri, 22 Jan 2021 19:41:14 -0500
X-MC-Unique: gi9YoUm5NLqcNNQlPWw3nQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A5B180A096;
 Sat, 23 Jan 2021 00:41:13 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-81.ams2.redhat.com
 [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F5C05DA30;
 Sat, 23 Jan 2021 00:41:08 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
From: Laszlo Ersek <lersek@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
 <d68e5cc9-d6ba-2dac-04ad-49d5509cd836@redhat.com>
 <eef8237e-293a-b6e6-20be-fa004509fa05@redhat.com>
 <1121a803-98e7-6d41-119c-3d82717976ec@redhat.com>
 <cba8919b-0480-3520-6ad6-920bf9d4186e@redhat.com>
Message-ID: <95b1fd67-e980-be70-addc-6f1ac5f95f3d@redhat.com>
Date: Sat, 23 Jan 2021 01:41:07 +0100
MIME-Version: 1.0
In-Reply-To: <cba8919b-0480-3520-6ad6-920bf9d4186e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------9E2DAA14C408422C63578946"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------9E2DAA14C408422C63578946
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01/22/21 22:26, Laszlo Ersek wrote:

> I'm drifting towards an overhaul of coroutine-sigaltstack, based on my
> personal understanding of POSIX, but given that I can absolutely not
> *test* coroutine-sigaltstack on the platforms where it actually matters,
> an "overhaul" by me would be reckless.
> 
> I didn't expect these skeletons when I first read Max's "Thread safety
> of coroutine-sigaltstack" email :/
> 
> Max, after having worked on top of your patch for a few hours, I
> officially endorse your mutex approach. I can't encourage you or myself
> to touch this code, in good conscience. It's not that it's "bad"; it's
> inexplicable and (to me) untestable.

I'm attaching a patch (based on 0e3246263068). I'm not convinced that I
should take responsibility for this, given the lack of testability on my
end. So I'm not posting it stand-alone even as an RFC. I've built it and
have booted one of my existent domains with it, but that's all.

Thanks
Laszlo

--------------9E2DAA14C408422C63578946
Content-Type: text/x-patch; 
	name=0001-coroutine-sigaltstack-overhaul-SIGUSR2-treatment.patch; 
	charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-coroutine-sigaltstack-overhaul-SIGUSR2-treatment.patch"

From c6c05052961e6066d36f5c7c6e32d36ea9f17dff Mon Sep 17 00:00:00 2001
From: Laszlo Ersek <lersek@redhat.com>
Date: Fri, 22 Jan 2021 11:20:41 +0100
Subject: [PATCH] coroutine-sigaltstack: overhaul SIGUSR2 treatment
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(1) Disposition (action) for any given signal is global for the process.
    When two threads run coroutine-sigaltstack's qemu_coroutine_new()
    concurrently, they may interfere with each other: one of them may
    revert the SIGUSR2 handler to SIG_DFL, between the other thread (a)
    setting up coroutine_trampoline() as the handler and (b) raising
    SIGUSR2. That SIGUSR2 will then terminate the QEMU process abnormally.

    Outside of coroutine-sigaltstack, qemu does not use SIGUSR2 [*]. So
    move the pthread_sigmask() and sigaction() calls from
    qemu_coroutine_new() to coroutine_init(). This will keep the handler
    installed all the time, while also ensuring that all threads block
    SIGUSR2 all the time.

    [*] In user-mode emulation, the guest can register signal handlers for
        any signal but SIGSEGV and SIGBUS, so if it registers a SIGUSR2
        handler, that will interfere with coroutine-sigaltstack. However,
        we do not use coroutines for user-mode emulation, so that is fine.

(2) The temporary unblocking of SIGUSR2 in qemu_coroutine_new() with
    sigsuspend(), which implements the synchronous delivery of SIGUSR2 to
    the thread, is needlessly complicated. Remove the "tr_called"-based
    loop around sigsuspend(), as by the time we reach sigsuspend(),
    SIGUSR2 is certainly pending.

(3) Relatedly, the top of the signal handler can only be entered via the
    sigsuspend() in qemu_coroutine_new(). Express this fact in the signal
    handler by abort()ing on (tr_handler==NULL).

    First, even if another process sends a SIGUSR2 to the QEMU process
    asynchronously, SIGUSR2 will only be unblocked by sigsuspend() in the
    next qemu_coroutine_new() execution, and by that time, the thread in
    question will have raised SIGUSR2 anyway.

    Second, there is no reason for sigsuspend() *not* to be both a
    compiler barrier and a memory barrier.

(4) Finally, the "tr_handler" field should be more strongly typed; it only
    ever points to a CoroutineSigAltStack object.

Based on Max's original patch.

Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
---
 util/coroutine-sigaltstack.c | 89 +++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 37 deletions(-)

diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
index aade82afb8c0..a59513367532 100644
--- a/util/coroutine-sigaltstack.c
+++ b/util/coroutine-sigaltstack.c
@@ -44,21 +44,22 @@ typedef struct {
 /**
  * Per-thread coroutine bookkeeping
  */
 typedef struct {
     /** Currently executing coroutine */
     Coroutine *current;
 
     /** The default coroutine */
     CoroutineSigAltStack leader;
 
     /** Information for the signal handler (trampoline) */
     sigjmp_buf tr_reenter;
-    volatile sig_atomic_t tr_called;
-    void *tr_handler;
+    CoroutineSigAltStack *tr_handler;
 } CoroutineThreadState;
 
 static pthread_key_t thread_state_key;
 
+static void coroutine_trampoline(int signal);
+
 static CoroutineThreadState *coroutine_get_thread_state(void)
 {
     CoroutineThreadState *s = pthread_getspecific(thread_state_key);
@@ -81,16 +82,51 @@ static void qemu_coroutine_thread_cleanup(void *opaque)
 static void __attribute__((constructor)) coroutine_init(void)
 {
     int ret;
+    sigset_t sigs;
+    struct sigaction sa;
 
     ret = pthread_key_create(&thread_state_key, qemu_coroutine_thread_cleanup);
     if (ret != 0) {
         fprintf(stderr, "unable to create leader key: %s\n", strerror(errno));
         abort();
     }
+
+    /*
+     * This constructor function is running in the main thread. Masking SIGUSR2
+     * here means that both the main thread, and directly or indirectly
+     * descendant threads thereof, will block SIGUSR2. (The signal mask is
+     * thread-specific, and inherited through pthread_create().)
+     */
+    sigemptyset(&sigs);
+    sigaddset(&sigs, SIGUSR2);
+    pthread_sigmask(SIG_BLOCK, &sigs, NULL);
+
+    /*
+     * Establish the SIGUSR2 signal handler. This is a process-wide operation,
+     * and so will apply to all threads from here on.
+     *
+     * We'll only unblock the delivery of SIGUSR2 in a narrow window, in
+     * qemu_coroutine_new().
+     *
+     * While the handler is running, SIGUSR2 itself will be blocked due to
+     * setting none of the SA_NODEFER and SA_RESETHAND flags below. All other
+     * signals will *remain* blocked, from where we unblock SIGUSR2 in
+     * qemu_coroutine_new(). Still, we need to set "sa_mask" below *somehow*,
+     * and then it's simplest to make it block all signals, even though it
+     * makes no difference to the signal mask that's already going to be in
+     * effect when the handler is entered.
+     */
+    sa.sa_handler = coroutine_trampoline;
+    sigfillset(&sa.sa_mask);
+    sa.sa_flags = SA_ONSTACK;
+    if (sigaction(SIGUSR2, &sa, NULL) != 0) {
+        perror("Unable to install SIGUSR2 handler");
+        abort();
+    }
 }
 
 /* "boot" function
  * This is what starts the coroutine, is called from the trampoline
  * (from the signal handler when it is not signal handling, read ahead
  * for more information).
  */
@@ -110,38 +146,47 @@ static void coroutine_bootstrap(CoroutineSigAltStack *self, Coroutine *co)
 /*
  * This is used as the signal handler. This is called with the brand new stack
  * (thanks to sigaltstack). We have to return, given that this is a signal
  * handler and the sigmask and some other things are changed.
  */
 static void coroutine_trampoline(int signal)
 {
     CoroutineSigAltStack *self;
     Coroutine *co;
     CoroutineThreadState *coTS;
 
     /* Get the thread specific information */
     coTS = coroutine_get_thread_state();
     self = coTS->tr_handler;
-    coTS->tr_called = 1;
+
+    if (!self) {
+        /*
+         * Never reached -- the top of coroutine_trampoline() can only be
+         * entered from the sigsuspend() call in qemu_coroutine_new().
+         */
+        abort();
+    }
+
+    coTS->tr_handler = NULL;
     co = &self->base;
 
     /*
      * Here we have to do a bit of a ping pong between the caller, given that
      * this is a signal handler and we have to do a return "soon". Then the
      * caller can reestablish everything and do a siglongjmp here again.
      */
     if (!sigsetjmp(coTS->tr_reenter, 0)) {
         return;
     }
 
     /*
      * Ok, the caller has siglongjmp'ed back to us, so now prepare
      * us for the real machine state switching. We have to jump
      * into another function here to get a new stack context for
      * the auto variables (which have to be auto-variables
      * because the start of the thread happens later). Else with
      * PIC (i.e. Position Independent Code which is used when PTH
      * is built as a shared library) most platforms would
      * horrible core dump as experience showed.
      */
     coroutine_bootstrap(self, co);
 }
@@ -149,107 +194,77 @@ static void coroutine_trampoline(int signal)
 Coroutine *qemu_coroutine_new(void)
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
      * prepare a stack, with it delivering a signal to ourselves and then
      * put sigsetjmp/siglongjmp where needed.
      * This has been done keeping coroutine-ucontext as a model and with the
      * pth ideas (GNU Portable Threads). See coroutine-ucontext for the basics
      * of the coroutines and see pth_mctx.c (from the pth project) for the
      * sigaltstack way of manipulating stacks.
      */
 
     co = g_malloc0(sizeof(*co));
     co->stack_size = COROUTINE_STACK_SIZE;
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
     ss.ss_sp = co->stack;
     ss.ss_size = co->stack_size;
     ss.ss_flags = 0;
     if (sigaltstack(&ss, &oss) < 0) {
         abort();
     }
 
     /*
      * Now transfer control onto the signal stack and set it up.
      * It will return immediately via "return" after the sigsetjmp()
-     * was performed. Be careful here with race conditions.  The
-     * signal can be delivered the first time sigsuspend() is
-     * called.
+     * was performed.
      */
-    coTS->tr_called = 0;
+    coTS = coroutine_get_thread_state();
+    coTS->tr_handler = co;
     pthread_kill(pthread_self(), SIGUSR2);
     sigfillset(&sigs);
     sigdelset(&sigs, SIGUSR2);
-    while (!coTS->tr_called) {
-        sigsuspend(&sigs);
-    }
+    sigsuspend(&sigs);
 
     /*
      * Inform the system that we are back off the signal stack by
      * removing the alternative signal stack. Be careful here: It
      * first has to be disabled, before it can be removed.
      */
     sigaltstack(NULL, &ss);
     ss.ss_flags = SS_DISABLE;
     if (sigaltstack(&ss, NULL) < 0) {
         abort();
     }
     sigaltstack(NULL, &ss);
     if (!(oss.ss_flags & SS_DISABLE)) {
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
      * redundant ping-pong pointer arithmetic is necessary to avoid
      * type-conversion warnings related to the `volatile' qualifier and
      * the fact that `jmp_buf' usually is an array type.
      */
     if (!sigsetjmp(old_env, 0)) {
         siglongjmp(coTS->tr_reenter, 1);
     }
 
     /*
      * Ok, we returned again, so now we're finished
      */
 
     return &co->base;
 }
-- 
2.19.1.3.g30247aa5d201


--------------9E2DAA14C408422C63578946--


