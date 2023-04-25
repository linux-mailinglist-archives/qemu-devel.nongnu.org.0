Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2BF6EE876
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:45:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOS9-0006Ew-7t; Tue, 25 Apr 2023 15:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORp-0005f5-HE
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:35 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORQ-0005NK-Fj
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:35:32 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso6845302e87.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451307; x=1685043307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=jY9PccdyiHArO3/JJSCICJ7FGAdsOcrBmmU33RDGy7T3AeAsX3mCVdJYeUHy052XTT
 FXFJ1d4O7nCxSQCJFC3BMWdxW/D07gQEnomYuof4BHfOriO25C7GurU1Rjo5gi6KzoZF
 IhIEEdPgF823nEyzy2LX9rYKaoJMtXWGPO1so+BqeX+x56jAXG0w7Dz7KqI+wdKSupwF
 NtVkltM8XWCQ3bXiUdEm7UCNGNGBvOZ2OGnH8CoLNg6EnWMqXJlZmxp/hp6MVZ0HOUPv
 7DutXNFNajw+SHefo8lE4zbiapraLb0hEosaF0Fw+hIc9eHWDS9cXIzGviPHkTuGqAwA
 vmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451307; x=1685043307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g0XhypHJuKT2RLCHGyOOS8cpna/MQwPu76GFexENMHE=;
 b=Y/4NRA6EAV8SB0D133MlzBXWLRsNHZ/1EmNhmsBw8vTnsmjVLE3vsWEiU6bBUtjqcQ
 tFXn21D4UKymd/NmcmVnikSGAe+XDZZTGq/uKT86D36VkNnRj+el9l+SAiBqVzYSmahG
 Ajym/cxwmCJF5EYVHvlHXYaFvvFdfKa+SrE3Cm607/QPB3fnK/lX4IULyzrShSGvDJO0
 Ol5ENPrtBnQvP48EvGDPiLxypEYkEU1UBft4UOCFDpdHGFTey2CuWI76UQVuaURjxZMe
 XCwuITQxI3xukYMB5qH0TK4aRgFWq4y1FJDiTnec+WIdQsIAmjzWHjYdEgl0wOqB/DWH
 SrpQ==
X-Gm-Message-State: AAQBX9cPRkRXraKYDkVqECJlqf7bThiIPd7Bik3yIwUPB+11FdUsfW3J
 1LS9xYP0SI8Yd6mSrdz34ca8cCWwJZJ+6oYLkpsbiQ==
X-Google-Smtp-Source: AKy350YPrehHUXPXHEjvpL2FMdBnGNQmAeyLxVg8Sc5adLt+GKa+vkAVxzota+Ws4+ms0Ctw4yAUKA==
X-Received: by 2002:a05:6512:374b:b0:4b6:eca8:f6ca with SMTP id
 a11-20020a056512374b00b004b6eca8f6camr5131335lfs.67.1682451306802; 
 Tue, 25 Apr 2023 12:35:06 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:35:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 36/57] tcg/loongarch64: Assert the host supports unaligned
 accesses
Date: Tue, 25 Apr 2023 20:31:25 +0100
Message-Id: <20230425193146.2106111-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This should be true of all server class loongarch64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index e651ec5c71..ccc13ffdb4 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -30,6 +30,7 @@
  */
 
 #include "../tcg-ldst.c.inc"
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_DEBUG_TCG
 static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
@@ -1674,6 +1675,11 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 static void tcg_target_init(TCGContext *s)
 {
+    unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+
+    /* All server class loongarch have UAL; only embedded do not. */
+    assert(hwcap & HWCAP_LOONGARCH_UAL);
+
     tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
     tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
 
-- 
2.34.1


