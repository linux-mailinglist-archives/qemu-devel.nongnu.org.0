Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E1333459
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:24:27 +0100 (CET)
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqOY-0007wi-JQ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAy-0003bY-Lu; Tue, 09 Mar 2021 23:10:24 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36357 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAw-0004F4-Rx; Tue, 09 Mar 2021 23:10:24 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWf244Qz9sXk; Wed, 10 Mar 2021 15:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349406;
 bh=FAmvpoIycEat6ZCPtDntwu118saVz3Q8BNqsP/GslpA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FEdDTNo6G2c90I/+T0i9+RhnwUP9wRa91GV2G8Vcmsxc+NxkLsPigkbMHBjJxeWuK
 R1L2+JLeHpTYCufn/qDJPG1RfzQJqKT9h3MX4IivWlXHX+0bDDcDxle6Ad72oKk2Lv
 61HWnPuT0zI4Ta12qvorC0qwzBPgMHfDfdRYv4U0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 17/20] qemu_timer.c: add timer_deadline_ms() helper
Date: Wed, 10 Mar 2021 15:09:59 +1100
Message-Id: <20210310041002.333813-18-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The pSeries machine is using QEMUTimer internals to return the timeout
in seconds for a timer object, in hw/ppc/spapr.c, function
spapr_drc_unplug_timeout_remaining_sec().

Create a helper in qemu-timer.c to retrieve the deadline for a QEMUTimer
object, in ms, to avoid exposing timer internals to the PPC code.

CC: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210301124133.23800-2-danielhb413@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
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
index 81c28af517..02424bc1b6 100644
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
+               qemu_clock_get_ms(timer->timer_list->clock->type);
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


