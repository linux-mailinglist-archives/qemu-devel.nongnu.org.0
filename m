Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470362F0F5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:20:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxX1-0001LE-Em; Fri, 18 Nov 2022 04:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWt-0001Dh-0x
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:26 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWp-0005vm-Pg
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:22 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 62so4458901pgb.13
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wu9PcznBR0A4AHwT/zVDuaCr78FXrib5Istu/+EU5u8=;
 b=jBolwQebOAI0U5A5p1qT0j2Gz91+wZDUGpDg9ygjGnMhpQ2CZVp17SkyG4+TtFENEA
 xY7O2RoRscH777GwlOYczf9AzH/1amNyMkrzHoIjMIygMilftM95T9AmtvfH8B52QWry
 jmgDPA20zKKjzHHRZ4a4EuHO4/slLDrRpAay5ADQwS9rqfDM/jTG66KxQF4xr5RwmvuC
 jVh1w60sbuR3uol6kFTskhxWKV4b6EUrzOeBCfhliab/2hCpn4Y1j7/ruWwKSRj7LHaj
 OZDu7NNoMtCoFhPHU6lf1yUe7EK3jq9NRsocrW5MPCGJ8gOX1Ydci9nQaKIGMkDbHYsF
 r3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wu9PcznBR0A4AHwT/zVDuaCr78FXrib5Istu/+EU5u8=;
 b=4lf4Qa63eny/5v1LpAxscvfb4MaDT1daiMpA/TbIns1zN0XxmhJUzeV0JkuT95N25f
 4Aca/lNEmfh7FFzsXFcMFu+n/WOvKF53IlNeN4ettwuuQM9pOCkGZe2SfgYAGPC9mqt9
 MzI31Q8FDkxkOg8Tkh93a6IzGg31h4oi9vZJtWyukDIGMOzL022/1IvMI9eEFuhbVy9m
 iA2bR3pBbIF5FtyipBuQHulyFulQEukmLz6y1yaL29dtHHnhYe3ZpW6BA6e05qpDVj3k
 KgpX+n34rlSpMLczRzm+WoYRncdJeuHZicFsFYxH77kaQNvqC8hmy6qpg6wEz1OXGVhm
 1i/A==
X-Gm-Message-State: ANoB5plJgNJgVjFBEfrraCCJ10+M5veBl0JwCjJL/e4COxVDcT/tD/ST
 fFq5EYJp8MjSXiEkJR6LLdMdwfFgZXP1CA==
X-Google-Smtp-Source: AA0mqf5gLPiA+g2yNpd7+0G1gsim10kYnqseeizKSm0G9xMrlSDTdb1Kga0vapDzDRXT/QLKZAHObA==
X-Received: by 2002:a05:6a00:27a3:b0:56d:6450:9e49 with SMTP id
 bd35-20020a056a0027a300b0056d64509e49mr6902260pfb.54.1668763142989; 
 Fri, 18 Nov 2022 01:19:02 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:19:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-8.0 1/7] qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
Date: Fri, 18 Nov 2022 01:18:52 -0800
Message-Id: <20221118091858.242569-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118091858.242569-1-richard.henderson@linaro.org>
References: <20221118091858.242569-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:Main loop)
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


