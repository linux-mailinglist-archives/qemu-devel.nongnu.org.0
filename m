Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C6459C42C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 18:33:30 +0200 (CEST)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAMj-0006Bs-3g
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 12:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lm-0000Ey-VY
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:27 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:54228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LW-0000q7-Dd
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id m15so3292023pjj.3
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=r2s4x+bZJOY5/giT1jRp8us14Aquo3FqXDJ1E/9NmhQ=;
 b=ohq2sb2ouf5s7iCm7STCUZ7jD7GI/JbnAn8Uuar98848AM9CBHWznKj+61xbvnY1G0
 UMC4kHp6AicUdlf8UDtGtPq5VUk9gn7LFEvaynedFDe4qGyYXIpu5plgBsOyLM4e2GQP
 Oa5aNC0+Md4uuLvtyrr3EKXtlfagdFXpLsrfpMtK+FAwPRaOqp+yVPbqoMmELYVG7OTJ
 EPLu1NzZq1OU7cqhVHmoO5SY2xXI7GbJcZj1KHqooqWl9IublyZ4t8v57svtOrEa/N6X
 OUvl0bPQEc92zCLfdY70Y1Ac1ymtJWfWvho9Sn6UX6J/nST3XKaOWCqME4NXUQUQmoNU
 kt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=r2s4x+bZJOY5/giT1jRp8us14Aquo3FqXDJ1E/9NmhQ=;
 b=YBgQv/JH2gHKiuIW34O5aCdjYMum4Sd/gUuLBv/aLg0TXSGY3RtQ/8ERoGoC0H1k85
 XQ8d8WHoOmYNIMxvFupbtZlpvCOV9CUIiTPev9KCo/YzjKbtanTUt4L3Q3d0An1PvtSb
 tkoT66jMTIH5+Y6nFYZfVXDoeTJRD7NkUKhHozOZ/f3wCU5JHMdSDsqI3U03oHohqTQD
 f9RsUIupU1CLpRqNial7/TWbOhFRdoFU7gLILtdoahYcG1QWho0GbdISSkX0kud86Cej
 qISvWSkAJBkR4S4he34NOuv5AVsQre9m+4EZFfW43HsaF0neh+54QXb1V13BmTDjs448
 Rgew==
X-Gm-Message-State: ACgBeo21OjO9y0CQnLaZcrsZrQMm/fAhBlJG7NdGCwoJ8C1hhmuRPofR
 xYr0LQApzZ7cWxd4i4BjxWDHvJsjtWiYjA==
X-Google-Smtp-Source: AA6agR7KH1L7SPsovw38IIQvonZYx+ezDIpwrPJgilkTsmD6qFJMuen7UUrssEtdxjLY/fVoLII5BA==
X-Received: by 2002:a17:902:dac6:b0:172:e3c6:2b39 with SMTP id
 q6-20020a170902dac600b00172e3c62b39mr6979175plx.84.1661182088068; 
 Mon, 22 Aug 2022 08:28:08 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 31/66] target/arm: Fix S2 disabled check in S1_ptw_translate
Date: Mon, 22 Aug 2022 08:27:06 -0700
Message-Id: <20220822152741.1617527-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Pass the correct stage2 mmu_idx to regime_translation_disabled,
which we computed afterward.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index dbe5852af6..680139b478 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -211,11 +211,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                                ARMMMUFaultInfo *fi)
 {
     bool is_secure = *is_secure_ptr;
+    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
-        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
-                                         : ARMMMUIdx_Stage2;
+        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
-- 
2.34.1


