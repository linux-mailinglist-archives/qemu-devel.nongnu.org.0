Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B20648F8E
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:57:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42CR-0003YK-IR; Sat, 10 Dec 2022 10:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CO-0003Vk-OW
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:36 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CN-0004S5-76
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:36 -0500
Received: by mail-wm1-x329.google.com with SMTP id n7so1943238wms.3
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSN/vxmvjzjZWG1Yzr7yo5qjrH7L/P4OnxN/YhyWvKE=;
 b=hL7pbh/woT31F3BVD6BSyogDelr+oUTeVcoPMl96aqzIWzxQ//hX6sjRAZMr188Uhx
 oPBjqz7zgFcXzm2x5Yndg2uxG4OPOxF6xwR8QpF5yLipE/1jG4EIw4w+frWV34u7orGq
 QgJMmTSaEogP1N8621KnpPi4mskq4wlEkEkQWH1C3ua6SVOcaKc3IoDnkf7ptqAjUj4r
 SaRiVrOuAZUYtnB8+HC2bEZh0HUbdcOyX0ZTVJjY+KTi2DNfSjiSxnzRqVurD9YUf8e4
 dttbSCLciBB+k0h3aosAdRG/sSa8qKC/tcQU7axH0WIPWaxsHSFqHPmGx2TWYn/eemKI
 MNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mSN/vxmvjzjZWG1Yzr7yo5qjrH7L/P4OnxN/YhyWvKE=;
 b=g4Nep87g5d79AUp2FHTiJcaaISXablCQ4adJrNQRVuQbOWOcunua272jvHH28rISL/
 dFTHG2ZfzbCVFwUbxFKcNAwVe55BkDY9K4QnG+mPQ/vj5pR8evkySe7VKAkFNtyLEmlG
 EOtwYmQOIpe8mEZI+FiPa0z8WYOyMgnlJGK+bhvPRAu3LYRkhuz+yVkoHVIlPdbiE8a2
 DQ0QQlWRMmrDVYWufKY/z30r8bvJCIB97Sa7v9iYb6AoahG2OglDpo9CNNSFeUPjow1T
 2hwZETlXVpmmpkSFPO/UJSjWe41zFJKskkuhfON9DjO/Zw5nxkAkryH0mFvlA8Pi9otC
 G0yw==
X-Gm-Message-State: ANoB5pmRSI0gBhOucunHpMZBTp3BbPskHl1iOjCWZ2oyX3SZ3O71gdA2
 J0SA4IiWDvA2qgRa9IiTc3nxFyu0lJPdusQBnTM=
X-Google-Smtp-Source: AA0mqf7MzyWtQauoGlTosMQEMp0vxLYqEtBgPMkMo1IygmMLmz25nsplyZA/lA5OML6hi46oBNBu0g==
X-Received: by 2002:a05:600c:4fd0:b0:3d1:c0a1:4804 with SMTP id
 o16-20020a05600c4fd000b003d1c0a14804mr7958693wmq.17.1670687733567; 
 Sat, 10 Dec 2022 07:55:33 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d538f000000b00242442c8ebdsm4137165wrv.111.2022.12.10.07.55.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 5/7] hw/mips/bootloader: Implement nanoMIPS SW opcode
Date: Sat, 10 Dec 2022 16:55:00 +0100
Message-Id: <20221210155502.74609-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210155502.74609-1-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
---
 hw/mips/bootloader.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 997e74ee52..cc3df385df 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -150,9 +150,31 @@ static void bl_gen_lui(void **p, bl_reg rt, uint32_t imm32)
     }
 }
 
+static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm)
+{
+    uint16_t *p = (uint16_t *)*ptr;
+    uint32_t insn = 0;
+
+    insn = deposit32(insn, 26, 6, 0b100000);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 16, 5, rs);
+    insn = deposit32(insn, 0, 12, imm);
+
+    stw_p(p, insn >> 16);
+    p++;
+    stw_p(p, insn >> 0);
+    p++;
+
+    *ptr = p;
+}
+
 static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
 {
-    bl_gen_i_type(p, 0x0d, rs, rt, imm);
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        bl_gen_ori_nm(p, rt, rs, imm);
+    } else {
+        bl_gen_i_type(p, 0x0d, rs, rt, imm);
+    }
 }
 
 static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset)
-- 
2.38.1


