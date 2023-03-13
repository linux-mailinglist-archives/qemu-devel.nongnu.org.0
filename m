Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77D6B7661
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgaq-0002fK-VO; Mon, 13 Mar 2023 07:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgan-0002ad-6g
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgal-0003Qx-Dt
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678707830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CDG1QAa4TCDbCNsqeNWyQrEnH8MUpubsGVfZYyi7So=;
 b=H88QnNnCfuSWD1yGb49poo0yB/1/WG3UZlmABIQUtNZfBu8LQDMMU/a0t6jxg06JDODXSK
 fdp2p12THs+lIYuLwqeuUt8wJckPBZ0bErsi4nltU7ivYFKMoxZe4OL4esJMbssqslYrRo
 mOwhuxy116cSHHim7AJJiXc59UK6IB4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-KLsWBQv7NX6u3hRK9s7Zyw-1; Mon, 13 Mar 2023 07:43:46 -0400
X-MC-Unique: KLsWBQv7NX6u3hRK9s7Zyw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 574CD185A794;
 Mon, 13 Mar 2023 11:43:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 021EE492C13;
 Mon, 13 Mar 2023 11:43:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 01/25] util: drop qemu_fork()
Date: Mon, 13 Mar 2023 15:43:11 +0400
Message-Id: <20230313114335.424093-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fortunately, qemu_fork() is no longer used since commit
a95570e3e4d6 ("io/command: use glib GSpawn, instead of open-coding
fork/exec"). (GSpawn uses posix_spawn() whenever possible instead)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230221124802.4103554-2-marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h | 14 ---------
 util/oslib-posix.c   | 70 --------------------------------------------
 util/oslib-win32.c   |  9 ------
 3 files changed, 93 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 88c9facbf2..f68b5d8708 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -665,20 +665,6 @@ void qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
  */
 char *qemu_get_pid_name(pid_t pid);
 
-/**
- * qemu_fork:
- *
- * A version of fork that avoids signal handler race
- * conditions that can lead to child process getting
- * signals that are otherwise only expected by the
- * parent. It also resets all signal handlers to the
- * default settings.
- *
- * Returns 0 to child process, pid number to parent
- * or -1 on failure.
- */
-pid_t qemu_fork(Error **errp);
-
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
  */
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 77d882e681..760390b31e 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -583,76 +583,6 @@ char *qemu_get_pid_name(pid_t pid)
 }
 
 
-pid_t qemu_fork(Error **errp)
-{
-    sigset_t oldmask, newmask;
-    struct sigaction sig_action;
-    int saved_errno;
-    pid_t pid;
-
-    /*
-     * Need to block signals now, so that child process can safely
-     * kill off caller's signal handlers without a race.
-     */
-    sigfillset(&newmask);
-    if (pthread_sigmask(SIG_SETMASK, &newmask, &oldmask) != 0) {
-        error_setg_errno(errp, errno,
-                         "cannot block signals");
-        return -1;
-    }
-
-    pid = fork();
-    saved_errno = errno;
-
-    if (pid < 0) {
-        /* attempt to restore signal mask, but ignore failure, to
-         * avoid obscuring the fork failure */
-        (void)pthread_sigmask(SIG_SETMASK, &oldmask, NULL);
-        error_setg_errno(errp, saved_errno,
-                         "cannot fork child process");
-        errno = saved_errno;
-        return -1;
-    } else if (pid) {
-        /* parent process */
-
-        /* Restore our original signal mask now that the child is
-         * safely running. Only documented failures are EFAULT (not
-         * possible, since we are using just-grabbed mask) or EINVAL
-         * (not possible, since we are using correct arguments).  */
-        (void)pthread_sigmask(SIG_SETMASK, &oldmask, NULL);
-    } else {
-        /* child process */
-        size_t i;
-
-        /* Clear out all signal handlers from parent so nothing
-         * unexpected can happen in our child once we unblock
-         * signals */
-        sig_action.sa_handler = SIG_DFL;
-        sig_action.sa_flags = 0;
-        sigemptyset(&sig_action.sa_mask);
-
-        for (i = 1; i < NSIG; i++) {
-            /* Only possible errors are EFAULT or EINVAL The former
-             * won't happen, the latter we expect, so no need to check
-             * return value */
-            (void)sigaction(i, &sig_action, NULL);
-        }
-
-        /* Unmask all signals in child, since we've no idea what the
-         * caller's done with their signal mask and don't want to
-         * propagate that to children */
-        sigemptyset(&newmask);
-        if (pthread_sigmask(SIG_SETMASK, &newmask, NULL) != 0) {
-            Error *local_err = NULL;
-            error_setg_errno(&local_err, errno,
-                             "cannot unblock signals");
-            error_report_err(local_err);
-            _exit(1);
-        }
-    }
-    return pid;
-}
-
 void *qemu_alloc_stack(size_t *sz)
 {
     void *ptr, *guardpage;
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 07ade41800..528c9ee156 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -283,15 +283,6 @@ char *qemu_get_pid_name(pid_t pid)
 }
 
 
-pid_t qemu_fork(Error **errp)
-{
-    errno = ENOSYS;
-    error_setg_errno(errp, errno,
-                     "cannot fork child process");
-    return -1;
-}
-
-
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2


