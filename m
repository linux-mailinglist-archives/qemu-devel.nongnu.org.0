Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8E3F3D76
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 06:09:32 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHenb-0008Hk-Va
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 00:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaV-0007vO-QZ
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:56:01 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaU-0000od-BS
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id x1so5651601plg.10
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XrQegvQ52g51iXxP1ir/2vDYcsxCC4+2/9p/CuuRamw=;
 b=eYaXYCpdmhTQzkbqpVAqtILN5KqU1JrfJYNZhTfR1lk9TQlIBqoPAslWSuyiavJQwD
 HjYO7bMXTiUVJzkfWyKeR6iWQPTwrj/PxEpjDHxjrmsA8tLRFUQv8VcAmEV98jjW0cue
 oMucg5rVDTGejNoIfBETnrtYiCOi/GfS4xO4U4syCUbkbwEWcZ8P2aKGsaaTRkDYl/RK
 W36Vo4q58MOJN3ZfyUmDiM1rjmbfSX4i9N4VrxgIBLN7SvHRxDgiW8SB70WjQ4uLhfOQ
 kSzqaw8EFbRbO8X9I5u4K05PFZexE5QjyDYTvSnRop61EOBEriLvLXH2APFx6NUxhoWn
 h/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XrQegvQ52g51iXxP1ir/2vDYcsxCC4+2/9p/CuuRamw=;
 b=Ux0vsZVa3ZyZvJGjzTZzAe4Mvq4yquzpEPn60ekZ434nrc9B/NQGY6DXd+wyYpX4CA
 bjT6Zzd+YNFc4wXBKM0UKh9QUiSFmPBYqEKiKjp2I1Sk/vwLC/FOCKMoRr8gDwb+kJAn
 +5LdEipVdDdmhYPR9Nhu6/059ooqiQaL21NrOcdyQd1//533zQ2BhXnCAc2vk7W2Q8r5
 NJS8ocEjMVWikWWhHuo/xWUbaj6Ym73gbzNMnVKkea4e0gyPGGs2liuVJrlptgycS7dS
 dseGjALGamKiFDqgRCoNGCIy4+0PaiMT5R6nzABLItuTBy9lRNEgft9G7CMaKrdgogkO
 +41g==
X-Gm-Message-State: AOAM533AJXOTBxyn9CpXu8aKFIfLhLKK0PvBEOd1kR619pArvhWQaZdo
 s0ETKhen8lzAGHxnX8GuS9P1Wq4/y9LqFA==
X-Google-Smtp-Source: ABdhPJzSM2rtYEgNxQSWcCX/CvlTwJtUKE6OGyxbi8I4oywTQBZ2RfE4kQmwIGhg5e0CIeRn79rTpg==
X-Received: by 2002:a17:90a:8005:: with SMTP id
 b5mr637562pjn.190.1629604557070; 
 Sat, 21 Aug 2021 20:55:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/30] linux-user/sh4: Use force_sig_fault,
 force_sigsegv_for_addr
Date: Sat, 21 Aug 2021 20:55:35 -0700
Message-Id: <20210822035537.283193-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822035537.283193-1-richard.henderson@linaro.org>
References: <20210822035537.283193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new functions instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sh4/cpu_loop.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index 222ed1c670..0c3ec908e7 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -21,12 +21,13 @@
 #include "qemu-common.h"
 #include "qemu.h"
 #include "cpu_loop-common.h"
+#include "signal-common.h"
+
 
 void cpu_loop(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
 
     while (1) {
         bool arch_interrupt = true;
@@ -58,18 +59,11 @@ void cpu_loop(CPUSH4State *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case 0xa0:
         case 0xc0:
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            info.si_code = TARGET_SEGV_MAPERR;
-            info._sifields._sigfault._addr = env->tea;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sigsegv_for_addr(env->tea);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


