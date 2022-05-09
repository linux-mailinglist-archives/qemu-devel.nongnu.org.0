Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E616451FCB0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:25:08 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2Ro-0000xk-0G
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22i-0007l9-2o
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22g-0001L4-Df
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:11 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso10651126wma.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+3olo7e85VH/YZ4COonx8SmNnB4UzXRKEotRzbQ80o4=;
 b=u5Vj86WSM2ffMzDw5tMtLV3nUvfOVVSQzfOE10UVk+jUMtv6oxRPkjkffdPp/rBSKo
 /gBFbmtUvz+xum5zvwNLny66nLOFytvSb+JqBgDKxrd3Jxz2jp0FH8ul55kQJpbA05+0
 BKdlbVPeQsnVmADlvxySPYa7Noh/VKxgdcCvEwOZhTfTqcwHpk43xtsLcGIYDWsyBFv3
 H05ZjTiTE+HjVTLMSHc7MmFeOmeAHWtcn/A3FUyBGz0A4NZvK+MaTMFId7/EpUpaPWzx
 R2Gh81sQ2YmDs+sgt1EyawqWxhUkLvHksdYxtpTvoE8oMFWOK54cojY+RvY0THNYj4ze
 diYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3olo7e85VH/YZ4COonx8SmNnB4UzXRKEotRzbQ80o4=;
 b=6zEWJIzH48lMVhUGGHzrim62ZUS0iPHXI6IeIQr7AkorVEXgE6CAv/b9kvE8h3NaOQ
 Ea+rGIHdjG+cQcckPZatU1BI6EOiMcYh01O64aC6hRRiNPz+seR2qyE7NlheggbXPBrp
 Q3uO/bHEuxjqQwjPAkAPyLht1Ir9vro9BzRv3dWEh41XCXvvn5ySINF5HeanYk1AMs8Y
 1p53t//CQXiYvpghe4AcEjlOr9LZlGnO0yX7qyNvMU9fV6eL8D2dx8BVtybHKRnv2d0S
 NX6X9pRDjnvfJDXChX4zixVn/cgn5TyG1NOd+UF7349g63ousTnpC7/mepDjp4buZegw
 V/pQ==
X-Gm-Message-State: AOAM530PlZY01qIInQKa9PAg//4zqqV8ZJK83hfE9YS3vz+gkdNfLdqB
 0XfpkawKQbNHHTU0K+DvKQ3SbuWQWmTSgQ==
X-Google-Smtp-Source: ABdhPJx/GNEnxD6GCdIeysjmWR945Tmdq9p3xXMLUNUBZEZ6rdVdE2ereNKo9l1QpvSpzQiOSfKV2g==
X-Received: by 2002:a1c:7414:0:b0:394:1d5d:27f2 with SMTP id
 p20-20020a1c7414000000b003941d5d27f2mr15812603wmc.37.1652097549047; 
 Mon, 09 May 2022 04:59:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/32] target/arm: Enable FEAT_DGH for -cpu max
Date: Mon,  9 May 2022 12:58:39 +0100
Message-Id: <20220509115848.3521805-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/translate-a64.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 48522b8e1cd..8ed466bf68e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -17,6 +17,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 40f77defb51..f55121060dc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -738,6 +738,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5a02e076b7f..6a27234a5c4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1427,6 +1427,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.25.1


