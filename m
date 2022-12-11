Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AA3649656
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 21:46:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4TD0-0005Cx-3M; Sun, 11 Dec 2022 15:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TCv-0005CS-Ly
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:45:57 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4TCt-0003RN-Mk
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 15:45:57 -0500
Received: by mail-ej1-x62b.google.com with SMTP id kw15so23287141ejc.10
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 12:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U4rIDZ7SV5XNk1rUwM4p0SKpFhukmmdzChpWUah/f+E=;
 b=y51PhjNTCSJNQuD5BfHr+WXnBI4LoofxnE0OnWzz5DEcHjjgwqza0BoDZsgZZp+TLA
 H8NaW76qEDTu/6XgBj6zHHuU5ny0I+BUwwHDUF/0hEEmUK9iQN/WGDZLtqNt0ztHLwtX
 yp72nXcyp4RB/9YDGQ4WE5uz4OihCMWiBWwHMZoYey+qpJbpnLuUG0fSYjFQM5s0FP+I
 X1os4H5u811fOtA50dDKYJFrxkyO8YKRnhgdUr9xblFyUTu4cD4tSV+sb9ZfqfMwQ5Y6
 g590plxOdFEZi3x/mds8VTVdmfxFrP5unEvat9LQZO7F4R4XL6t4VQoa2zSjOJlwcLWo
 OIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U4rIDZ7SV5XNk1rUwM4p0SKpFhukmmdzChpWUah/f+E=;
 b=0coIdCBli7RskV2I6gGz0DH1WxW35P5zIybU73GkkRwmc1TZ2iCtzrdJ6VIFGVdReT
 JzVAAJ55nQ0AIwq1knFjLvcj46NkZ+XpOGodsN+hlN2rmIBgt8Yi0IkQQ3p88vG+5Uqu
 DasmvZz18Jo5b1MEcO89W3ySXX80PVRj7WfdjJzgst7dhGEH4NOP9iAl/CMia5WJXKCl
 ogaDUYkzyOCZu9CnqbjYyH4t7a21EnLAvaLPwNF5EUvz1v+S07hW9yvzgb4RPybCGO8E
 ZwbB1hQEveP3NOdRott4STVS55AcdY0dJIb5mejPua42JTxtYaMz7l8/xiSXHQ8/15cd
 dGwQ==
X-Gm-Message-State: ANoB5pnOX4pJTg6d8CxJ6NzjjJ4MI8qYHTWIemXHFe57nUuGiXjbMDAJ
 uu/bgpi48twsnqrXF+z6QhiCD3KV3qniRAc5yKc=
X-Google-Smtp-Source: AA0mqf4oW8BV41MPP/vHRzrJ7djITVap06hQkhVkPTsfetlv6rYrRKaTbBlc1tX4fKD9/tJVJG/aug==
X-Received: by 2002:a17:906:411b:b0:7c0:a48b:2dff with SMTP id
 j27-20020a170906411b00b007c0a48b2dffmr11414670ejk.43.1670791554076; 
 Sun, 11 Dec 2022 12:45:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lb22-20020a170907785600b00780982d77d1sm2409021ejc.154.2022.12.11.12.45.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Dec 2022 12:45:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 v2 03/11] hw/mips/bootloader: Implement nanoMIPS SW
 opcode generator
Date: Sun, 11 Dec 2022 21:45:25 +0100
Message-Id: <20221211204533.85359-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
References: <20221211204533.85359-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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
 hw/mips/bootloader.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 0035f37335..3e1e73360f 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -143,9 +143,27 @@ static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
     bl_gen_i_type(p, 0x0d, rs, rt, imm);
 }
 
+static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t ofs12)
+{
+    uint32_t insn = 0;
+
+    assert(extract32(ofs12, 0, 12) == ofs12);
+    insn = deposit32(insn, 26, 6, 0b100001);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 16, 5, rs);
+    insn = deposit32(insn, 12, 4, 0b1001);
+    insn = deposit32(insn, 0, 12, ofs12);
+
+    st_nm32_p(ptr, insn);
+}
+
 static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset)
 {
-    bl_gen_i_type(p, 0x2b, base, rt, offset);
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        bl_gen_sw_nm(p, rt, base, offset);
+    } else {
+        bl_gen_i_type(p, 0x2b, base, rt, offset);
+    }
 }
 
 static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
-- 
2.38.1


