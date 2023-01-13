Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5C669D1B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGi-0001xl-IJ; Fri, 13 Jan 2023 10:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGg-0001xP-PX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:58 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGf-0006GR-9K
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id g10so15553548wmo.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1qPfxBX17QwjQQWrVKyI6Qs1xSLlsiE1fYEVpC7zrok=;
 b=rnCr6ONs9ou+aMrbfAhsXS4kWDbDTLdT95lSvvnmUJMh85rqoeA2Pph8koWdLS5bJU
 ZoQ2cjZH54VioNeAZU9UGdafSjiPLxe/m5p6nPzzLhat+rIvLFpw/ay+IrnenPBZOO23
 chFw0s9rNA32qvKc1+pakQJqFG7A+zzsBG5IZ3QBNjIaYdSiV1YPx9+y/hbFLV9iILUR
 Qrf0iI2IA/v2bCOVSZIJOnHQ+FUrsV0zr9RaGIY+TI/UvZ2zSSb4baqkoBMQgcY/SMJS
 2u58ddzZujAZ2io52H1S//R176Rj5bpsGgs53s9AdAbYH8HjxQJanqEvg0MD5FoJ7d9o
 /liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1qPfxBX17QwjQQWrVKyI6Qs1xSLlsiE1fYEVpC7zrok=;
 b=Bui3nIixX9E6snzy2Z0G3qsxcO1tmjtUGPUkXeoQ9P70sD/VI6hP/NykoNH2Z//bGx
 vNDfk9TsU/6uu5c70wXifgb0TsOde8W98tekg1dIrlyAzlRc66xVsVjnMKwwRlqIch15
 fXYpNzQ4dOdbMcYsigcIE9EsnMRB4AgucdTkpnV+YIxegWLjLM9Zde7tglECzi24Zl82
 YHZsvB0X9YIeFD0nuMuLMeA8RPtDUh22CZaxF2ob+q9a58IT5mQxEJDo/GRv6fC1JyFN
 LjedDsEMq6oCyhmni5B+6AyK284RdxPch1ZjnunbMKIVRP19RGSv8U7y1j1NLAcu5CUB
 Un6Q==
X-Gm-Message-State: AFqh2kpsHJJ77HSqO6AlPMNkBuQCG4CC4H2X2j7qpKvWB+lvPIgNa9q7
 al+VU1RIFVU0V7KSSBLVvLZavKJKpfJ0l+BB
X-Google-Smtp-Source: AMrXdXtiCe2kaaSXwzpABNi5ozVcHGbaBWtIENQMhTsGbDDExhtDQrBKLiy4G6PXwk6c7sLTQtcPaQ==
X-Received: by 2002:a05:600c:4f88:b0:3da:e4d:e6ba with SMTP id
 n8-20020a05600c4f8800b003da0e4de6bamr7855745wmq.14.1673624815820; 
 Fri, 13 Jan 2023 07:46:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003d9a86a13bfsm27617575wmq.28.2023.01.13.07.46.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/46] hw/mips/bootloader: Implement nanoMIPS JALRc opcode
 generator
Date: Fri, 13 Jan 2023 16:45:03 +0100
Message-Id: <20230113154532.49979-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-6-philmd@linaro.org>
---
 hw/mips/bootloader.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 9fc926d83f..1dd6ef2096 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -129,7 +129,17 @@ static void bl_gen_dsll(void **p, bl_reg rd, bl_reg rt, uint8_t sa)
 
 static void bl_gen_jalr(void **p, bl_reg rs)
 {
-    bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        uint32_t insn = 0;
+
+        insn = deposit32(insn, 26, 6, 0b010010); /* JALRC */
+        insn = deposit32(insn, 21, 5, BL_REG_RA);
+        insn = deposit32(insn, 16, 5, rs);
+
+        st_nm32_p(p, insn);
+    } else {
+        bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
+    }
 }
 
 static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
-- 
2.38.1


