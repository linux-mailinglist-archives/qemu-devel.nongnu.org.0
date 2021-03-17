Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAED33F023
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:22:05 +0100 (CET)
Received: from localhost ([::1]:56186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVBc-0006MH-Ji
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6a-0002HR-BF; Wed, 17 Mar 2021 08:16:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6X-0007jm-Gd; Wed, 17 Mar 2021 08:16:51 -0400
Received: by mail-ej1-x629.google.com with SMTP id dx17so2243256ejb.2;
 Wed, 17 Mar 2021 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smfqshe5rWL1zIyiqGH7+GywYlbeI5eZY7MNQuJ+Muk=;
 b=ff/BMM0yYL2KOKRLefc27F7D0Mg4L1QZPERQBm/dtapY0VMiYI0hn8Xjc+TdPLhRIW
 5RiA0p9hSgyS3JJ1B6EGuPlLLlBv6ZmXwf/rb6xPYeFiBRvuAEiNVSjyPXxKk6KTjCxa
 /iGRTp8+XZxtDsq6fhjmS8tstboUW32x4zK42c/qhZpO8UgifgYhpoLIq5ax4LtnLJHS
 kCnCmymwPoNG0UKSlONMEe1BBNLHkgNDJA+Ur/katxy7SwgtlbKZera61shzGx7QSaTv
 RCKeUYA5d3K94S+ooCiMOYhtgTrVaN23zlwcQHHYUPTHKV3qW9DH6fS+BsyOHHrCee0a
 kCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=smfqshe5rWL1zIyiqGH7+GywYlbeI5eZY7MNQuJ+Muk=;
 b=JtJxirP36pG8I8MLqgsfMz2tplblMdQU4Hbe2VkITvT2MOikSOTaHpfZLgZa94MNkS
 dlnjEAkPsmSpIHJiraewnY1kjc57oB/eJJLMeog1jsWDIHiKcl4fvGITmk9FJEYfaRoA
 bYFUplU0uopAcySQLn0G2JKEzR/BveFCAS2urdhwL/DodE1Zrz8oPEEuESgU6i0XBo4Z
 HJYeTalFNXT8Nrm/PYikD7h4/+IlZSG4TxZ67RowCUQ6ABqF3aqq0Qtt6X/7ug6Nst0R
 MGbIP2JdPQ1f+S7WR30r8zpikExDd4ODsbEP9GBox0tf2gJgiuMqIwKikCYzDWUXZEm+
 CSKQ==
X-Gm-Message-State: AOAM533ywveV2+xvK6A+LIw+U7d8JstS/1HchdbsLu4++F0g4K1icgRE
 0q0FKIx0tmHQ92XlmDBywdrfE0xKoIw=
X-Google-Smtp-Source: ABdhPJy7aglDZLedtVIG91Ey87ZuCH5kokcUgj7oB25TmAXtsyFhd6gCrPrhsSg6xP8oq0USxWW8mA==
X-Received: by 2002:a17:906:5611:: with SMTP id
 f17mr35491731ejq.208.1615983407836; 
 Wed, 17 Mar 2021 05:16:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm11520996ejb.85.2021.03.17.05.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:16:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] test-coroutine: Add rwlock downgrade test
Date: Wed, 17 Mar 2021 13:16:41 +0100
Message-Id: <20210317121641.215714-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317121641.215714-1-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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


