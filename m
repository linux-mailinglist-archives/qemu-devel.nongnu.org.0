Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B85A8DCD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:56:47 +0200 (CEST)
Received: from localhost ([::1]:46852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTdC2-0005s5-OW
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4Q-00073y-Lo
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4O-0002T6-Uc
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id u17so1590833wrp.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=onqIs+XT2WZfG8WtGyXgNUrHr/Df9zcYrXD6nOSwGCs=;
 b=uQBW/8tnJAsg7rFDlHOWg8jdifLXntZjgajxOcGQzxgXtKIlJcCDNzwRMMOh5hVFEO
 /IwhD4Cs1yVahJXjiIm2G4rKb5M8xc2mNOLDPbX4gLV2GlDc2csrDAKApWw7qUltPpYr
 Jw0PWiHGhqfcXpM5d4TllpA8xGMDrKtB/zmDymTQwSTDAoNyaWObb1FztG0/1aAK/Cmz
 Q8xuWNhJt/ux9jgfrkyryunPABrvC941pzlo+shDPP/JsBF+saBcSkbWeDBC/lGz1kap
 l5av28iMP/kSWW1WMsmGN8ukET5dVPTU9UtYBCSJ+xn0DmMi0WY+UVtUT5lYBkL+pPAj
 QHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=onqIs+XT2WZfG8WtGyXgNUrHr/Df9zcYrXD6nOSwGCs=;
 b=jUqfocP8rApcfVVPQtOfOPDnjohAgUWhUmjzpsBuO2hs8LqyXG3nIy1B9SVOvPxUpI
 gG5zQm963tXBzXQbYZi5rlwhRBcfiG0cbOWKS7493JXJWJ3ACrs7bRSPlTq4zc96KhQB
 ZKvHdb1pvNsq/PCxYUNaxiTC+pj21r0BlkYX0Anl8oXnzsBI9FobhwdoOEfkeqga5LKk
 7cT704/Y+YEzuY5UfRYIal2eosWl5emFwCMflgA8Us3+EyyF2x0FhH14vmcpf3asTKxr
 xUD3B95fss63UKYFdNXmaGeqEoL/BcGflx29V8xJzL3sMLLYgdamifRhBoElZKknXy+t
 2ZuA==
X-Gm-Message-State: ACgBeo0fvcmgCC9ENJjMU6UJD4S5FNzeJ9xLVuFSkTpmZgmBiYrBz6lQ
 n710/5FIDtTBr/w9bDYk+W6Zab7BqCYBc5ljGk4=
X-Google-Smtp-Source: AA6agR6jj1H6feEsnHI1f0s5B3aHD2Ua0G3phEohnQbqXy0YiEAlZuVjdleFC+obN46N0yl8FlaHkA==
X-Received: by 2002:a05:6000:1e18:b0:226:e095:a98c with SMTP id
 bj24-20020a0560001e1800b00226e095a98cmr7087054wrb.235.1662011330233; 
 Wed, 31 Aug 2022 22:48:50 -0700 (PDT)
Received: from localhost.localdomain ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0022533c4fa48sm13429938wrp.55.2022.08.31.22.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 22:48:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 3/4] target/avr: Only execute one interrupt at a time
Date: Thu,  1 Sep 2022 06:48:42 +0100
Message-Id: <20220901054843.31646-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901054843.31646-1-richard.henderson@linaro.org>
References: <20220901054843.31646-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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


