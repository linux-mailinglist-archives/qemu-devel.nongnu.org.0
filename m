Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C044433B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:16:44 +0100 (CET)
Received: from localhost ([::1]:54906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH4F-0007p5-KQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwi-0002A3-LD
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:56 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:45845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwg-0004yL-BH
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:56 -0400
Received: by mail-qk1-x72e.google.com with SMTP id n15so2335781qkp.12
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1o19N/gk+PXUbK6jyFXquvR0OhRPiuwQnhC8c4hu1vw=;
 b=JJUr5FC7hZ7DKtjnSHUU5Qb8R0OxgQKQHQfD2L8og3/u7HMv5merNjuxDIOVwA7umt
 IlTsoOibsgilWhDohCLkytIrgsmka1+hPKtuihpT1YUD0Bo06uHEe4/3tOcopbIEtEIp
 SqpjivER7KL+K/GDl7tzGLhprxEP1k1flYkdJQtSqTBO5lcDkyJ3ic82sPy1OEbB0eZb
 VN+nXcESRlbc5mWlu2lB4qp1ptuyPUsAO4CHptJIKqUSsmH3LChriWU4avD05CCnqJ8g
 wIyjlmUffZSYYfuGhHahxvt7CP/LQtx4rN0yCWO2og4AgQ77MCsuY4kgOJcTKhY4kd32
 jxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1o19N/gk+PXUbK6jyFXquvR0OhRPiuwQnhC8c4hu1vw=;
 b=4M8GmR5QZZ0ZhZ9PI6ftj6bOcnNiauUSY4vDit8CNz6Z7vhrwRkFt9J2wS8x/sktmW
 3Hh/vhthKvJiiju2dm3ql91WSRB6pZvTQbiat0TXEUdXvW1hriv7sDsIJZC6spXzUt4C
 xQc2ns4TjLjaFeOUtmpfiUE/otZlDvRNnUNc1qmH7gT9g41+6gUJ+YGkGDV89SfepKUu
 MUpOGq5DvkP0jj0pQvJA6JdlPWIBFRPHHg7wUrVHO3yA+JPyMdJ4yUoHeVY4h99hgiwc
 Hezu2NIA4VnpSYfuNfzKBWrz6CaOLJ2N4ux0MLoJRZVPxjb4itv71zssFZH3lxrkKrmh
 S4lQ==
X-Gm-Message-State: AOAM531/1GjY+xOa/PJwSnsAop4vwQJtB/VI9CZqOFDc8djaSEwm2825
 n/+HYkfUKUPhtFB+RGL4sWZmWNx2DNjHOw==
X-Google-Smtp-Source: ABdhPJxrrPvgcvihLyIQoDXxLXnwBnEa9eyL6oKciacD9gYDmLE6c9Ow2uBImR3gWiihZE49m++dvg==
X-Received: by 2002:a05:620a:448e:: with SMTP id
 x14mr34639705qkp.406.1635948533408; 
 Wed, 03 Nov 2021 07:08:53 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/23] linux-user/hppa: Set FPE_CONDTRAP for COND
Date: Wed,  3 Nov 2021 10:08:31 -0400
Message-Id: <20211103140847.454070-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 75abf64287cab, for linux 4.17.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall_defs.h  | 1 +
 linux-user/hppa/cpu_loop.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 55ccc6ae03..f9efbffe0c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -688,6 +688,7 @@ typedef struct target_siginfo {
 #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
 #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
 #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
+#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
 #define TARGET_NSIGFPE         15
 
 /*
diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 8e13f84a64..c33a59fef5 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -156,6 +156,8 @@ void cpu_loop(CPUHPPAState *env)
             force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->iaoq_f);
             break;
         case EXCP_COND:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_CONDTRAP, env->iaoq_f);
+            break;
         case EXCP_ASSIST:
             force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
-- 
2.25.1


