Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270234904E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 12:35:09 +0100 (CET)
Received: from localhost ([::1]:55590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOGa-0001Na-2L
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 07:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBT-0003Yo-0C
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lPOBR-0006ja-BQ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:29:50 -0400
Received: by mail-wr1-x433.google.com with SMTP id x16so1915006wrn.4
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oT4p1KHSGxZ7LX2qzvJOdZpm8tKTnC34BumbQ35O8mA=;
 b=E4fiqLaII1WnJHqAafQl3fLf/r7HmiF3fglACzEV9ihOd4NdgpBz6w7BdNoCAxG7Bh
 7GeeyLRpq42e7kSEVTzB8jB/qw8mNx4XfikiO2eL6O4/nT2Hv9wBGKVwjGvs+KQnvAKV
 Rdeh6Rx25rdtGnsI6jyQ8pjJ5EDFAWwz7UlQWATmu56V834eBlV4a8oS8ks+NDG+7PaG
 CQOAIcjRFJuPZbO2wmv3bP8usEKct2HkcazZ7/7HoOPbmIqw5/e1w6mYXKHTyKZOMapO
 5WjaJhXP7O+CBd3E5Us4A3jY4GNgsm0R0MpGlAr/BLk0wvBTDtlKh2xTxvq+26iSN1zh
 r3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oT4p1KHSGxZ7LX2qzvJOdZpm8tKTnC34BumbQ35O8mA=;
 b=X0siwcxF7q1yAHv42kE2mHjhhlN5eVVI0YnR5ieqJMaOiNlGKeZPboTJ2GMvdA/ypi
 /DEbCAq510e3JQL9bpp5V0ctIn70A8iTryrBRJfC6gKyl7KtAgGQk0jLXIB5sOPW3v42
 Jnj9K9X57FZsklKu6Zk4ZD69Ekhvk/b78UWzQ6m7NLEHCMvFMZKRM5nfOYw4Y4L3+iAB
 O7Va0qEgkUPrYbdz+yfmuMuNQxKl8ZiQWxrjfioWvXwMy4CbZ0y5JRyboKGoqKDY+aVi
 6K8PvCGdGpsgk0WpJATCm1w5I20iDwuY6xORW+Qay1K56ftckFM0pJQRURJ9J/ZQInvM
 MpoQ==
X-Gm-Message-State: AOAM533qBtpYY1vXjo+UR+uAgRNrFX6c4jxV0yqg4LPu1ajm1aSqEnse
 hrEaibBBSy6WbdCARZuAy8JbGp+mXr8=
X-Google-Smtp-Source: ABdhPJxhiQCLE87Xp8DZERq8ayTlil0884bxmFjnqsB9QkAUhi09WqQD1uFUfc22w4tB/DrQE/MN5Q==
X-Received: by 2002:a5d:4105:: with SMTP id l5mr8759721wrp.105.1616671788128; 
 Thu, 25 Mar 2021 04:29:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id g11sm7220118wrw.89.2021.03.25.04.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 04:29:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/6] test-coroutine: Add rwlock upgrade test
Date: Thu, 25 Mar 2021 12:29:40 +0100
Message-Id: <20210325112941.365238-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210325112941.365238-1-pbonzini@redhat.com>
References: <20210325112941.365238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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

Test that rwlock upgrade is fair, and that readers go back to sleep if
a writer is in line.

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



