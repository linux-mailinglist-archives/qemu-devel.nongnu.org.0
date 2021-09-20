Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3F0411774
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:48:59 +0200 (CEST)
Received: from localhost ([::1]:53874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKbK-0004Ux-BQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9U-0002jz-4E
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9D-0000nO-PK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id q26so30174244wrc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ENrAKgrxyRT60mcqAWs+XVbaXYspvJoX4HkAmPHvGCw=;
 b=WWgA1GEjHRti9qB/T4SNy2UeThzhXkNF0xzio5LDieZCCTUj15wOPHLfUOLJibVVui
 H86XwBpiiYmYbT+ni+WSfrAbVbQxlT2EIFu3ZQx/Caudt5n0jPHlXUCPeTrXpsgPOXZB
 ruznNk+frdpxTL+wADSr+7+a8cnl7QnDnlvc34kG1uXGw3dMBEkcE8gzM5RyjqUOWsfK
 5jcOA+LbVBta4idZo31RYW2M8iAV9gJUlwJA0QNSA/upH08EegwM233qDh63xAsgoy7X
 iffryoBhitUFo2lrvwZFoOEZerBDMNGOmyC949ijxa8uEAVmyZavyIAVYmVek6+zuvtB
 SHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ENrAKgrxyRT60mcqAWs+XVbaXYspvJoX4HkAmPHvGCw=;
 b=cULRuvpaRV48rdgrof3T19vdIw1Nz1TJdXRemGJWGgOfhPUhzeASZR7LAGlisQu7bl
 1NXPypWYYUNGQst7qqsQsSR/LdiKMY5PEufYtdp7WMLbYTVTcSpuQr+cepGufKnoKq4x
 ugWgNCHw+CyuFmE8zLknKquKYoBE7gxT13XTChjmqPHjZ2jT/c1Dv+aQA4RLYd3AXczT
 1c1hyHZHJOWUYwxbRs8mjMjn5nhykhh7IkGx/kdafeDv1p5paYr5S3x+2KS8eozmb1qT
 /j9bk2C+0HXTT3j4+xnLq9rj2gvzQ4TAOUfID0QaK+i8Fhxw3ZOOPCsLGNl2bHX4xaEM
 ervQ==
X-Gm-Message-State: AOAM533G7MsWd2VonBk7FGix/xj+zIMAg0taVjyTkkuO1dAWajhWyiAP
 EzaI9yNpotL0sEIlw6d2f+++FadMzxSqtg==
X-Google-Smtp-Source: ABdhPJx6zjjVEm+hem5jptQUgMu4ImH1dHzI0YTXdvo1g+34vTHR7YKv6L3eihQwnxCeQooqqYnIXw==
X-Received: by 2002:a5d:6cb1:: with SMTP id a17mr28798962wra.72.1632147592191; 
 Mon, 20 Sep 2021 07:19:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/27] target/arm: Always clear exclusive monitor on reset
Date: Mon, 20 Sep 2021 15:19:24 +0100
Message-Id: <20210920141947.5537-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no particular reason why the exclusive monitor should
be only cleared on reset in system emulation mode. It doesn't
hurt if it isn't cleared in user mode, but we might as well
reduce the amount of code we have that's inside an ifdef.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210914120725.24992-3-peter.maydell@linaro.org
---
 target/arm/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3f750d5bfea..1dff1d33473 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -381,15 +381,15 @@ static void arm_cpu_reset(DeviceState *dev)
         env->regs[15] = 0xFFFF0000;
     }
 
+    env->vfp.xregs[ARM_VFP_FPEXC] = 0;
+#endif
+
     /* M profile requires that reset clears the exclusive monitor;
      * A profile does not, but clearing it makes more sense than having it
      * set with an exclusive access on address zero.
      */
     arm_clear_exclusive(env);
 
-    env->vfp.xregs[ARM_VFP_FPEXC] = 0;
-#endif
-
     if (arm_feature(env, ARM_FEATURE_PMSA)) {
         if (cpu->pmsav7_dregion > 0) {
             if (arm_feature(env, ARM_FEATURE_V8)) {
-- 
2.20.1


