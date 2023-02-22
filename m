Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543C69EC9E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:01:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeQz-00036B-V9; Tue, 21 Feb 2023 21:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQv-00034W-QH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:37 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQt-00014h-T0
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:37 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso687071pjv.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKMBaWZBGONH22d4GZ6aoQ5NI2bVoqwHKZG9lz4sA9s=;
 b=r+sIy3KcSW8Yd6RILWmAHzlhOA/Kj2ahEyRX1w4+Tq1mLxfiRJuhoJB6zyjnSFLINr
 AzBAVZa+KorRc4HYL6948qwpZet5LGeS34YRU/wdbzvmD6/0IpY5THNXaV55Xrjq8JsN
 7rzRIl/KJBSco9Oun3HVwl1IAUQbBNZ2lsQbPz9FqsmSnoVY1PU8ysjQWJ8nxNgZVrb9
 Wu78/Xt4WqD4+XI+z8HAGkO4AiiWlby7UHlHWRnc4XhlMfUSbgcUlry0t9biiJzE2PvU
 0QLOU0n4wtt5KewdTZPScwz30SEu7ObYUZ+cK+o8gCpDKOAlxPBNh4Vc5ly4mnzn1RvE
 A7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JKMBaWZBGONH22d4GZ6aoQ5NI2bVoqwHKZG9lz4sA9s=;
 b=tF6+UK2YMBBFxC8doQ7Ia8KqTbHrbKvInDXHMQPU3m6gw8Sy1joFwD4/WQUxwnYAPX
 gIx1MoMFczDfeTGixEMkoRbx8RFglcSL1hq5Fn0X6+ajTBqfLudpJOBTsJHhUD/0JmuE
 gv87tdrJNgZTQ2pqIIK1T6QYJIo5njyyB6yc9OT59L89YOstrFmwz9TK8ND8mgYgTJQk
 NSy7uRSgtYYDTurvp8soe5tuSlOhZdbmFGQYo3PnHfP0zftYhWjDaWdn9M8AaPhchpxm
 aNmCGFyTPixS5peRz64YiXt1zByNGw8uSSf8Dj2pBQrRTJv7yN30t+JZdS8LtWyP4au0
 CMtA==
X-Gm-Message-State: AO0yUKW7/Ngh4ZZ29ADug8aS9KgfbZ+mHMyORnxorsTbdc3DcQnk6ds/
 g7YVkqYZwTBCeERGMjr07QrxGR4BXAZmCYKR+5E=
X-Google-Smtp-Source: AK7set/0tF4vWKX3PSf6vkMv7R2S95Nj5EZ2khLbvVZEf6eeL/U62lPK13QvVxjKF8jPrXZdlTZdbw==
X-Received: by 2002:a17:902:7292:b0:196:56ae:ed1d with SMTP id
 d18-20020a170902729200b0019656aeed1dmr5162060pll.69.1677031234385; 
 Tue, 21 Feb 2023 18:00:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v2 5/8] linux-user/microblaze: Handle privileged exception
Date: Tue, 21 Feb 2023 16:00:20 -1000
Message-Id: <20230222020023.904232-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
References: <20230222020023.904232-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


