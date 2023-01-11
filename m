Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48A0665EE8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcr3-00058W-HZ; Wed, 11 Jan 2023 10:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcql-00054G-9P
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:13 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pFcqj-0001PF-Hy
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:17:10 -0500
Received: by mail-il1-x134.google.com with SMTP id i1so4552244ilu.8
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 07:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTtAtxGY4Bs65WVYgMhynTWfuOk2bggcnt6aho5Sk7c=;
 b=AohEby0FGsmGJBvdrsXaMZUADjXpw0O6HAYYvg1lEf8/s3Pj+JdABRK+NCw3mjXscy
 dzuJt9vLCsg3nHLTtrXKGP7SM+SiFdhAHP4+0iUTP4o2FzU7BluiUR7i1/X1+naVNxNF
 lhuOFxHXIMnPsgEByFzWD4Kf6pmB9qP84eaIEjSdB+CcLTMYFGY5moZzTfIPA2IDH7y+
 9wB4tC77MVCOvc6H+KyrBh+St8LdqKvkDgPGJCC0Ek7AExU1LRBXyog8IcdWjAT9979N
 /fKGrFfKKkITF8STPYNIucLWWIC5F3+gILQG2GIQVEvklz7h6oO8vhiLB+UQN80uiDb7
 f/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gTtAtxGY4Bs65WVYgMhynTWfuOk2bggcnt6aho5Sk7c=;
 b=ceR3ol5ZWYy3XuAy0bf2lMuioYGesP+EZ+YIgo9ma63S5FSTlCtufN1jRupBFwxi4M
 qH8hdGVnkI1VybbHiJMqEh2fikEsythMOaK52hO/UdaPoozd3OrI6lkQuCEl+fSNjOC1
 +Fy4n3kEhSPv4pKlZ8IM5RW6mQYadU/2Lxd98ryESf4jrfqKcZR78Ipmq1TxJ6LKhGx+
 ciaWrY6CreCHDD8StcHvYhYiM+rTTGqucybpuUpve4oKyRUnMzt2C3r6uCdD5qmawk7q
 N7tq80zvAqyLB9VWlWBBORAM9ge9DhI7CPO7W2w0vdkr5SP8bZPtubxONTFImFSsubLx
 APPA==
X-Gm-Message-State: AFqh2kqsm3A39O1qCcxYjHvLbRjqRz8UNGPrE46SQkdvA1XQXtBzfpEL
 xUhaRfmiJprm0VQAMd76fxvioTGdwtWoeZEL4Z0=
X-Google-Smtp-Source: AMrXdXs0iwc6v6l2gY0O+gh8smnBrHi0TPiNegAvirnhju7dfPEGxvZCJRYoA5+F7LeudPOCiaX5jw==
X-Received: by 2002:a92:d111:0:b0:30b:b664:d0e9 with SMTP id
 a17-20020a92d111000000b0030bb664d0e9mr46884880ilb.24.1673450228263; 
 Wed, 11 Jan 2023 07:17:08 -0800 (PST)
Received: from localhost ([37.19.210.30]) by smtp.gmail.com with ESMTPSA id
 q20-20020a056e02097400b0030bf7ae141esm4495355ilt.2.2023.01.11.07.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:17:07 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v3 5/5] plugins: make qemu_plugin_user_exit's locking order
 consistent with fork_start's
Date: Wed, 11 Jan 2023 10:16:28 -0500
Message-Id: <20230111151628.320011-6-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111151628.320011-1-cota@braap.org>
References: <20230111151628.320011-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::134;
 envelope-from=cota@braap.org; helo=mail-il1-x134.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


