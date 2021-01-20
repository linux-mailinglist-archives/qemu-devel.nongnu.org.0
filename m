Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D442FD5B0
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:32:52 +0100 (CET)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GPb-0004IH-Dx
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2GJz-0000Nh-DU
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l2GJw-00072e-4J
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611160018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=BqUDPelgQeYsqpvpePqvp77v5hVRzYMkIliTCONxcKk=;
 b=iqbpyycHUyUfoHXNleX579Hc81+rTyHRlBtTd4TXoijme9pLB2m2l0CSclvk7IoiuLjeE/
 WLtnXIgvBLsqpLTIunv+Dc7ROO5IdJYyVoqN8tkDSQFNUiE4WMVVN11dGBtN+Fxvjl9e9w
 /zktkkftYRkDn0HajCEP5atvrYDL9ic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-7CYp6r9ZORi5YzqYbYNtoQ-1; Wed, 20 Jan 2021 11:26:52 -0500
X-MC-Unique: 7CYp6r9ZORi5YzqYbYNtoQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEEB5806662
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 16:26:51 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-178.ams2.redhat.com
 [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F18160D06;
 Wed, 20 Jan 2021 16:26:47 +0000 (UTC)
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: Max Reitz <mreitz@redhat.com>
Subject: Thread safety of coroutine-sigaltstack
Message-ID: <7b8155ad-0942-dc1c-f43c-bb5eb518a278@redhat.com>
Date: Wed, 20 Jan 2021 17:26:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------65D8FF1061BDB08AE4E62593"
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------65D8FF1061BDB08AE4E62593
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I’ve run into trouble with Vladimir’s async backup series on MacOS, 
namely that iotest 256 fails with qemu exiting because of a SIGUSR2.

Turns out this is because MacOS (-xcode) uses coroutine-sigaltstack, 
when I use this on Linux, I get the same error.

(You can find the series applied on my block branch e.g. here:

https://github.com/XanClic/qemu.git block
)

Some debugging later I found that the problem seems to be two threads 
simultaneously creating a coroutine.  It makes sense that this case 
would appear with Vladimir’s series and iotest 256, because 256 runs two 
backup jobs in two different threads in a transaction, i.e. they’re 
launched simultaneously.  The async backup series makes backup use many 
concurrent coroutines and so by default launches 64+x coroutines when 
the backup is started.  Thus, the case of two coroutines created 
concurrently in two threads is very likely to occur.

I think the problem is in coroutine-sigaltstack’s qemu_coroutine_new(). 
It sets up a SIGUSR2 handler, then changes the signal handling stack, 
then raises SIGUSR2, then reverts the signal handling stack and the 
SIGUSR2 handler.  As far as I’m aware, setting up signal handlers and 
changing the signal handling stack are both process-global operations, 
and so if two threads do so concurrently, they will interfere with each 
other.  What usually happens is that one thread sets up everything, 
while the other is already in the process of reverting its changes: So 
the second thread reverts the SIGUSR2 handler to the default, and then 
the first thread raises SIGUSR2, thus making qemu exit.

(Could be worse though.  Both threads could set up the sigaltstack, then 
both raise SIGUSR2, and then we get one coroutine_trampoline() 
invocation in each thread, but both would use the same stack.  But I 
don’t think I’ve ever seen that happen, presumably because the race time 
window is much shorter.)

Now, this all seems obvious to me, but I’m wondering...  If 
coroutine-sigaltstack really couldn’t create coroutines concurrently, 
why wouldn’t we have noticed before?  I mean, this new backup case is 
kind of a stress test, yes, but surely we would have seen the problem 
already, right?  That’s why I’m not sure whether my analysis is correct.

Anyway, I’ve attached a patch that wraps the whole SIGUSR2 handling 
section in a mutex, and that makes 256 pass reliably with Vladimir’s 
async backup series.  Besides being unsure whether the problem is really 
in coroutine-sigaltstack, I also don’t know whether getting out the big 
guns and wrapping everything in the mutex is the best solution.  So, 
it’s an RFC, I guess.

Max

--------------65D8FF1061BDB08AE4E62593
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-coroutine-sigaltstack-Add-SIGUSR2-mutex.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-coroutine-sigaltstack-Add-SIGUSR2-mutex.patch"

From 08d4bb6a98fa731025683f20afe1381291d26031 Mon Sep 17 00:00:00 2001
From: Max Reitz <mreitz@redhat.com>
Date: Wed, 20 Jan 2021 16:59:40 +0100
Subject: [RFC] coroutine-sigaltstack: Add SIGUSR2 mutex

Modifying signal handlers or the signal handling stack is a
process-global operation.  When two threads run coroutine-sigaltstack's
qemu_coroutine_new() concurrently, thay may interfere with each other,
e.g.:

- One of the threads may revert the SIGUSR2 handler back to the default
  between the other thread setting up coroutine_trampoline() as the
  handler and raising SIGUSR2.  That SIGUSR2 will then lead to the
  process exiting.

- Both threads may set up their coroutine stack with sigaltstack()
  simultaneously, so that only one of them sticks.  Both then raise
  SIGUSR2, which goes to each of the threads separately, but both signal
  handler invocations will then use the same stack, which cannot work.

We have to ensure that only one thread at a time can modify the
process-global SIGUSR2 handler and the signal handling stack.  To do so,
wrap the whole section where that is done in a mutex.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 util/coroutine-sigaltstack.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
index aade82afb8..1e48ec4461 100644
--- a/util/coroutine-sigaltstack.c
+++ b/util/coroutine-sigaltstack.c
@@ -157,6 +157,7 @@ Coroutine *qemu_coroutine_new(void)
     sigset_t sigs;
     sigset_t osigs;
     sigjmp_buf old_env;
+    static pthread_mutex_t sigusr2_mutex = PTHREAD_MUTEX_INITIALIZER;
 
     /* The way to manipulate stack is with the sigaltstack function. We
      * prepare a stack, with it delivering a signal to ourselves and then
@@ -186,6 +187,13 @@ Coroutine *qemu_coroutine_new(void)
     sa.sa_handler = coroutine_trampoline;
     sigfillset(&sa.sa_mask);
     sa.sa_flags = SA_ONSTACK;
+
+    /*
+     * Modifying signal handlers and the signal handling stack are
+     * process-global operations.  We must not run this code in
+     * multiple threads at once.
+     */
+    pthread_mutex_lock(&sigusr2_mutex);
     if (sigaction(SIGUSR2, &sa, &osa) != 0) {
         abort();
     }
@@ -234,6 +242,8 @@ Coroutine *qemu_coroutine_new(void)
      * Restore the old SIGUSR2 signal handler and mask
      */
     sigaction(SIGUSR2, &osa, NULL);
+    pthread_mutex_unlock(&sigusr2_mutex);
+
     pthread_sigmask(SIG_SETMASK, &osigs, NULL);
 
     /*
-- 
2.29.2


--------------65D8FF1061BDB08AE4E62593--


