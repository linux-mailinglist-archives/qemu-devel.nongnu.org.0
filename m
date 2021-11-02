Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0E1442D53
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:59:21 +0100 (CET)
Received: from localhost ([::1]:41382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsRk-0005Eh-Cy
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhM-0001vY-10
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:24 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhI-00021n-BF
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:23 -0400
Received: by mail-qt1-x82d.google.com with SMTP id o12so7706668qtv.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lLZzifCuDAFtBOJRXRut8iWPXEYL/L2LC9pwY/6QWY=;
 b=G1hYnCJ1LayxyZpilQvnLE4XfaY/AcXvxVzGjz6CRfEywQ/KnPsip6x98wvKKDXD16
 bdfoN3XTGxsZiQGznOW7P6/VZfvIV7lZtkcU/+nbWzDJ+95VTaeTvhbQlMcEvVpUfYsE
 g07g5dYp7Eh3Lh8BtVIZrpqh5etObL6OIP8I3LanqquMfyi9k3YqJ8aPHhegipkTfmSi
 TdpLpmW3zTLrLam+0uzwQ/447l9VbAIsTy9SQaeyJMd5DdHRLMhuShvl7RbX48lVyx8C
 rlVaVXdrc6CMFtFI5xIbCROxfP3ZwMegRYMEax/+XUymaWmq6L/2sHxtEbYbhPSlgBnL
 yK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lLZzifCuDAFtBOJRXRut8iWPXEYL/L2LC9pwY/6QWY=;
 b=fC0tYrJ3SjqHodqgRmrC1JLQIZEecRjnk7DxZlrtGXJ5yncGVRc6lkx7VKV8npYbew
 2a1ktc1/AYHgwIbNIvmDpTwH8wCO1P2KdobM8HH9SHYJnVI5KDPf62KvbCM9qP2AYjFr
 Tk+iNE4Q1hvH4sCxIWgZTFIuHKK1gh7mwN8dH1mZOsukyYf/5Mj82cT4xEM2V01Xg+tR
 zdtqeUg9JpxyRFafnOYW4BjwdZ/IfbXPRl5+wokvDD91axxvccSNT0ZEYs23Rs8UR3Om
 A2B2UVQZ0wxtowglyyLkbldQdP92QCnLRM9IZkor4YegCcCS8TeLJg0NtB7TwwkpeDzE
 7M+g==
X-Gm-Message-State: AOAM531XxtLl/8YCY5dukacLfUrEmCm64HZ8Fts4AbiylTnrTyxg6h7J
 PBRzx4etLujSLhq3XbS2xh2ua9NXGKEkNg==
X-Google-Smtp-Source: ABdhPJwA8glHF2o8gJIwe1AHpNtIiT3qJLJPfgwGYCFHHdbGEsfV0Opipqz3LAFdYZU+01yM1qdGTQ==
X-Received: by 2002:ac8:5e0a:: with SMTP id h10mr36257566qtx.195.1635851477537; 
 Tue, 02 Nov 2021 04:11:17 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 60/60] linux-user: Handle BUS_ADRALN in host_signal_handler
Date: Tue,  2 Nov 2021 07:07:40 -0400
Message-Id: <20211102110740.215699-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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


