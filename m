Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D27D2DA192
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:33:02 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouWi-0006Zj-Bf
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouUk-0004zZ-6O
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:30:58 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouUh-0007bZ-PM
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:30:57 -0500
Received: by mail-wm1-x342.google.com with SMTP id 3so16452670wmg.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=US17KcrCZrCDcmXNzTrOgqCNbxPx2k2oPM2wuq/RKmQ=;
 b=NPW5agFH2r8On1y6ie5r097PUpVRChV/RRzG4OSTLTqY7nJgm05gVxXLDvnoXTXnxV
 yGc5+Ia+59ZftaKdcPKuCHnqa7ZJhgysmEycSSu1/m/a8Tjoj5UDYi7zT/PoRNGddN1+
 wYG4MiiheLSV47jKrS0SwXGsvVmd/t6aWCb6uwvB+1QMywBAiM1EglG1Yk9dclLwvSe+
 RYT49yVIMISwbRxEj7OuGVTayKxLSQjpAMzYpa48O8zt1QkxhEzPVKhE9M0qoDs2/qXh
 aDtOTyiQOChOJb3cPM0jhi78P6WWDdjcQK2J+8L1er59+5lAV3IWaT2JHiZxVmQoXG8/
 +S9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=US17KcrCZrCDcmXNzTrOgqCNbxPx2k2oPM2wuq/RKmQ=;
 b=s18oHQGi+eRUeilLLjr21WJSHBturZmBtIiaUuowlQCZmvoOH3xnSFIaQsD/lq6PSc
 /t88p8JayE3ClXOEkdIREyNNbBjYXrg9PC9fPcYRlZ23kklDxKg8k3K6BmjhZtQR3zNc
 tfG2NRfCSCLS0Q6AURDJRPqEln868tG1H8OScvJmZTuLGeEgcJZYkP9/RQmDTpR6yITF
 fiN91dmPu8KrROACILRSItKidQ9c8xa9x3fQs0xBz5/67gUHhEm/dCvhHIOdgQGEEd1o
 NWz4YpcryEI2DgMWoaNBlCdhX0h9NZTyGh4p3Y3M7/8zfBLOyag8N4AwRX08uMr2MFak
 bXGw==
X-Gm-Message-State: AOAM533lcZegSLb02zrnOjka+zkScGcR1MvqI61kM0grz+S/R7nvVbS0
 H9TQvOteQK0r+lMjZfPB9O4le4a27QOoZQ==
X-Google-Smtp-Source: ABdhPJxqc0HwriB79UQr+MkP9yuFpt//B3rSea9Rmn9tPh/6gArKEt/LirRUTJLhuSwkPOfJYBl6Dw==
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr30057077wmf.46.1607977853701; 
 Mon, 14 Dec 2020 12:30:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b7sm34273589wrv.47.2020.12.14.12.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 12:30:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] util/qemu-timer: Make timer_free() imply timer_del()
Date: Mon, 14 Dec 2020 20:30:48 +0000
Message-Id: <20201214203050.6993-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214203050.6993-1-peter.maydell@linaro.org>
References: <20201214203050.6993-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently timer_free() is a simple wrapper for g_free().  This means
that the timer being freed must not be currently active, as otherwise
QEMU might crash later when the active list is processed and still
has a pointer to freed memory on it.  As a result almost all calls to
timer_free() are preceded by a timer_del() call, as can be seen in
the output of
  git grep -B1 '\<timer_free\>'

This is unfortunate API design as it makes it easy to accidentally
misuse (by forgetting the timer_del()), and the correct use is
annoyingly verbose.

Make timer_free() imply a timer_del().  We use the same check as
timer_deinit() ("ts->expire_time == -1") to determine whether the
timer is already deleted (although this is only saving the effort of
re-iterating through the active list, as timer_del() on an
already-deactivated timer is safe).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/timer.h | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index bdecc5b41fe..1789a600525 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -609,17 +609,6 @@ static inline QEMUTimer *timer_new_ms(QEMUClockType type, QEMUTimerCB *cb,
  */
 void timer_deinit(QEMUTimer *ts);
 
-/**
- * timer_free:
- * @ts: the timer
- *
- * Free a timer (it must not be on the active list)
- */
-static inline void timer_free(QEMUTimer *ts)
-{
-    g_free(ts);
-}
-
 /**
  * timer_del:
  * @ts: the timer
@@ -631,6 +620,22 @@ static inline void timer_free(QEMUTimer *ts)
  */
 void timer_del(QEMUTimer *ts);
 
+/**
+ * timer_free:
+ * @ts: the timer
+ *
+ * Free a timer. This will call timer_del() for you to remove
+ * the timer from the active list if it was still active.
+ */
+static inline void timer_free(QEMUTimer *ts)
+{
+
+    if (ts->expire_time != -1) {
+        timer_del(ts);
+    }
+    g_free(ts);
+}
+
 /**
  * timer_mod_ns:
  * @ts: the timer
-- 
2.20.1


