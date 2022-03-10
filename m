Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208754D475A
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:54:22 +0100 (CET)
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIJB-0001Dk-62
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:54:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9f-0006fm-2T; Thu, 10 Mar 2022 07:44:31 -0500
Received: from [2a00:1450:4864:20::32a] (port=50691
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9d-0005Be-DP; Thu, 10 Mar 2022 07:44:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l10so3196057wmb.0;
 Thu, 10 Mar 2022 04:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2cqgz/F/tq6WMZLaHRWJJzZQDdwgOx1eBo+ARCMxfoU=;
 b=I3UwZECtz27y88tNCRouI1XPB81OFgklj23vZdsVR7hLyVBNwIqE7386sRwBXI77Gs
 cTRzegjIyvF+KvqMIQt0dgdc/Sii3NZU05TU0xJVfjtvO8+VDPyMqTIg5z7X/y1WYGPG
 GpdYS83oUP0EpUZUxy5jv3w9NiB2BarQJW9QfrgpBYIkTLyMQhL5MN36htamNSlu7114
 JkdkJ2t+inW6YGl0ICDsTKGIlvpBkiJfPQenCLktpv/nnp2g5AS1KCbsatYvr1MucVN4
 LuWE0LSOLw9rDFy2mGJrfOOX/fGI7cx+ZHIlC0zb37tQaD7dtRFp+mpAeczfb422qR/J
 A+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2cqgz/F/tq6WMZLaHRWJJzZQDdwgOx1eBo+ARCMxfoU=;
 b=R1n5KbUHr5Uij0DOf1RFk2K3mu/qVI0RqmMjDIBkA2RONYr+ee/9whBDSaUyW8OFxQ
 CMf46qhxK/67BEVx3arBVyd3k7jWIE8XqR09faQpSnI1EYcnHxtahIQBwVAWtSd3oVi/
 aMgKTulEYBfCwjZtOn89XbGgB9gLgRQ4FwWBkJfrLtrZlb7kXyhU6Y9fm4OuqivfHOVn
 IGMC6lx+xUWfD9ChqTCkxgYK86ticDdW4P1Wf1ZdTzIOMVPUahPN4EtIYY9fNJDH4h6t
 uCZiBZF+d/S8XmTsA2U8P6s6WaKVIQ1QTgIo9xhpA02UcW+/k+NGVEerM02eLgqKBiqH
 /osA==
X-Gm-Message-State: AOAM533IWKmqnbBDiWbR67pEQZ0Zb++sEbJp9oqXv/fT//WDm9ZY3uOA
 vQ5/BSxs06/Bw4/HwodB+LRZRpfNx5M=
X-Google-Smtp-Source: ABdhPJzd7bs0Tt9fIYbswdi2WtSws8yj0kuEUNNDPFfVj6//lRmGnlq7ViIHUoOBi07BWRFB3M66ng==
X-Received: by 2002:a05:600c:2c49:b0:384:7202:358e with SMTP id
 r9-20020a05600c2c4900b003847202358emr11660574wmg.108.1646916267397; 
 Thu, 10 Mar 2022 04:44:27 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/35] convert qemu-coroutine-sleep.c to stackless coroutines
Date: Thu, 10 Mar 2022 13:43:47 +0100
Message-Id: <20220310124413.1102441-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main change is to qemu_co_sleep_ns_wakeable, which gets the full
conversion treatment.  It's important to note that variables that escape
(have their address taken), such as "QEMUTimer ts" in this case, move
entirely to the frame structure and do not have local variables anymore.
For the others, always using the frame structure would be inefficient,
so they need to be saved and restored.  Perhaps "restrict" would be
an idea too, I haven't investigated it.

qemu_co_sleep almost has a tail call to qemu_coroutine_yield(), except for
an assertion after qemu_coroutine_yield() returns.  For simplicity and
to demonstrate the optimization I'm removing the assertion.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-sleep.c | 59 ++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index b5bfb4ad18..3d0b1579b3 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -17,7 +17,6 @@
 #include "qemu/timer.h"
 #include "block/aio.h"
 
-#if 0
 static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
 void qemu_co_sleep_wake(QemuCoSleep *w)
@@ -42,7 +41,7 @@ static void co_sleep_cb(void *opaque)
     qemu_co_sleep_wake(w);
 }
 
-void coroutine_fn qemu_co_sleep(QemuCoSleep *w)
+CoroutineAction qemu_co_sleep(QemuCoSleep *w)
 {
     Coroutine *co = qemu_coroutine_self();
 
@@ -56,27 +55,59 @@ void coroutine_fn qemu_co_sleep(QemuCoSleep *w)
     }
 
     w->to_wake = co;
-    qemu_coroutine_yield();
+    return qemu_coroutine_yield();
 
     /* w->to_wake is cleared before resuming this coroutine.  */
-    assert(w->to_wake == NULL);
+    // assert(w->to_wake == NULL);
 }
 
-void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
-                                            QEMUClockType type, int64_t ns)
-{
-    AioContext *ctx = qemu_get_current_aio_context();
-    QEMUTimer ts;
+struct FRAME__qemu_co_sleep_ns_wakeable {
+	CoroutineFrame common;
+	uint32_t _step;
+        QemuCoSleep *w;
+        QEMUClockType type;
+        int64_t ns;
+	QEMUTimer ts;
+};
 
-    aio_timer_init(ctx, &ts, type, SCALE_NS, co_sleep_cb, w);
-    timer_mod(&ts, qemu_clock_get_ns(type) + ns);
+static CoroutineAction co__qemu_co_sleep_ns_wakeable(void *_frame)
+{
+    struct FRAME__qemu_co_sleep_ns_wakeable *_f = _frame;
+    AioContext *ctx = qemu_get_current_aio_context();
+
+switch(_f->_step) {
+case 0: {
+    QemuCoSleep *w = _f->w;
+    QEMUClockType type = _f->type;
+    int64_t ns = _f->ns;
+    aio_timer_init(ctx, &_f->ts, type, SCALE_NS, co_sleep_cb, w);
+    timer_mod(&_f->ts, qemu_clock_get_ns(type) + ns);
 
     /*
      * The timer will fire in the current AiOContext, so the callback
      * must happen after qemu_co_sleep yields and there is no race
      * between timer_mod and qemu_co_sleep.
      */
-    qemu_co_sleep(w);
-    timer_del(&ts);
+_f->_step = 1;
+    return qemu_co_sleep(w);
+}
+case 1:
+    timer_del(&_f->ts);
+    goto _out;
+}
+_out:
+stack_free(&_f->common);
+return COROUTINE_CONTINUE;
+}
+
+CoroutineAction qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
+                                          QEMUClockType type, int64_t ns)
+{
+    struct FRAME__qemu_co_sleep_ns_wakeable *f;
+    f = stack_alloc(co__qemu_co_sleep_ns_wakeable, sizeof(*f));
+    f->w = w;
+    f->type = type;
+    f->ns = ns;
+    f->_step = 0;
+    return co__qemu_co_sleep_ns_wakeable(f);
 }
-#endif
-- 
2.35.1



