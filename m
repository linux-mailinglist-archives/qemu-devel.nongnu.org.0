Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32E8348FE2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:32:23 +0100 (CET)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPODu-0005OA-Sj
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBU-0003bB-Bf
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:52 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBS-0006kJ-Fi
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z2so1911604wrl.5
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smfqshe5rWL1zIyiqGH7+GywYlbeI5eZY7MNQuJ+Muk=;
 b=nsdPFx1puYrLkbwqlVtbmicHvfHWd1sIByXDPH011FLGpI7MK+FVJ0TLPnmBEbrQN6
 iyhFxrqMHXSSoT9h1pfZWLDKJsaU+FEbggFc/MsiHZDZ35yDYpj1maPbc7XuakbzGyUA
 EPAHlODCDUnp3PNZPB86/KwPnTFcBrT7h/FRgpqMcoRRi3+Px27IYTIXPXXbD0CuSZJQ
 ooxIIth9SmHk0wQfQH95EW7xIFUKO64zL0O47HC0G6enoK600S5wz5Mz/fTIXzyxdyq+
 DzwCV4CKmwYXlfkgMmwhNn1p1w2VRR7tk53tkZYa0UL4sH6qpbREySzxe/Oivtj7IeAX
 9OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=smfqshe5rWL1zIyiqGH7+GywYlbeI5eZY7MNQuJ+Muk=;
 b=e6KUXS6ZipG6cnjQUEtBPeLBcBw4+FgrxqJrTfE4iY7gUoFJyMgog2jyWqhtjrApG9
 sSoJtdY+yqVAI3BDJ7AJ5IEXEA4gRpe9N8KtOEY1D1s1ss47d+tCPs/G0tKjNiQaksJa
 f1MFTSnhuqLvaFdiFJrQIBVjVc2E15upLjehJizk+cV+Lks35nekh/1A/kW0+RWpmcEn
 xGUE7V2ZxnPe8rFcGazkcz7jg8bN63Gs3a/nufzKP2WFdAEcut5fE8Kv/bCRqEmgwPZZ
 vXhK3aJDSOK8HPez+he9koKJNsm0i3ax1EaWQ2NPxfsou1DiHRLwJ4W7tbOdR1/bU7b7
 MjSQ==
X-Gm-Message-State: AOAM531lyiTrI3Ch3xwMN8Xh/P5m57ENEsH6cgGebb4/BCRu783kLAsP
 53tCRgb6u3V5SJT3ZNfDThfyaFpj3qA=
X-Google-Smtp-Source: ABdhPJx2XB6QU3EOpOfyyMHdJhYlynrZfRIcfQZPShQG/99xGMXBOfT1KFxHgMe08Mwf2u3dhCh0UA==
X-Received: by 2002:adf:c40b:: with SMTP id v11mr8296123wrf.320.1616671789296; 
 Thu, 25 Mar 2021 04:29:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g11sm7220118wrw.89.2021.03.25.04.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:29:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/6] test-coroutine: Add rwlock downgrade test
Date: Thu, 25 Mar 2021 12:29:41 +0100
Message-Id: <20210325112941.365238-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112941.365238-1-pbonzini@redhat.com>
References: <20210325112941.365238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: david.edmondson@oracle.com, stefanha@redhat.com
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


