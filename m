Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA3663451
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 23:51:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF0yv-0005x2-Co; Mon, 09 Jan 2023 17:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yO-0005ih-PX
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:33 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pF0yM-00078b-Lx
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 17:50:31 -0500
Received: by mail-qt1-x82c.google.com with SMTP id v14so9465383qtq.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 14:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aC4zZ6XSnozWRPIZlr8juBKASRNoGs4qqu58FPIo/+c=;
 b=Yi8Zj38b7clij8AiYrXOcB+aMeJkX3Y7tP51qb9LM6eH64vYWMGFaPQ+mo48t85Zcs
 DORVnBp/NaFHEn/Y0pF35+kDcb9qNwwh28oHW5y0YqhQnf16huYvlAMw7K2P32pFCcc7
 6w1U0q48USTdXI+5RtyOyb7cnFgOrH5bupgXjaB9wIpE+Zizrf3keUBOErrOP/SK8Dho
 Yhpe2u2vXUhIwNxZ3h5teXwrqMmIA+FYV9WDmp5cv6bmXXNmsuwdYZfo763ZfGXeCVYj
 AxZfL/lCrF5DKWUCDUQbKl8w78fKCALUDogV0+zbX7lgUTZB64JX84TmikjZhV+rjHTg
 jF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aC4zZ6XSnozWRPIZlr8juBKASRNoGs4qqu58FPIo/+c=;
 b=NSlnwKb5P8Bn9j0Crz7A/hOrP8FVadhTkEfkxQkrEb2kWBdHetuWl0dRCK+fpmOxDH
 28/Ru73oQxQ9Ai+UZEmtMB1o0tUlqJRpToFyLpmP6GUeQEItiJ19+KF+51FBRV39FNmd
 pztO5MS0TZjE5wXMDhzTQv+xtRuKR+hlAiEHexbUIRxBW0JapKe3HSxuoJzyUtLe+bgq
 QjrHEdqPWlbEqQjVf97eCQygszA7Iwdt56HMqxrOQKkGgG3JTwQZ7gJtLTGjQNys0QvM
 g2LcB9YyHsRSHmgLWn1f7BKECAcsHROrlVqch2TgQ+EwQqqqP4fvbwk6R7rKtwNrBAhX
 sWdA==
X-Gm-Message-State: AFqh2kpHs02Ki65BAJeuU6I+wgiw8pZb09Du/2DT6TdAfEwf61Ar5nhM
 HbSJAT/EmMnEMmbUctzNaeR2MRRngxYzBloiyIQ=
X-Google-Smtp-Source: AMrXdXvQBToluAdF0E+dZT49g86+NKrrVpvdFXJeiNaNQhCkD4onljWdJ+IXZmN1bj6MD7Wp1zYA8g==
X-Received: by 2002:a05:622a:4207:b0:3a8:322f:705f with SMTP id
 cp7-20020a05622a420700b003a8322f705fmr90025883qtb.56.1673304629129; 
 Mon, 09 Jan 2023 14:50:29 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 jr49-20020a05622a803100b003ad373d04b6sm2176671qtb.59.2023.01.09.14.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:50:28 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 5/5] plugins: make qemu_plugin_user_exit's locking order
 consistent with fork_start's
Date: Mon,  9 Jan 2023 17:49:54 -0500
Message-Id: <20230109224954.161672-6-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109224954.161672-1-cota@braap.org>
References: <20230109224954.161672-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::82c;
 envelope-from=cota@braap.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

To fix potential deadlocks as reported by tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
---
 plugins/core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/plugins/core.c b/plugins/core.c
index ccb770a485..728bacef95 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -500,10 +500,17 @@ void qemu_plugin_user_exit(void)
     enum qemu_plugin_event ev;
     CPUState *cpu;
 
-    QEMU_LOCK_GUARD(&plugin.lock);
-
+    /*
+     * Locking order: we must acquire locks in an order that is consistent
+     * with the one in fork_start(). That is:
+     * - start_exclusive(), which acquires qemu_cpu_list_lock,
+     *   must be called before acquiring plugin.lock.
+     * - tb_flush(), which acquires mmap_lock(), must be called
+     *   while plugin.lock is not held.
+     */
     start_exclusive();
 
+    qemu_rec_mutex_lock(&plugin.lock);
     /* un-register all callbacks except the final AT_EXIT one */
     for (ev = 0; ev < QEMU_PLUGIN_EV_MAX; ev++) {
         if (ev != QEMU_PLUGIN_EV_ATEXIT) {
@@ -513,13 +520,12 @@ void qemu_plugin_user_exit(void)
             }
         }
     }
-
-    tb_flush(current_cpu);
-
     CPU_FOREACH(cpu) {
         qemu_plugin_disable_mem_helpers(cpu);
     }
+    qemu_rec_mutex_unlock(&plugin.lock);
 
+    tb_flush(current_cpu);
     end_exclusive();
 
     /* now it's safe to handle the exit case */
-- 
2.34.1


