Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2824D483F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:39:51 +0100 (CET)
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJ1C-00073J-QD
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9c-0006d1-7R; Thu, 10 Mar 2022 07:44:29 -0500
Received: from [2a00:1450:4864:20::436] (port=43711
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9a-0005Ay-FU; Thu, 10 Mar 2022 07:44:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id e24so7740069wrc.10;
 Thu, 10 Mar 2022 04:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6kzF4fk/7WGa9iQWNCNiXF89/inZenZW77T19RelLEw=;
 b=gSHudhEZYF4pyVidcb5E384sVoSaVcsA7nbT9DTiJFVJ5ohAANAli0wSBl+4pEha8W
 +K0yTkaFVkZ/YS4TrassqU+HZHZaiGT+UPrgvyL6udYfKA2awdH5qsvpVyenCMXSwUa1
 Rw1VAr3cBhd0BbggiDfm47xBg6eRRmhakX5mOTEoNT27Oxt23tfxs7e4ocH1Ruj1ojPK
 UZXxAK4xSbNNDEmrooKnLhqe6gG2dYkGEXl76rVh5BHlcAzSRAVBvzsFOLxeg8bJoiaY
 Gs2Jvkit97mr0uIs+7CycNoVM4/1z2MYa9kUXHGqXrhruEgkF1Wnm9DRp8NqwiNAO9/c
 pUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6kzF4fk/7WGa9iQWNCNiXF89/inZenZW77T19RelLEw=;
 b=r/IZhceDKHtAxKgmqKDluXHntkSUQQKqROYSf7eufNGo+LItXWowChOczKbzjl9Iou
 u7xbYP/1gX5lTpsdWBuaaB29c0Ylxzvz/MaXsK4Nk+mL2DDJSt1MjYnbC9qTUaKi+1Fg
 7PVbr6mz0SZPvAc/mCwaf8IVL4yYcYbT/oLEPoePCeQsDeRyc8rXxE9QyJs646vJucWI
 nm5JQ+E+zm8yovQigB33G7dDAfWihNKlk38ogfi6o6rdpOzTtuXYMKad8Op1w31AD6ry
 9MUGyuGY/n4mNM7n1J/txOvXJfH4DVlD8T4tz0rHuELaPLhB4j1q/pnZsh63c7ysDK4Q
 mkwg==
X-Gm-Message-State: AOAM533er8PDswsqFuhXmti4nsgqkZIVLiZcPnF+++lCS+27nSAcY4oV
 dDlvxy9KYWVnQFVX5D1h3KYhs4cqmH0=
X-Google-Smtp-Source: ABdhPJwIdltThobXnUfgESeglDJdBDt4AEcnDZt53a4jl5h5EDsimdaWh+taD1/A2KYJhQIdGqW3QQ==
X-Received: by 2002:a5d:64e5:0:b0:1fb:5b9a:1a20 with SMTP id
 g5-20020a5d64e5000000b001fb5b9a1a20mr3431851wri.34.1646916264056; 
 Thu, 10 Mar 2022 04:44:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/35] disable some code
Date: Thu, 10 Mar 2022 13:43:44 +0100
Message-Id: <20220310124413.1102441-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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

Disable a lot of code that I can't be bothered to convert right now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/meson.build      |  2 +-
 tests/unit/test-coroutine.c |  6 ++++++
 util/meson.build            | 10 +++++-----
 util/qemu-coroutine-lock.c  |  2 ++
 util/qemu-coroutine-sleep.c |  2 ++
 5 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 96b295263e..4ca5fdb699 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -61,7 +61,7 @@ endif
 
 if have_block
   tests += {
-    'test-coroutine': [testblock],
+    'test-coroutine': [],
     'test-aio': [testblock],
     'test-aio-multithread': [testblock],
     'test-throttle': [testblock],
diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 82e22db070..c230c2fa6e 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -16,6 +16,7 @@
 #include "qemu/coroutine_int.h"
 #include "qemu/lockable.h"
 
+#if 0
 /*
  * Check that qemu_in_coroutine() works
  */
@@ -638,11 +639,13 @@ static void perf_cost(void)
                    duration, ops,
                    (unsigned long)(1000000000.0 * duration / maxcycles));
 }
+#endif
 
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
+#if 0
     /* This test assumes there is a freelist and marks freed coroutine memory
      * with a sentinel value.  If there is no freelist this would legitimately
      * crash, so skip it.
@@ -650,7 +653,9 @@ int main(int argc, char **argv)
     if (CONFIG_COROUTINE_POOL) {
         g_test_add_func("/basic/no-dangling-access", test_no_dangling_access);
     }
+#endif
 
+#if 0
     g_test_add_func("/basic/lifecycle", test_lifecycle);
     g_test_add_func("/basic/yield", test_yield);
     g_test_add_func("/basic/nesting", test_nesting);
@@ -669,5 +674,6 @@ int main(int argc, char **argv)
         g_test_add_func("/perf/function-call", perf_baseline);
         g_test_add_func("/perf/cost", perf_cost);
     }
+#endif
     return g_test_run();
 }
diff --git a/util/meson.build b/util/meson.build
index f6ee74ad0c..30949cd481 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -76,13 +76,13 @@ if have_block
   util_ss.add(files('lockcnt.c'))
   util_ss.add(files('main-loop.c'))
   util_ss.add(files('nvdimm-utils.c'))
-  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
-  util_ss.add(when: 'CONFIG_LINUX', if_true: [
-    files('vhost-user-server.c'), vhost_user
-  ])
+  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c')) # 'qemu-coroutine-io.c'
+# util_ss.add(when: 'CONFIG_LINUX', if_true: [
+#   files('vhost-user-server.c'), vhost_user
+# ])
   util_ss.add(files('block-helpers.c'))
   util_ss.add(files('qemu-coroutine-sleep.c'))
-  util_ss.add(files('qemu-co-shared-resource.c'))
+# util_ss.add(files('qemu-co-shared-resource.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 3f12b53a31..d6c0565ba5 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -34,6 +34,7 @@
 #include "block/aio.h"
 #include "trace.h"
 
+#if 0
 void qemu_co_queue_init(CoQueue *queue)
 {
     QSIMPLEQ_INIT(&queue->entries);
@@ -465,3 +466,4 @@ void qemu_co_rwlock_upgrade(CoRwlock *lock)
         assert(lock->owners == -1);
     }
 }
+#endif
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 571ab521ff..b5bfb4ad18 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -17,6 +17,7 @@
 #include "qemu/timer.h"
 #include "block/aio.h"
 
+#if 0
 static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
 void qemu_co_sleep_wake(QemuCoSleep *w)
@@ -78,3 +79,4 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
     qemu_co_sleep(w);
     timer_del(&ts);
 }
+#endif
-- 
2.35.1



