Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12433648F8F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42CW-0003hh-MU; Sat, 10 Dec 2022 10:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CU-0003ev-Ak
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:42 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CS-0004Tb-QJ
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f18so8002767wrj.5
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4QRrKPOgHC81ExTYEFHUZ5O6izEXVdgJCHiyrcpa6dc=;
 b=Wj4SZKrF4KwF28d17HNYAxQgnwyV3gcvJNe/Xzn8OlDN70bgx47YyfAhGOum4IlIVH
 LoG/ngrLblmgdMcetVhO9B8kptJumRToOTF2XxKV+K9NGpdzaN+iqHFx8b1qH5tvblQh
 u+eGpn1cHANIxdaZbjzeJop2ekX0+mJ/6bfOUQrvthPArGR0xOAhT1WiDOwEdERwbcYy
 XRnOvaThEl2em6Ai99/2Heh1xQCNiLI6ijuA9Mx8LFYJ/U/vaKH/CP2C8VgiOjgACa4Y
 QId0C6kQ3HNkeFBLRFuBAeH7wvje8ErAryMJiTgHr0UVNd+bVKeXEpo0an6A3UzkFE+g
 bTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4QRrKPOgHC81ExTYEFHUZ5O6izEXVdgJCHiyrcpa6dc=;
 b=bTyEe2R138wJ6GIxVLVnLt234mVCn9g63yaQr3OWI/hyNFjAFwIjOHr3ZixLaDzZ+x
 tB32nGGep7v6hsFHM3xEDYhq2VpVn/fzy96sM9BsEPokQDqJDKQQ4aMhBREaHLUGbjHB
 PzAE+wDDBcklzXgK8AXMn/xSR1M9OktdujLmzMpnWIoylxZR1m4X8FjA+9RHuzXzfeys
 SnwXO1PJjuCXJfieietyitGrjRHoGSS/ElPeusLwM5lh67SFDk+YQboONLvS5vP7sPQy
 bZNHNnwsfUGajv3KwtObIpZ21FGaFOUxlcBnWNIfuWpEMlDbt8nUreLG3QhmMcjifnYc
 +yaA==
X-Gm-Message-State: ANoB5plpAIuq0kly6Nt+Nt2rmAVJTc+iCqKejrDgw5ASGC6OYhX+PRrp
 dLGHKW1ZZJsLi2SqSddwOs2XslyXnj0n7CSeRuY=
X-Google-Smtp-Source: AA0mqf4WsHB/rNrV2VbqdW05xYb9ymVABX0DjxuQOT6IcyU7RckfhlvljXYSaI8q2qMidV4iqRMybA==
X-Received: by 2002:adf:e7c3:0:b0:242:eb5:254f with SMTP id
 e3-20020adfe7c3000000b002420eb5254fmr6967088wrn.48.1670687739261; 
 Sat, 10 Dec 2022 07:55:39 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a5d58c5000000b00241da0e018dsm4111229wrf.29.2022.12.10.07.55.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 6/7] hw/mips/bootloader: Implement nanoMIPS SW opcode
Date: Sat, 10 Dec 2022 16:55:01 +0100
Message-Id: <20221210155502.74609-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210155502.74609-1-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
 hw/mips/bootloader.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index cc3df385df..541b59bf84 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -177,9 +177,32 @@ static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
     }
 }
 
+static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t offset)
+{
+    uint16_t *p = (uint16_t *)*ptr;
+    uint32_t insn = 0;
+
+    insn = deposit32(insn, 26, 6, 0b100001);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 16, 5, rs);
+    insn = deposit32(insn, 12, 4, 0b1001);
+    insn = deposit32(insn, 0, 12, offset);
+
+    stw_p(p, insn >> 16);
+    p++;
+    stw_p(p, insn >> 0);
+    p++;
+
+    *ptr = p;
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


