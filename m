Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FEF5A8F8D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:16:06 +0200 (CEST)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeQn-00072P-Uv
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3w-0005tI-VC
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe3v-0003Gc-A6
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id n17so21007773wrm.4
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=pnrkcB7u5z1U6ZLIT5ewwpikaStb8NPbw7XF1+tgjNM=;
 b=IdCIzWwsBBxT4n1uUZukAlpHIRx1mAUESF7XAocOL/1ZkFZYKXgm/CIcngpWJOw4Qg
 4/18t5zC2tXX5JuyDeyn6JvNIKX4rLJA9u4eI2FzBKh1O0ypodrsHOJbsNLY1XL8uhec
 GVKLcfOaqyovMGQ/O62W/IB9b5IRfpdonJb5lZsTatf2MK7jqQVbUJKL5VlKS3k6KL7F
 GGXCkYNp8ZnmLpDSvwEmOT7pKuWO3mRJCt+tK7hmXcAIyA3VODkgjqWnShCMcBTFreBB
 bFaG80ky+QMv1dtZNdT4FGYhGk29O0cMH+UJJ1lt50Bv9DVMR/K/ZNOegam4nXMMg+JM
 v1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pnrkcB7u5z1U6ZLIT5ewwpikaStb8NPbw7XF1+tgjNM=;
 b=x4lPUM8XEXg0PfDdYfAK5vsqPsH+xLqhVWpvu/BbHD+mTnQXnXpyscAoFQDupd5gKW
 nmTrvsZtd7KQ/xyTS07bEKLUGLDvUnZSHXULSe6Odarly0pJrHJajHoKspgHMGE/7brQ
 RnjJEd3qA/HyAHWhauYIVK6VN2owSpwm1fFKjUPaasOYrks8mk4FlVtcKWwY7IAdEWp7
 bPhJyoZKXc5uIgpe3b9af/B1QKL2Fto5jETIvOWj3JWi1w/UMQpJVtlpFbFf0wFbWj49
 s8GbnnWNQssqN1xmiwtvacAi/DJbudaX4kqu5Il/0CJWphblrI/Vn0Qngjhoig1/soNo
 PkMA==
X-Gm-Message-State: ACgBeo0Mv+rAbRlJrwaHrFE6pMwRU1qCatUULEste7s2QYLLklxfJvMM
 N89xszJwqO8SVdEi/8J4iRDlGMVbAARzUE1P
X-Google-Smtp-Source: AA6agR5sK3jthDMNd3vbsAdtpTbsk5jdu/k0/Nb+RSOGwExl2fuPE82mQwLeuB8f18SOz6mTK1maMw==
X-Received: by 2002:a5d:47a1:0:b0:226:ebfc:f759 with SMTP id
 1-20020a5d47a1000000b00226ebfcf759mr3592783wrb.636.1662015145864; 
 Wed, 31 Aug 2022 23:52:25 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 2/4] target/avr: Call avr_cpu_do_interrupt directly
Date: Thu,  1 Sep 2022 07:51:50 +0100
Message-Id: <20220901065210.117081-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
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


