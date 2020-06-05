Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A640F1EFF55
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 19:44:21 +0200 (CEST)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhGOC-0006sy-NU
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 13:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jhGHw-0003vX-H0
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 13:37:52 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jhGHv-0003zi-MO
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 13:37:52 -0400
Received: by mail-pg1-x541.google.com with SMTP id d10so5523970pgn.4
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AYdOaJYxtk+d/I+Jwq+9vEcr8Iz8aXatF1CrO9YlEDI=;
 b=p3+nbVsy4PvU9tSN8xRzYq1rT4aICEHfHySZZAcW5Vyvhf3hbtLejt4hciR33Iy5fq
 qQyPULZoVJl2I7Wt3oGr9IOZ0k0Zud5btJERRQHzTRTJ9AzONKSPYFnMThYLxdJfhcTh
 oa0pN7Da4zMTF0UBqv2+awE8VaCP4y6BgvNhlJ5OyMkYRVE/i+P8bEd3xB37BUoRC3+v
 QLoI8kekdxRvAJGs7bPvnBtXWfjxCsvje/39SKCxlevf95ZqqFLZuhq9SZm9XpMp+ICG
 hCo1Rh9scqCRP5YlKLoKkcHgy4G+ZY3JY0O+6eaiw+yWvsyzJLD6UvUl4s0aEFMyvHhz
 gFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AYdOaJYxtk+d/I+Jwq+9vEcr8Iz8aXatF1CrO9YlEDI=;
 b=uKb3YNqfYbAITfLBdwD2qWYQE9h1+v4tE1FJYlJ/2oEOarw+yn9R7NdtiBaExjWj+M
 RgmLnEReOdS0pmc3EvvR5A5rK2E44ULfl67YJ+qw85X+YAV0fjxHbWAKnMtgXvE/m7d2
 z5yBV5V5ceD58ish3rd0sY2r24GUQDZZmb+fb6UyGgiikOFDBBfykxwlAQkfOqPDn4zK
 LT000l3njlRgkWvSD9nH1menUD1rhNzf+bPOpPrEkdw008DyaZ1BoELTqK0jDpiaaqvu
 o0XQsWxKvBEuSX4UgohBSWgahEZl6rLtj0rOFb+C9k5v2cS8UT0VVZ/lknrRm9l51+NH
 6ecQ==
X-Gm-Message-State: AOAM531jrXBNpQtJUigP/GFm3GDaB/znqJNI0O3xTkvRCEmXXyT+x+Q9
 xNCxJKvKAv9U932Y93pGHaU26uEFaKOIug==
X-Google-Smtp-Source: ABdhPJz+0TqhsTfWBffMyJMplls+qRqMU+jjxrgCc29VZJBTvomQRRA3hOJ3R1q5/AqJ0CmDpFxHNA==
X-Received: by 2002:a63:e60a:: with SMTP id g10mr10856361pgh.210.1591378669027; 
 Fri, 05 Jun 2020 10:37:49 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 (c-73-47-162-176.hsd1.ma.comcast.net. [73.47.162.176])
 by smtp.gmail.com with ESMTPSA id a19sm188307pfd.165.2020.06.05.10.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 10:37:48 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] thread: add tsan annotations to QemuSpin
Date: Fri,  5 Jun 2020 13:34:17 -0400
Message-Id: <20200605173422.1490-9-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605173422.1490-1-robert.foley@linaro.org>
References: <20200605173422.1490-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=robert.foley@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.puhov@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/thread.h | 39 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/include/qemu/thread.h b/include/qemu/thread.h
index e50a073889..43fc094b96 100644
--- a/include/qemu/thread.h
+++ b/include/qemu/thread.h
@@ -206,6 +206,10 @@ void qemu_thread_atexit_add(struct Notifier *notifier);
  */
 void qemu_thread_atexit_remove(struct Notifier *notifier);
 
+#ifdef CONFIG_TSAN
+#include <sanitizer/tsan_interface.h>
+#endif
+
 struct QemuSpin {
     int value;
 };
@@ -213,23 +217,46 @@ struct QemuSpin {
 static inline void qemu_spin_init(QemuSpin *spin)
 {
     __sync_lock_release(&spin->value);
+#ifdef CONFIG_TSAN
+    __tsan_mutex_create(spin, __tsan_mutex_not_static);
+#endif
 }
 
-static inline void qemu_spin_destroy(QemuSpin *spin)
-{ }
+/* const parameter because the only purpose here is the TSAN annotation */
+static inline void qemu_spin_destroy(const QemuSpin *spin)
+{
+#ifdef CONFIG_TSAN
+    __tsan_mutex_destroy((void *)spin, __tsan_mutex_not_static);
+#endif
+}
 
 static inline void qemu_spin_lock(QemuSpin *spin)
 {
+#ifdef CONFIG_TSAN
+    __tsan_mutex_pre_lock(spin, 0);
+#endif
     while (unlikely(__sync_lock_test_and_set(&spin->value, true))) {
         while (atomic_read(&spin->value)) {
             cpu_relax();
         }
     }
+#ifdef CONFIG_TSAN
+    __tsan_mutex_post_lock(spin, 0, 0);
+#endif
 }
 
 static inline bool qemu_spin_trylock(QemuSpin *spin)
 {
-    return __sync_lock_test_and_set(&spin->value, true);
+#ifdef CONFIG_TSAN
+    __tsan_mutex_pre_lock(spin, __tsan_mutex_try_lock);
+#endif
+    bool busy = __sync_lock_test_and_set(&spin->value, true);
+#ifdef CONFIG_TSAN
+    unsigned flags = __tsan_mutex_try_lock;
+    flags |= busy ? __tsan_mutex_try_lock_failed : 0;
+    __tsan_mutex_post_lock(spin, flags, 0);
+#endif
+    return busy;
 }
 
 static inline bool qemu_spin_locked(QemuSpin *spin)
@@ -239,7 +266,13 @@ static inline bool qemu_spin_locked(QemuSpin *spin)
 
 static inline void qemu_spin_unlock(QemuSpin *spin)
 {
+#ifdef CONFIG_TSAN
+    __tsan_mutex_pre_unlock(spin, 0);
+#endif
     __sync_lock_release(&spin->value);
+#ifdef CONFIG_TSAN
+    __tsan_mutex_post_unlock(spin, 0);
+#endif
 }
 
 struct QemuLockCnt {
-- 
2.17.1


