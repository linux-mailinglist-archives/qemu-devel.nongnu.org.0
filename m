Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12C54EEA80
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:35:34 +0200 (CEST)
Received: from localhost ([::1]:36862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDgr-0007uQ-UB
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:35:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRY-0000Hk-F6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:46 -0400
Received: from [2a00:1450:4864:20::236] (port=34686
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRV-0006tB-1k
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:43 -0400
Received: by mail-lj1-x236.google.com with SMTP id 17so3120279lji.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFVdnuw+3o5G9R5rQeBbXGWA5P0kYYacFZZwVwvOqB4=;
 b=mvBWJ30ufOsXXse3c/eA0VSPunDQWrxy8eZ8H8hANsIQpjQiEnUXwegydFIU37ukTI
 2Gk3265mgDLtNTIyAFwptOUs4AVfcHea4k4gXLm9foltiETFTYbut0ySuoruM3Sje0wv
 +8CZAA/Pjkt/59SxZOuLHm/8OzI9H3ViGuxV2xo+dDU/jAbyrxbT/zRbwMVG2YABscPo
 KRYLPAtg7SaDTKei4zdw/xBc+r08fMH57aCHVBVFp3uQso2R/9/5uRemvCRlrfl7Rmgr
 SNA/EUInxNXf7N1wHn1jq5b2wJda/krttuGLKw7RsS9/AHwRfzVZfOvonZ/eMat4Gmnw
 T2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFVdnuw+3o5G9R5rQeBbXGWA5P0kYYacFZZwVwvOqB4=;
 b=1qg0hgFwvCd+4OVZZnx1hlB5P8K7v1Rb4kikAtCjsVusjKwS0ByAfxzdHI8LggvrGY
 cID2sC+N4spQ4NPEgbva/7g27CvTS7aVVMOsJx0wUjpu1nWammN0J02tn4cKOzbq2Axn
 MTIwZzpfjpHaMLgpIZp3+k0rtaDc2/jMW7eZTnUHA/BgaQvK3+53XIqKcQOEbUgU3X4U
 CL86D7+xQPU9/fJj11LrSSzzrvx2yNcI7Bfu4ItEX8v/CC5UAYp4h0opijeafgBnZSkC
 9Ve7gkqq/uz+jyBMGGRh9EegiK1FBAV1llmBUgF+sLp5WGE0CUyMrp/p2lzwMyScj/Ky
 W8+Q==
X-Gm-Message-State: AOAM533/iUh47lQdZUPwaaAyfhB5xrK1Iw1jpipGMtb4Q0wRD8y/7Zzf
 WDsdeWNo4Y9JTmrxi8ZZGkORtA==
X-Google-Smtp-Source: ABdhPJz4sOBktV+pwqvdsj3bp1TswVB2eUCWxYpk2D4ES5if6GZ3BNIDdn3Y8+YS/y20WTZ8TuW/tg==
X-Received: by 2002:a2e:6e0d:0:b0:247:fc9c:284e with SMTP id
 j13-20020a2e6e0d000000b00247fc9c284emr13326088ljc.251.1648804776920; 
 Fri, 01 Apr 2022 02:19:36 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:36 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 4/7] util: add qemu-co-timeout
Date: Fri,  1 Apr 2022 12:19:17 +0300
Message-Id: <20220401091920.287612-5-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401091920.287612-1-vsementsov@openvz.org>
References: <20220401091920.287612-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x236.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 util/meson.build         |  1 +
 util/qemu-co-timeout.c   | 89 ++++++++++++++++++++++++++++++++++++++++
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
2.35.1


