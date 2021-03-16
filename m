Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1133D8BE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:10:01 +0100 (CET)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCGd-0006Eb-Ve
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7J-0000uq-6e; Tue, 16 Mar 2021 12:00:21 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7D-0000LG-0s; Tue, 16 Mar 2021 12:00:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id o14so6942489wrm.11;
 Tue, 16 Mar 2021 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9UJ7bhSHpJmzJJvP40BdtCaFHKYlAuZrTu3mwldeJRg=;
 b=WpEok9b17mvce8Fg7ZuBCtH6fIZ3nKYJWNC0jIx8MoTzCyFM0EVvJJZKp/pk9y3cy3
 jUj6RNWoKJV4HWhk2mQWVGyc1xvUhr++vBlLfTSpDJrscGWZE6OuThHDPiVlk3wSV7P6
 /FjgZ1HWwp5ks2qvREyS9+hL57Jo4Wcs+JjuWwrdvvRiQGmtanEi3TTIQBxetScIkErV
 LOKjuDir05/Qwa9FuW8NOysMb7c5KT2Qf85l2dCsFinnIM3UHc6FGtMcsaqv0gQVHBsO
 pkYBASoAKvJNJJvsLhy3DnH9DmljluxJIOSTO+7WPwD3iFPzg2kkllFF1kQojRy1ecSH
 Z8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9UJ7bhSHpJmzJJvP40BdtCaFHKYlAuZrTu3mwldeJRg=;
 b=BZASesew3Iy3SR0urRVJ/iLCoRM3SUGOx3Xl65054/RQVEji+NcwMLm3VDXBuVvfgu
 uU2jQyyzljGI/oMNRwll3ohlAwjyAeiNL6DsRfAHCeGuNVKy6zWznywH9J+nrWLLSg0b
 UUrroqTVWzMyNCUZIPkjopbiSExd9wdIzYCWZw/68UzcvpOTvZpyQdfc4FfYdr8maij3
 hQLiNo64ha6k8M+C7NALsG3e5BQQgQoVeC6X41R/fH5bAz4d+CnMmHrftXxKVZ6X6hV+
 LFvs5+8wVTQJ3yoCKUcg2w7EjOQDMw8dADeBB+8RY9+enMJwGhbQ22bEof4HTaaNxLKu
 Bf6w==
X-Gm-Message-State: AOAM533+XY7NXzL3T1QMHsvzpaFAbdgFR+T52gMu8Mly+AD2XsLiUuD+
 bFJ5htkLZLeBA6/Ule/Da9LKAdG5uHA=
X-Google-Smtp-Source: ABdhPJz/oXgd8O4cXRfCwEvmtFEggqR6sWYUidVX0sRV8J9tVK6+CA5p/wa5ce3rEFPGmJEgcGRzTg==
X-Received: by 2002:adf:e60a:: with SMTP id p10mr5672004wrm.291.1615910412610; 
 Tue, 16 Mar 2021 09:00:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm22674851wrw.69.2021.03.16.09.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:00:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] test-coroutine: Add rwlock downgrade test
Date: Tue, 16 Mar 2021 17:00:07 +0100
Message-Id: <20210316160007.135459-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316160007.135459-1-pbonzini@redhat.com>
References: <20210316160007.135459-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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
        Unlike in David's solution, here c3 is run as soon as c2
        is downgraded.  This only affects the drawing and not the
        test code.

 tests/unit/test-coroutine.c | 109 ++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index e946d93a65..62b0092721 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -264,6 +264,114 @@ static void test_co_mutex_lockable(void)
     g_assert(QEMU_MAKE_LOCKABLE(null_pointer) == NULL);
 }
 
+static bool c1_done;
+static bool c2_done;
+static bool c3_done;
+static bool c4_done;
+
+static void coroutine_fn rwlock_c1(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_rdlock(l);
+    qemu_coroutine_yield();
+
+    qemu_co_rwlock_unlock(l);
+    qemu_coroutine_yield();
+
+    c1_done = true;
+}
+
+static void coroutine_fn rwlock_c2(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_wrlock(l);
+
+    qemu_co_rwlock_downgrade(l);
+    qemu_co_rwlock_unlock(l);
+    c2_done = true;
+}
+
+static void coroutine_fn rwlock_c3(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_rdlock(l);
+
+    qemu_co_rwlock_unlock(l);
+    c3_done = true;
+}
+
+static void coroutine_fn rwlock_c4(void *opaque)
+{
+    CoRwlock *l = opaque;
+
+    qemu_co_rwlock_wrlock(l);
+
+    qemu_co_rwlock_unlock(l);
+    c4_done = true;
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
+    CoRwlock l;
+    Coroutine *c1, *c2, *c3, *c4;
+
+    qemu_co_rwlock_init(&l);
+
+    c1 = qemu_coroutine_create(rwlock_c1, &l);
+    c2 = qemu_coroutine_create(rwlock_c2, &l);
+    c3 = qemu_coroutine_create(rwlock_c3, &l);
+    c4 = qemu_coroutine_create(rwlock_c4, &l);
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
@@ -501,6 +612,7 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/order", test_order);
     g_test_add_func("/locking/co-mutex", test_co_mutex);
     g_test_add_func("/locking/co-mutex/lockable", test_co_mutex_lockable);
+    g_test_add_func("/locking/co-rwlock/downgrade", test_co_rwlock_downgrade);
     if (g_test_perf()) {
         g_test_add_func("/perf/lifecycle", perf_lifecycle);
         g_test_add_func("/perf/nesting", perf_nesting);
-- 
2.29.2


