Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C9F4653A7
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 18:09:25 +0100 (CET)
Received: from localhost ([::1]:52132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msT6i-0001DM-HM
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 12:09:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzT-0000iR-Se
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzQ-0001Lc-An
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638378111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zwI4SSAGseqe99BJ4tH/CN4/F2g0U2EsjU4hUPD/cc=;
 b=dk99n+ppIj3QfD+Lyg6qrWruWRlrQ/4pwlA4ssJbM6Qlyt6XqRElUJ4JvWh9gB9yy5k98a
 ToLkHSY3XKO20B1YQD+ko55ECUJKwvJpSLU+RENUxZoXj1V3DBRP/lfAaV+siQtZK09+nz
 CcAFEijPmr7CZzx43RRU4UOYG992+Rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-51MShBKgMmiKMmZiwiD1-w-1; Wed, 01 Dec 2021 12:01:49 -0500
X-MC-Unique: 51MShBKgMmiKMmZiwiD1-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7714F1937FFA;
 Wed,  1 Dec 2021 17:01:27 +0000 (UTC)
Received: from localhost (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DAD119811;
 Wed,  1 Dec 2021 17:01:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 3/4] rcu: use coroutine TLS macros
Date: Wed,  1 Dec 2021 17:01:19 +0000
Message-Id: <20211201170120.286139-4-stefanha@redhat.com>
In-Reply-To: <20211201170120.286139-1-stefanha@redhat.com>
References: <20211201170120.286139-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RCU may be used from coroutines. Standard __thread variables cannot be
used by coroutines. Use the coroutine TLS macros instead.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/rcu.h         |  7 ++++---
 tests/unit/rcutorture.c    | 10 +++++-----
 tests/unit/test-rcu-list.c |  4 ++--
 util/rcu.c                 | 10 +++++-----
 4 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index e69efbd47f..b063c6fde8 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -29,6 +29,7 @@
 #include "qemu/atomic.h"
 #include "qemu/notify.h"
 #include "qemu/sys_membarrier.h"
+#include "qemu/coroutine-tls.h"
 
 #ifdef __cplusplus
 extern "C" {
@@ -76,11 +77,11 @@ struct rcu_reader_data {
     NotifierList force_rcu;
 };
 
-extern __thread struct rcu_reader_data rcu_reader;
+QEMU_DECLARE_CO_TLS(struct rcu_reader_data, rcu_reader)
 
 static inline void rcu_read_lock(void)
 {
-    struct rcu_reader_data *p_rcu_reader = &rcu_reader;
+    struct rcu_reader_data *p_rcu_reader = get_ptr_rcu_reader();
     unsigned ctr;
 
     if (p_rcu_reader->depth++ > 0) {
@@ -96,7 +97,7 @@ static inline void rcu_read_lock(void)
 
 static inline void rcu_read_unlock(void)
 {
-    struct rcu_reader_data *p_rcu_reader = &rcu_reader;
+    struct rcu_reader_data *p_rcu_reader = get_ptr_rcu_reader();
 
     assert(p_rcu_reader->depth != 0);
     if (--p_rcu_reader->depth > 0) {
diff --git a/tests/unit/rcutorture.c b/tests/unit/rcutorture.c
index de6f649058..495a4e6f42 100644
--- a/tests/unit/rcutorture.c
+++ b/tests/unit/rcutorture.c
@@ -122,7 +122,7 @@ static void *rcu_read_perf_test(void *arg)
 
     rcu_register_thread();
 
-    *(struct rcu_reader_data **)arg = &rcu_reader;
+    *(struct rcu_reader_data **)arg = get_ptr_rcu_reader();
     qatomic_inc(&nthreadsrunning);
     while (goflag == GOFLAG_INIT) {
         g_usleep(1000);
@@ -148,7 +148,7 @@ static void *rcu_update_perf_test(void *arg)
 
     rcu_register_thread();
 
-    *(struct rcu_reader_data **)arg = &rcu_reader;
+    *(struct rcu_reader_data **)arg = get_ptr_rcu_reader();
     qatomic_inc(&nthreadsrunning);
     while (goflag == GOFLAG_INIT) {
         g_usleep(1000);
@@ -253,7 +253,7 @@ static void *rcu_read_stress_test(void *arg)
 
     rcu_register_thread();
 
-    *(struct rcu_reader_data **)arg = &rcu_reader;
+    *(struct rcu_reader_data **)arg = get_ptr_rcu_reader();
     while (goflag == GOFLAG_INIT) {
         g_usleep(1000);
     }
@@ -304,7 +304,7 @@ static void *rcu_update_stress_test(void *arg)
     struct rcu_stress *cp = qatomic_read(&rcu_stress_current);
 
     rcu_register_thread();
-    *(struct rcu_reader_data **)arg = &rcu_reader;
+    *(struct rcu_reader_data **)arg = get_ptr_rcu_reader();
 
     while (goflag == GOFLAG_INIT) {
         g_usleep(1000);
@@ -347,7 +347,7 @@ static void *rcu_fake_update_stress_test(void *arg)
 {
     rcu_register_thread();
 
-    *(struct rcu_reader_data **)arg = &rcu_reader;
+    *(struct rcu_reader_data **)arg = get_ptr_rcu_reader();
     while (goflag == GOFLAG_INIT) {
         g_usleep(1000);
     }
diff --git a/tests/unit/test-rcu-list.c b/tests/unit/test-rcu-list.c
index 49641e1936..64b81ae058 100644
--- a/tests/unit/test-rcu-list.c
+++ b/tests/unit/test-rcu-list.c
@@ -171,7 +171,7 @@ static void *rcu_q_reader(void *arg)
 
     rcu_register_thread();
 
-    *(struct rcu_reader_data **)arg = &rcu_reader;
+    *(struct rcu_reader_data **)arg = get_ptr_rcu_reader();
     qatomic_inc(&nthreadsrunning);
     while (qatomic_read(&goflag) == GOFLAG_INIT) {
         g_usleep(1000);
@@ -206,7 +206,7 @@ static void *rcu_q_updater(void *arg)
     long long n_removed_local = 0;
     struct list_element *el, *prev_el;
 
-    *(struct rcu_reader_data **)arg = &rcu_reader;
+    *(struct rcu_reader_data **)arg = get_ptr_rcu_reader();
     qatomic_inc(&nthreadsrunning);
     while (qatomic_read(&goflag) == GOFLAG_INIT) {
         g_usleep(1000);
diff --git a/util/rcu.c b/util/rcu.c
index c91da9f137..b6d6c71cff 100644
--- a/util/rcu.c
+++ b/util/rcu.c
@@ -65,7 +65,7 @@ static inline int rcu_gp_ongoing(unsigned long *ctr)
 /* Written to only by each individual reader. Read by both the reader and the
  * writers.
  */
-__thread struct rcu_reader_data rcu_reader;
+QEMU_DEFINE_CO_TLS(struct rcu_reader_data, rcu_reader)
 
 /* Protected by rcu_registry_lock.  */
 typedef QLIST_HEAD(, rcu_reader_data) ThreadList;
@@ -355,23 +355,23 @@ void drain_call_rcu(void)
 
 void rcu_register_thread(void)
 {
-    assert(rcu_reader.ctr == 0);
+    assert(get_ptr_rcu_reader()->ctr == 0);
     qemu_mutex_lock(&rcu_registry_lock);
-    QLIST_INSERT_HEAD(&registry, &rcu_reader, node);
+    QLIST_INSERT_HEAD(&registry, get_ptr_rcu_reader(), node);
     qemu_mutex_unlock(&rcu_registry_lock);
 }
 
 void rcu_unregister_thread(void)
 {
     qemu_mutex_lock(&rcu_registry_lock);
-    QLIST_REMOVE(&rcu_reader, node);
+    QLIST_REMOVE(get_ptr_rcu_reader(), node);
     qemu_mutex_unlock(&rcu_registry_lock);
 }
 
 void rcu_add_force_rcu_notifier(Notifier *n)
 {
     qemu_mutex_lock(&rcu_registry_lock);
-    notifier_list_add(&rcu_reader.force_rcu, n);
+    notifier_list_add(&get_ptr_rcu_reader()->force_rcu, n);
     qemu_mutex_unlock(&rcu_registry_lock);
 }
 
-- 
2.33.1


