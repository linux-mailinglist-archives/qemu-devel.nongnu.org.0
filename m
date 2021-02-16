Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD331CE28
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:36:56 +0100 (CET)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3LL-0002pZ-CM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32z-0008TO-Um
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:57 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32L-0002T9-Cr
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:57 -0500
Received: by mail-wr1-x429.google.com with SMTP id n4so10809533wrx.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aBQbZtjh6qoRiTLl0J95xhpcxji8rRRUHNr03avILCc=;
 b=tHmAbL/dO8y84yaT9eFb/OJXY0cEOAFr7GCo162UBCEzkOLX0Y8Au3ejI0FW+uiFq6
 0tTQrL1Yi/WZnjNNg1i8eaCKLK/dckxu+H4rO8UX646AJ7wnWJLKJOAY+ekz2ioVGjt2
 BP4i1mgR/6qGYOS8yEjtnpcwWN+dnjrNIbfWyjs2ggBo45IwYv9hNXS2Ulo3GT3rXlAK
 uWAlkaNewC1947gX0V11j7qSe94/dJP2DaMRn5NexFejl8QBb/yGPHlFl4bVB93x46oO
 xCvPOMctBA8B5iHYtRU1J2A2OsIRpFvCotL+TgGyziS2iKI1vKJMMFY+73mnkBsPFII1
 FgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aBQbZtjh6qoRiTLl0J95xhpcxji8rRRUHNr03avILCc=;
 b=F45EH0iltz8lMcjIoOCRC8uvyfL5j8js2V0weuK/KRSPhSYwMVWHRwfWC6b3xXIcTC
 X1Hhvw4NW48fs+MvnIeVgfTIckKZBReDT2LzaUO9XhGfZuztbSYcRrSG16CEi0iUb8MO
 klrK0S04fAns3q+YUqELp49CbSBoS5CLbwPCaGE1l2NzW2URumQoggKCjBh7EwDx9Ltv
 Lu4sVmIk6nn9/iVNKKp0A7iFu5AJQ6+EXywnZwcaScrli8AHZWSAALQgl39fcwg/cw2q
 nLzARDTNz4EfOQvq06FUjZ/6Gp/AqJDTT380Kyb51/Bv/rB8jDLySx9eqf9dog0W2kok
 QpnA==
X-Gm-Message-State: AOAM533ijVfnbXzOfIINdPWHqbijssa9uZSkgmdhGey+2sqC2QHDojxV
 tQksmrCiyJ1PLSnWMxgICm7Qu4NzO9HIJg==
X-Google-Smtp-Source: ABdhPJyQJdAGcd9/iEDtcfdd570OS3obC/vXaXe446eYDU1NxYKnnOPZif5N0P2+ajAc2JBeWLQ7sA==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr24233214wrr.93.1613492235941; 
 Tue, 16 Feb 2021 08:17:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/40] target/arm: Use the proper TBI settings for linux-user
Date: Tue, 16 Feb 2021 16:16:40 +0000
Message-Id: <20210216161658.29881-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We were fudging TBI1 enabled to speed up the generated code.
Now that we've improved the code generation, remove this.
Also, tidy the comment to reflect the current code.

The pauth test was testing a kernel address (-1) and making
incorrect assumptions about TBI1; stick to userland addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210212184902.1251044-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h      |  4 ++--
 target/arm/cpu.c            | 10 +++-------
 tests/tcg/aarch64/pauth-2.c |  1 -
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b251fe44506..112bbb14f07 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1425,9 +1425,9 @@ static inline bool tcma_check(uint32_t desc, int bit55, int ptr_tag)
  */
 static inline uint64_t useronly_clean_ptr(uint64_t ptr)
 {
-    /* TBI is known to be enabled. */
 #ifdef CONFIG_USER_ONLY
-    ptr = sextract64(ptr, 0, 56);
+    /* TBI0 is known to be enabled, while TBI1 is disabled. */
+    ptr &= sextract64(ptr, 0, 56);
 #endif
     return ptr;
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5cf6c056c50..70cfcbc9181 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -205,14 +205,10 @@ static void arm_cpu_reset(DeviceState *dev)
             env->vfp.zcr_el[1] = MIN(cpu->sve_max_vq - 1, 3);
         }
         /*
-         * Enable TBI0 and TBI1.  While the real kernel only enables TBI0,
-         * turning on both here will produce smaller code and otherwise
-         * make no difference to the user-level emulation.
-         *
-         * In sve_probe_page, we assume that this is set.
-         * Do not modify this without other changes.
+         * Enable TBI0 but not TBI1.
+         * Note that this must match useronly_clean_ptr.
          */
-        env->cp15.tcr_el[1].raw_tcr = (3ULL << 37);
+        env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
index 9bba0beb639..978652ede3a 100644
--- a/tests/tcg/aarch64/pauth-2.c
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -53,7 +53,6 @@ void do_test(uint64_t value)
 int main()
 {
     do_test(0);
-    do_test(-1);
     do_test(0xda004acedeadbeefull);
     return 0;
 }
-- 
2.20.1


