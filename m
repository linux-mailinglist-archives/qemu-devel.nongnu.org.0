Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94B654815
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:57:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TYB-00063b-Hs; Thu, 22 Dec 2022 16:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TY9-00062T-HU
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:25 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8TY7-0007AX-Tb
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:56:25 -0500
Received: by mail-ed1-x52a.google.com with SMTP id d14so4727089edj.11
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrBY8xhhloPHHStYYTzLZIUBphfWCL1Sr3LvXL9Y2+E=;
 b=vZZzVd2GmPjInNPlJIQ7HLDrLVkDwzvBoAawnQ3s64Se3LU/32AzmhOvbDfL/oUoQG
 jrzmdjznaxldhfv2Eiv60h3JKNPCkLEivxWEpFR3eUj+3+0IFgc6c1qWveXW51sqJIf6
 muL5K9YYLzKof4V+nUeLeqGRYmPGS9unr70lZLWPbKmiQQ1FNWVeUF8xrMLukjz4s3wG
 lM4RxS/ydo+esz3Se40mIhj0g+hI9HomJbp0X5ewuY8dDcsAJQfBfv3Kmd19cgnEnDaq
 8XhqdDlRYuR+rQ5LzRSTbDMhJmOFCPiC1axyOXliDhH9jNX5cq3FYtQklxrH2nXkfjV8
 ARVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XrBY8xhhloPHHStYYTzLZIUBphfWCL1Sr3LvXL9Y2+E=;
 b=J+o9USfXg5waRPVYdARA7Lt8oIi/GIk7Vo/Kdox3jKf9CyBsXM1xVxTxDQvELhebAC
 WkWj9XB71fZZHAEuBiJZ4x8J6Q76Ufc1mmVlsq4WkYKy1c//xw6Pg3sySmN6KlFaTFdX
 yPdAu26L6O+rEagCGBqO6Yfcj8RgLn5PMX+/pqaP9x+FUdxdNtnHP4uxzutZU9Uz1unH
 Tmmttf6ObkkHPccTwZwtTWXvs0XZvug2OSWIogq8EMG1gd4FyOcrVGUgOjObTe1D7V/v
 fVVVMaL7Zr+nao9kxERnNYvwnNQvsybrcrtLei0HUUmIrwxwwKgtK6iRTcbiHD/84EvP
 d2MA==
X-Gm-Message-State: AFqh2koA7pCiYGmFiQSf6++47+6Lrbsj6s6x/PScNnmt75uEhINwKe24
 tcdyI+72KjKFjXOzw2iqAYpDFFHInsfDn3zCr80=
X-Google-Smtp-Source: AMrXdXvJWZGKtgF0u8IpdXQ57xPzM/UvjNEFZBGsVuVZ+HieahWzQ7cKHXxf2anpT90WjkVOXAWlEQ==
X-Received: by 2002:a05:6402:1cce:b0:472:1b3b:35f1 with SMTP id
 ds14-20020a0564021cce00b004721b3b35f1mr7556762edb.21.1671746182342; 
 Thu, 22 Dec 2022 13:56:22 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k6-20020aa7d2c6000000b00467c3cbab6fsm791917edr.77.2022.12.22.13.56.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Dec 2022 13:56:21 -0800 (PST)
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
Subject: [PATCH 3/6] hw/arm/exynos4210: Remove tswap32() calls and constify
 smpboot[]
Date: Thu, 22 Dec 2022 22:55:46 +0100
Message-Id: <20221222215549.86872-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
References: <20221222215549.86872-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
 hw/arm/exynos4210.c | 48 ++++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 8dafa2215b..89ee83456d 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -468,35 +468,29 @@ static const MemoryRegionOps exynos4210_chipid_and_omr_ops = {
     }
 };
 
-void exynos4210_write_secondary(ARMCPU *cpu,
-        const struct arm_boot_info *info)
+void exynos4210_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
 {
-    int n;
-    uint32_t smpboot[] = {
-        0xe59f3034, /* ldr r3, External gic_cpu_if */
-        0xe59f2034, /* ldr r2, Internal gic_cpu_if */
-        0xe59f0034, /* ldr r0, startaddr */
-        0xe3a01001, /* mov r1, #1 */
-        0xe5821000, /* str r1, [r2] */
-        0xe5831000, /* str r1, [r3] */
-        0xe3a010ff, /* mov r1, #0xff */
-        0xe5821004, /* str r1, [r2, #4] */
-        0xe5831004, /* str r1, [r3, #4] */
-        0xf57ff04f, /* dsb */
-        0xe320f003, /* wfi */
-        0xe5901000, /* ldr     r1, [r0] */
-        0xe1110001, /* tst     r1, r1 */
-        0x0afffffb, /* beq     <wfi> */
-        0xe12fff11, /* bx      r1 */
-        EXYNOS4210_EXT_GIC_CPU_BASE_ADDR,
-        0,          /* gic_cpu_if: base address of Internal GIC CPU interface */
-        0           /* bootreg: Boot register address is held here */
+    const uint32_t smpboot[] = {
+        const_le32(0xe59f3034),     /* ldr r3, External gic_cpu_if */
+        const_le32(0xe59f2034),     /* ldr r2, Internal gic_cpu_if */
+        const_le32(0xe59f0034),     /* ldr r0, startaddr */
+        const_le32(0xe3a01001),     /* mov r1, #1 */
+        const_le32(0xe5821000),     /* str r1, [r2] */
+        const_le32(0xe5831000),     /* str r1, [r3] */
+        const_le32(0xe3a010ff),     /* mov r1, #0xff */
+        const_le32(0xe5821004),     /* str r1, [r2, #4] */
+        const_le32(0xe5831004),     /* str r1, [r3, #4] */
+        const_le32(0xf57ff04f),     /* dsb */
+        const_le32(0xe320f003),     /* wfi */
+        const_le32(0xe5901000),     /* ldr     r1, [r0] */
+        const_le32(0xe1110001),     /* tst     r1, r1 */
+        const_le32(0x0afffffb),     /* beq     <wfi> */
+        const_le32(0xe12fff11),     /* bx      r1 */
+        const_le32(EXYNOS4210_EXT_GIC_CPU_BASE_ADDR),
+        cpu_to_le32(info->gic_cpu_if_addr), /* base address of Internal GIC CPU interface */
+        cpu_to_le32(info->smp_bootreg_addr) /* Boot register address is held here */
     };
-    smpboot[ARRAY_SIZE(smpboot) - 1] = info->smp_bootreg_addr;
-    smpboot[ARRAY_SIZE(smpboot) - 2] = info->gic_cpu_if_addr;
-    for (n = 0; n < ARRAY_SIZE(smpboot); n++) {
-        smpboot[n] = tswap32(smpboot[n]);
-    }
+
     rom_add_blob_fixed("smpboot", smpboot, sizeof(smpboot),
                        info->smp_loader_start);
 }
-- 
2.38.1


