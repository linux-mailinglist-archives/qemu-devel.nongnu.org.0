Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF534F68B2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:18:55 +0200 (CEST)
Received: from localhost ([::1]:51754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncAF4-0006T4-NP
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5E-0000OO-9s
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:44 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA59-0001xx-4N
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:41 -0400
Received: by mail-lf1-x129.google.com with SMTP id b17so5516664lfv.3
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JktyRDyKx1CdohBSccgJOravxS4i1xbSxr6wTMl/cIk=;
 b=3TXu900dv2m7ANUsbfJ65mI2CPetxpCI2jmI1yyK/dB2F2detB/dwYDXOF4XqzSVNo
 BOkUGvZlnwzE6b4Nffgar6AKmXDPEbJ0dIz0TGVd66Vw/bGbz8jLe06P3IlbdeFCyqWL
 BvUbL/VyPQsUfrxSM5mhXH1nBnWZ0r0e5OfFGHVz6pgtgWaibwjGE1Tm3TVS/wsbiZVN
 jh/dF323XnwZkQBU2TD5XzYJixsRKAaDE5Gm7a+IaZrzRkj6D+4ysjQDR950gZe2ZtDH
 v3cnGNGeg6fRaEmPLv42GoScA9mswYlyK8B0VN7ls5esLKQiks2uXejXR9jWVGtAsR3E
 f3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JktyRDyKx1CdohBSccgJOravxS4i1xbSxr6wTMl/cIk=;
 b=jS/MB4837ndsOCrVfyq26iYQIYOayn3JUD6CFk67SwBvH6hw04cKBB/yYOEeA18YUF
 N9/7eTRpHKhLuj4SMFvkZFvYLwLjF1lm9JtuHYLPHJ065AxIf3r7ttuXScwaHVStC+zR
 J0JpSsYllCHGGBBCQpTCIqw+dLPzqX3YfyXUlspYixiwAZPqM9hZUfLy+F+EhakmLor+
 zX7XA6kQGcDQQuBHv1aip20dSwXCrPmBKD0KtQp1aLCT4wqljiGMqN9jae9jn+GzjqkY
 LPWvHKbdNKRH0D6EeBu9JAJpdO2AYxIIsqLsJfbqWcRrbpKvnM/eK/T60SLzIa/j1kij
 h90Q==
X-Gm-Message-State: AOAM531urF6mJkV1fv6fc811XzBdhw6bPD4SXLClfokyiRv7xLBytv4+
 XNkC8w7cuSM1Q40dR6i9/dESRg==
X-Google-Smtp-Source: ABdhPJynA8MHZlu8VvPdyMIne0Wsic3oL/OEHehDlzjLSOUIVu+cBvzsi3rI7S+tYXazVLTmLamT1w==
X-Received: by 2002:a05:6512:3184:b0:44a:78f2:500b with SMTP id
 i4-20020a056512318400b0044a78f2500bmr6609754lfe.434.1649268517448; 
 Wed, 06 Apr 2022 11:08:37 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:37 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 4/7] util: add qemu-co-timeout
Date: Wed,  6 Apr 2022 21:07:58 +0300
Message-Id: <20220406180801.374844-5-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406180801.374844-1-vsementsov@openvz.org>
References: <20220406180801.374844-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new API, to make a time limited call of the coroutine.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 include/qemu/coroutine.h | 13 ++++++
 util/qemu-co-timeout.c   | 89 ++++++++++++++++++++++++++++++++++++++++
 util/meson.build         |  1 +
 3 files changed, 103 insertions(+)
 create mode 100644 util/qemu-co-timeout.c

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c828a95ee0..8704b05da8 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -316,6 +316,19 @@ static inline void coroutine_fn qemu_co_sleep_ns(QEMUClockType type, int64_t ns)
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
diff --git a/util/meson.build b/util/meson.build
index f6ee74ad0c..249891db72 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -83,6 +83,7 @@ if have_block
   util_ss.add(files('block-helpers.c'))
   util_ss.add(files('qemu-coroutine-sleep.c'))
   util_ss.add(files('qemu-co-shared-resource.c'))
+  util_ss.add(files('qemu-co-timeout.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
-- 
2.35.1


