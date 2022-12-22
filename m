Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F1654818
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:58:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TYm-0006VT-UG; Thu, 22 Dec 2022 16:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYk-0006Un-Mb
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:57:02 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TYh-0007EH-UN
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:57:02 -0500
Received: by mail-ed1-x536.google.com with SMTP id d20so4822554edn.0
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaCMViCuj4W9XyEnm5VQb8sPut9cn3g3RlnYgzpwXls=;
 b=b63W81rKmo4/ZnXugf6jX8/2b0n871C2CAv6YBF7wVsUO+p0rhxKUe3xLhiobUCKbk
 4fJPeXp7s0bM5I0J5UR03+whgmV/+06B7XinRm6gmT2JTtGVt67SnbecTEKjvv8JzVQ4
 PwJbBgk45AJ7195pPg2J7xIJRYMa78j63MyH4J3QMmjyKFyz9eC+HKROHiJCV06v/4T8
 9+EtVUPRf46b0PeHSLluzF7d5eHcykEuZYLZct4vgBv1+wRjhUw2znsi+qlXTEqMzCTI
 FR1IueVwJpCIAnPbgX13TIlrmFDFHbI0mq/Q3SZYgHWJowpxIh606AUPbFDrMPzg4BSv
 mAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaCMViCuj4W9XyEnm5VQb8sPut9cn3g3RlnYgzpwXls=;
 b=0AUVjJQT5xsuwUcBFupxc2gL2BN69pOUvmEKpRi8rvrkYrdhEt6P8GHqDXl48ITwag
 V1eqcyxMSAVaiR3XLsCTJneGx764e5So0OpnUh6turuLgj8URt9lzw7DTwiRW8+RY6cc
 VH9UGHjVOMv+7hY8uKLAIzCd9r7YIXbuKAyKP1abcqhhJheDtrtL63yOYlCAtQNRjBSA
 GcJR82Bpeg9zieXfiuCATCCwpDjIR8zyRtPiZVdcgEyf4uuc+50iuBJT59el229n7Y9y
 pNoXKGMqD82UIE+6KWM9s3LCrxyrKTZiEJl7x5zBfWulkyCCqhy0ZDzinKrqn7VMi+YC
 oT1g==
X-Gm-Message-State: AFqh2kr4TT/qpBulNCPCpH+4ITHwARWJelOMRdC87wHfjrZGcslbj8U+
 chF0UnH7nZInLENVOvkeupcfVvUjFqxFqz7VoKg=
X-Google-Smtp-Source: AMrXdXvUDSJYD7cxIJogQUH51O3kMECLUfAK4IN5Oq9qfUJCj7/C8Txk6DJtHnnM1TfKyAyT4tW/EQ==
X-Received: by 2002:a05:6402:4141:b0:461:8be6:1ac4 with SMTP id
 x1-20020a056402414100b004618be61ac4mr6322707eda.20.1671746218073; 
 Thu, 22 Dec 2022 13:56:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b15-20020aa7c90f000000b0046aa78ecd8asm803616edt.3.2022.12.22.13.56.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:57 -0800 (PST)
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
Subject: [PATCH 6/6] hw/arm/boot: Remove tswap32() calls and constify
 board_setup_blob[]
Date: Thu, 22 Dec 2022 22:55:49 +0100
Message-Id: <20221222215549.86872-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

board_setup_blob[] encoded instructions are written in little-endian.

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
 hw/arm/boot.c | 52 ++++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..22a100f19b 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -189,7 +189,7 @@ static void write_bootloader(const char *name, hwaddr addr,
         default:
             abort();
         }
-        code[i] = tswap32(insn);
+        code[i] = cpu_to_le32(insn);
     }
 
     assert((len * sizeof(uint32_t)) < BOOTLOADER_MAX_SIZE);
@@ -222,34 +222,33 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
                                             hwaddr mvbar_addr)
 {
     AddressSpace *as = arm_boot_address_space(cpu, info);
-    int n;
-    uint32_t mvbar_blob[] = {
+    static const uint32_t mvbar_blob[] = {
         /* mvbar_addr: secure monitor vectors
          * Default unimplemented and unused vectors to spin. Makes it
          * easier to debug (as opposed to the CPU running away).
          */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xe1b0f00e, /* movs pc, lr ;SMC exception return */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
-        0xeafffffe, /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xe1b0f00e), /* movs pc, lr ;SMC exception return */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe), /* (spin) */
+        const_le32(0xeafffffe)  /* (spin) */
     };
-    uint32_t board_setup_blob[] = {
+    const uint32_t board_setup_blob[] = {
         /* board setup addr */
-        0xee110f51, /* mrc     p15, 0, r0, c1, c1, 2  ;read NSACR */
-        0xe3800b03, /* orr     r0, #0xc00             ;set CP11, CP10 */
-        0xee010f51, /* mcr     p15, 0, r0, c1, c1, 2  ;write NSACR */
-        0xe3a00e00 + (mvbar_addr >> 4), /* mov r0, #mvbar_addr */
-        0xee0c0f30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
-        0xee110f11, /* mrc     p15, 0, r0, c1 , c1, 0 ;read SCR */
-        0xe3800031, /* orr     r0, #0x31              ;enable AW, FW, NS */
-        0xee010f11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
-        0xe1a0100e, /* mov     r1, lr                 ;save LR across SMC */
-        0xe1600070, /* smc     #0                     ;call monitor to flush SCR */
-        0xe1a0f001, /* mov     pc, r1                 ;return */
+        const_le32(0xee110f51), /* mrc  p15, 0, r0, c1, c1, 2  ;read NSACR */
+        const_le32(0xe3800b03), /* orr  r0, #0xc00             ;set CP11, CP10 */
+        const_le32(0xee010f51), /* mcr  p15, 0, r0, c1, c1, 2  ;write NSACR */
+        const_le32(0xe3a00e00 + (mvbar_addr >> 4)), /* mov r0, #mvbar_addr */
+        const_le32(0xee0c0f30), /* mcr  p15, 0, r0, c12, c0, 1 ;set MVBAR */
+        const_le32(0xee110f11), /* mrc  p15, 0, r0, c1 , c1, 0 ;read SCR */
+        const_le32(0xe3800031), /* orr  r0, #0x31              ;enable AW, FW, NS */
+        const_le32(0xee010f11), /* mcr  p15, 0, r0, c1, c1, 0  ;write SCR */
+        const_le32(0xe1a0100e), /* mov  r1, lr                 ;save LR across SMC */
+        const_le32(0xe1600070), /* smc  #0                     ;call monitor to flush SCR */
+        const_le32(0xe1a0f001)  /* mov  pc, r1                 ;return */
     };
 
     /* check that mvbar_addr is correctly aligned and relocatable (using MOV) */
@@ -259,15 +258,8 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
     assert((mvbar_addr + sizeof(mvbar_blob) <= info->board_setup_addr)
           || (info->board_setup_addr + sizeof(board_setup_blob) <= mvbar_addr));
 
-    for (n = 0; n < ARRAY_SIZE(mvbar_blob); n++) {
-        mvbar_blob[n] = tswap32(mvbar_blob[n]);
-    }
     rom_add_blob_fixed_as("board-setup-mvbar", mvbar_blob, sizeof(mvbar_blob),
                           mvbar_addr, as);
-
-    for (n = 0; n < ARRAY_SIZE(board_setup_blob); n++) {
-        board_setup_blob[n] = tswap32(board_setup_blob[n]);
-    }
     rom_add_blob_fixed_as("board-setup", board_setup_blob,
                           sizeof(board_setup_blob), info->board_setup_addr, as);
 }
-- 
2.38.1


