Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770F33F025
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:23:04 +0100 (CET)
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVCZ-0007Gv-54
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6Z-0002Gr-SK; Wed, 17 Mar 2021 08:16:52 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6X-0007jN-DZ; Wed, 17 Mar 2021 08:16:51 -0400
Received: by mail-ed1-x530.google.com with SMTP id bf3so1963126edb.6;
 Wed, 17 Mar 2021 05:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xvvv2l70qQm9QCjFzsbGDAhjoM/FYrf9gqA1A6uPvNg=;
 b=n/MR5Z++Q7RJ18bEJ1Od2M4AzLNhj0+MUecAyA5DS7FYoLRbJjITQFdVyvl12yRYE/
 P640Oltdbm1vlYWKKLJwdA7oD+GBS32qat+V8W2UDntoZimIU0pJRKSFAKYGKT/DLcLJ
 5TaRSuRPa5udr0GNIZvHcuBlWtcfHleF3pNgdOh0/Jpm9X2MgqVw4YRDSuQPC/srkvIJ
 nm71l4BcnYiJtpHXvsInjll9Jl21N+jqSCnx9mo9TFQ0Z94v+Vs4eBjYx/YPSdR+i5PO
 GMQsDNV8lCly988BcTNN0rVSFXiebR/C89eP5NntbN87852NUaDZBS8dCacYX+UA/h62
 7GkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xvvv2l70qQm9QCjFzsbGDAhjoM/FYrf9gqA1A6uPvNg=;
 b=LloySkQoMqxnvNEUKbh8tN9VpjfGNEIhzbu7WglAkSaHgzffJDwpFEYt/D9FeU6ArA
 p3flgNm2Y9BEIqRNXOuvT7v5EqpS8hxIr0fPyK97LT8FA4D7g/ZjAgRePHsW/02g0fL9
 EMLEFBmw5hIxKvGlCvh6VOyWZXfSdi8aW7F7h7woosQaHtJSXSn27/TuZhsXz1prLXmE
 RASmP7qPfVXbjxL0ixdTnwnpTh/E5rrYFwXh51xk1sJ6NiyfYk8cidMMOFNFvkHqy7I0
 7hTNT/o2YCxrLMU5TiAUF9ya5nJ51fsGecwp6AZrUb6Mswmnmnj21wcT1ncvoyLMVEcK
 GZuA==
X-Gm-Message-State: AOAM530RSyKhHVEo15vsVNSNay6TROxB2RxqEJf1UDp0NEpbv0OjjKd5
 uEJtZg+qvMRzQqWJ3UYmd+PPVUP+9c8=
X-Google-Smtp-Source: ABdhPJzPTZU+TuiDdExmCF1cuEAuZ/nh3Wpso1zwoeukD7aCi4BLCzXF8xzfu7H9xjBgWMx9NOd3pw==
X-Received: by 2002:aa7:d656:: with SMTP id v22mr41141009edr.119.1615983407060; 
 Wed, 17 Mar 2021 05:16:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm11520996ejb.85.2021.03.17.05.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:16:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] test-coroutine: add rwlock upgrade test
Date: Wed, 17 Mar 2021 13:16:40 +0100
Message-Id: <20210317121641.215714-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317121641.215714-1-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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



