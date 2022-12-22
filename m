Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66F6654817
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:57:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TYQ-0006GU-I0; Thu, 22 Dec 2022 16:56:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYO-0006Eu-Mg
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:40 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYM-0007BZ-UK
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:40 -0500
Received: by mail-ej1-x629.google.com with SMTP id x22so7916808ejs.11
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tY6SKki/uWVAIv0MsBbw55az0oWSvt0PY3G9FmsSaas=;
 b=dL2p6foofY2Hh8ZXBKcxBNbv/lgbNEFe5cLgSUrKSUL+jWtf1wanV1AMKwCRFciuJa
 xIooGOS3YkjLkhuit47Mn5MbWS5t3Gducg7evlcKxWBkrhN76QWacmDIZmIlLXYvm7qx
 SyxOTaumiunB9eCKnaAkO+jHD5r7UQRRkrmFxgpDS3cBCebveK5sjIgtkk7iJtW3roKl
 T2J5nZh9xPTzhnyW/q2vQfs/lqb4A91T00B/8JIRDmVo8Ya365bwU/dN4Zt5lO8hlUMj
 0dM3DrIkHCTqCds2lywM8cCGc50ct5xYEz2qOCErERNvUR4Z8YAW/UIIhwl7QMSskyM8
 thCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tY6SKki/uWVAIv0MsBbw55az0oWSvt0PY3G9FmsSaas=;
 b=EL1xUyHVHGV/qwbMgBP8JOxaHBx3ufRqG16drb/6yzzuOEOMtifRVkaPtFTZgqTfXb
 aAEAPb3vzJJp6GkpG7JONIDkkHBYYARj/Kn1n2Vdmjm36fJwwZ5Tk7f/p6DpZ3JNAe4R
 fp3lFJqsJhXPQZBzb7Hv5D95Iak0wsXevrmr1pJ5PsZNRHsvT+5tjw6QGPVomNQLkHK/
 vMGIIpyC6jCLrZpMuIQFrfptOHzYZv4vDxngRxfmbC3CT9QBgQUoiylNfmptJ6UZqIit
 Yr+dnRepdNeK7hqzYqSUuLyD1C1SYEgv2k8nPjcg7TW/hnhMh4yLQGPkYQYXHC6vbmtM
 74mw==
X-Gm-Message-State: AFqh2krmGFTM1p4jfWFUeEC8y6ef9ifA/cfy5Nl0zQd+oqFiUQ0tVA2Z
 chGkwuUX+ErAILaj4zCj3nEaMVo+94R6UebeTUQ=
X-Google-Smtp-Source: AMrXdXtHMU7gQ8Ru7YY8/bkUVTK46FlRiW6635DDWvaACMvDiMLjDtB//vZufnjG6WdCU78F4x66CQ==
X-Received: by 2002:a17:907:9a98:b0:7c1:d4c:f08c with SMTP id
 km24-20020a1709079a9800b007c10d4cf08cmr5506851ejc.4.1671746197418; 
 Thu, 22 Dec 2022 13:56:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a1709062f0600b007933047f923sm646867eji.118.2022.12.22.13.56.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 4/6] hw/arm/npcm7xx: Remove tswap32() calls and constify
 smpboot[]
Date: Thu, 22 Dec 2022 22:55:47 +0100
Message-Id: <20221222215549.86872-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
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

ARM CPUs fetch instructions in little-endian.

smpboot[] encoded instructions are written in little-endian.

We call tswap32() on the array. tswap32 function swap a 32-bit
value if the target endianness doesn't match the host one.
Otherwise it is a NOP.

* On a little-endian host, the array is stored as it. tswap32()
  is a NOP, and the vCPU fetches the instructions as it, in
  little-endian.

* On a big-endian host, the array is stored as it. tswap32()
  swap the instructions to little-endian, and the vCPU fetches
  the instructions as it, in little-endian.

Using tswap() on system emulation is a bit odd: while the target
particularities might change the system emulation, the host ones
(such its endianness) shouldn't interfere.

We can simplify by using const_le32() to always store the
instructions in the array in little-endian, removing the need
for the dubious tswap().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Note there is still a tswap() call in npcm7xx_init_fuses()
---
 hw/arm/npcm7xx.c | 49 ++++++++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc02765..2976192731 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -291,22 +291,18 @@ static const struct {
 static void npcm7xx_write_board_setup(ARMCPU *cpu,
                                       const struct arm_boot_info *info)
 {
-    uint32_t board_setup[] = {
-        0xe59f0010,     /* ldr r0, clk_base_addr */
-        0xe59f1010,     /* ldr r1, pllcon1_value */
-        0xe5801010,     /* str r1, [r0, #16] */
-        0xe59f100c,     /* ldr r1, clksel_value */
-        0xe5801004,     /* str r1, [r0, #4] */
-        0xe12fff1e,     /* bx lr */
-        NPCM7XX_CLK_BA,
-        NPCM7XX_PLLCON1_FIXUP_VAL,
-        NPCM7XX_CLKSEL_FIXUP_VAL,
+    static const uint32_t board_setup[] = {
+        const_le32(0xe59f0010),     /* ldr r0, clk_base_addr */
+        const_le32(0xe59f1010),     /* ldr r1, pllcon1_value */
+        const_le32(0xe5801010),     /* str r1, [r0, #16] */
+        const_le32(0xe59f100c),     /* ldr r1, clksel_value */
+        const_le32(0xe5801004),     /* str r1, [r0, #4] */
+        const_le32(0xe12fff1e),     /* bx lr */
+        const_le32(NPCM7XX_CLK_BA),
+        const_le32(NPCM7XX_PLLCON1_FIXUP_VAL),
+        const_le32(NPCM7XX_CLKSEL_FIXUP_VAL),
     };
-    int i;
 
-    for (i = 0; i < ARRAY_SIZE(board_setup); i++) {
-        board_setup[i] = tswap32(board_setup[i]);
-    }
     rom_add_blob_fixed("board-setup", board_setup, sizeof(board_setup),
                        info->board_setup_addr);
 }
@@ -321,22 +317,17 @@ static void npcm7xx_write_secondary_boot(ARMCPU *cpu,
      * we need to provide our own smpboot stub that can not use 'wfi', it has
      * to spin the secondary CPU until the first CPU writes to the SCRPAD reg.
      */
-    uint32_t smpboot[] = {
-        0xe59f2018,     /* ldr r2, bootreg_addr */
-        0xe3a00000,     /* mov r0, #0 */
-        0xe5820000,     /* str r0, [r2] */
-        0xe320f002,     /* wfe */
-        0xe5921000,     /* ldr r1, [r2] */
-        0xe1110001,     /* tst r1, r1 */
-        0x0afffffb,     /* beq <wfe> */
-        0xe12fff11,     /* bx r1 */
-        NPCM7XX_SMP_BOOTREG_ADDR,
+    static const uint32_t smpboot[] = {
+        const_le32(0xe59f2018),             /* ldr r2, bootreg_addr */
+        const_le32(0xe3a00000),             /* mov r0, #0 */
+        const_le32(0xe5820000),             /* str r0, [r2] */
+        const_le32(0xe320f002),             /* wfe */
+        const_le32(0xe5921000),             /* ldr r1, [r2] */
+        const_le32(0xe1110001),             /* tst r1, r1 */
+        const_le32(0x0afffffb),             /* beq <wfe> */
+        const_le32(0xe12fff11),             /* bx r1 */
+        const_le32(NPCM7XX_SMP_BOOTREG_ADDR),
     };
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(smpboot); i++) {
-        smpboot[i] = tswap32(smpboot[i]);
-    }
 
     rom_add_blob_fixed("smpboot", smpboot, sizeof(smpboot),
                        NPCM7XX_SMP_LOADER_START);
-- 
2.38.1


