Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847404ADBC9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:57:36 +0100 (CET)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRvz-0007Uo-1Y
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:57:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-000166-4g
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:45 -0500
Received: from [2a00:1450:4864:20::431] (port=42892
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqt-00028W-7L
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:23 -0500
Received: by mail-wr1-x431.google.com with SMTP id h6so11460998wrb.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7U9MMxjs5aOmUbpGxUkDHRsFOCc8L4YhvKF6hVVJTbc=;
 b=xyrDHvATWOFIDFmyTHcMrGrVhqBc4piJqMb8pT/NJgOT5fKM/WkMTatkgqT6egn9uQ
 nMOv0HR5Qb8lfO5DmkfAUhkqiHLBunzGC78ZwctK+zMvDGWI+LVoQET2SZWbH/Pr02/h
 Ua0pv2r3E/BssqbjL6GSnSv8W/++kgW5bhLM+j1toYwImdTUJOt2h7p2vjrZCvBkiPp+
 O/zakHETsy6SagyPuE+vC2rhZSBtZh5xKSafOtXQVrGuTNqs3N8G7OjKN5O6OWhge4qE
 pdX+S0x5Gjl/n8+UXdpMwYIr2Z6BoBO1yGsK2t3g4CAxXOFIZrK6HNJg7zCJVntfueWs
 a5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7U9MMxjs5aOmUbpGxUkDHRsFOCc8L4YhvKF6hVVJTbc=;
 b=mXvxdhNzNjUl0n6fd2OLLFdsaA9vHAqRjjpaEE/GfBz6uehCn9myhgqJfal/rEf/au
 Ged5Qu3dJiuxh2wiSbgKlkj9p63IRe6EXiaosJv/lkGKZLxDdvjoYyvvWr/DfBSCIuah
 oYJDiTKBGWQACKg20qsSLp9gSyRW7XbOk7BtMJN7YbUvjUMba+SywrDHpvFjblLbBIkc
 62Ap4gNPaiZ6cTaJ6yKzuAPjbc2JDhrqQpttFD7OqB8ucKR0yZ1TgBITsi30zu81O1qc
 SW31f2czS+9OJuRGmYQ9VCktmleyBHv9dGjlzrf4YGOeUTakm3Em+uYacFx0YgNtYaDN
 F8lA==
X-Gm-Message-State: AOAM530hw4IuxfPa/jPeluUxSXS/26qvyubDCyaunMwK0V7yzCFPKQJq
 p1JiR88yUMlKmUPANaB6IzrtTrqEatN29Q==
X-Google-Smtp-Source: ABdhPJzCQbx6dAT+a8nOaqxe2MauoCI2aQizrL4tdhtm2BzD4eJrjADN0qwe/3acsoW8nZCSPrG6zw==
X-Received: by 2002:adf:fac8:: with SMTP id a8mr1525810wrs.330.1644320402451; 
 Tue, 08 Feb 2022 03:40:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/39] hw/arm/highbank: Drop unused secondary boot stub code
Date: Tue,  8 Feb 2022 11:39:28 +0000
Message-Id: <20220208113948.3217356-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20220127154639.2090164-15-peter.maydell@linaro.org
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


