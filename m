Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EA49E85E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:08:32 +0100 (CET)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8G7-0000kY-Px
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:08:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zV-0006sy-Ch
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:17 -0500
Received: from [2a00:1450:4864:20::42c] (port=33605
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6zQ-0008P5-Uh
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:47:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id e8so5674638wrc.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DfIhd8MoTLGoeHrJIwdVILwXtofxSeMFrV8DeNXbnjE=;
 b=EY26MJIdltYrrTH7zWb5KlQlfxK1uEGig84kew7gyMawNfiVI4HqXNvTOcX/zK2uqh
 6UAPpu9Klq/GwvJHfnTu8uwSFRFY5/o1yWTj1jfQXLmwvRtAs6ZYFBHOc8ox34xqbi1O
 E4YCp9fKIId4o7t4m7FwP/UyR4KHj73/+Ru/5UJH1yTfcWNktd1bSPEziaYBAOKi8m+W
 1wYjUgG8SYM1jjK0qrC48c3+cm6X8lg8W/4Ts3q5t/WOwAzaYNpLSvQMdqqJG9V5lWUh
 +dQgFsqMSEbOU1vIq17u9J8fj2h2hgUqrPhIucEldRf3VAZLK28cEAo8/dMbYNdDmfdb
 +0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DfIhd8MoTLGoeHrJIwdVILwXtofxSeMFrV8DeNXbnjE=;
 b=KIPrOBPmt0sKF+t5VSLCjFbza/2RZESCyyRXNZijjvMfplgF4opfhJzyaqQK1ZKj1L
 /ctA7D0sQmE+s/dC3NL+IUUQQaHkF5ky/L29sUDAi9pWnTv4BNkyk2TZ9/NUL9xhGeFI
 HoI0w6EZ1xlsVzUhzclkw3ix4yI3rF9xsTwLD9actQyXWozNDQaxKRuZa8OESH587ZU4
 LU87HX1qNmKR6Omkjv7pJFTNuo/hHpOpwN0SoK02d7Nt8+aOBV3et+I5DHoyJnO2M9Al
 5k5ClIP8gBRfu7UFKfgO16wT2UMTYBZ/2esgKTwWx+pkwFgt75lF/H9CU8VeNTGVvvL6
 eZVA==
X-Gm-Message-State: AOAM532FLB7a/uXcoaoS7KvosD7gx+iXBr7uSupzr/GbrmwIG6bF9Wfb
 hz5an40DNS3Yx3Avr0mncI66zQ==
X-Google-Smtp-Source: ABdhPJwgiNxBOBZIaHiwgkB0Icec2fEHMF8VSDamoPFXdjlxlCGpWtWXTaoGnmUgvyspUdKbwNrwsA==
X-Received: by 2002:adf:b610:: with SMTP id f16mr3530437wre.266.1643298428943; 
 Thu, 27 Jan 2022 07:47:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:47:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/16] hw/arm/highbank: Drop unused secondary boot stub code
Date: Thu, 27 Jan 2022 15:46:37 +0000
Message-Id: <20220127154639.2090164-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127154639.2090164-1-peter.maydell@linaro.org>
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The highbank and midway board code includes boot-stub code for
handling secondary CPU boot which keeps the secondaries in a pen
until the primary writes to a known location with the address they
should jump to.

This code is never used, because the boards enable QEMU's PSCI
emulation, so secondary CPUs are kept powered off until the PSCI call
which turns them on, and then start execution from the address given
by the guest in that PSCI call.  Delete the unreachable code.

(The code was wrong for midway in any case -- on the Cortex-A15 the
GIC CPU interface registers are at a different offset from PERIPHBASE
compared to the Cortex-A9, and the code baked-in the offsets for
highbank's A9.)

Note that this commit implicitly depends on the preceding "Don't
write secondary boot stub if using PSCI" commit -- the default
secondary-boot stub code overlaps with one of the highbank-specific
bootcode rom blobs, so we must suppress the secondary-boot
stub code entirely, not merely replace the highbank-specific
version with the default.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/highbank.c | 56 -----------------------------------------------
 1 file changed, 56 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index a21afd178d1..da681b15708 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -48,60 +48,6 @@
 
 /* Board init.  */
 
-static void hb_write_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
-{
-    int n;
-    uint32_t smpboot[] = {
-        0xee100fb0, /* mrc p15, 0, r0, c0, c0, 5 - read current core id */
-        0xe210000f, /* ands r0, r0, #0x0f */
-        0xe3a03040, /* mov r3, #0x40 - jump address is 0x40 + 0x10 * core id */
-        0xe0830200, /* add r0, r3, r0, lsl #4 */
-        0xe59f2024, /* ldr r2, privbase */
-        0xe3a01001, /* mov r1, #1 */
-        0xe5821100, /* str r1, [r2, #256] - set GICC_CTLR.Enable */
-        0xe3a010ff, /* mov r1, #0xff */
-        0xe5821104, /* str r1, [r2, #260] - set GICC_PMR.Priority to 0xff */
-        0xf57ff04f, /* dsb */
-        0xe320f003, /* wfi */
-        0xe5901000, /* ldr     r1, [r0] */
-        0xe1110001, /* tst     r1, r1 */
-        0x0afffffb, /* beq     <wfi> */
-        0xe12fff11, /* bx      r1 */
-        MPCORE_PERIPHBASE   /* privbase: MPCore peripheral base address.  */
-    };
-    for (n = 0; n < ARRAY_SIZE(smpboot); n++) {
-        smpboot[n] = tswap32(smpboot[n]);
-    }
-    rom_add_blob_fixed_as("smpboot", smpboot, sizeof(smpboot), SMP_BOOT_ADDR,
-                          arm_boot_address_space(cpu, info));
-}
-
-static void hb_reset_secondary(ARMCPU *cpu, const struct arm_boot_info *info)
-{
-    CPUARMState *env = &cpu->env;
-
-    switch (info->nb_cpus) {
-    case 4:
-        address_space_stl_notdirty(&address_space_memory,
-                                   SMP_BOOT_REG + 0x30, 0,
-                                   MEMTXATTRS_UNSPECIFIED, NULL);
-        /* fallthrough */
-    case 3:
-        address_space_stl_notdirty(&address_space_memory,
-                                   SMP_BOOT_REG + 0x20, 0,
-                                   MEMTXATTRS_UNSPECIFIED, NULL);
-        /* fallthrough */
-    case 2:
-        address_space_stl_notdirty(&address_space_memory,
-                                   SMP_BOOT_REG + 0x10, 0,
-                                   MEMTXATTRS_UNSPECIFIED, NULL);
-        env->regs[15] = SMP_BOOT_ADDR;
-        break;
-    default:
-        break;
-    }
-}
-
 #define NUM_REGS      0x200
 static void hb_regs_write(void *opaque, hwaddr offset,
                           uint64_t value, unsigned size)
@@ -380,8 +326,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     highbank_binfo.board_id = -1;
     highbank_binfo.nb_cpus = smp_cpus;
     highbank_binfo.loader_start = 0;
-    highbank_binfo.write_secondary_boot = hb_write_secondary;
-    highbank_binfo.secondary_cpu_reset_hook = hb_reset_secondary;
     highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
     highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
 
-- 
2.25.1


