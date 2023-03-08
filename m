Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC16B0F8B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:00:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx8b-0004sS-4n; Wed, 08 Mar 2023 11:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8S-0004iN-I4; Wed, 08 Mar 2023 11:59:28 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx8M-00047g-3m; Wed, 08 Mar 2023 11:59:28 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 146F8400E8;
 Wed,  8 Mar 2023 19:58:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id DA5F513A;
 Wed,  8 Mar 2023 19:58:55 +0300 (MSK)
Received: (nullmailer pid 2098371 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 38/47] hw/timer/hpet: Fix expiration time overflow
Date: Wed,  8 Mar 2023 19:57:41 +0300
Message-Id: <20230308165815.2098148-38-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The expiration time provided for timer_mod() can overflow if a
ridiculously large value is set to the comparator register. The
resulting value can represent a past time after rounded, forcing the
timer to fire immediately. If the timer is configured as periodic, it
will rearm the timer again, and form an endless loop.

Check if the expiration value will overflow, and if it will, stop the
timer instead of rearming the timer with the overflowed time.

This bug was found by Alexander Bulekov when fuzzing igb, a new
network device emulation:
https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/

The fixed test case is:
fuzz/crash_2d7036941dcda1ad4380bb8a9174ed0c949bcefd

Fixes: 16b29ae180 ("Add HPET emulation to qemu (Beth Kon)")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20230131030037.18856-1-akihiko.odaki@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 37d2bcbc2a4e9c2e9061bec72a32c7e49b9f81ec)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/hpet.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 9520471be2..5f88ffdef8 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -352,6 +352,16 @@ static const VMStateDescription vmstate_hpet = {
     }
 };
 
+static void hpet_arm(HPETTimer *t, uint64_t ticks)
+{
+    if (ticks < ns_to_ticks(INT64_MAX / 2)) {
+        timer_mod(t->qemu_timer,
+                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ticks_to_ns(ticks));
+    } else {
+        timer_del(t->qemu_timer);
+    }
+}
+
 /*
  * timer expiration callback
  */
@@ -374,13 +384,11 @@ static void hpet_timer(void *opaque)
             }
         }
         diff = hpet_calculate_diff(t, cur_tick);
-        timer_mod(t->qemu_timer,
-                       qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (int64_t)ticks_to_ns(diff));
+        hpet_arm(t, diff);
     } else if (t->config & HPET_TN_32BIT && !timer_is_periodic(t)) {
         if (t->wrap_flag) {
             diff = hpet_calculate_diff(t, cur_tick);
-            timer_mod(t->qemu_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                           (int64_t)ticks_to_ns(diff));
+            hpet_arm(t, diff);
             t->wrap_flag = 0;
         }
     }
@@ -407,8 +415,7 @@ static void hpet_set_timer(HPETTimer *t)
             t->wrap_flag = 1;
         }
     }
-    timer_mod(t->qemu_timer,
-                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (int64_t)ticks_to_ns(diff));
+    hpet_arm(t, diff);
 }
 
 static void hpet_del_timer(HPETTimer *t)
-- 
2.30.2


