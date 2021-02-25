Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B313258A7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:30:22 +0100 (CET)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFODF-0002AP-3M
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFOCQ-0001jm-PB; Thu, 25 Feb 2021 16:29:30 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:41940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lFOCO-0006sI-7Z; Thu, 25 Feb 2021 16:29:30 -0500
Received: by mail-qk1-x736.google.com with SMTP id q85so7145232qke.8;
 Thu, 25 Feb 2021 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0KaLrDqmhnOxiPrRMamkEcy719Uyr/75+GZ2G0ez52E=;
 b=A7REgEz4zDb8R58L3xKlQmFB6iV/yOd3zINC6aiRT2a9y6rhnZ+BOYpkIFEgL6kSfH
 b92JrkHcO0MrRaWXFufyCdzrqdB8WIp29LNYJA1bS/3eS9d9vGRkw6FqrUETDlZ3Nx44
 O/16HTb3j649RULlg604abyoV3ICyJVVT5tK/2K9+tBc90HWfa0ECMaArRtOYRfrYnAj
 DOsUZlsAzxrgf/4l4tgnd4nhRO46uGDFGlnuqocVPHRDvk+gx3kYK/fJDTTQH8lemd47
 2lx/+3VJugJCP88qGbedyy9aFqQiNLTomMGOFuMJC9whDFUjzqx4TNdzFsE7du+Ez0pb
 rWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0KaLrDqmhnOxiPrRMamkEcy719Uyr/75+GZ2G0ez52E=;
 b=PLEnclmsBEDR/o/KHLhkW/c+B+p1c3RoPXYNyy4VvNc8gh6bAXWPVm8b6dxDnCKaUR
 qP5uWmVmONJ1C7RTamhcg/ZdrxNocMFDMfDeAgZ/ncdTDFVO6c2DQltX0R7UlEFCBcYX
 u4ekM/NvdtodZzZ28xnTTS9kYiCnlg6Aid28UpXyNb9BIibyw/aj7WB1MNMVsuR1kJfX
 eNScN7767/mTjWxgXruSMHxQYjnktVsZGqjApwBg6XHKlgT2sJNbij3qHlKE3svG+77I
 EN+AQRTBc2iBT/D+6vDHzDvT4Vomokjfuj8o8E/mxCDTMruWMXLIG/IRjw7/q7Fvz/nG
 pbLw==
X-Gm-Message-State: AOAM530k+Y1zt64IcuXUcLQngWkqWP+irdI9+GRNokauS+ht9sWo4slI
 KMlJ4hd9JuUlolhOWz8JqF3rX4XIk01LLQ==
X-Google-Smtp-Source: ABdhPJylF3YIrTbo3P+Lown62V6TwkLGUzrdYeTPsyUkKL/osLB7VKqPrp9hitpmIu7cHj/aqb9Fhg==
X-Received: by 2002:a37:af83:: with SMTP id y125mr4648690qke.210.1614288566723; 
 Thu, 25 Feb 2021 13:29:26 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id b9sm4673004qkj.90.2021.02.25.13.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 13:29:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] qemu_timer.c: add timer_deadline_ms() helper
Date: Thu, 25 Feb 2021 18:29:14 -0300
Message-Id: <20210225212914.366462-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pSeries machine is using QEMUTimer internals to return the timeout
in seconds for a timer object, in hw/ppc/spapr.c, function
spapr_drc_unplug_timeout_remaining_sec().

Create a helper in qemu-timer.c to retrieve the deadline for a QEMUTimer
object, in ms, to avoid exposing timer internals to the PPC code.

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---

This patch is applicable on top of David's ppc-for-6.0.

 hw/ppc/spapr_drc.c   |  5 ++---
 include/qemu/timer.h |  8 ++++++++
 util/qemu-timer.c    | 13 +++++++++++++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8c4997d795..98b626acf9 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -421,9 +421,8 @@ void spapr_drc_unplug_request(SpaprDrc *drc)
 
 int spapr_drc_unplug_timeout_remaining_sec(SpaprDrc *drc)
 {
-    if (drc->unplug_requested && timer_pending(drc->unplug_timeout_timer)) {
-        return (qemu_timeout_ns_to_ms(drc->unplug_timeout_timer->expire_time) -
-                qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL)) / 1000;
+    if (drc->unplug_requested) {
+        return timer_deadline_ms(drc->unplug_timeout_timer) / 1000;
     }
 
     return 0;
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 1678238384..5e76e3f8c2 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -795,6 +795,14 @@ static inline int64_t get_max_clock_jump(void)
     return 60 * NANOSECONDS_PER_SECOND;
 }
 
+/**
+ * timer_deadline_ms:
+ *
+ * Returns the remaining miliseconds for @timer to expire, or zero
+ * if the timer is no longer pending.
+ */
+int64_t timer_deadline_ms(QEMUTimer *timer);
+
 /*
  * Low level clock functions
  */
diff --git a/util/qemu-timer.c b/util/qemu-timer.c
index 81c28af517..3a03a63daa 100644
--- a/util/qemu-timer.c
+++ b/util/qemu-timer.c
@@ -243,6 +243,19 @@ int64_t timerlist_deadline_ns(QEMUTimerList *timer_list)
     return delta;
 }
 
+/*
+ * Returns the time remaining for the deadline, in ms.
+ */
+int64_t timer_deadline_ms(QEMUTimer *timer)
+{
+    if (timer_pending(timer)) {
+        return qemu_timeout_ns_to_ms(timer->expire_time) -
+               qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    }
+
+    return 0;
+}
+
 /* Calculate the soonest deadline across all timerlists attached
  * to the clock. This is used for the icount timeout so we
  * ignore whether or not the clock should be used in deadline
-- 
2.29.2


