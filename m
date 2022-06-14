Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C100054AE93
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:40:33 +0200 (CEST)
Received: from localhost ([::1]:37498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o13yK-0002Fn-Re
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nv-0001J8-BW; Tue, 14 Jun 2022 06:29:47 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:57622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nj-0000kZ-Jv; Tue, 14 Jun 2022 06:29:46 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 71EE52E1B3B;
 Tue, 14 Jun 2022 13:29:23 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 DCh4GdX575-TMKCZls1; Tue, 14 Jun 2022 13:29:23 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202563; bh=mGGdCmEAhQQB++A8rPpCt9oQTAppyi+bJY7uxZdtrdY=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=MtuHPMoI+KEKW10oJu+8La+S77DqR2Av1bHtQh6+yujrlkAb+0NWcSr6eK2xUJhAQ
 R2UKHB0HFFiT7qQOBceT7tgVwsMDA7C+LI0nxMClBWDFCJ9fVU9pZOUHenoW7VGugQ
 +iGZN5XuL1QhBX9byc5a3cjmqWzm0v1NJsJO7NGM=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TMMm67lh; Tue, 14 Jun 2022 13:29:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL 04/10] util: add qemu-co-timeout
Date: Tue, 14 Jun 2022 13:29:04 +0300
Message-Id: <20220614102910.1431380-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

Add new API, to make a time limited call of the coroutine.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/qemu/coroutine.h | 13 ++++++
 util/meson.build         |  1 +
 util/qemu-co-timeout.c   | 89 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
 create mode 100644 util/qemu-co-timeout.c

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index d1548d5b11..08c5bb3c76 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -331,6 +331,19 @@ static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
     qemu_co_sleep_ns_wakeable(&w, type, ns);
 }
 
+typedef void CleanupFunc(void *opaque);
+/**
+ * Run entry in a coroutine and start timer. Wait for entry to finish or for
+ * timer to elapse, what happen first. If entry finished, return 0, if timer
+ * elapsed earlier, return -ETIMEDOUT.
+ *
+ * Be careful, entry execution is not canceled, user should handle it somehow.
+ * If @clean is provided, it's called after coroutine finish if timeout
+ * happened.
+ */
+int coroutine_fn qemu_co_timeout(CoroutineEntry *entry, void *opaque,
+                                 uint64_t timeout_ns, CleanupFunc clean);
+
 /**
  * Wake a coroutine if it is sleeping in qemu_co_sleep_ns. The timer will be
  * deleted. @sleep_state must be the variable whose address was given to
diff --git a/util/meson.build b/util/meson.build
index 8f16018cd4..9abd2f5bcc 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -85,6 +85,7 @@ if have_block
   util_ss.add(files('block-helpers.c'))
   util_ss.add(files('qemu-coroutine-sleep.c'))
   util_ss.add(files('qemu-co-shared-resource.c'))
+  util_ss.add(files('qemu-co-timeout.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
diff --git a/util/qemu-co-timeout.c b/util/qemu-co-timeout.c
new file mode 100644
index 0000000000..00cd335649
--- /dev/null
+++ b/util/qemu-co-timeout.c
@@ -0,0 +1,89 @@
+/*
+ * Helper functionality for distributing a fixed total amount of
+ * an abstract resource among multiple coroutines.
+ *
+ * Copyright (c) 2022 Virtuozzo International GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/coroutine.h"
+#include "block/aio.h"
+
+typedef struct QemuCoTimeoutState {
+    CoroutineEntry *entry;
+    void *opaque;
+    QemuCoSleep sleep_state;
+    bool marker;
+    CleanupFunc *clean;
+} QemuCoTimeoutState;
+
+static void coroutine_fn qemu_co_timeout_entry(void *opaque)
+{
+    QemuCoTimeoutState *s = opaque;
+
+    s->entry(s->opaque);
+
+    if (s->marker) {
+        assert(!s->sleep_state.to_wake);
+        /* .marker set by qemu_co_timeout, it have been failed */
+        if (s->clean) {
+            s->clean(s->opaque);
+        }
+        g_free(s);
+    } else {
+        s->marker = true;
+        qemu_co_sleep_wake(&s->sleep_state);
+    }
+}
+
+int coroutine_fn qemu_co_timeout(CoroutineEntry *entry, void *opaque,
+                                 uint64_t timeout_ns, CleanupFunc clean)
+{
+    QemuCoTimeoutState *s;
+    Coroutine *co;
+
+    if (timeout_ns == 0) {
+        entry(opaque);
+        return 0;
+    }
+
+    s = g_new(QemuCoTimeoutState, 1);
+    *s = (QemuCoTimeoutState) {
+        .entry = entry,
+        .opaque = opaque,
+        .clean = clean
+    };
+
+    co = qemu_coroutine_create(qemu_co_timeout_entry, s);
+
+    aio_co_enter(qemu_get_current_aio_context(), co);
+    qemu_co_sleep_ns_wakeable(&s->sleep_state, QEMU_CLOCK_REALTIME, timeout_ns);
+
+    if (s->marker) {
+        /* .marker set by qemu_co_timeout_entry, success */
+        g_free(s);
+        return 0;
+    }
+
+    /* Don't free s, as we can't cancel qemu_co_timeout_entry execution */
+    s->marker = true;
+    return -ETIMEDOUT;
+}
-- 
2.25.1


