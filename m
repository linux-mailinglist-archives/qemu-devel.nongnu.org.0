Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EECC5A8F6E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:12:47 +0200 (CEST)
Received: from localhost ([::1]:52862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeNQ-0003XC-Id
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe45-0005uy-P5
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:45 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe43-0003HE-PJ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:37 -0400
Received: by mail-wr1-x432.google.com with SMTP id u17so1743649wrp.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=onqIs+XT2WZfG8WtGyXgNUrHr/Df9zcYrXD6nOSwGCs=;
 b=j/ArPmNDqu8+dbWrYmrB1qzxQNRhwo4Yjcdj3flzD4J3lugNXFQ6wSHnD8W9g6c8Od
 MJgwbakGwCGqeZDr3r3yxyTj6d3SYmwNTvEa+Bo5oj5TEGQ/G5OgkwhyKPY+UyPVYPNu
 Ur4sM8oWgDWEKfqtQ/pZW3x5nmiuOvgEoUAPGVrL+Hy+QUyWABViiMpB5A1WTaoDKpjp
 49lu6oPygRmaCj+quhdhOtXTAiSWnUjCJN8ldge//FHNBpPhcjFuWPmtNW1BDHaJjTm7
 3IKKxPZJ50dcEucAprc/C3KbuuzYnVXb/ZnbYNm2n4+Ux/+t3feJfcQJGPnbJ/Ag2Ynu
 fdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=onqIs+XT2WZfG8WtGyXgNUrHr/Df9zcYrXD6nOSwGCs=;
 b=1BQztdn51AoT7dnUm823c0w+lNeqW6swbvsVsC0cjyE5vaoqqInSAVe+6CiI80non7
 P5fFRCAF/9Z86Zv1qltwKdFLI6Gh8/bqyDzdOt2xQyNkGRmbfwYetEcbUGFt90iy+4fZ
 rP007fIaykpsNhyflRdf2pk6JG0Gv/g4RqzCVLGo/iSwJFK1Lq0I2QWqhWx8v3lLdwZl
 4kNwCbu6OEdvYFUJtwPxXXhEjEjSm3Un5kh0JHFOX8jOdWanZ9yQOAVaZU55g72eOvna
 cUJDevQm0QLY7oE1CqL0eJwyFsdfl0L08KLfdZFtBmNdBcaOu2XbbXERQI4cfJvCtbGb
 /I9w==
X-Gm-Message-State: ACgBeo0MO7157Sym+xpDNt4CYFh8NVi2QwjsMmg24Pwi3yL2UpSHZzyU
 +ejP1z0Xby6NXfTzxoHw0ErVFRpC17pjRoNJ
X-Google-Smtp-Source: AA6agR7+6xQwEt4RkfJIxf6RhS5w3+E6KvfuBuh9b/zyMeTqy8uGDa263N3ARu/6DBOTbqvKa8XDlA==
X-Received: by 2002:a05:6000:1568:b0:226:e2d0:abcb with SMTP id
 8-20020a056000156800b00226e2d0abcbmr6885447wrz.456.1662015153685; 
 Wed, 31 Aug 2022 23:52:33 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 3/4] target/avr: Only execute one interrupt at a time
Date: Thu,  1 Sep 2022 07:51:52 +0100
Message-Id: <20220901065210.117081-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

We cannot deliver two interrupts simultaneously;
the first interrupt handler must execute first.

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 9614ccf3e4..34f1cbffb2 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -28,7 +28,6 @@
 
 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    bool ret = false;
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
@@ -38,8 +37,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             avr_cpu_do_interrupt(cs);
 
             cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
-
-            ret = true;
+            return true;
         }
     }
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -52,11 +50,10 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             if (!env->intsrc) {
                 cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
             }
-
-            ret = true;
+            return true;
         }
     }
-    return ret;
+    return false;
 }
 
 void avr_cpu_do_interrupt(CPUState *cs)
-- 
2.34.1


