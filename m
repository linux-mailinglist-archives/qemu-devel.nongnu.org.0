Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB10654813
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:57:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TYa-0006JV-8m; Thu, 22 Dec 2022 16:56:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYY-0006J8-J0
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:50 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYW-0007BZ-VC
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:50 -0500
Received: by mail-ej1-x629.google.com with SMTP id x22so7917543ejs.11
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eJ7KNsaeAIcuwibRTmPK9N9xgsftdW4nEKhohT2Tqnw=;
 b=iEJLpHzxwaMTP58pZ88b0id+U1wBqsANL8xy71bWCVFNFM5kcDG3ZdVXfazrcPtyX/
 ixcgwz+TC0oP0uRW97t/ytQ+1XJdlDOFCwuC/hjbSiIu/IMX9NUMtXef0b+/rjzN6iaG
 wsFz61/5/GT/yfanAI+qySmtDVLSMasDNPux5GBjDmQ3RamY1zvRJ5gDjKuoEN8BaIGg
 /hqnFlGpvU+xN5E/MOOZj0aavFIXbWtp9CcjTT5txDXZp+mVNxK/cIYN0FXI4s3UDx6s
 lX32iIwQD3rrfo/yVo0IAAOTWfhwD8XXnC5Rc1ZGXNyIEFKN+xvaZwWcLT4b85wIxC/F
 cJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eJ7KNsaeAIcuwibRTmPK9N9xgsftdW4nEKhohT2Tqnw=;
 b=NeqxxRzBShtfHObof87ByPCK3YWDPijfjyHkBycWXy+apEFzqvW++THhJJRiQVbZSl
 TPscShFagaZpaGmHkvCJ71JtgpKWDbif5VZiqJXyOUCOgcqp1BZk68OVrWNpGuqaMrMe
 LG/od5dX5wJ9pF9d+xAg/lgNTTQbdU5IU7H4NdGG8mCemweh+n2UyK5cJt6pmHAMqV8w
 jpQTVMyp95MvxLj8UCTSfbsgxw4QJHlqnQMWSJcUXlQPR5uCdwhYiSFik/mTGeDnxxm5
 tHT/y1FhPVpz4nki3oqUO2IaHWLSth1sEag++OZUl3d2EhrPndkdD++XeB9cCteUXgyx
 FtGw==
X-Gm-Message-State: AFqh2kpaa8VjsXpqPnO/j5SIZLkNsJv+6ar7uRqJR+qxycxFgCHD8q+g
 A2jvZpbHKpyeZNGoa2s0Ps5v2gbDWYIzW0MLE6M=
X-Google-Smtp-Source: AMrXdXtuss5o08KxNpb5nby1BGvCG90E3B43FCMc4TXwkj2/xqgItww1hPCW2i/2MjMOMUbEN/UOxw==
X-Received: by 2002:a17:907:c28f:b0:7c1:eb:b2a7 with SMTP id
 tk15-20020a170907c28f00b007c100ebb2a7mr9430560ejc.13.1671746208107; 
 Thu, 22 Dec 2022 13:56:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s22-20020aa7cb16000000b00457b5ba968csm788692edt.27.2022.12.22.13.56.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:47 -0800 (PST)
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
Subject: [PATCH 5/6] hw/arm/xilinx_zynq: Remove tswap32() calls and constify
 smpboot[]
Date: Thu, 22 Dec 2022 22:55:48 +0100
Message-Id: <20221222215549.86872-6-philmd@linaro.org>
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
 hw/arm/xilinx_zynq.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..4316143b71 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -71,6 +71,11 @@ static const int dma_irqs[8] = {
 
 #define ZYNQ_SDHCI_CAPABILITIES 0x69ec0080  /* Datasheet: UG585 (v1.12.1) */
 
+struct ZynqMachineState {
+    MachineState parent;
+    Clock *ps_clk;
+};
+
 #define ARMV7_IMM16(x) (extract32((x),  0, 12) | \
                         extract32((x), 12,  4) << 16)
 
@@ -79,29 +84,21 @@ static const int dma_irqs[8] = {
  */
 
 #define SLCR_WRITE(addr, val) \
-    0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16)), /* movw r1 ... */ \
-    0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16)), /* movt r1 ... */ \
-    0xe5801000 + (addr)
-
-struct ZynqMachineState {
-    MachineState parent;
-    Clock *ps_clk;
-};
+    cpu_to_le32(0xe3001000 + ARMV7_IMM16(extract32((val),  0, 16))), /* movw r1 ... */ \
+    cpu_to_le32(0xe3401000 + ARMV7_IMM16(extract32((val), 16, 16))), /* movt r1 ... */ \
+    const_le32(0xe5801000 + (addr))
 
 static void zynq_write_board_setup(ARMCPU *cpu,
                                    const struct arm_boot_info *info)
 {
-    int n;
-    uint32_t board_setup_blob[] = {
-        0xe3a004f8, /* mov r0, #0xf8000000 */
+    const uint32_t board_setup_blob[] = {
+        const_le32(0xe3a004f8),         /* mov r0, #0xf8000000 */
         SLCR_WRITE(SLCR_UNLOCK_OFFSET, SLCR_XILINX_UNLOCK_KEY),
         SLCR_WRITE(SLCR_ARM_PLL_OFFSET, 0x00014008),
         SLCR_WRITE(SLCR_LOCK_OFFSET, SLCR_XILINX_LOCK_KEY),
-        0xe12fff1e, /* bx lr */
+        const_le32(0xe12fff1e)          /* bx lr */
     };
-    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
-        board_setup_blob[n] = tswap32(board_setup_blob[n]);
-    }
+
     rom_add_blob_fixed("board-setup", board_setup_blob,
                        sizeof(board_setup_blob), BOARD_SETUP_ADDR);
 }
-- 
2.38.1


