Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACDF4F80CF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:39:22 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSM5-0001OU-AM
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAr-00077w-1X
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:45 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:33539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAo-0007uL-G0
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:44 -0400
Received: by mail-lf1-x136.google.com with SMTP id bu29so9723505lfb.0
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/10aFJpOBf3AAl4GLfLE1OLig8oWXVs06ng3GxyYuOk=;
 b=yxFoKi4F0PVwofhIUCxXddXPaogZ+K1B9fix3plHnLiYIKTx4DHmsiuVOIEmFOcJUI
 LxC6RH1OkfAmIEPRA/4+80lyvdt3u/CbbYkCW51WKKw2WKstgJbdwTZOVLzR5HM7YFHN
 MKr1imoBGsObma3DnN5tnOcaIoS8ee8/+Nt7Nzh6AA4WdaGL2QdG5Gufd3PyLsfTb/cJ
 YkWf2VBOJDpfBjPy7bFYsBtv2esnbcQlwSyZIRK6hdTf9Bmsrthohq94y0yI2qvTP/mB
 9jAnJIDnTtkvXfoSP3fcg6YNCFG2NMbryv2vBi0QxgCHeql2nfEM4chlgVNrfuNOv/9Z
 iL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/10aFJpOBf3AAl4GLfLE1OLig8oWXVs06ng3GxyYuOk=;
 b=GJj3bNRLSWxCOOTSH72CIEagrgDhXCaGCRPe65z+wTVxXOpRfNm9uTGPS581gPNPjE
 9n8YNpm3nlTDD4XAHq3nBJ8vefqn8myh6QB+r62Ib1jejLeKJznk1ZYpz3oYt4fhhXWC
 QdX+OzPOrIy9PJEwStHycUmUarySc6LfhYO8JgVRFBUPGSEosb+Xp06+trswoaxnWYv2
 zBgaUCXbpp5q0/AXGHJF4skQ/gNU7p5fz+lPspkR1GjxHiHPU4/LIs+26OBPuZq5kz5l
 +sIpqAQpbQCcfnEZ7b/u4nQY91bmNULGzv6iAlONT6ZjWfBWmajt8kkqAXG55p+PBrih
 FNDA==
X-Gm-Message-State: AOAM530NyU0REJjTGn5r2UN/EmfGEHRftjTeLQb4MSr2wvWdsJIfKgSW
 AsgCH/jnJOb1LDx4jL0Omf+Rzg==
X-Google-Smtp-Source: ABdhPJySJ27iUfqqURvs5WzlpIhU9CG8v7rQiWukMT4D40wDCYJNEz/eSUJo69T+qsVFLSTYy0xbgw==
X-Received: by 2002:a05:6512:400e:b0:450:e09d:c9a6 with SMTP id
 br14-20020a056512400e00b00450e09dc9a6mr10197620lfb.243.1649338060550; 
 Thu, 07 Apr 2022 06:27:40 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:40 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 4/7] util: add qemu-co-timeout
Date: Thu,  7 Apr 2022 16:27:23 +0300
Message-Id: <20220407132726.85114-5-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
References: <20220407132726.85114-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x136.google.com
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
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
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


