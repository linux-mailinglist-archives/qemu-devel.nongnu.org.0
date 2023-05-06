Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF176F8FEB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:26:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvCGU-0005S1-L2; Sat, 06 May 2023 03:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCGP-0005Nw-Sr
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvCFt-0004N9-CW
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:23:29 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3063208beedso2452836f8f.1
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357776; x=1685949776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3fy0vmCrTrGncYxmSNiskWJCsJlGLSETPcKSq6VV7UU=;
 b=UC/Q9hR5AQYAyrfjS2LKyfwcxMPqjhaiWxTYGlWipBbSyqZ01wF296JnKKEhTBQPda
 ss8GjSgCiKQAqM7QfDdgNWKdr8JkZieDm1jD7xfhI4J+5VFMOcFoJ/bsnmob9YHWD73R
 l0Z0iUtgrwK7KUX0lhHwrkrhiWxxBlC7mA386HX/OrJoy50+G8smerZZgtLw6g6ig6sv
 vAkpy+xG6QAK6flps/znbs0S2ECWZOuuvVbZd3s0U9ktHvMWS/b3sC5J+9PCQYdqNLka
 myQY9L2hmz/EDFxlyJBzU5ymSRhmmL863qUYpxB958JKVABD1uXub5nRT1m/KMezMfeG
 E5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357776; x=1685949776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3fy0vmCrTrGncYxmSNiskWJCsJlGLSETPcKSq6VV7UU=;
 b=koGj5UHYziYg8usHpXgsyhKsfV34mBO7Vr0CMwO5nVtJ7X3BEf+yAOrfCCepZ2Efvf
 /Yuik+JzYy0+b16du078m+6d8X3XBdvJqmu0D8GqlkKM4rvwZCaSVCW9M8vTmfM2sJEu
 0JBqZGf5dYiIDXDAVM2Ouil2Ip7E1tP2mcllI5blLD5J6beVBDDFGahFa4XqEoFUUaJs
 7mCNXg3kbWqlt/faR0xHsL9yK6W1wUow0s52g2wihXkBHiI14UQTGa0P7YDkXUNrBvCe
 m58FAkPQTI0LCAU1ZrzpU5wuC/VCA3fARNvsW0PQc7e/sAdvLP2L8hZWqJ50BxAzgGuG
 pZ8Q==
X-Gm-Message-State: AC+VfDytg8cLBUAIXaqseMkzXriD/FQ/dFZWX/CyqgT90hGOV0dlIn0/
 vBCUdZWY4m4GS2CCVynVINHzuwPYRWN+OwxaWKCLgw==
X-Google-Smtp-Source: ACHHUZ7GC12AEDn1Ft1uzPO2lP11E7I2E3AFECRJcuCd3sxRwb1BKlvyUydH/JkfblgadQeY+7WXkg==
X-Received: by 2002:adf:f849:0:b0:306:35d4:566f with SMTP id
 d9-20020adff849000000b0030635d4566fmr2752644wrq.65.1683357776639; 
 Sat, 06 May 2023 00:22:56 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 x9-20020adfec09000000b002faaa9a1721sm4481223wrn.58.2023.05.06.00.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 00:22:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v5 26/30] tcg/ppc: Remove unused constraints A, B, C, D
Date: Sat,  6 May 2023 08:22:31 +0100
Message-Id: <20230506072235.597467-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506072235.597467-1-richard.henderson@linaro.org>
References: <20230506072235.597467-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1


