Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F36D5A30C1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 23:01:25 +0200 (CEST)
Received: from localhost ([::1]:40240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRgS9-0000dT-Vy
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 17:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMQ-0002hE-Dn
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMO-00033N-RL
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id jm11so2552740plb.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+qYqXrLsLw0dcBJ3rsNbWS6QwV4sJttAiucTYyfmq0U=;
 b=IdZAK73p9ijbs9jb3vE2M+5SK5cV4rkJRtyj85cwPrmOwHquOiFHb2YlkQRsuNCuB9
 xNes7Pj7hkCf2liLO1n/eje7p+8ncG1RUVRRvY3IfvFdXCQx3u5Wksj3cfPNDy1aq2uU
 Mx/KyH++wcl2LqF7JoSy2kSvJXwI2u1+xaGVQmSlrUkOcdHh6Ms3g+Yiu4xy5vxx7AWS
 fI3bHsuh2ePCh/WVbZhIpZDW7UMyZ6wUbBr6d2WY5BBoFB1tAnHGxpUYiHoBq74AryhN
 4JzzaUwBBAW6dqFavy0jv1Y2NJXu7JmmSBFzGQeLrlnHghL3uVijd7+Yrb34BPVsKRaF
 73eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+qYqXrLsLw0dcBJ3rsNbWS6QwV4sJttAiucTYyfmq0U=;
 b=0/wfc9Kjh0Yq3sai+/MjI7iwyGzORdzdJS1h2GLXrdwQb6ZhwjBdXUszIXYzNoTRst
 uq6F5KraS8PlRYA6ZrlSL7lf9Lhi3eL9vaRVhX/5PRdi3u3+pX87koNi0Mkj9PNOxCcK
 lC2/bCvccdrLpckOPZsqY6L4p1sc4akjrjFPIeqbsQenJ8qaWkL4MQ+Wmkd566zXc1Tt
 945BAL/hhEBSivmqSF09oJFSDRABqL4OTRTpHBM+47oeTFahkfHBHVQF63zHR4IZNxY2
 DB9FBd+1hWao5Ax8Ak2jbU0BxXosLBtmnwtDy51GZcg1YBVBH7dI0tEXUgSZi2LRc2va
 2OyQ==
X-Gm-Message-State: ACgBeo2jlpiCyEkx1SqMdhmVqsr1G7MqXPs6WmnWFWB+fE2Pb/ZOA9t2
 Gw/NhZuIdN7C1fC3AWmi3SX5Hb4FsMnwrQ==
X-Google-Smtp-Source: AA6agR6UFXkuOzC5RbAWHZ7KktaEfaJy6ukrFJ7Z/hzRsHZWmRyN+YP0yWV+MwcQNM17MKUc+1AEgw==
X-Received: by 2002:a17:902:c9cc:b0:172:e18d:4703 with SMTP id
 q12-20020a170902c9cc00b00172e18d4703mr5399539pld.41.1661547323062; 
 Fri, 26 Aug 2022 13:55:23 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902650b00b00172a567d910sm2009900plk.289.2022.08.26.13.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:55:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com
Subject: [PATCH 2/3] target/avr: Only execute one interrupt at a time
Date: Fri, 26 Aug 2022 13:55:17 -0700
Message-Id: <20220826205518.2339352-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826205518.2339352-1-richard.henderson@linaro.org>
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


