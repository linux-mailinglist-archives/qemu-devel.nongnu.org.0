Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F99F2EF507
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:43:29 +0100 (CET)
Received: from localhost ([::1]:44514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtvE-0004OF-EN
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtof-0004qF-Iv
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:41 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtod-0002uC-0q
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:41 -0500
Received: by mail-wr1-x432.google.com with SMTP id w5so9381589wrm.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=k/yTTW3gJMy8kmNQdvCvlmrK8ZnSXl30930dPL2g97c=;
 b=fTBlzZ6AUXKbhJhYj6DM8p2sA0eXcpFyq7LRt3YbWzivJ75miO1PPGWUpO9eiRSkM7
 LrPe5SnvRzd5rKpHSfEBhOmkbaqyoJE8+oUr0XGHxkzoDk1r3oRqa9sFrXXZ56cSgS5S
 YEIs03MMmKr7rZs2q0xVu8bOXnKV8SXh27YKznMIXeUk7JjHFffH4INVA9jpF0U3f7cu
 +8wfoxEuRQPt4B42bOedUDyhm7kZsRpUkT2dujAswitlGxa9S0kUkn+AroKL0M57Cmr1
 WU2gE6A7ON1U3ff4IBX7uGO4FKGdeRJxlbq3wbUmtiTylA11Uo4GUSd86NU18HKqhuYG
 i6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/yTTW3gJMy8kmNQdvCvlmrK8ZnSXl30930dPL2g97c=;
 b=oz5J/1+Iqhjo3MX9c+X8hSWdqeYpKXoJVwbPeRanepF8Y479pkJ3FhhARfOEpX0j01
 YBVyaJl7E1HVq6rtSsL1iRzcx7U+qwbm1utcNTwqQ7RHtoK35BcDk5qGRbef7Zt1xwFX
 VJdc2DBTXBxqP+4bux5+1aFPD2MM5jfgKxfHpfOew1Wyb8i4Ftpao2Fg23a0AxetVjtB
 5/ns+01yAfwOuTeIanGh7ONdob15R9EMKx8r+tXggWRFtR+XsMMrqjEmJZ9COHbKBmRk
 p7VGrniEeF1yyrIiGw0Fla+EYd4K4wvx/idWsGlvmDxvA0LYTgyx0szKrl6PcdgLS4SV
 K8kg==
X-Gm-Message-State: AOAM531DsVIkTOHkCMxs9oqrPXs+m0zHcXivOF0h9ahyp1GclLo62qrF
 bJjTM8cXCSRft94oWwqrqCVYz5k1FWBcaQ==
X-Google-Smtp-Source: ABdhPJxRZiH/7oP+Utj40UC9SxxxJPihaX6yPXVGRmjnwPiY2nTJa5+on57vRaUM19Gnl59GAn1z1g==
X-Received: by 2002:adf:a1d5:: with SMTP id v21mr4225623wrv.24.1610120197470; 
 Fri, 08 Jan 2021 07:36:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/23] util/qemu-timer: Make timer_free() imply timer_del()
Date: Fri,  8 Jan 2021 15:36:07 +0000
Message-Id: <20210108153621.3868-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Make timer_free() imply a timer_del().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201215154107.3255-2-peter.maydell@linaro.org
---
 include/qemu/timer.h | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index bdecc5b41fe..61296ea980c 100644
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
@@ -631,6 +620,19 @@ static inline void timer_free(QEMUTimer *ts)
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
+    timer_del(ts);
+    g_free(ts);
+}
+
 /**
  * timer_mod_ns:
  * @ts: the timer
-- 
2.20.1


