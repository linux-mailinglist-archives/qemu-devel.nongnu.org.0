Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67770649654
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TD3-0005De-Ii; Sun, 11 Dec 2022 15:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TD1-0005D3-7J
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:03 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TCz-0003S3-Ae
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:02 -0500
Received: by mail-ej1-x629.google.com with SMTP id vv4so23332644ejc.2
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ODqL345nO/zfoaR7l6awIbdJz+to07VvHXWnKwVvcA=;
 b=uR7szoMYqjemxXju5YsPTF6XgovIhg1MlfwK9H8gFBcOanzYIt3P6W2s0nYUeZJ+n3
 q6fU0JYjheHiZgc9ydL6CbuBonjqd6a4Z6dH5Eya4yRnaJGg18nlWZuoS1WBo8UUeVRe
 s+Qpwm6twYM7+7753/g/3MpOoYVpdw8bgR8BA5KpgNQeN/aP0OkAYbQbHnre3Z9Xepfa
 0xuSCoG61cBD1C+iQTbDt4F9XAcJNja7J4fR4RYm3oXdU08VspbNxcL6Xzb5aJXKt1LY
 wTStznK5VLxiZXw6OH1CfyqciYIsp2ALOsSQkAw3Z0vGUc8XhpXm5/cbWlns4EQtyG3A
 0EhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ODqL345nO/zfoaR7l6awIbdJz+to07VvHXWnKwVvcA=;
 b=TjVplQFBRoZzM8a+Pvb8UXg7hwEse5vlNPxmE0B1FofpVQzJKeQ4kBtI0hM0lr1Gq1
 vqcJGvg91ne+GQAOwrtP2O3zHMoLWGekdvdAr2wyu9NLOenqMx5830it8lwcknVZnXrD
 WFZ/67lPkVYm2arMuBj627cu5pz7rR6RJ9ESpxoi6VHI4wkfXKhVpwYuhzdXzF9xffOf
 TugNd2Kdh9dU61qMzl/OdUZy38tUD3DeDsltVqiLAb1y6v7s+F5ETMWJQGB9OTR9hAoU
 Ps+urQFymhvn+3d45x86vgkP6pws6mSwcqBD9PW60wyJdqXg1w4j5RPgZjpOWp+yAyZB
 0yug==
X-Gm-Message-State: ANoB5pmIQRovldWFfDnwKEe7UrxOEI2ari0p5rdEUhNMp1dup3SpUKrJ
 PrSQMZXAtPLH56xAb6ikg7zvCXNVHKdZTWCd/nM=
X-Google-Smtp-Source: AA0mqf6f8fa1vv6dKyq9NW0zaw+kxMCWXCtNjLUXJxP8HQCSIx8YSHfB4rLIFLTyXuuRiORrwYdFMA==
X-Received: by 2002:a17:906:da0f:b0:7c1:540c:e214 with SMTP id
 fi15-20020a170906da0f00b007c1540ce214mr5462839ejb.47.1670791559683; 
 Sun, 11 Dec 2022 12:45:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h22-20020a170906591600b007bdc2de90e6sm2421913ejq.42.2022.12.11.12.45.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:45:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 04/11] hw/mips/bootloader: Implement nanoMIPS LI
 (LUI+ORI) opcode generator
Date: Sun, 11 Dec 2022 21:45:26 +0100
Message-Id: <20221211204533.85359-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
 hw/mips/bootloader.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 3e1e73360f..9fc926d83f 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -132,12 +132,39 @@ static void bl_gen_jalr(void **p, bl_reg rs)
     bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
 }
 
+static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
+{
+    uint32_t insn = 0;
+
+    assert(extract32(imm20, 0, 20) == imm20);
+    insn = deposit32(insn, 26, 6, 0b111000);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 12, 9, extract32(imm20, 0, 9));
+    insn = deposit32(insn, 2, 10, extract32(imm20, 9, 10));
+    insn = deposit32(insn, 0, 1, sextract32(imm20, 19, 1));
+
+    st_nm32_p(ptr, insn);
+}
+
 static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
 {
     /* R6: It's a alias of AUI with RS = 0 */
     bl_gen_i_type(p, 0x0f, 0, rt, imm);
 }
 
+static void bl_gen_ori_nm(void **ptr, bl_reg rt, bl_reg rs, uint16_t imm12)
+{
+    uint32_t insn = 0;
+
+    assert(extract32(imm12, 0, 12) == imm12);
+    insn = deposit32(insn, 26, 6, 0b100000);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 16, 5, rs);
+    insn = deposit32(insn, 0, 12, imm12);
+
+    st_nm32_p(ptr, insn);
+}
+
 static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
 {
     bl_gen_i_type(p, 0x0d, rs, rt, imm);
@@ -178,8 +205,13 @@ static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
 /* Pseudo instructions */
 static void bl_gen_li(void **p, bl_reg rt, uint32_t imm)
 {
-    bl_gen_lui(p, rt, extract32(imm, 16, 16));
-    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        bl_gen_lui_nm(p, rt, extract32(imm, 12, 20));
+        bl_gen_ori_nm(p, rt, rt, extract32(imm, 0, 12));
+    } else {
+        bl_gen_lui(p, rt, extract32(imm, 16, 16));
+        bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+    }
 }
 
 static void bl_gen_dli(void **p, bl_reg rt, uint64_t imm)
-- 
2.38.1


