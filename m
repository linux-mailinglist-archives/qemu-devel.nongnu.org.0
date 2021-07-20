Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF23CF149
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:26:12 +0200 (CEST)
Received: from localhost ([::1]:53188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eWR-0007cJ-CY
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOq-0006gx-Ml
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:22 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOp-0003Tf-Ah
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:20 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m83so18271910pfd.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1SYl6z4JM6oqxGI/nixKvmomGJ8etB/EcKsdFgvob4o=;
 b=Ds91u9k9HXaMQ2DDALQDns/BuOqFDcOqUkFHTY6ls7uOCsi06glnOqZVcfr+Ggu7hF
 slhyAntwAVHcTipKTc4LLVaZf2yZaqWZ4BRPpaKLqWgT6mIRKfPQiVouCmoJvu/wFPpI
 Rqkw2K5oPvJaTipSZcbrm6auscu+0eZIawabvED5QnCcYgR1hCR+jdThOKgi8wuGwBXd
 vnb3Lg5/uoOxNfoncqJMoRVxZWN9WjYpCNU1bCicfFSOTkKvbzV7pxJzZ0k0l0TBTGpX
 Vanq/M42I6b9jFFto8nvJZePpmvonWImRckPXvnI2klKY/5qIFlakFFbAJuh/7B9pB1x
 5jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SYl6z4JM6oqxGI/nixKvmomGJ8etB/EcKsdFgvob4o=;
 b=C+DFIW4l/n3S0CvDCDH63fcWaGjGm2MXRm4zxdGMgAKE56JOZnmG+gIWMmoB2Jlc1D
 oppi5I5OeOveB4HzQtxn/u2QRDxyt6MZV5xrFqtt2VOHPJkkRyLxDwLBpU5cqsstrwKL
 ZCJ/h8ZiNafAgEn2NjTArldrFM0QOuCZxYlnx0xqNqqmA3Z2srvX9Ox2f1TA43oQRrIz
 QXyMJzXQUxlNjmbgXLcNqiy6yCdATAqjokMc5DGl8T3lwdH+jiwCu7tcpTSzbdMrUGh6
 C5dOEsAjd1HcCq4wL8KhYjiVvF8vUfz5BA4atotcdHE6szbzxJ2QCYT2UV36y/X0ueqZ
 zHNw==
X-Gm-Message-State: AOAM530cd8lqDk3pxgSbN4fSiex1QflW2rKgl2pmdcYsqZHJdo+FYNzC
 EGr6PFM3wsapQkRLr2ZdE2twzMpKlowOMQ==
X-Google-Smtp-Source: ABdhPJx3Al/lJr2+zmcSrN8/YStaieVJTIxoDr90uQwvTcP6iGPQJu0+JW3iwVpFkJjDZxZ9JzjjjQ==
X-Received: by 2002:a63:d709:: with SMTP id d9mr28350581pgg.337.1626743898080; 
 Mon, 19 Jul 2021 18:18:18 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 10/15] target/i386: Implement debug_check_breakpoint
Date: Mon, 19 Jul 2021 15:17:55 -1000
Message-Id: <20210720011800.483966-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Return false for RF set, as we do in i386_tr_breakpoint_check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/tcg-cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index e96ec9bbcc..238e3a9395 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -54,6 +54,17 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.eip = tb->pc - tb->cs_base;
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool x86_debug_check_breakpoint(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    /* RF disables all architectural breakpoints. */
+    return !(env->eflags & RF_MASK);
+}
+#endif
+
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps x86_tcg_ops = {
@@ -66,6 +77,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .tlb_fill = x86_cpu_tlb_fill,
 #ifndef CONFIG_USER_ONLY
     .debug_excp_handler = breakpoint_handler,
+    .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
 
-- 
2.25.1


