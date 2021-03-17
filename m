Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0FE33F7CD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:05:02 +0100 (CET)
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaXV-0002uR-Nh
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT1-0000j0-NV; Wed, 17 Mar 2021 14:00:23 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT0-0004v0-39; Wed, 17 Mar 2021 14:00:23 -0400
Received: by mail-ej1-x62e.google.com with SMTP id p7so4082536eju.6;
 Wed, 17 Mar 2021 11:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xvvv2l70qQm9QCjFzsbGDAhjoM/FYrf9gqA1A6uPvNg=;
 b=KmIHz17quR+1SQWwuT/wJMbL1h0kpAqHKZqzpqyeKXxZIEodn+fjro+iQtUCjUTzXy
 WjkjFp8S70J7m5wp/v8f2jN2ua726gkUhAejUwPKka8JeSoa4WS7R+rP+A7Xu0DOcfT9
 kQ11uILxYmmltmvBEK4ijwySPwWEOvWiG5CVkHXloESc250lyLG82WC0k2a2VyemkMQe
 sqzmS6ZBOfPPKv3b7xGsXsdS+bu6vsAr8ZU1PIf9XaFjPnK1m8/z01kwM3ktb/mP2btk
 Yx+Uls471Agr5aqIAJXplSPmDDFEYNFCn9ZxPDKDzuFX5bMcbh8JfW49NuMcpg2qwYsW
 12VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xvvv2l70qQm9QCjFzsbGDAhjoM/FYrf9gqA1A6uPvNg=;
 b=IMk+5vhI1HxuM+sHn0QQzLBQJgABlI5e7Ca1xDHRKhR0k08xoLVBvL8TnwQDqheypK
 JMqVktfs0vXzxbVX4+lvQ4byhgsU0SweUFzjf+jGBxhagDaiu4pa3pcnDgfenA9rCJH0
 CSi485EmdHnfbKXyPvhRJSsV/xtM0v8x+xTuijuJPWWkSu/foq1xCu4AdYgAx5pR1xBU
 uh1G+uyjMdGD3lD2MkrN88gaP5LsGslf3ZXYcWQNgwdE2tgbhPH2hlwW1ir63VS7/edk
 kGG8jQx4me6JlHiuvNcJGUSLJbmDs3nXmLBxC9NEYYtFQv0lsGEdcU2A+euQ+49brIgD
 QJzw==
X-Gm-Message-State: AOAM531a4PvfawJ0orOCpmKSjy15gilHVe2omTTFrLs8xSOKJLjD1Vi2
 cUtrVhQPQpGb8Dfav/HNJe3p1oVILGI=
X-Google-Smtp-Source: ABdhPJx3sp3/rQUD3QoX5on16Q1j5D9ki93BBFlMHWCVxpAH6htKFqAz5OhDZIEIF4pFfrYaPstnww==
X-Received: by 2002:a17:906:3395:: with SMTP id
 v21mr36630356eja.322.1616004019581; 
 Wed, 17 Mar 2021 11:00:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b22sm13159303edv.96.2021.03.17.11.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:00:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] test-coroutine: add rwlock upgrade test
Date: Wed, 17 Mar 2021 19:00:12 +0100
Message-Id: <20210317180013.235231-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317180013.235231-1-pbonzini@redhat.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test that rwlock upgrade is fair, and readers go back to sleep if a writer
is in line.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 62 +++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index e946d93a65..6e6f51d480 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -264,6 +264,67 @@ static void test_co_mutex_lockable(void)
     g_assert(QEMU_MAKE_LOCKABLE(null_pointer) == NULL);
 }
 
+static CoRwlock rwlock;
+
+/* Test that readers are properly sent back to the queue when upgrading,
+ * even if they are the sole readers.  The test scenario is as follows:
+ *
+ *
+ * | c1           | c2         |
+ * |--------------+------------+
+ * | rdlock       |            |
+ * | yield        |            |
+ * |              | wrlock     |
+ * |              | <queued>   |
+ * | upgrade      |            |
+ * | <queued>     | <dequeued> |
+ * |              | unlock     |
+ * | <dequeued>   |            |
+ * | unlock       |            |
+ */
+
+static void coroutine_fn rwlock_yield_upgrade(void *opaque)
+{
+    qemu_co_rwlock_rdlock(&rwlock);
+    qemu_coroutine_yield();
+
+    qemu_co_rwlock_upgrade(&rwlock);
+    qemu_co_rwlock_unlock(&rwlock);
+
+    *(bool *)opaque = true;
+}
+
+static void coroutine_fn rwlock_wrlock_yield(void *opaque)
+{
+    qemu_co_rwlock_wrlock(&rwlock);
+    qemu_coroutine_yield();
+
+    qemu_co_rwlock_unlock(&rwlock);
+    *(bool *)opaque = true;
+}
+
+static void test_co_rwlock_upgrade(void)
+{
+    bool c1_done = false;
+    bool c2_done = false;
+    Coroutine *c1, *c2;
+
+    qemu_co_rwlock_init(&rwlock);
+    c1 = qemu_coroutine_create(rwlock_yield_upgrade, &c1_done);
+    c2 = qemu_coroutine_create(rwlock_wrlock_yield, &c2_done);
+
+    qemu_coroutine_enter(c1);
+    qemu_coroutine_enter(c2);
+
+    /* c1 now should go to sleep.  */
+    qemu_coroutine_enter(c1);
+    g_assert(!c1_done);
+
+    qemu_coroutine_enter(c2);
+    g_assert(c1_done);
+    g_assert(c2_done);
+}
+
 /*
  * Check that creation, enter, and return work
  */
@@ -501,6 +562,7 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/order", test_order);
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
+    g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
     if (g_test_perf()) {
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
         g_test_add_func("/perf/nesting", perf_nesting);
-- 
2.29.2



