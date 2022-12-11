Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32BC649659
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:47:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TD8-0005Fv-NS; Sun, 11 Dec 2022 15:46:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TD6-0005Fb-Of
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:08 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TD5-0003SS-1z
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:46:08 -0500
Received: by mail-ej1-x62e.google.com with SMTP id qk9so23361908ejc.3
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVrUBkERcAIb08X4oIeJUP7Fcrj6nkHLEnbsh/6J7xg=;
 b=Pn3nOcrqVg3ElQnu6UQ9NI3PW0ay8V045Fgvx9SETQo+pJ+1x5EauaL3yUTSYnxlne
 jKqsBrwOih4et5lJcKWexmRia1+jiZUhmjj3uqondi+JE4Ke4HVMPOksrLQ9nt85uZX6
 mwL+lMTKJeLxem9ah+71MfE73AwijGA6mgl7f9rMzyqKPDvLLOD83EEW4uAIGh9uQcLV
 Gcm1govorOpYX5ZQC+gy2waBOWRB3Fds4uHa/NcSpfkECInN8a57JgtMGYT5xn0jm4HC
 8plDiAeE4JINqZEjDbbFcTohDQ/r1bHd+00KlhnqKZtdH9KUajRqUSLEXPJuHLxG8ALI
 GrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVrUBkERcAIb08X4oIeJUP7Fcrj6nkHLEnbsh/6J7xg=;
 b=PO6A8shFuNOegGw3uibYLcanCaY5wp14GYbulTPD8PyFFTWw0k6eO/kpjmLKKoEt+N
 4M4i2FyW+zLQVhqV2qkllqGmN952YB+FYjH3UqV1XHiZmJLnFCNX0ynkFuF2k1QB9qj6
 g7gr8y22RRG5k2YgCVxa55WusfSjXdYmmtcdi+b4o6s5crMb6DYsQ1c2SDyf3w5MdU3o
 4NpxP1bAZNhNq8jcs8MO8FuygAtNGgZqgb2k+b9bhtCjvDhoUKXPBjIRkl5Pkac3ai/I
 9q4RCfmKrZJ9TfGEHwGz6E/z2t/+J0u/C7+RljiN24L9PXI3aGFZn/H2/WUDk3IjVrvJ
 vzDA==
X-Gm-Message-State: ANoB5pkBB82fYM+axQrfOCs+sORw6MJQT1bAPa+tK5LZ9ce/jxhKm8cv
 2ssp33suTvCD6JlHc2+gES4/KmwRMtQwL22f4Ck=
X-Google-Smtp-Source: AA0mqf7MCrwPELMwgFgU5l2HoJlgYtwomRt5PoadmYJ7EfYoG/xICXwvUsufga/yQTdPou1EIvIj3A==
X-Received: by 2002:a17:906:2a8c:b0:78d:f454:3771 with SMTP id
 l12-20020a1709062a8c00b0078df4543771mr10895148eje.20.1670791565328; 
 Sun, 11 Dec 2022 12:46:05 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b20-20020aa7df94000000b0044dbecdcd29sm3047570edy.12.2022.12.11.12.46.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:46:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 05/11] hw/mips/bootloader: Implement nanoMIPS JALRc
 opcode generator
Date: Sun, 11 Dec 2022 21:45:27 +0100
Message-Id: <20221211204533.85359-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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


