Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C426593B6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:15:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r5-0002yL-DY; Thu, 29 Dec 2022 19:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r2-0002xM-R6
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:33 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2qz-0002fO-KC
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:32 -0500
Received: by mail-pj1-x1031.google.com with SMTP id p4so20796358pjk.2
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xe4xTZh/olelEWsm0lJjRBAP0V+vxyo3x0yWKfVII3Q=;
 b=InX3Bww5FTo6olEtvtEQ3RMkkrfThUjDRB+E0TA+5r0J1m+uaS6rex0MZ9tBn3OqpE
 g+XgaagGG+QoGaOTsigKaQfzH5deXQbYwFH0fFB7RFK1YH1Le1Ls3qzzr4czRQ279pBq
 UmcZDbawX7dwTEuI8A8LpCxUJUKGcaXsbtiJjNxd8s1BNhsF8ZeX1l78kdL/g6COvnkJ
 ul30SJCiVc0BV4mgB1ybU/8FD5JtNho7Y5khSsUKkLANejykB4WxpX/D533+1I1UUYgB
 HZ8xf9izclQVDnHKSJxnFaKsGMQxD9JN0XYBWyiaWleI5pwOrND9yojuRSp0T1tuQ4uo
 TfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xe4xTZh/olelEWsm0lJjRBAP0V+vxyo3x0yWKfVII3Q=;
 b=wLZhhsq95IQ1iHI+GiP4C68TTUV9SxW2KuFjR3l0GPhUg5bMyXivbHj7DMUctsk7x3
 IFk47pv0bhFP07/4dfpj2VDu+9fMjBjfUe10vys6vQz4pM66QJVQlsnKD0pMJdURezDL
 qI8RjikiAIIplY4o6G1nj5781+pPW8GLWk6fco3wz+Ynq3Sc29B+2GCTnSziitW2C8yt
 1vgQWU1n4+s23Tlm/gEmyKUGe7dbHtCjUQp/+Blm2nm7qrhb3qq993Y4IJ1Y2vywN38Y
 jEKUVIa5EULdZs0YcWXJbzv1nI+o3/RQweiLYo8qU0EwoLgSzOwZ21bkOI7hVetAoDzM
 g4qA==
X-Gm-Message-State: AFqh2krvz/3sz6+eFuy2OoWI6IWBIGy1569UnDfAnNeZu8PkU2ONJ9Y7
 3tGepWV5bexpdvQeXbWrn+FBa4mUMOdlQiV4
X-Google-Smtp-Source: AMrXdXsUpjPf0E/ixIXwl42EPqxdKQBHkRQEMkrALrZaCy45SdgwqUGPiHEX/UkaEIQaBQxRAKFnZQ==
X-Received: by 2002:a17:902:ccc1:b0:189:8002:5f59 with SMTP id
 z1-20020a170902ccc100b0018980025f59mr57457991ple.57.1672358547776; 
 Thu, 29 Dec 2022 16:02:27 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/47] qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
Date: Thu, 29 Dec 2022 16:01:39 -0800
Message-Id: <20221230000221.2764875-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Create a wrapper for locking/unlocking the iothread lock.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/main-loop.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index 3c9a9a982d..c25f390696 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -343,6 +343,35 @@ void qemu_mutex_lock_iothread_impl(const char *file, int line);
  */
 void qemu_mutex_unlock_iothread(void);
 
+/**
+ * QEMU_IOTHREAD_LOCK_GUARD
+ *
+ * Wrap a block of code in a conditional qemu_mutex_{lock,unlock}_iothread.
+ */
+typedef struct IOThreadLockAuto IOThreadLockAuto;
+
+static inline IOThreadLockAuto *qemu_iothread_auto_lock(const char *file,
+                                                        int line)
+{
+    if (qemu_mutex_iothread_locked()) {
+        return NULL;
+    }
+    qemu_mutex_lock_iothread_impl(file, line);
+    /* Anything non-NULL causes the cleanup function to be called */
+    return (IOThreadLockAuto *)(uintptr_t)1;
+}
+
+static inline void qemu_iothread_auto_unlock(IOThreadLockAuto *l)
+{
+    qemu_mutex_unlock_iothread();
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(IOThreadLockAuto, qemu_iothread_auto_unlock)
+
+#define QEMU_IOTHREAD_LOCK_GUARD() \
+    g_autoptr(IOThreadLockAuto) _iothread_lock_auto __attribute__((unused)) \
+        = qemu_iothread_auto_lock(__FILE__, __LINE__)
+
 /*
  * qemu_cond_wait_iothread: Wait on condition for the main loop mutex
  *
-- 
2.34.1


