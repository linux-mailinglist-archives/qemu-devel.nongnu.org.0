Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1911440AD46
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:14:54 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Kv-0008Uq-1W
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dt-0000n2-1B
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Dq-0001MB-D8
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:07:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id e26so9065944wmk.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xKwGyJmZxOms/ByF0kDC33B+Wu0QPCZS/ddqiwTaY04=;
 b=gbEO4MdaJGu1/l2b26BchYmIGdHWFP+8LM76ril7xaV4buTJSNg12cngXRL/pPQvPw
 r/WREqi5k0i69Dldpv5HkfMV+FCc3wP4V7EWypQAvNHCgT9lxuSnFnAFZgK2E6IOMJ1e
 yI39Yd4nRwXCtHI494wFlggr4r76V892isFD4ZZAi9oUCqg+o71NngPqVBbObOYRtLVt
 CwIjI0Zr2C2J4dztPGw3vhdUKM4A8uJzfCnr09x9+l9XWntlCJ7NfPwinTrn/51HUmmF
 Ks99C3DuoSPmp4rHIS3/teNN/aiSpF7sux1+uzb68wvbqfuolcUXZVrmx22nRvF+PVwQ
 DwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKwGyJmZxOms/ByF0kDC33B+Wu0QPCZS/ddqiwTaY04=;
 b=1z5qdQEbXwhH5OQS2o2Bi59HX5YAblktY1UJ0BFjt/ruUFn1GDu6FhDjgtbfm/MaWl
 K7El5b5gfmYY6a8c6aHEmrMUCWvAGJ5BLbzykenpozCFTzB8hhQ2waFZS8ZyyuDq8w4A
 q3M+cVOhljyVzKj1+IudkOWnixx/DK8h3rZkG9Fg0mHb/1i8Uve6+v0kXs1xbm2v8EKk
 UTj+TU/Axt/Jnnb6x95F+jCpVAwVc4iwO7suDmpVsomdYaf0DWre0phnefk8v7C636zF
 kPvM9fvA9U31jbdbeKSYlzjXN7r6sOJdUtR4YxRGYv0b9JcIGLkAFrUIpCpuaBMBLytd
 1NDQ==
X-Gm-Message-State: AOAM533n3i3lkQkEC8d9T96JcmPMN0xGsKD16oNe5FPWaNrGJ4weYa1a
 3JxARSXWiSZlWMGTxS19AQrYSA==
X-Google-Smtp-Source: ABdhPJwomtUOA3FQYouxTy1/mk/ODpKqOEUjv8Krze2Ya8GvwjCwd6/1rayMt44byBcSOXJQh1dANg==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr1778571wma.155.1631621249849; 
 Tue, 14 Sep 2021 05:07:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o10sm11472466wrc.16.2021.09.14.05.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 05:07:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Always clear exclusive monitor on reset
Date: Tue, 14 Sep 2021 13:07:24 +0100
Message-Id: <20210914120725.24992-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210914120725.24992-1-peter.maydell@linaro.org>
References: <20210914120725.24992-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Lyon <christophe.lyon@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no particular reason why the exclusive monitor should
be only cleared on reset in system emulation mode. It doesn't
hurt if it isn't cleared in user mode, but we might as well
reduce the amount of code we have that's inside an ifdef.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 98eed6c6d31..7b1665a1d0c 100644
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


