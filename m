Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A8867C9DA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:28:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Lb-0003V1-Lh; Thu, 26 Jan 2023 06:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LU-0002sa-9Z
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:08 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LS-0003hj-6p
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so906630wmc.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dxqv1wYRpSn53E/nUZT1yc2AZ9KkmDIimuwl5F539Pg=;
 b=UmGqPgcHwRjDFzb8yZqMNA7/lydxW4B9patxi3MPuydLJUpWZDseyHwJquwGSB9/NH
 kpx0sbDrU8ZDLy4OB+NRP9DoSVa7q3wNB7sW5IqLP9Q7h6nPSYa9nFuQdTqxXRmQjEcz
 QCb29bqfRbAapdeO197dtL6Q2IWTXnj+F1Sx9o8U7sHkZv2pER+41YUJqE+o5Vf1sjm4
 V3h95xHX75Zc5cdz80N8BmGclpF3GUUCqyePSH6fW6SJpMau6djyImuBCbH/lTbDb/pZ
 SjgS1gVGlOFxAlymF2m54iOz1jVG4hXwjJQEn6CsVG3/bGE5a7VZ2wNrLwRJKbURhmZI
 +Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dxqv1wYRpSn53E/nUZT1yc2AZ9KkmDIimuwl5F539Pg=;
 b=UYmjtWWZ8ZQIyRC49UcI0jEtWHqa1+wUeIj7jxATwmO4M67f29N2Vy9MLXft0YG/Iy
 Eq8C0INSQO6xbt4/XPOwqwOHMWmAKdjjll5vBNXGb5h91E6r3kCfXJG0Av41B+gZFmJi
 uIviouPuqGfjRU00qFoxVDavXJ9UkwuyBwR81UtQ+cozo6G6VwsAiclkF71Kh6fFB4sk
 F99C3zYOis3PTzg3T2ZcW+tRfgS+Ef1aPvVGJ2wFC/PK9+vkIDJUZigZp62aaD6aJjd1
 uuPIh6TiO/zVG+DQiPgdHVU96cIcQRncaD1m9acDc191i+zEBcppDDe1y/HW7Xt7m1NY
 TXzA==
X-Gm-Message-State: AFqh2kr6dOmljpubIGg3w/Fe5ATKs+9bdaRyGvWReZqq5bKDx7asrLQE
 KYiZXFuNqKorJmmv7aZe6iD5ixPayGvcGhhF
X-Google-Smtp-Source: AMrXdXva7xHuqHAyH/HKWvj6KRP2D55UdqcyyTu7JuebfowKOIqp4sucI6kohqCYCnKoHU2JHNRaDQ==
X-Received: by 2002:a05:600c:3b07:b0:3d1:cdf7:debf with SMTP id
 m7-20020a05600c3b0700b003d1cdf7debfmr33726409wms.26.1674732185341; 
 Thu, 26 Jan 2023 03:23:05 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c2caf00b003d974076f13sm1345540wmc.3.2023.01.26.03.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:23:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DBC31FFC2;
 Thu, 26 Jan 2023 11:22:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Emilio Cota <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 30/35] plugins: make qemu_plugin_user_exit's locking order
 consistent with fork_start's
Date: Thu, 26 Jan 2023 11:22:45 +0000
Message-Id: <20230126112250.2584701-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Emilio Cota <cota@braap.org>

To fix potential deadlocks as reported by tsan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230111151628.320011-6-cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230124180127.1881110-31-alex.bennee@linaro.org>

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


