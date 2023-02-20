Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A869C477
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 04:25:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTwmU-0001BK-0t; Sun, 19 Feb 2023 22:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmR-0001Av-SS
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:55 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTwmQ-0005qm-9T
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 22:23:55 -0500
Received: by mail-pl1-x62d.google.com with SMTP id q9so2040325plh.6
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 19:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKMBaWZBGONH22d4GZ6aoQ5NI2bVoqwHKZG9lz4sA9s=;
 b=YzdR1yc1S5JYXOoNhpa9IxLl+hTme/WPpNSeOnX7jn5L+WlEW8z0cGhTh2AuSU9Lmx
 /ZelLEGc27P7c6edAhagPR/pkuTg+BKXPdiE7nTfhHI94SBIIk4m4eeFhI7gP7i8sic4
 h+k8Iuvq8AgaSuEUTGNHVZOr9Z30O5Vhp6FaIX3j4WqFvK+Za/PV6Y6pQanEfgS+ZKjX
 VSx5m4X+h2KdUuDWrqzP66WT/+hhB4Dn3BArk7J/VT7gq3Z5PmSeM8k9BMo8Yv02u3f4
 z7Qx/pljY+BH4si1CMbT7RYzXbXeNFzVV+6rE8b/OHFzj3vmrb48zTGoqpumSOosOLZ5
 X3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JKMBaWZBGONH22d4GZ6aoQ5NI2bVoqwHKZG9lz4sA9s=;
 b=f6Xp1cfb8LyE8kW67fy5VR3vEJwLqyj3RVss7Pi9ekLiNvNfCGlnAxJdYFF6LdmMx6
 2o9RdgSo8FFGE5enj7qE1SIdwIEX53PMj3iWs5PhmF0FodfwGhskvGD6Hd8cO6/TITEo
 KWvS79+Jt245M/RrXvciduEFI0jugxr+1Bn4PTWPxnd8l1/dbHG+wfWLoWFIig0YJQI2
 ZAkPZagMQNLvGM3m5Z35GLIflPmVAuZ24K6n3WDjpmYd07FESgVlfsE/OfFhRYmG5d8y
 XuCzrVmbFWSLpoLvaYXOX7nFNGa8nvbSfTLygWCKfFJ9jRIkVxdYjFlMHBzp7j6hsmzK
 d9aQ==
X-Gm-Message-State: AO0yUKWQ0VJSjRDuO4kXGMrUIbJogLjlN220OsIdVKZ0B3mqwbMC7uTd
 jN8zkk07N18bdp4AlXq4RE/57bQtk1N21UY0V28=
X-Google-Smtp-Source: AK7set+Niry9fD+EnbLyc85zeIfBCcBQt3oPYPodUd3kzGPwSZmS7NC6R+fpNpszKAVuwg86y/HPqQ==
X-Received: by 2002:a17:903:790:b0:196:f00:c8f9 with SMTP id
 kn16-20020a170903079000b001960f00c8f9mr2348490plb.10.1676863432905; 
 Sun, 19 Feb 2023 19:23:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902d34b00b00198e1bc9d83sm6621302plk.266.2023.02.19.19.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 19:23:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 5/7] linux-user/microblaze: Handle privileged exception
Date: Sun, 19 Feb 2023 17:23:36 -1000
Message-Id: <20230220032338.5619-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220032338.5619-1-richard.henderson@linaro.org>
References: <20230220032338.5619-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Follow what kernel's full_exception() is doing.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20230214140829.45392-4-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/cpu_loop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/linux-user/microblaze/cpu_loop.c b/linux-user/microblaze/cpu_loop.c
index 5ccf9e942e..212e62d0a6 100644
--- a/linux-user/microblaze/cpu_loop.c
+++ b/linux-user/microblaze/cpu_loop.c
@@ -25,8 +25,8 @@
 
 void cpu_loop(CPUMBState *env)
 {
+    int trapnr, ret, si_code, sig;
     CPUState *cs = env_cpu(env);
-    int trapnr, ret, si_code;
 
     while (1) {
         cpu_exec_start(cs);
@@ -76,6 +76,7 @@ void cpu_loop(CPUMBState *env)
             env->iflags &= ~(IMM_FLAG | D_FLAG);
             switch (env->esr & 31) {
             case ESR_EC_DIVZERO:
+                sig = TARGET_SIGFPE;
                 si_code = TARGET_FPE_INTDIV;
                 break;
             case ESR_EC_FPU:
@@ -84,6 +85,7 @@ void cpu_loop(CPUMBState *env)
                  * if there's no recognized bit set.  Possibly this
                  * implies that si_code is 0, but follow the structure.
                  */
+                sig = TARGET_SIGFPE;
                 si_code = env->fsr;
                 if (si_code & FSR_IO) {
                     si_code = TARGET_FPE_FLTINV;
@@ -97,13 +99,17 @@ void cpu_loop(CPUMBState *env)
                     si_code = TARGET_FPE_FLTRES;
                 }
                 break;
+            case ESR_EC_PRIVINSN:
+                sig = SIGILL;
+                si_code = ILL_PRVOPC;
+                break;
             default:
                 fprintf(stderr, "Unhandled hw-exception: 0x%x\n",
                         env->esr & ESR_EC_MASK);
                 cpu_dump_state(cs, stderr, 0);
                 exit(EXIT_FAILURE);
             }
-            force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
+            force_sig_fault(sig, si_code, env->pc);
             break;
 
         case EXCP_DEBUG:
-- 
2.34.1


