Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5A682277
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 04:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMgt6-0004cr-GT; Mon, 30 Jan 2023 22:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMgt3-0004ci-R8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 22:00:46 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMgt1-0004VK-V0
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 22:00:45 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 144so9264563pfv.11
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 19:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N+ydyPvtqICIU4Za5Zwxgk41pHy0LdMcJdotGQvWiHA=;
 b=WpL91S7BJKVpMuI0f/VqBsCdLYX7bHakEX4DYUTLaWaB2PlJfv9+053LLaBxDp09Nf
 zJ85v3FnG1QZVEC5e87ZSDUK5EmfrEs3F3XLWmsrzAfI6jlj6Chpf9Tx4mdCY6XHtGHp
 J6HKv5X4XAF+1QXSVrEiV7Gvz18+qwgHTOqvUEKjYOKOGmA5+C6220Oi+0oZkpKaNzHD
 qV+oeoe57HmjRTKGJCzt7O1aQtUfaCOTpY4YObMdSeYPdDRO7pQdBlj6O6z42fgqv4UO
 TnI47mctA6NpEVM0ToIp7gmE+FXfifrsdwv1ijN4Nfyo3IHIsTaFXpUfxzN5ROI2A9Nq
 g6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N+ydyPvtqICIU4Za5Zwxgk41pHy0LdMcJdotGQvWiHA=;
 b=gdMwzvy6xOUI65ycgAgSYcrTWRYbbg5YJ2JaFp4o9fKeoT9fqP4/JVbl7tCBUZwf9G
 7P62kGll490rbkZ2KhUQAQGEZMSJSkarrx7JgWckGx486C4198pZEcqcvlKVQK9xwSAp
 enMdXwC4opKyLZmctLNLWWPpkQ3XSACM/Dbke2EUYafwr3BvBFNvZfFpKQIbnvAsBAQI
 1J3ZfHI5S/RXGbNxquuw6JHHlpPuQZIFzaVcGKQWSmVreTcZxfW0wRF7TFw/TfoG68gA
 osc8Rrct+lGEgk8h80qdaQQP+X4vMPwgpdQv1K23gtqKWCZXGO9Pm5yC96DdIM66eA1N
 meog==
X-Gm-Message-State: AO0yUKW+2VnGKVBql4DXJwrUObiDkKqFjs52DBOjiG5+sLYQZf+s4eDV
 MkEaqW9Z4cC/tkeRQsAb+jNXvjoXLqu58/DD
X-Google-Smtp-Source: AK7set8bp5jDvJCucthtwmKSt91S5YWPVlwVRDo2ypvEH5WzgcNseXsGXegcSzuLkfszDY1Pdr7C/Q==
X-Received: by 2002:a05:6a00:2289:b0:592:fc9f:8ae5 with SMTP id
 f9-20020a056a00228900b00592fc9f8ae5mr13669504pfe.23.1675134042300; 
 Mon, 30 Jan 2023 19:00:42 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a056a00229200b0058bca264253sm8139259pfe.126.2023.01.30.19.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 19:00:41 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2] hw/timer/hpet: Fix expiration time overflow
Date: Tue, 31 Jan 2023 12:00:37 +0900
Message-Id: <20230131030037.18856-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42c.google.com
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
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
V1 -> V2: Renamed arm() to hpet_arm()

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
2.39.1


