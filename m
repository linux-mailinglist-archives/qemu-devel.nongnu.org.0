Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51B32D3BC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:58:20 +0100 (CET)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnYZ-0003Fr-6a
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnKG-00042Q-4A; Thu, 04 Mar 2021 07:43:32 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnKE-00016T-Gn; Thu, 04 Mar 2021 07:43:31 -0500
Received: by mail-pj1-x1030.google.com with SMTP id ch11so864171pjb.4;
 Thu, 04 Mar 2021 04:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qiSe1m6SraHxEiBlxw2mIet7Zd+qJP85kLR+YPU+/yQ=;
 b=aVJNOATSATx9GMRVcG7keMtXLrywiWfleek3H9Be8WGcZG6VKvWRvlZyvEhvUybxTU
 tHO31md+ZBbK++LYQI0Q6fyceGQoPs6F5u1TIN8n+71/x8CEIwFUQmWMsAE+Q2508eO0
 00fuLjzrY6/znm4i05XkAkfGXt+0YN5Sui5Zrr9709g773boGqHdsVpItpqfksXxEzwP
 QATPo6yuoaxYIC21v/pl/t8+Ct7CfzRp61wiILb6TUcH1/wSKbwWlAz1gn3hpDa2aB7g
 euo8JDGI3F2G0v0yI+1jjUmP7eIV2uCQ1hWFjR+dUsRbKe2Db4LDctcSGd3zPurZB/Ny
 Zg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=qiSe1m6SraHxEiBlxw2mIet7Zd+qJP85kLR+YPU+/yQ=;
 b=IGDFYrZut6/XFlAh9mNSEcbD/InlhUdjiPovjKnyvK65Vwwaa1rSH1oCKb/9i7fmtm
 xQhpsZidd/a/LUUhjwIHobpwY5iqHyQKik7YE8+xnPqG+2PV+6NjUKY2vxRyj5Zehx20
 M3rWf6M7IsgeZx6blHFZ6XkvgDwwVmq3QPtNHnf4W36OoYArMeUDxO75PqQaOiFsNXbP
 ejJj82fBDI56Xym+aWExnJShOqkuI1G2IwzPytgxyK5Cz3AV0Ksj4ekS3fW7JTCTHY+e
 Pr3QBaJB97Z/FG2pe5olsw3CuGL2OI5XgCB+RV09KqzJVviUVzbM9tG4YHTYhTWTAAv4
 IdVQ==
X-Gm-Message-State: AOAM532x20FW7SHckQurlzSktwBW8goMfXCk2bQt2pwzyloapiDG+vci
 B1ak5+d2pTWrr75lfTBAp5c=
X-Google-Smtp-Source: ABdhPJwtEDLUiOb3MhTeghKmFD4T7P2IiQvhzIbPg273zBaHE9uITn+lrqUtpTM0ZTQ1mRMiY0TZhg==
X-Received: by 2002:a17:90a:5505:: with SMTP id
 b5mr4428295pji.194.1614861808279; 
 Thu, 04 Mar 2021 04:43:28 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id u3sm27381637pfb.88.2021.03.04.04.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 04:43:27 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] aspeed: Emulate the AST2600A3
Date: Thu,  4 Mar 2021 23:13:16 +1030
Message-Id: <20210304124316.164742-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the latest revision of the ASPEED 2600 SoC.

Reset values are taken from v8 of the datasheet.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/misc/aspeed_scu.h |  2 ++
 hw/arm/aspeed_ast2600.c      |  2 +-
 hw/misc/aspeed_scu.c         | 32 +++++++++++++++++++++++++-------
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index d49bfb02fbdb..c14aff2bcbb5 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -43,6 +43,8 @@ struct AspeedSCUState {
 #define AST2500_A1_SILICON_REV   0x04010303U
 #define AST2600_A0_SILICON_REV   0x05000303U
 #define AST2600_A1_SILICON_REV   0x05010303U
+#define AST2600_A2_SILICON_REV   0x05020303U
+#define AST2600_A3_SILICON_REV   0x05030303U
 
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
 
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bf31ca351feb..8c42dafe8583 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -480,7 +480,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
 
     sc->name         = "ast2600-a1";
     sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
-    sc->silicon_rev  = AST2600_A1_SILICON_REV;
+    sc->silicon_rev  = AST2600_A3_SILICON_REV;
     sc->sram_size    = 0x16400;
     sc->spis_num     = 2;
     sc->ehcis_num    = 2;
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 40a38ebd8549..3515d6ff6bbf 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -104,11 +104,19 @@
 #define AST2600_SDRAM_HANDSHAKE   TO_REG(0x100)
 #define AST2600_HPLL_PARAM        TO_REG(0x200)
 #define AST2600_HPLL_EXT          TO_REG(0x204)
+#define AST2600_APLL_PARAM        TO_REG(0x210)
+#define AST2600_APLL_EXT          TO_REG(0x214)
+#define AST2600_MPLL_PARAM        TO_REG(0x220)
 #define AST2600_MPLL_EXT          TO_REG(0x224)
+#define AST2600_EPLL_PARAM        TO_REG(0x240)
 #define AST2600_EPLL_EXT          TO_REG(0x244)
+#define AST2600_DPLL_PARAM        TO_REG(0x260)
+#define AST2600_DPLL_EXT          TO_REG(0x264)
 #define AST2600_CLK_SEL           TO_REG(0x300)
 #define AST2600_CLK_SEL2          TO_REG(0x304)
-#define AST2600_CLK_SEL3          TO_REG(0x310)
+#define AST2600_CLK_SEL3          TO_REG(0x308)
+#define AST2600_CLK_SEL4          TO_REG(0x310)
+#define AST2600_CLK_SEL5          TO_REG(0x314)
 #define AST2600_HW_STRAP1         TO_REG(0x500)
 #define AST2600_HW_STRAP1_CLR     TO_REG(0x504)
 #define AST2600_HW_STRAP1_PROT    TO_REG(0x508)
@@ -433,6 +441,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2500_A1_SILICON_REV,
     AST2600_A0_SILICON_REV,
     AST2600_A1_SILICON_REV,
+    AST2600_A2_SILICON_REV,
+    AST2600_A3_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
@@ -651,16 +661,24 @@ static const MemoryRegionOps aspeed_ast2600_scu_ops = {
     .valid.unaligned = false,
 };
 
-static const uint32_t ast2600_a1_resets[ASPEED_AST2600_SCU_NR_REGS] = {
+static const uint32_t ast2600_a3_resets[ASPEED_AST2600_SCU_NR_REGS] = {
     [AST2600_SYS_RST_CTRL]      = 0xF7C3FED8,
-    [AST2600_SYS_RST_CTRL2]     = 0xFFFFFFFC,
+    [AST2600_SYS_RST_CTRL2]     = 0x0DFFFFFC,
     [AST2600_CLK_STOP_CTRL]     = 0xFFFF7F8A,
     [AST2600_CLK_STOP_CTRL2]    = 0xFFF0FFF0,
     [AST2600_SDRAM_HANDSHAKE]   = 0x00000000,
-    [AST2600_HPLL_PARAM]        = 0x1000405F,
+    [AST2600_HPLL_PARAM]        = 0x1000408F,
+    [AST2600_APLL_PARAM]        = 0x1000405F,
+    [AST2600_MPLL_PARAM]        = 0x1008405F,
+    [AST2600_EPLL_PARAM]        = 0x1004077F,
+    [AST2600_DPLL_PARAM]        = 0x1078405F,
+    [AST2600_CLK_SEL]           = 0xF3940000,
+    [AST2600_CLK_SEL2]          = 0x00700000,
+    [AST2600_CLK_SEL3]          = 0x00000000,
+    [AST2600_CLK_SEL4]          = 0xF3F40000,
+    [AST2600_CLK_SEL5]          = 0x30000000,
     [AST2600_CHIP_ID0]          = 0x1234ABCD,
     [AST2600_CHIP_ID1]          = 0x88884444,
-
 };
 
 static void aspeed_ast2600_scu_reset(DeviceState *dev)
@@ -675,7 +693,7 @@ static void aspeed_ast2600_scu_reset(DeviceState *dev)
      * of actual revision. QEMU and Linux only support A1 onwards so this is
      * sufficient.
      */
-    s->regs[AST2600_SILICON_REV] = AST2600_A1_SILICON_REV;
+    s->regs[AST2600_SILICON_REV] = AST2600_A3_SILICON_REV;
     s->regs[AST2600_SILICON_REV2] = s->silicon_rev;
     s->regs[AST2600_HW_STRAP1] = s->hw_strap1;
     s->regs[AST2600_HW_STRAP2] = s->hw_strap2;
@@ -689,7 +707,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "ASPEED 2600 System Control Unit";
     dc->reset = aspeed_ast2600_scu_reset;
-    asc->resets = ast2600_a1_resets;
+    asc->resets = ast2600_a3_resets;
     asc->calc_hpll = aspeed_2500_scu_calc_hpll; /* No change since AST2500 */
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
-- 
2.30.1


