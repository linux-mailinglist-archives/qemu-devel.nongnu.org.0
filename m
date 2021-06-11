Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C7A3A4B6A
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:49:36 +0200 (CEST)
Received: from localhost ([::1]:42018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqu6-0000Si-Uc
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmf-0002Qe-Qs
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:53 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmb-0002YA-3g
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:53 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so913024pjq.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSl6OeNN4w6woYqVHZ//vjb0CKaJZ9EhsQMGYBZHzX0=;
 b=ujaWAxJTq9EVXFRDHSs/+k5dLhv50RMH+jSj21qmkrPeEm5GC0ZUKuIOXumFbBSQnb
 8CkYfDxugiHKYCxCTcaMzyeFq1nyY96Crjyy0Ez6fTp8bjpifZ7vdzZr2lygA4cjYX8z
 qZv9g2HUNCfw7E7eiIVPV8ctHFpEiXZ/5ztTZz1yKDC0Qeqb87JFmRrLimL4HNu7W9lP
 zRDGoMk3rvrgkxmmEEQ5NvVRybqG6wFucVfGG7GdLSrCj/zKn/bSxp4C8udv5aDPkT2q
 bB3Ddf/OFH3jLk9T+qHWm46bmk1/mtxizz4bl5hwpCd4PkjYTdyKo7kuPNM8Q8IrpW5V
 fKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSl6OeNN4w6woYqVHZ//vjb0CKaJZ9EhsQMGYBZHzX0=;
 b=F9ZFM0g6jzG86yzbY93jv61a6Nb7vviUCEhfGO/1uiwUxItoEPu0o3sQZ4OLEKY91T
 dHhRBZSU5rIadqEaWAcdThOtnfThe9ruiR8K8rCq3t4YPWFdoUazzkTqzNRCinMKB/32
 bVGY97X5NN4+7QgCE3TruEyHbTGyKdcesXLRbhUdG2UyIGmvcj2s8zKc+ZUfNWZzvQqw
 0gqWEv9kbdhW7CIJEKboBD9XXnAFg/2La/P5bgSJ2kBm+qJUC9GwEFjk/uI31U/yZRSB
 pZNhD2jYu9q8uCS5t4w8/dFU2+Ft/0rLNs5H5Ub/bEZuznviTmg4Ah89jDq0yW6OdWdO
 /N9w==
X-Gm-Message-State: AOAM5339KYDQB6UQBigZTmINoLYGtY5xl/AAyOoeRXkopA5/LIqIVfj3
 Lo/tZT+NwNKhRfmLJZpfbKIR7BDSAC7YOQ==
X-Google-Smtp-Source: ABdhPJyrGPEy7uri+Uc5RD4nlr+jarZlvAMfx3YbGkvIGPC2gikDgQE7A6emAkc9c9sZde7X90e4Hw==
X-Received: by 2002:a17:90b:3ec3:: with SMTP id
 rm3mr7031298pjb.105.1623454907787; 
 Fri, 11 Jun 2021 16:41:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/34] tcg: Remove error return from
 tcg_region_initial_alloc__locked
Date: Fri, 11 Jun 2021 16:41:14 -0700
Message-Id: <20210611234144.653682-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers immediately assert on error, so move the assert
into the function itself.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1e683b80e4..ba690e0483 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -720,9 +720,10 @@ static bool tcg_region_alloc(TCGContext *s)
  * Perform a context's first region allocation.
  * This function does _not_ increment region.agg_size_full.
  */
-static inline bool tcg_region_initial_alloc__locked(TCGContext *s)
+static void tcg_region_initial_alloc__locked(TCGContext *s)
 {
-    return tcg_region_alloc__locked(s);
+    bool err = tcg_region_alloc__locked(s);
+    g_assert(!err);
 }
 
 /* Call from a safe-work context */
@@ -737,9 +738,7 @@ void tcg_region_reset_all(void)
 
     for (i = 0; i < n_ctxs; i++) {
         TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-        bool err = tcg_region_initial_alloc__locked(s);
-
-        g_assert(!err);
+        tcg_region_initial_alloc__locked(s);
     }
     qemu_mutex_unlock(&region.lock);
 
@@ -876,11 +875,7 @@ void tcg_region_init(void)
 
     /* In user-mode we support only one ctx, so do the initial allocation now */
 #ifdef CONFIG_USER_ONLY
-    {
-        bool err = tcg_region_initial_alloc__locked(tcg_ctx);
-
-        g_assert(!err);
-    }
+    tcg_region_initial_alloc__locked(tcg_ctx);
 #endif
 }
 
@@ -942,7 +937,6 @@ void tcg_register_thread(void)
     MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
-    bool err;
 
     *s = tcg_init_ctx;
 
@@ -966,8 +960,7 @@ void tcg_register_thread(void)
 
     tcg_ctx = s;
     qemu_mutex_lock(&region.lock);
-    err = tcg_region_initial_alloc__locked(tcg_ctx);
-    g_assert(!err);
+    tcg_region_initial_alloc__locked(s);
     qemu_mutex_unlock(&region.lock);
 }
 #endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


