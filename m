Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F83C327E80
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:43:42 +0100 (CET)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhtl-0007yN-Kk
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lGhrx-00070L-K0; Mon, 01 Mar 2021 07:41:49 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:38949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lGhrv-0002QT-Ty; Mon, 01 Mar 2021 07:41:49 -0500
Received: by mail-qt1-x830.google.com with SMTP id w6so11829494qti.6;
 Mon, 01 Mar 2021 04:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=om+nAXvnWfBxhySIZEK+AoMUXZJvwVYgs08tfetWUV8=;
 b=rF71XCgHsH3ZVPCDuY7E4KAgfjLTj51vN0Gr0PHVxQtposLAbspC8V/wcV9ssGT/u8
 5eMlPbleM8781YnbANoraDnzIdFFB267FJXbEGTdzRPB0IIK7KI5P5Xk6YfCTWjv9tgN
 9wZ8T3RNUP5A6KbCIGgVnMN/T9HusDckQktAAkgOyZtDBtueJMAXxvA4OQ6ynlJPRc6o
 JlDeCY8vuRmv2EG7uosMwWP5FajBqOmRzO4cMi9kMEhlJv3R5rfqBvVCoBNjrHaMVDQR
 Vj4Iy6W0g2yPgn02/RMa8+ptV1LoogMexAyh00xCa09B6ug/7MezVLqKaZ3QtNd1Nkz8
 IKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=om+nAXvnWfBxhySIZEK+AoMUXZJvwVYgs08tfetWUV8=;
 b=G+wmHsXvJ+atvcfmQfVw2tAuXp3O6OehtPKnmL/Q0pr784FZgoNwzvtvGTTE4pXHQl
 a6s36Ol4fLYAt4h3TaqxwUZbEYn3emUC4H9vJaVmJeD53dxXjZbG/KjY/SM4QCu38wsl
 YKnVgHmxwtJQ/ibMPBbQsyvEg1on1r5LuM5kZewrT2nPk5mWxPLK5gOsPQjTK41UmUU8
 82UINpAaAnfS0zFd/79T4c2Z3iOfR9CqUZjWSAcO1JB4TwxkGqW7nIbPdnsSfGcBFwab
 YGi198VAC4x/4tDhpak+UbSiEoui/oyE/eALlsHrlDwhj1mARi53hSDCBKxHzHCegIb0
 qcQQ==
X-Gm-Message-State: AOAM533gjn7u5qAMdfYkoN2E9Z0jaBr706qIxin14KfN0Swx9tcLwKyh
 vtoDLZgIXSyq7BR6MDRmQYypsBwzu3SrXg==
X-Google-Smtp-Source: ABdhPJw+c0QJT2YPobC4h1cewC1WX6mNCJSccYulY66MQfSmMuz1+CF05GzrG25wfz0S9B8blJ7Hhg==
X-Received: by 2002:ac8:3937:: with SMTP id s52mr13423770qtb.90.1614602506345; 
 Mon, 01 Mar 2021 04:41:46 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:cd1c:d722:e26f:4e76:c5c1])
 by smtp.gmail.com with ESMTPSA id t16sm10981755qto.58.2021.03.01.04.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 04:41:45 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] qemu_timer.c: add timer_deadline_ms() helper
Date: Mon,  1 Mar 2021 09:41:33 -0300
Message-Id: <20210301124133.23800-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301124133.23800-1-danielhb413@gmail.com>
References: <20210301124133.23800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x830.google.com
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
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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


