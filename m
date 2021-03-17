Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3433F7E9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:13:54 +0100 (CET)
Received: from localhost ([::1]:56966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMag5-0001SM-G8
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT9-0000nL-S1; Wed, 17 Mar 2021 14:00:32 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT5-000515-3a; Wed, 17 Mar 2021 14:00:28 -0400
Received: by mail-ej1-x62f.google.com with SMTP id e19so4082178ejt.3;
 Wed, 17 Mar 2021 11:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smfqshe5rWL1zIyiqGH7+GywYlbeI5eZY7MNQuJ+Muk=;
 b=dVe479KW7cs+YM+4etiw8qYGFeTRtxiaLiqzVW/OI2RiFJ6F+bOL0lfPik7pBuzysB
 IC4o05+Yp3dWtvPrgNBrzumcZYzqV6uBjdCgVvaTqU5f05sQDsVV6S9vrliGUrubDkld
 MGmQq9m89kgr08nBoealG8nNQtj9X0HJJC1UBOc6mpHd3vOHKei1qdMCoIih+fShzvoN
 ZRSR+x2Sfo3ajBZvbulX3VQfdNWBdNo9rIwztSqvGVBhhNcNyKcgwM9AN3LcxQq76fIu
 Pl1WBLV3VKoQbYKDj4YscYxeZOWRug3acG7MXX60PKyLHMk8NYzkuBm7Loyq/6fw8WGj
 qjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=smfqshe5rWL1zIyiqGH7+GywYlbeI5eZY7MNQuJ+Muk=;
 b=ScThh7Z/PmqU26sqtZYwJMOZIWFzoyz22Nfulz5Hd436ycF1eoJRyu9iOu02LFDIPu
 kDSOqVQ7sqJ6VbnefqoIyWmuDQsFy13c3+jCnjQUIUNm6khVv3811sCMNbEhKg7AWeL6
 1HGatGh5P2mfUojYGxrEeDC86oDFSMCiiKk1SCIEhO4BUxrKNP+KY55yzGUckWFlYzq1
 cTztSOl+3fByuxDDGg4oZdOejSYZrbep54wM5+j6y06+XbOfpDcc0y3jant8cTp+arXg
 b5m8JxzFOJsDPN2x9rgMOuVFRkLC9jZP4gMQbSCh5YbD41yydNRWJRQZF92cpjLMET/b
 9GUw==
X-Gm-Message-State: AOAM5331JTEKc5J1F9FOQFD/rxf7nck0Jnwqw0iqGZkLVFtHWxdv7HmB
 8gU8mD4SUqFGGbzCjyLLQ2Bv53OPOWI=
X-Google-Smtp-Source: ABdhPJxJXGHjqMl9sfZHGJqpILfCjPycyTwQczGRvF66HPxZWNsXIgNvWosngEcScoIhuUr3bVH3PQ==
X-Received: by 2002:a17:906:ad4:: with SMTP id
 z20mr35893672ejf.496.1616004020495; 
 Wed, 17 Mar 2021 11:00:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b22sm13159303edv.96.2021.03.17.11.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:00:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] test-coroutine: Add rwlock downgrade test
Date: Wed, 17 Mar 2021 19:00:13 +0100
Message-Id: <20210317180013.235231-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317180013.235231-1-pbonzini@redhat.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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

From: David Edmondson <david.edmondson@oracle.com>

Test that downgrading an rwlock does not result in a failure to
schedule coroutines queued on the rwlock.

The diagram associated with test_co_rwlock_downgrade() describes the
intended behaviour, but what was observed previously corresponds to:

| c1     | c2         | c3         | c4       |
|--------+------------+------------+----------|
| rdlock |            |            |          |
| yield  |            |            |          |
|        | wrlock     |            |          |
|        | <queued>   |            |          |
|        |            | rdlock     |          |
|        |            | <queued>   |          |
|        |            |            | wrlock   |
|        |            |            | <queued> |
| unlock |            |            |          |
| yield  |            |            |          |
|        | <dequeued> |            |          |
|        | downgrade  |            |          |
|        | ...        |            |          |
|        | unlock     |            |          |
|        |            | <dequeued> |          |
|        |            | <queued>   |          |

This results in a failure...

ERROR:../tests/test-coroutine.c:369:test_co_rwlock_downgrade: assertion failed: (c3_done)
Bail out! ERROR:../tests/test-coroutine.c:369:test_co_rwlock_downgrade: assertion failed: (c3_done)

...as a result of the c3 coroutine failing to run to completion.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-5-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 99 +++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 6e6f51d480..aa77a3bcb3 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -325,6 +325,104 @@ static void test_co_rwlock_upgrade(void)
     g_assert(c2_done);
 }
 
+static void coroutine_fn rwlock_rdlock_yield(void *opaque)
+{
+    qemu_co_rwlock_rdlock(&rwlock);
+    qemu_coroutine_yield();
+
+    qemu_co_rwlock_unlock(&rwlock);
+    qemu_coroutine_yield();
+
+    *(bool *)opaque = true;
+}
+
+static void coroutine_fn rwlock_wrlock_downgrade(void *opaque)
+{
+    qemu_co_rwlock_wrlock(&rwlock);
+
+    qemu_co_rwlock_downgrade(&rwlock);
+    qemu_co_rwlock_unlock(&rwlock);
+    *(bool *)opaque = true;
+}
+
+static void coroutine_fn rwlock_rdlock(void *opaque)
+{
+    qemu_co_rwlock_rdlock(&rwlock);
+
+    qemu_co_rwlock_unlock(&rwlock);
+    *(bool *)opaque = true;
+}
+
+static void coroutine_fn rwlock_wrlock(void *opaque)
+{
+    qemu_co_rwlock_wrlock(&rwlock);
+
+    qemu_co_rwlock_unlock(&rwlock);
+    *(bool *)opaque = true;
+}
+
+/*
+ * Check that downgrading a reader-writer lock does not cause a hang.
+ *
+ * Four coroutines are used to produce a situation where there are
+ * both reader and writer hopefuls waiting to acquire an rwlock that
+ * is held by a reader.
+ *
+ * The correct sequence of operations we aim to provoke can be
+ * represented as:
+ *
+ * | c1     | c2         | c3         | c4         |
+ * |--------+------------+------------+------------|
+ * | rdlock |            |            |            |
+ * | yield  |            |            |            |
+ * |        | wrlock     |            |            |
+ * |        | <queued>   |            |            |
+ * |        |            | rdlock     |            |
+ * |        |            | <queued>   |            |
+ * |        |            |            | wrlock     |
+ * |        |            |            | <queued>   |
+ * | unlock |            |            |            |
+ * | yield  |            |            |            |
+ * |        | <dequeued> |            |            |
+ * |        | downgrade  |            |            |
+ * |        |            | <dequeued> |            |
+ * |        |            | unlock     |            |
+ * |        | ...        |            |            |
+ * |        | unlock     |            |            |
+ * |        |            |            | <dequeued> |
+ * |        |            |            | unlock     |
+ */
+static void test_co_rwlock_downgrade(void)
+{
+    bool c1_done = false;
+    bool c2_done = false;
+    bool c3_done = false;
+    bool c4_done = false;
+    Coroutine *c1, *c2, *c3, *c4;
+
+    qemu_co_rwlock_init(&rwlock);
+
+    c1 = qemu_coroutine_create(rwlock_rdlock_yield, &c1_done);
+    c2 = qemu_coroutine_create(rwlock_wrlock_downgrade, &c2_done);
+    c3 = qemu_coroutine_create(rwlock_rdlock, &c3_done);
+    c4 = qemu_coroutine_create(rwlock_wrlock, &c4_done);
+
+    qemu_coroutine_enter(c1);
+    qemu_coroutine_enter(c2);
+    qemu_coroutine_enter(c3);
+    qemu_coroutine_enter(c4);
+
+    qemu_coroutine_enter(c1);
+
+    g_assert(c2_done);
+    g_assert(c3_done);
+    g_assert(c4_done);
+
+    qemu_coroutine_enter(c1);
+
+    g_assert(c1_done);
+}
+
 /*
  * Check that creation, enter, and return work
  */
@@ -563,6 +661,7 @@ int main(int argc, char **argv)
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
     g_test_add_func("/locking/co-rwlock/upgrade", test_co_rwlock_upgrade);
+    g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
     if (g_test_perf()) {
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
         g_test_add_func("/perf/nesting", perf_nesting);
-- 
2.29.2


