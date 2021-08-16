Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B13ED152
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:54:17 +0200 (CEST)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZJw-0000l3-TV
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFZET-0007Vk-LH
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mFZER-0005aA-VS
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629107315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dD5wqvZmJg+V1NkNO9QyB5xOa455X2dFvlo+stSnv6U=;
 b=Ed3O5kg/Kmov7RMn1P4cgIkQ9oKLQmE1J2mdf+XcM6BA3uojCK/uiU4NTOTV0IY9dRdBsR
 OWyhBF5twZE5jYr1Oh+DNCGVC7AbCiDs4K4c9XE45Ht04vRuY05vFdrkJ+epZJVLhzkeqz
 HUnuGxRlqo7YHY4yJ31SFF6xs0J9xEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-yELymizVMU6LHNdVlYv2gw-1; Mon, 16 Aug 2021 05:48:34 -0400
X-MC-Unique: yELymizVMU6LHNdVlYv2gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DC1A802928;
 Mon, 16 Aug 2021 09:48:33 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C532F19C59;
 Mon, 16 Aug 2021 09:48:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] util/oslib-posix: Forward SIGBUS to MCE handler under
 Linux
Date: Mon, 16 Aug 2021 11:47:39 +0200
Message-Id: <20210816094739.21970-8-david@redhat.com>
In-Reply-To: <20210816094739.21970-1-david@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Temporarily modifying the SIGBUS handler is really nasty, as we might be
unlucky and receive an MCE SIGBUS while having our handler registered.
Unfortunately, there is no way around messing with SIGBUS when
MADV_POPULATE_WRITE is not applicable or not around.

Let's forward SIGBUS that don't belong to us to the already registered
handler and document the situation.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/cpus.c     |  4 ++++
 util/oslib-posix.c | 36 +++++++++++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840..23bca46b07 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -352,6 +352,10 @@ static void qemu_init_sigbus(void)
 {
     struct sigaction action;
 
+    /*
+     * ALERT: when modifying this, take care that SIGBUS forwarding in
+     * os_mem_prealloc() will continue working as expected.
+     */
     memset(&action, 0, sizeof(action));
     action.sa_flags = SA_SIGINFO;
     action.sa_sigaction = sigbus_handler;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 9829149e4b..5c47aa9cb7 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -95,6 +95,7 @@ typedef struct MemsetThread MemsetThread;
 
 /* used by sigbus_handler() */
 static MemsetContext *sigbus_memset_context;
+struct sigaction sigbus_oldact;
 static QemuMutex sigbus_mutex;
 
 static QemuMutex page_mutex;
@@ -446,7 +447,11 @@ const char *qemu_get_exec_dir(void)
     return exec_dir;
 }
 
+#ifdef CONFIG_LINUX
+static void sigbus_handler(int signal, siginfo_t *siginfo, void *ctx)
+#else /* CONFIG_LINUX */
 static void sigbus_handler(int signal)
+#endif /* CONFIG_LINUX */
 {
     int i;
 
@@ -459,6 +464,26 @@ static void sigbus_handler(int signal)
             }
         }
     }
+
+#ifdef CONFIG_LINUX
+    /*
+     * We assume that the MCE SIGBUS handler could have been registered. We
+     * should never receive BUS_MCEERR_AO on any of our threads, but only on
+     * the main thread registered for PR_MCE_KILL_EARLY. Further, we should not
+     * receive BUS_MCEERR_AR triggered by action of other threads on one of
+     * our threads. So, no need to check for unrelated SIGBUS when seeing one
+     * for our threads.
+     *
+     * We will forward to the MCE handler, which will either handle the SIGBUS
+     * or reinstall the default SIGBUS handler and reraise the SIGBUS. The
+     * default SIGBUS handler will crash the process, so we don't care.
+     */
+    if (sigbus_oldact.sa_flags & SA_SIGINFO) {
+        sigbus_oldact.sa_sigaction(signal, siginfo, ctx);
+        return;
+    }
+#endif /* CONFIG_LINUX */
+    warn_report("os_mem_prealloc: unrelated SIGBUS detected and ignored");
 }
 
 static void *do_touch_pages(void *arg)
@@ -628,10 +653,10 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 {
     static gsize initialized;
     int ret;
-    struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
     size_t numpages = DIV_ROUND_UP(memory, hpagesize);
     bool use_madv_populate_write;
+    struct sigaction act;
 
     /*
      * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
@@ -647,10 +672,15 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 
         qemu_mutex_lock(&sigbus_mutex);
         memset(&act, 0, sizeof(act));
+#ifdef CONFIG_LINUX
+        act.sa_sigaction = &sigbus_handler;
+        act.sa_flags = SA_SIGINFO;
+#else /* CONFIG_LINUX */
         act.sa_handler = &sigbus_handler;
         act.sa_flags = 0;
+#endif /* CONFIG_LINUX */
 
-        ret = sigaction(SIGBUS, &act, &oldact);
+        ret = sigaction(SIGBUS, &act, &sigbus_oldact);
         if (ret) {
             error_setg_errno(errp, errno,
                 "os_mem_prealloc: failed to install signal handler");
@@ -667,7 +697,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     }
 
     if (!use_madv_populate_write) {
-        ret = sigaction(SIGBUS, &oldact, NULL);
+        ret = sigaction(SIGBUS, &sigbus_oldact, NULL);
         if (ret) {
             /* Terminate QEMU since it can't recover from error */
             perror("os_mem_prealloc: failed to reinstall signal handler");
-- 
2.31.1


