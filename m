Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29F6616C3
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:40:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYi7-0001Bi-7r; Sun, 08 Jan 2023 11:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYi5-0001BF-BX
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:49 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYi3-0002gl-Tl
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:39:49 -0500
Received: by mail-qt1-x831.google.com with SMTP id j15so672297qtv.4
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HmY5q5T4tQyiUixjlDijQBP6aFMcfJLYqoAw6OnSdDI=;
 b=dnsmqHIkrz253qbjYEyxj583ixSyyDa6fFHqTgHzX1Bi3jWVdjnFNLoJe1N96Hu5G6
 lVKz2UVkv2m24zzHMHPFxaMyYSYo3TqDcIAnPq+42ISpxlad2KGRmXJhwcI56IPGbg+H
 b79pBvMy4vqGo32EyGFD7cvlAO8i/eiR+4GleeTST6BMJloUrURAka6+vRImL8XsUiXl
 htYLDo3CWSS6Deyz1ioQdiSh/NzmzAwrUXfELGoxKxkiJM3Tt3QQQ6bKThpYE8sVka5P
 o0Dv8dx/qfhLUMFRdm7A1OVKszIDG2CMF72IzgmTC/bVDokJY1nmkk/gcC1l8UcbZ79n
 qqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HmY5q5T4tQyiUixjlDijQBP6aFMcfJLYqoAw6OnSdDI=;
 b=vyeD0pykqvYLtBWC78pFwHMLD3l8wbiHAVzOWccr+kiiNJaon4RmvNhNEQ8rpmRiSx
 HHfpNTz6+KY/Is3ZpeU/TSxox2tuqErVckSyVvh+5DjAdRc4z+h3o3b2m2JbAubp5TRs
 O6WBdBLzjed96bonjcsQMRfmgrZ2GAlW2UwTgx+yu7J+K479IGhQJx+yJ/D1kG0uJyKH
 NlQqHwOlsWLJ93zHBbiqQs/ibslJEo2jmSvNG7NqtkoiDJ3esJ759y9nXuC2XMkYOfQ5
 u79c4L+prkmDWWGC144OLGJWSLGCWsi0OfG+fKl7Tqm2CtPFGAtsEQc/G8Dr8UXjDlIV
 9Flg==
X-Gm-Message-State: AFqh2kqQ3xVLch7g3hVevPEDsv/emWRSudN9uiVz0SsUs402V1QgEjBj
 d9jMupScC5Z0mS8h9ztuFEyhm6eLLJ/JCSQUYJ4vRw==
X-Google-Smtp-Source: AMrXdXuKHXNbcNvj85VKiPeRc33mZE3G+vpjl4aYXnM63N8VvUdjqAHLCNYf6WoMmcc8i4/MemXywQ==
X-Received: by 2002:ac8:7452:0:b0:3a5:e9fc:aa87 with SMTP id
 h18-20020ac87452000000b003a5e9fcaa87mr87336569qtr.59.1673195986792; 
 Sun, 08 Jan 2023 08:39:46 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 a22-20020a05620a103600b006fbaf9c1b70sm3864759qkk.133.2023.01.08.08.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:39:46 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH 4/4] plugins: make qemu_plugin_user_exit's locking order
 consistent with fork_start's
Date: Sun,  8 Jan 2023 11:39:05 -0500
Message-Id: <20230108163905.59601-5-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108163905.59601-1-cota@braap.org>
References: <20230108163905.59601-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::831;
 envelope-from=cota@braap.org; helo=mail-qt1-x831.google.com
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


