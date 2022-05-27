Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D8536624
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:51:21 +0200 (CEST)
Received: from localhost ([::1]:42664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudBI-0003Uz-Lv
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8J-0001Ir-Aq
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:15 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:41801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8H-0005Nr-Py
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:15 -0400
Received: by mail-pf1-x432.google.com with SMTP id p8so4774294pfh.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mCzaU+JrOI2uB5gjGXQ6lDaHwnlMpGfIPzqc07MdKqM=;
 b=EPjKqx/MU/ieambM1J14JB9lO9dxRYulwb8Sl/kSACBXKKWfh1gO20pmO2lpJ3xH6t
 MWyZntcuSTQmYA445ndSKmUn5ubFlXIZZUXYDRFM69Xnht1A7MkEJcguBCZd0fVNSgAh
 v7RqQf+6ptCFuuXF/k4SW+O7I1+ccZMcifqecGgyT3b7LY1g/d28n1vf2L9N92gI4OaI
 e/XA+6nqcKfmsfzNDvj7fv/XcMcaJCKQlvl+8djnTZDccys/jIC4alHPiXmLhy+MhdGE
 TGolE7iUDvyH/c5v3COSYkfOcEl/psaVjZQCPPQ0MwzpgB3rVE3PSI/RJu+D1ANn+zd6
 3L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mCzaU+JrOI2uB5gjGXQ6lDaHwnlMpGfIPzqc07MdKqM=;
 b=urukG6g34XhtA7BIei0ScoFUkY4Qjv2kVFjRTgfoLkyjV2giv2EvvohuMh1WLdbEyL
 lEkeEUEsl0WEVIsOpqMFPUKrKHg7kBLlhFBaJayjknV0i/fPr20jdzHHfqAfe9JzZbI7
 D83HLFQRh23QAxy0LJ/Qz8NJZMVOaBEJN+Iy9Z5stzb3ldrhpG8gaFwpfcscUUavag9D
 YE75mr8c7uVlr0Q49TjjGCPLRJIFm1lm2MwipD/p4+Cp2QlbbvhD3xyEB8NROpFQBD2M
 Bt1WR3Fkp07JUVVd9CcL4DZHRv3GVhDn/aWAVsnkDxGPPiUfKgEZIVCL7+ri3UlY5UsY
 CrPQ==
X-Gm-Message-State: AOAM5309CaLmuVGUVbkBWb+uDeQR++Sd0FXAUEkl/YaHJCMGjlLUdFww
 ZalNdGg4wxRHE8QLV9DlwuvNV6SjOU2lWA==
X-Google-Smtp-Source: ABdhPJwUO3SrO4veons/YPd1VHJgq9eKt5b3bh8zCUfrXmiOUfH18zmB3RnvElYAbdREiChbyPM3NA==
X-Received: by 2002:a65:404c:0:b0:3c6:4018:ffbf with SMTP id
 h12-20020a65404c000000b003c64018ffbfmr38437520pgp.408.1653670091474; 
 Fri, 27 May 2022 09:48:11 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 03/17] target/m68k: Fix coding style in m68k_interrupt_all
Date: Fri, 27 May 2022 09:47:53 -0700
Message-Id: <20220527164807.135038-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

Add parenthesis around & vs &&.

Remove assignment to sr in function call argument -- note that
sr is unused after the call, so the assignment was never needed,
only the result of the & expression.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 2b94a6ec84..0f41c2dce3 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -408,11 +408,11 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
         break;
 
     case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
-        if (is_hw && oldsr & SR_M) {
+        if (is_hw && (oldsr & SR_M)) {
             do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
             oldsr = sr;
             env->aregs[7] = sp;
-            cpu_m68k_set_sr(env, sr &= ~SR_M);
+            cpu_m68k_set_sr(env, sr & ~SR_M);
             sp = env->aregs[7];
             if (!m68k_feature(env, M68K_FEATURE_UNALIGNED_DATA)) {
                 sp &= ~1;
-- 
2.34.1


