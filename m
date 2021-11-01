Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9602442041
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:47:15 +0100 (CET)
Received: from localhost ([::1]:58742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcKv-0005rZ-Dc
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9W-0000Wz-IJ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:22 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:37865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9H-0001GO-9U
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:22 -0400
Received: by mail-qk1-x736.google.com with SMTP id r8so3415539qkp.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lLZzifCuDAFtBOJRXRut8iWPXEYL/L2LC9pwY/6QWY=;
 b=Apt32m2gVLDak4Y+MuMtozXIIfonDVj5IwrO1VkBi+rBJ9jpg4W3DNcYEP5jaYboPH
 t3t1tvFa0cXUfnY8qAK/7J4RrOTYZE878N2QNACZ7LGfNthBO9owfqVEZjwvE5po5OMU
 0F63iUApzxQLf+OwAG9RSGnGO8B1lQLk40T3oW5vMDkIYrKu5ONO++CpFWztBDWxDjaH
 937aQTqK0ZxJJi4nUz2FWdqFQCYQtoTUJJh/DyMk6SyUaMbq907sfRTMMBkzukYkAFxF
 XVfSkCgKGUXvt2Bhb11wmXiM6f1xOu/SkZ449C+tD12kc7T62ahpLSg4UZ40LEYDLO5m
 qB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lLZzifCuDAFtBOJRXRut8iWPXEYL/L2LC9pwY/6QWY=;
 b=KwPMCOB+CuM7bSjR0i+eIx7rNa2iPax+e1+r/202+FljTy/TdcjEmXxfadkz6U0V8h
 xkEP3hA+CSf0dr0k9v6ecWXe/QytXz1FVFYhYJdIAQ9WsoGHQz7COZJmRZypokQ7dYAb
 4bCvN1qqZvumiotdIf/ur7URd7qWWydJ8bgY8j1dDsi01W9pB+bIxxff9uyG4tVIEsf4
 l9WVoVYV4kF/EejUdno85VoCSX/pbbMUwfOH5MpSKQHzUvK+jXPB/xYRauMDhCEa9fvR
 pfFTVV8P5b39l5S9qoMgYM5aTpEk4fIMFEYsZXgK8vl+cgQFmDxu7NPYbjD2VeFrAQti
 qcKw==
X-Gm-Message-State: AOAM532td1QaSX3Q9D4MdEjowxj8M3sOc7LB4g0L/zzBggj1zXA1sqNa
 A4gmFUJDjoZ/ewuwIO5AxDqa9BlO8wdHjg==
X-Google-Smtp-Source: ABdhPJz6EbPMSjjJR12O73DY51uKibIKg6P2kUgslPE9ltBTMbY93TBOZJLDvSICOm6zdNe++wzcEA==
X-Received: by 2002:a37:b147:: with SMTP id a68mr25092790qkf.157.1635787866355; 
 Mon, 01 Nov 2021 10:31:06 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 60/60] linux-user: Handle BUS_ADRALN in host_signal_handler
Date: Mon,  1 Nov 2021 13:27:29 -0400
Message-Id: <20211101172729.23149-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle BUS_ADRALN via cpu_loop_exit_sigbus, but allow other SIGBUS
si_codes to continue into the host-to-guest signal conversion code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index df2c8678d0..81c45bfce9 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -860,6 +860,9 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
             cpu_loop_exit_sigsegv(cpu, guest_addr, access_type, maperr, pc);
         } else {
             sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+            if (info->si_code == BUS_ADRALN) {
+                cpu_loop_exit_sigbus(cpu, guest_addr, access_type, pc);
+            }
         }
 
         sync_sig = true;
-- 
2.25.1


