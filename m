Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE59E5A8DAE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:53:23 +0200 (CEST)
Received: from localhost ([::1]:57240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTd8k-0002mW-Dd
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4Q-00073x-Jb
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:54 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:53974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4O-0002T0-UU
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id h1so8419697wmd.3
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=pnrkcB7u5z1U6ZLIT5ewwpikaStb8NPbw7XF1+tgjNM=;
 b=n2yKUHL4xzO1KEXGfD69/ymDMQyfWukeU0brel/elTvsM492ZK7qvu+RnPGIY0/y72
 B/VuuFZTFXBTms2LtlWVVeYLyUxQg98Sgw4Yt78Gyc32KRI6HhXK/CO03MLQuSAT0rVD
 x83h7i58rGEvLSuGbLf2ghyQ9nX2hYcBR20I8fBnc2E6QFs8CmcpUWxs1HssjAfDsQ0X
 kQj+ncFN76PgXafSwGLamXzsxIdaAmzoqS29yXZwTc0v1CM+taTrSyvyHLkOM4cQlL4L
 65/buzc/APq1Mj6ZmND345Famtg2c0nlSNjUDHa805RZcJUembWFgur8d+JDi/PBGerf
 /FAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pnrkcB7u5z1U6ZLIT5ewwpikaStb8NPbw7XF1+tgjNM=;
 b=FLc6YAWOnHTxQxkJhX2+MhSnIsN4nQKzszcao8pksFHHe6p10X/BpiotPS5G6PZTV8
 MIr1JsmVQYP6KgkCE7lcpamFJZOhNNbI6nGhVGiiF6LTZixONLNvZewTojYjua8TXzA+
 ExHEyw3a74kgokOJWJryAwxt+bi6VH98T1VO9SY/5rdHhwgsegGS489cBXwBBTX0g++M
 PXS1XZGzJg3uOQn91f/ZVlH5aihxyElcUGdYEjzxChCp012q40VifoFj/ccf/+Z3gXss
 gt08tWEuEQHCXxhiC6hPtsyxrg4NXP3OQBQi/t1Ca7ehtGiXjWAKjPNDmF0jOwCAU6bi
 EoxQ==
X-Gm-Message-State: ACgBeo1J2/boDob6GziQT3I7hGDnjEAPwnsiKfatm5Lw0rawWJJfprah
 75F2YrfdspH2T5nCNjpz5Mn7+TIoHb/uM+nrR1Q=
X-Google-Smtp-Source: AA6agR6uGRC9XqABAjTtN3w6olO2yzygqAEciFeRlVJribUeW0xwDWly126hDrvbJ+M+ez4FuN8Efg==
X-Received: by 2002:a05:600c:1c1b:b0:3a5:e6ec:d12f with SMTP id
 j27-20020a05600c1c1b00b003a5e6ecd12fmr3947993wms.2.1662011328941; 
 Wed, 31 Aug 2022 22:48:48 -0700 (PDT)
Received: from localhost.localdomain ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0022533c4fa48sm13429938wrp.55.2022.08.31.22.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 22:48:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 2/4] target/avr: Call avr_cpu_do_interrupt directly
Date: Thu,  1 Sep 2022 06:48:41 +0100
Message-Id: <20220901054843.31646-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901054843.31646-1-richard.henderson@linaro.org>
References: <20220901054843.31646-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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

There is no need to go through cc->tcg_ops when
we know what value that must have.

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 82284f8997..9614ccf3e4 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -29,14 +29,13 @@
 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     bool ret = false;
-    CPUClass *cc = CPU_GET_CLASS(cs);
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
     if (interrupt_request & CPU_INTERRUPT_RESET) {
         if (cpu_interrupts_enabled(env)) {
             cs->exception_index = EXCP_RESET;
-            cc->tcg_ops->do_interrupt(cs);
+            avr_cpu_do_interrupt(cs);
 
             cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
 
@@ -47,7 +46,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
             int index = ctz32(env->intsrc);
             cs->exception_index = EXCP_INT(index);
-            cc->tcg_ops->do_interrupt(cs);
+            avr_cpu_do_interrupt(cs);
 
             env->intsrc &= env->intsrc - 1; /* clear the interrupt */
             if (!env->intsrc) {
-- 
2.34.1


