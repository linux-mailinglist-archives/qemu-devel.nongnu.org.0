Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0392DB06B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:48:17 +0100 (CET)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCYi-00022h-8x
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRu-0003NO-J2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:14 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRs-0004ty-WC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:14 -0500
Received: by mail-wr1-x444.google.com with SMTP id i9so20317311wrc.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NkI1JPV6T76myH92t9WLjDACCV+iWxQLh0fjZqVGsx0=;
 b=FDfzgfAElQm3Ralfyk4cDrZz/22Jb2tASbI+eMOhIyqSICyROMcrWbSlJxxxsL9Jrv
 w0/svmaL9jMAfRz0Hytk1GeEoGBrQESZPpSjy440GC5m/5B2IU/N39je5HFhK3b0wYyK
 x42hCns2HHXXsoOJhCPhLchAuId6wGdexc6LFkYl7vcld+Tkqui14RJbNx0Asz2Mu7YK
 q7xCSYd7E+0mvPwoHAHX63WCl7lLLjsAe8L3VesgiFTtRJH8/eYzYoCTvEasaCojsYwn
 3JZgEy3MKobf+4b2oVsHYJnvkq1Ttn7SY6OU3fZkmEac4ERs3Sh6NRhFUdx6FfExSidt
 9vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NkI1JPV6T76myH92t9WLjDACCV+iWxQLh0fjZqVGsx0=;
 b=K6gJ3DbXIb6XHnQDJO41EGogWWu9yuHavgeGmT3uObcVQznBD+xGkGmc3OzqqeuQk8
 loR+zeedZpW+8EtSy7SEWZtj9SOi9Pmn2gMn+PNztcOUBPNkgcbIL3vbsaSBaV4FDcsz
 jIF/ZujZPSyaEYdzp7AUwvs8PvLDV1HBGlXOiIyihPtfq98v44kIWo+vk3z4PUu3hoG3
 a6qSwbwnEMuFr20SLm+Z4l+d6yXjfuxweV9OpjkiSVjv4GMDDfJ1nEOkgVZFEJ3UqZfQ
 wvdwoqnIpax5JarcCX4V7dvLFJfdl6qouuhEwFBWt1CfJKy+AwqveY0x34zJZ0d8GckL
 I8Ug==
X-Gm-Message-State: AOAM531hQkFsRVbVVwbL6jfGg2U4/EwyHb6RHOcn48PUslSz9WVWgYkq
 yrYo7UU1cUoTZB36F+VQVg/oALRLrbJXPw==
X-Google-Smtp-Source: ABdhPJydtmdP4JKUA5Qr5bKFXcvYiBVrZK0ttV9wKD929tCySRTjITsdtmlARFe0DIk2xVygfzDxQQ==
X-Received: by 2002:adf:80ae:: with SMTP id 43mr3386140wrl.50.1608046871362;
 Tue, 15 Dec 2020 07:41:11 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 34sm38259978wrh.78.2020.12.15.07.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:41:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] util/qemu-timer: Make timer_free() imply timer_del()
Date: Tue, 15 Dec 2020 15:41:04 +0000
Message-Id: <20201215154107.3255-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215154107.3255-1-peter.maydell@linaro.org>
References: <20201215154107.3255-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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

Make timer_free() imply a timer_del().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/timer.h | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index bdecc5b41fe..ed84ad8f3aa 100644
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
@@ -631,6 +620,20 @@ static inline void timer_free(QEMUTimer *ts)
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
+    timer_del(ts);
+    g_free(ts);
+}
+
 /**
  * timer_mod_ns:
  * @ts: the timer
-- 
2.20.1


