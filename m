Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8816680F63
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:52:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUYd-0000Hb-Mn; Mon, 30 Jan 2023 08:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUY1-00076u-GE
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:50:22 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUXz-0004AN-Tf
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:50:13 -0500
Received: by mail-pf1-x434.google.com with SMTP id z1so4714466pfg.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8lSdKmjnPpiAUKPyHbaNznuppAxzmUonsIDeJy+VesA=;
 b=ZsGyE9VL3onW3gqxmpZ46d+mhHxLasOhLVPp2Rujjsks/7h1vg1CqiT4xGJ4mFQGdh
 lUZvtUct6PCTEN9TZPCkPKW+rWn4IBvqHEUbzWMlPBlyWtZyqFptXYVkID5YVH/YuZiB
 HDoWrJXZkX45zZnpcIdKIF2HT+JbcvYwI7Qrox3IXuxTwFuGpQQjHcJy47asHQ7MwYVI
 kG1YKmxkQzeyO1jYVYGM/isyE+5XipGaghQZUDMlCTDOaWNv+KIn18tbST+EcnyL0j/t
 68CD+kI035bONMI+8afSnXuRDFAqRTPaSHZTZNc/LHCSZpmIhl77dhX9KXzD920yCrfQ
 y72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8lSdKmjnPpiAUKPyHbaNznuppAxzmUonsIDeJy+VesA=;
 b=YryIJ7auw33qsS2e1tdXoyLhvVHT6wbPRnTqiw1XVDrP7Jgmn90bDiWoxHC4/4mliN
 uChOXkSYsVKcTvaH9//ynabEWy7xzwAS8Ut08MwM5CNrdOIlP3YJTG6l0HXz3klmt07M
 fNh9a8/2bRCcN3txT1mvM6DCvaIqiZwo+j33FStEeYXk+AeC/sWBVvIM0+ZjfewBeige
 z+y0AXpUpUT6f4kn0HF/Rv4+Tj4K3aOt32kOGbi3KCdZ4dqtrxpE7gqgV0ryGVv+Qs1O
 lLWLB0Jyh8+dWo8Knhym0zHx+a81eVNuKBE5vXVhgbPJb9vqB3AczIp2NnlqTdDGQmgz
 IwQw==
X-Gm-Message-State: AO0yUKWHByBwf8876F/QLlwIEv4IpDrkWFtCnM1cPDBPN6z9gwBTEYEx
 X/NEY0ix6/r6zZyHVzWEvRsXjrbr9rqz6X6L
X-Google-Smtp-Source: AK7set+HE9runvmpf4Iga/goZEqPNWg0yJ704RAalLwfvSd1imDF0dD1JMLpIuGpL2k1UaN1eSeCmg==
X-Received: by 2002:a62:5484:0:b0:593:bc80:2d2d with SMTP id
 i126-20020a625484000000b00593bc802d2dmr4279403pfb.17.1675086610470; 
 Mon, 30 Jan 2023 05:50:10 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 n16-20020aa79850000000b005818d429d98sm7450216pfq.136.2023.01.30.05.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:50:10 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] hw/timer/hpet: Fix expiration time overflow
Date: Mon, 30 Jan 2023 22:50:01 +0900
Message-Id: <20230130135001.76841-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
---
 hw/timer/hpet.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 9520471be2..3657d5f463 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -352,6 +352,16 @@ static const VMStateDescription vmstate_hpet = {
     }
 };
 
+static void arm(HPETTimer *t, uint64_t ticks)
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
+        arm(t, diff);
     } else if (t->config & HPET_TN_32BIT && !timer_is_periodic(t)) {
         if (t->wrap_flag) {
             diff = hpet_calculate_diff(t, cur_tick);
-            timer_mod(t->qemu_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                           (int64_t)ticks_to_ns(diff));
+            arm(t, diff);
             t->wrap_flag = 0;
         }
     }
@@ -407,8 +415,7 @@ static void hpet_set_timer(HPETTimer *t)
             t->wrap_flag = 1;
         }
     }
-    timer_mod(t->qemu_timer,
-                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (int64_t)ticks_to_ns(diff));
+    arm(t, diff);
 }
 
 static void hpet_del_timer(HPETTimer *t)
-- 
2.39.1


