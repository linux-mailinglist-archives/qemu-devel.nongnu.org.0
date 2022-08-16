Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1AC5963C3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:39:01 +0200 (CEST)
Received: from localhost ([::1]:39876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3L2-0004GJ-DI
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GW-0004iu-37
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:21 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:41592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3GT-0004Uw-4L
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:19 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11c21c69347so2112055fac.8
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
 b=yKRYZfBF0l+lEmmYN5DIrDNWA9i7sub3taSvN/YUNdpHv7/vKzQ/HVvpRtH6itAhT6
 GvImupfKf5Lxljl8tgVYL5wO4M5YN/QULYN9sOt08YmhPFqqdQe/n0aYnrPGccd01of6
 hr34Zs7BZF3T0WCstrPZ/tQp+O9yCV2wN4YU0Zp0Wx1l+kv8LDc8mxW6OrFK+JHpeLSw
 mwtbA+QuQ7G6wPaanuk6knW/iD6yC4Ko21OzeTTtocEy2Sqn7l56Q+tMOc46s0IDSAM0
 FVU2h7y6IGZ/0/SBR7sPXpWQ7XU0Xqx6xe8qWAGiCWtHSPjDr/2Wbu5X0dZ+SldVEUwg
 qirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BW7Q1ag8Lfnxwk0WaGeudEHBVGgEoEo4+8WybCWhWKA=;
 b=Ftz3e7MFLDyKbASP0oPA7Odb6HMgKZninv8MQSiBjP02s6GWzemsv4HDwbejVbO811
 wtGOMU1GuqNXk0I6FuBeAlaPykDlykH+VaUFnRPObxciMQOaRjX7bFGvvWaA9xOVLSqi
 CtolJWQwcPQIyGStnLPxAVaKajR5aPX6wqNrYCYQDYGCTgb5y9y3/c1lh2k48sm1tVCW
 BkNgDd2o0nRHhnmfQ0tppjFsUyI8p6dDTBO6yG2taywxYh9d/KHopHfutZucvK3ZqgUc
 RDvzdcXXgQ0dGd7u9lKEAIqJVLZHPOiHBqBDkmbkmmgBUbee911GgXJUutApnNTNhxsk
 nSXQ==
X-Gm-Message-State: ACgBeo3GrTZRq9EUij5BEZpfgbfxeeQwLgsTKB+g1XqT3xH0m1BRAG/V
 JFfHi9pIo2PuNBZd5AF/QKejEAfjdCc1pw==
X-Google-Smtp-Source: AA6agR791SFeiRG+lA2t2AelaxQt16u+R+sCuX/sEHDTjaxHuDUkj42fj2Z4/HxvBut4cHMp1KIsTA==
X-Received: by 2002:a05:6870:8904:b0:113:a785:b09f with SMTP id
 i4-20020a056870890400b00113a785b09fmr159385oao.216.1660682055793; 
 Tue, 16 Aug 2022 13:34:15 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 05/33] tests/tcg/i386: Move smc_code2 to an executable
 section
Date: Tue, 16 Aug 2022 15:33:32 -0500
Message-Id: <20220816203400.161187-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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

We're about to start validating PAGE_EXEC, which means
that we've got to put this code into a section that is
both writable and executable.

Note that this test did not run on hardware beforehand either.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/i386/test-i386.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index ac8d5a3c1f..e6b308a2c0 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1998,7 +1998,7 @@ uint8_t code[] = {
     0xc3, /* ret */
 };
 
-asm(".section \".data\"\n"
+asm(".section \".data_x\",\"awx\"\n"
     "smc_code2:\n"
     "movl 4(%esp), %eax\n"
     "movl %eax, smc_patch_addr2 + 1\n"
-- 
2.34.1


