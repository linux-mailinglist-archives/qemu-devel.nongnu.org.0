Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AA4632EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:25:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEHP-0004XQ-Gj; Mon, 21 Nov 2022 16:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxEGz-0004Jy-Mr
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:24:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxEGu-00083N-BL
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:24:10 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so9766940wma.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8gkv8kvW5LJw8L5Xe3JzRzRvQ07cJtVsiJm2+QBkpmY=;
 b=qkEMBhw8WpRLi0SK/AIrmEo6m8CHUL997iWpOhHRXeuz84PurIkzwW5U2e9vYqdIXD
 iMx2gqbIsF+LEQxJ3cDPLMqUoMhjOiiZM7rzp8nt6y3Wl2Rmj6QLZuR30VRjFvQcNGhr
 wHNrgIKhg+spRWly4YUOPKpmKa2iYP611lACP6Wv3uu/KiJTaEwIwL1d5dMONxy+BqyU
 /+xnIjDTH41kMlvfxluR5lyo6IGgAMSok+yOY/LmkO00OEaC42ohUSNjktWHELyqPqpc
 SEuOOiH/62Eh2kcKfl+OZBnGew411C5kBlBRiw0dbuEWjCNt/7xU0irqwq6FIwBHhgc9
 3B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8gkv8kvW5LJw8L5Xe3JzRzRvQ07cJtVsiJm2+QBkpmY=;
 b=r0nWxBDL2Syl8TyV7PGJrh7FhSdRSljUaXdhu4KNvzOq9gBGAkDRt6ZrAVMgBqgGmd
 4eP3MhWP7RK8/wq6DnfK1oNdvwKdQfeVSzfbkX3Sv2BCi2ErsaUlqO3QOHIRxlnd8vpU
 xKojwx1gRLTTWmW2PDTbdwwOd2ZqZe4cOl1oqN5/t1zajg00TCmnv+sPx6q7zLxkf5yw
 XTWeANBAkcuBPi4r0V48aT8s3J3zGCt/z46+9rjacDif2ZDv4Uzlvloi+Uwg5p8tf2AL
 qQDItSjNnLRg9ohq25/faKnEpzW+Id6mMnE5/rnBwRe/Phpiw84RjMkNcwkvRp3QmFWW
 8fEA==
X-Gm-Message-State: ANoB5pk7oInqAOMFJSZEeyI03RuqO7O+6pfvWT4rLB/5fz3iZl6HR5H+
 heQlcxG+xAjlZo4VSXhXznWPSA==
X-Google-Smtp-Source: AA0mqf51bEf2p74ltiLbF+EaQft539N/BVUj+yGxA7xFYpjXYoJLaDgEObiSgGPZsIoNPl5upZ8Frg==
X-Received: by 2002:a05:600c:a0d:b0:3cf:6c0d:a27 with SMTP id
 z13-20020a05600c0a0d00b003cf6c0d0a27mr13954630wmp.196.1669065846540; 
 Mon, 21 Nov 2022 13:24:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r24-20020adfa158000000b00236b2804d79sm12675461wrr.2.2022.11.21.13.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 13:24:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH for-7.2] target/arm: Don't do two-stage lookup if stage 2 is
 disabled
Date: Mon, 21 Nov 2022 21:24:04 +0000
Message-Id: <20221121212404.1450382-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In get_phys_addr_with_struct(), we call get_phys_addr_twostage() if
the CPU supports EL2.  However, we don't check here that stage 2 is
actually enabled.  Instead we only check that inside
get_phys_addr_twostage() to skip stage 2 translation.  This means
that even if stage 2 is disabled we still tell the stage 1 lookup to
do its page table walks via stage 2.

This works by luck for normal CPU accesses, but it breaks for debug
accesses, which are used by the disassembler and also by semihosting
file reads and writes, because the debug case takes a different code
path inside S1_ptw_translate().

This means that setups that use semihosting for file loads are broken
(a regression since 7.1, introduced in recent ptw refactoring), and
that sometimes disassembly in debug logs reports "unable to read
memory" rather than showing the guest insns.

Fix the bug by hoisting the "is stage 2 enabled?" check up to
get_phys_addr_with_struct(), so that we handle S2 disabled the same
way we do the "no EL2" case, with a simple single stage lookup.

Reported-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This patch has RTH's r-by because I ran a couple of options for
fixing this by him over private email.
---
 target/arm/ptw.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3745ac97234..4264002021a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2604,8 +2604,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
 
-    /* If S1 fails or S2 is disabled, return early.  */
-    if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
+    /* If S1 fails, return early.  */
+    if (ret) {
         return ret;
     }
 
@@ -2731,7 +2731,8 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
          * Otherwise, a stage1+stage2 translation is just stage 1.
          */
         ptw->in_mmu_idx = mmu_idx = s1_mmu_idx;
-        if (arm_feature(env, ARM_FEATURE_EL2)) {
+        if (arm_feature(env, ARM_FEATURE_EL2) &&
+            !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
             return get_phys_addr_twostage(env, ptw, address, access_type,
                                           result, fi);
         }
-- 
2.25.1


