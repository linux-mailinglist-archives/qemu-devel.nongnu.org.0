Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A5648F89
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42CR-0003Xk-Vs; Sat, 10 Dec 2022 10:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CJ-0003SS-Mo
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:35 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42CI-0004Og-7i
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:31 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso1842217wme.5
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKz4mcswYkRci+UIrMG/hIhKLFd8Jngr0Cb+SmfdDdk=;
 b=BlaqyMTcK21rg7Q9vSGSZB/5WPJEpRxDVaJzsd8TFiVEm41CLVSf2Os6NCXPQ1uC3a
 R1GwDQCoo/M/r1aymiY2HnaNyRx9DrrdZZ9b5YcwSvuXZgZQemtDn4nsghRf9pWekocU
 8idPQtzxc0udc53ZK8NS7/BCktaXV5Zl+2Yk5kbf4Rj7YH9brqLzyWOL6GP7jdiJ0mND
 k8qy30NO24j3KAwUjthBDiGSURhHOVNHvnzK85ExAEbegkCRes0miIf/gZgBKRB8dnat
 dfyil7ihq5iNpM5FPQPkQe12ouJh+iTwYwkGr8phS6yFZwM+cOWfkkm2SR8PkfdfwQ00
 8ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKz4mcswYkRci+UIrMG/hIhKLFd8Jngr0Cb+SmfdDdk=;
 b=DXBUPhtWeIL16oiOcwtrFAt2m23bUaQ0z/eG0DbnnZwu4aWh/uwCkVrhmu9HmBwmID
 7DtUQfG41DBguuRhVVDkd1eISgNpnh8qKU+EG9VghNhj5kRBImYGbxXPeKaX0C6FQTPh
 gSyh/0bd9c+j2MwzjNbOx9sMJ1mxkxltmhfCxAC+1tr+fLHFs8qBTjMUtFTRwEcshX3v
 e2wKNDTPaJypXTELy4o5o54/VYk5S8mhKcxCf1aZ8sbU9yHZtkzd7+lW7nBrh9klBYrT
 Zpo0ByWj07/iIOygGGlkjt/lnVZC335JhDD0wge353JnrgDlzwqzzV9ro24eQbql+Db5
 unww==
X-Gm-Message-State: ANoB5pkk3gRFLh3p++yfLB6Bg1yJgMvXkMnItBiy9cm8PCas+PF+ILcC
 IqiErWjrtMUWYXj7DHrvS5PI7HDWYsthmHzuHIo=
X-Google-Smtp-Source: AA0mqf7i5fQgZs23xEjgpfJ3p/lKIl1LLFAekgDdslj5oWKKrNMC1iaaE2rPCrrbazo425pYA5mx2g==
X-Received: by 2002:a05:600c:34ce:b0:3cf:f9a7:fadf with SMTP id
 d14-20020a05600c34ce00b003cff9a7fadfmr7626204wmq.38.1670687728039; 
 Sat, 10 Dec 2022 07:55:28 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d5267000000b00241cfe6e286sm4059497wrc.98.2022.12.10.07.55.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 4/7] hw/mips/bootloader: Implement nanoMIPS LUI opcode
Date: Sat, 10 Dec 2022 16:54:59 +0100
Message-Id: <20221210155502.74609-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210155502.74609-1-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
 hw/mips/bootloader.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 7f7d938f2e..997e74ee52 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -120,11 +120,34 @@ static void bl_gen_jalr(void **p, bl_reg rs)
     bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
 }
 
+static void bl_gen_lui_nm(void **ptr, bl_reg rt, uint32_t imm20)
+{
+    uint16_t *p = (uint16_t *)*ptr;
+    uint32_t insn = 0;
+
+    insn = deposit32(insn, 26, 6, 0b111000);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 12, 9, extract32(imm20, 12, 9));
+    insn = deposit32(insn, 2, 10, extract32(imm20, 21, 10));
+    insn = deposit32(insn, 0, 1, sextract32(imm20, 31, 1));
+
+    stw_p(p, insn >> 16);
+    p++;
+    stw_p(p, insn >> 0);
+    p++;
+
+    *ptr = p;
+}
+
 static void bl_gen_lui(void **p, bl_reg rt, uint32_t imm32)
 {
-    /* R6: It's a alias of AUI with RS = 0 */
-    assert(imm32 <= UINT16_MAX);
-    bl_gen_i_type(p, 0x0f, 0, rt, extract32(imm32, 16, 16));
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        bl_gen_lui_nm(p, rt, imm32);
+    } else {
+        /* R6: It's a alias of AUI with RS = 0 */
+        assert(imm32 <= UINT16_MAX);
+        bl_gen_i_type(p, 0x0f, 0, rt, extract32(imm32, 16, 16));
+    }
 }
 
 static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
-- 
2.38.1


