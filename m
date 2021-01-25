Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3E3024A3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:05:32 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40cd-0002Pi-3D
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:05:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l40aZ-0001XP-QW
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:03:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l40aQ-00078p-0l
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:03:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611576193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=66JOwiJJMLE8roueHfHmx0jEkrS44ri4V7+pGn4+88A=;
 b=aKiqPqdq3XeI5qPp3R6gcLlXtIIF1w9yOuMtBoVIUjssZfIqFfrGMiP3OuhqEljVdVTitU
 fKfxz6HhBqrh/kOyaRcRhwNXO+oBbK10KPWzrg4DD2ooj9o7ng2L+8opMJiQbzB6Zbx55o
 qpJ+E0APy3UhBzX/lJ1kjsKrcLlPgy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-7_YKMSbPMKyH7_EepLBgBQ-1; Mon, 25 Jan 2021 07:03:10 -0500
X-MC-Unique: 7_YKMSbPMKyH7_EepLBgBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E19441015C80
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 12:03:09 +0000 (UTC)
Received: from localhost (ovpn-114-237.ams2.redhat.com [10.36.114.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EAB05C737;
 Mon, 25 Jan 2021 12:03:06 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] coroutine-sigaltstack: Add SIGUSR2 mutex
Date: Mon, 25 Jan 2021 13:03:05 +0100
Message-Id: <20210125120305.19520-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

Disposition (action) for any given signal is global for the process.
When two threads run coroutine-sigaltstack's qemu_coroutine_new()
concurrently, they may interfere with each other: One of them may revert
the SIGUSR2 handler to SIG_DFL, between the other thread (a) setting up
coroutine_trampoline() as the handler and (b) raising SIGUSR2.  That
SIGUSR2 will then terminate the QEMU process abnormally.

We have to ensure that only one thread at a time can modify the
process-global SIGUSR2 handler.  To do so, wrap the whole section where
that is done in a mutex.

Alternatively, we could for example have the SIGUSR2 handler always be
coroutine_trampoline(), so there would be no need to invoke sigaction()
in qemu_coroutine_new().  Laszlo has posted a patch to do so here:

  https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg05962.html

However, given that coroutine-sigaltstack is more of a fallback
implementation for platforms that do not support ucontext, that change
may be a bit too invasive to be comfortable with it.  The mutex proposed
here may negatively impact performance, but the change is much simpler.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 util/coroutine-sigaltstack.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
index aade82afb8..e99b8a4f9c 100644
--- a/util/coroutine-sigaltstack.c
+++ b/util/coroutine-sigaltstack.c
@@ -157,6 +157,7 @@ Coroutine *qemu_coroutine_new(void)
     sigset_t sigs;
     sigset_t osigs;
     sigjmp_buf old_env;
+    static pthread_mutex_t sigusr2_mutex = PTHREAD_MUTEX_INITIALIZER;
 
     /* The way to manipulate stack is with the sigaltstack function. We
      * prepare a stack, with it delivering a signal to ourselves and then
@@ -186,6 +187,12 @@ Coroutine *qemu_coroutine_new(void)
     sa.sa_handler = coroutine_trampoline;
     sigfillset(&sa.sa_mask);
     sa.sa_flags = SA_ONSTACK;
+
+    /*
+     * sigaction() is a process-global operation.  We must not run
+     * this code in multiple threads at once.
+     */
+    pthread_mutex_lock(&sigusr2_mutex);
     if (sigaction(SIGUSR2, &sa, &osa) != 0) {
         abort();
     }
@@ -234,6 +241,8 @@ Coroutine *qemu_coroutine_new(void)
      * Restore the old SIGUSR2 signal handler and mask
      */
     sigaction(SIGUSR2, &osa, NULL);
+    pthread_mutex_unlock(&sigusr2_mutex);
+
     pthread_sigmask(SIG_SETMASK, &osigs, NULL);
 
     /*
-- 
2.29.2


