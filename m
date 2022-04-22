Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52450B35D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:00:29 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhp9Q-0006wQ-9M
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhonp-0006si-2I
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhonn-0006Ja-6G
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=spde1PPk4+g3bTy5FK58CtKYvaQh36HB5AuIUYOW3vc=;
 b=EDHeF6hDmoSDQagJ2ULw9h2fZffPb7aoFD3CwoMvaBa3PZ1oqhG9liuqff61uGGb2e80em
 wkoiWJ44dLmCYvC8AXVnefcMWSmuf2+w3bKokA41h74t4lbdVKA0tFMeraK260k257ib6e
 AAjL3pePegy2q+7nk22E2jlWfOl1E5s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-q9AhmKCxMcKB_-30vHiIyg-1; Fri, 22 Apr 2022 04:38:05 -0400
X-MC-Unique: q9AhmKCxMcKB_-30vHiIyg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA21B1C05ABA;
 Fri, 22 Apr 2022 08:38:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BC7C434822;
 Fri, 22 Apr 2022 08:38:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] Replace qemu_pipe() with g_unix_open_pipe()
Date: Fri, 22 Apr 2022 12:36:35 +0400
Message-Id: <20220422083639.3156978-7-marcandre.lureau@redhat.com>
In-Reply-To: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Eric Blake <eblake@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

GLib g_unix_open_pipe() is essentially like qemu_pipe(), available since
2.30.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h        |  4 ----
 qemu-nbd.c                  |  5 +++--
 util/event_notifier-posix.c |  2 +-
 util/oslib-posix.c          | 22 ----------------------
 4 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 220b44f710e5..241d249d7e5b 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -547,10 +547,6 @@ static inline void qemu_timersub(const struct timeval *val1,
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     G_GNUC_WARN_UNUSED_RESULT;
 
-#ifndef _WIN32
-int qemu_pipe(int pipefd[2]);
-#endif
-
 void qemu_set_cloexec(int fd);
 
 void fips_set_state(bool requested);
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 397ffa64d768..a184c6b9992f 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -902,13 +902,14 @@ int main(int argc, char **argv)
 
     if ((device && !verbose) || fork_process) {
 #ifndef WIN32
+        g_autoptr(GError) err = NULL;
         int stderr_fd[2];
         pid_t pid;
         int ret;
 
-        if (qemu_pipe(stderr_fd) < 0) {
+        if (!g_unix_open_pipe(stderr_fd, FD_CLOEXEC, &err)) {
             error_report("Error setting up communication pipe: %s",
-                         strerror(errno));
+                         err->message);
             exit(EXIT_FAILURE);
         }
 
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 8dc30c51414d..df21c2583e1f 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -49,7 +49,7 @@ int event_notifier_init(EventNotifier *e, int active)
         if (errno != ENOSYS) {
             return -errno;
         }
-        if (qemu_pipe(fds) < 0) {
+        if (!g_unix_open_pipe(fds, FD_CLOEXEC, NULL)) {
             return -errno;
         }
         ret = fcntl_setfl(fds[0], O_NONBLOCK);
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 03d97741562c..543c9944b083 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -274,28 +274,6 @@ void qemu_set_cloexec(int fd)
     assert(f != -1);
 }
 
-/*
- * Creates a pipe with FD_CLOEXEC set on both file descriptors
- */
-int qemu_pipe(int pipefd[2])
-{
-    int ret;
-
-#ifdef CONFIG_PIPE2
-    ret = pipe2(pipefd, O_CLOEXEC);
-    if (ret != -1 || errno != ENOSYS) {
-        return ret;
-    }
-#endif
-    ret = pipe(pipefd);
-    if (ret == 0) {
-        qemu_set_cloexec(pipefd[0]);
-        qemu_set_cloexec(pipefd[1]);
-    }
-
-    return ret;
-}
-
 char *
 qemu_get_local_state_dir(void)
 {
-- 
2.36.0


