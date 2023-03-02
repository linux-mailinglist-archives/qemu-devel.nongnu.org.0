Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25256A7C8C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:26:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFy-0003Vw-AX; Thu, 02 Mar 2023 03:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFh-0002Ql-Pj
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFf-0002ED-Vp
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GleSwhwfl4eNCQkaTj5UeA1Cyi3863D6aHKVVtWLf3c=;
 b=Om/6kTzH3pch1ppmzvIaHQFV4WCCxN2ONn9pGv7ZZFz0e2JXg4BGBBOhkt3OXgAGMrmdxV
 /ZB9t0I2PncSqN/zilk0mN7hQFQmI/AgLNPI+otOq7KSxJaS2oPnvAxwzSTxPkVJF/dKd/
 T8EcvEMPGvsEO6fjsYvHS61qsrps9/g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-rQ5obEAuPpe2uL9y71pbTQ-1; Thu, 02 Mar 2023 03:25:22 -0500
X-MC-Unique: rQ5obEAuPpe2uL9y71pbTQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so949389wms.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745520;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GleSwhwfl4eNCQkaTj5UeA1Cyi3863D6aHKVVtWLf3c=;
 b=fH0b5J9b4ThYbodwCzCkawJqFAYrCh57HGnPNIQGnVzGE9yhTvqIjb+tEDCVsElU8Q
 ZenADmKWGSjcdPzLzhcDhAJruWBvg9lt8c/5zwnv2ZvWWKK7Je1iLBrjJbAtAqvPuNfT
 sgcml7+4fFBRT7ZKMLAMxHd7ENXG6f1l7aNUIkGWLDPC9SNZnjuxMADqjaLHA6quib74
 u31WsjU2c8H6lsBAk2qcFTVQkw6aWTJGwQIR2YJHec6ng54Q7BdPdzshyUmM3DnGnlDh
 v6ERQ6wAIWG6wHnHOnSN+AQ7hldEwOtCTD6K3D6p4t90pNBbaKNLJWJ/7HNMcAXc8mSR
 luNg==
X-Gm-Message-State: AO0yUKUGUVjgjBkSOumEhU1FExbRSmeR3A5uZjTc6CdDGbGS5bMUyi7a
 JDAxGpVZkMZR6N3eg5xOTAy/TdCMmq8RW1umF9Fqgr4RqnBNCnEkwLTVrXR+XPZxIMPu9qVbGV9
 lCbCyEzyJuOcHPHx4W2KRWpoTOgrQglFhOETWsQhj1xrjxrXqf7SHQIgoPWmqfyaTPg==
X-Received: by 2002:a05:600c:3acd:b0:3e2:a8e:ba4a with SMTP id
 d13-20020a05600c3acd00b003e20a8eba4amr7681202wms.21.1677745520498; 
 Thu, 02 Mar 2023 00:25:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+5GnAQB7E9DY0dG2myRTVotusVI5XWAbLh26EQqNLwCUco/0PHkeUxWt49j+iZJ4O93Kmr0w==
X-Received: by 2002:a05:600c:3acd:b0:3e2:a8e:ba4a with SMTP id
 d13-20020a05600c3acd00b003e20a8eba4amr7681190wms.21.1677745520287; 
 Thu, 02 Mar 2023 00:25:20 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003e9ae2a8cbfsm2403868wmo.2.2023.03.02.00.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:19 -0800 (PST)
Date: Thu, 2 Mar 2023 03:25:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 15/53] hw/timer/hpet: Fix expiration time overflow
Message-ID: <20230302082343.560446-16-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 hw/timer/hpet.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 214d6a0501..6998094233 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -353,6 +353,16 @@ static const VMStateDescription vmstate_hpet = {
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
@@ -375,13 +385,11 @@ static void hpet_timer(void *opaque)
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
@@ -408,8 +416,7 @@ static void hpet_set_timer(HPETTimer *t)
             t->wrap_flag = 1;
         }
     }
-    timer_mod(t->qemu_timer,
-                   qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + (int64_t)ticks_to_ns(diff));
+    hpet_arm(t, diff);
 }
 
 static void hpet_del_timer(HPETTimer *t)
-- 
MST


