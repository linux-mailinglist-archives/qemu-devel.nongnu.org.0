Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D75A410D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:21:23 +0200 (CEST)
Received: from localhost ([::1]:55950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUOw-0001Cl-RO
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEG-0003cB-Be
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:20 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEE-0001dS-Ol
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:20 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v4so6433559pgi.10
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=55VT9o/tNovUP7KyBCwm0gq6nWLk3JJV6wEPVewGesI=;
 b=zuQrGBgFmMCQ4pX79kNUORVWR0cViTr22oZUZIwMhmkPKkCUDJMId08BiCFhrqNG3N
 TvVvkr3a2yrB9P2fUwM/ty9+60JeT2U0roSYx9t9vNkS9frvxvwtbZIJyI/+Hb6d4YUS
 3XP7cFntzpvM1u1ewsNBqaETzYS8iq5TBVR5ChSY2eaMdtYbSFZVoXJfJYWHj17zKI23
 mr0AXjTZLkHR/MTlxmx91FTGMnGURtQ2Y1ol3MJyRntjQlkZs+GYQ+75YON4Uh0rmSC8
 YJVIqd+n1m1zNY1gLo1g94K7rfBe4v/FONyLFT9/kTwS1/WQaqJfp5Xv2AkK9GS7hVZq
 BM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=55VT9o/tNovUP7KyBCwm0gq6nWLk3JJV6wEPVewGesI=;
 b=P/WX1D76C6T9ARnQ5FvRgKktMAq54AX/A0SA13CtGDdLwcm0vRHDnz25FwTgCHpJMd
 b1DVWcuknUd71QVNUqSA1G/rSRNr2Y8D1jKaW+gzaLrdQmtf8jL7FD/Dn89nikzFX/tq
 VZxoTLVjnF3huTbrCtsdKcFBSP3rkogRU4Q4ImqLGe+qTIEE3R0tLbG/vuskw8bt413H
 uUqw3qXhfBlymGOMmM4es6sf8wrMo4gLqzEO1S7ICO4/gHMuvM/m4uyYdYmpJsrL+8eR
 EAvRlpe/GSN0r8anwrBPpKgIzQNL3lDDZQr+fFIxGhRB85TXnBbc15QcVsTq7WcgDW1o
 fINA==
X-Gm-Message-State: ACgBeo1LtlF3HUtpBACNHQ45fy+9SOZtEkiQdYnJ6Z6TH2ADoLMhp6GQ
 3BQ4UzK3tyuh3ZtrV+hziE1cuza8Ohu+6w==
X-Google-Smtp-Source: AA6agR7nzrv5NyJHjevcA5q7kPGGTbkuFObJ/m2c67LGu2yEGL6EmbbNRPuHIk4AaE0OLDbIH7P81A==
X-Received: by 2002:a63:4e44:0:b0:42b:1fff:72d1 with SMTP id
 o4-20020a634e44000000b0042b1fff72d1mr12355972pgl.432.1661739017405; 
 Sun, 28 Aug 2022 19:10:17 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 8/8] linux-user: Log tid for strace
Date: Sun, 28 Aug 2022 19:10:06 -0700
Message-Id: <20220829021006.67305-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Printing the same pid for all threads isn't helpful.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index c47d91bb3d..ca9d44fa7c 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3782,7 +3782,7 @@ print_syscall(CPUArchState *cpu_env, int num,
     if (!f) {
         return;
     }
-    fprintf(f, "%d ", getpid());
+    fprintf(f, "%d ", gettid());
 
     for (i = 0; i < nsyscalls; i++) {
         if (scnames[i].nr == num) {
-- 
2.34.1


