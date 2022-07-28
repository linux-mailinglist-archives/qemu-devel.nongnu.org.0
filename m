Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DD5584577
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 20:21:08 +0200 (CEST)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH88A-0000oh-PD
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 14:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH86g-0007rH-Bv
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:19:34 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oH86e-00028H-Lr
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:19:34 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-10e634ecfe6so3285123fac.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fAQrWe0FxAsJVFkHkOuN/CwC/ocLOm/oiXRttPvl018=;
 b=p5dOeafx/Ikep7pnU4XDQLdAqt4q+9/h5ue4+4b+MAevXjsoXq2u9KaUDAhOm5XqNQ
 He/UmPTcBA27oA7YWiSzwToYGvXnOMIzliQIEHCoTvfztu0nd6c2Ccq8NtK8Qh4T2uoI
 21BTEKD+2sceeGgtQnM803b1x5gGC0z8Jw8EqOqtixkwWN6n+1q3b6yTMYXJGHsjq92H
 z4AvtArz8ht9mXJlJerRFdYQ1KjlUYQHqf/hDTI1AgLP0DOrY3gYX4XcEWLnFzD2qBuC
 SofWPSgeI+ozLm9KJPVSC4LIvPLq64ex6FvUyEXPASoumS44xp7OEzemSx8xhHpdIcVZ
 Z0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fAQrWe0FxAsJVFkHkOuN/CwC/ocLOm/oiXRttPvl018=;
 b=npikCK4mexYX20m6VEgyuqGh5akzX32GCqurd5NGVr/bd3Vi24MvpcKLqwZQ48RMrJ
 JxX0ykD928Mhw1b75lw2WH1SSlGe/FBOVRDXv6aw1zVLwJLWeEsMrtVgQBwludTzoMMx
 0cqlQUwd3CsH9cnzPrjaWYnE/a4vRs88ShtG3Z4VMrrQIQnGKOftbIDRxCO9Fn6stVli
 1JWH91HvYXTOgTyaRHNK3bEK4fTBoUQl8nYoPUlj1pAtiQuiaVvaBzFrNRzvjekzvvWJ
 6Aqc0YKqqj+Dqrfmwyen4ksHI2A6cobQNVQ61QaUbu4gM3qEznWguss0FXHl/vI8TiYE
 XdYw==
X-Gm-Message-State: AJIora/XY05NqxnI/iuoSWAi4VrkXFZzPCm+I4+deoqRVHnawmI34/WZ
 sbHO+v4L7dRG5BwwwqtgTCWlUo8vtPw=
X-Google-Smtp-Source: AGRyM1siRKeumQejsJaS6+fJuYYatPsFu7KqYw2OgHAjm4Wfv/BnRgSObAZwLe8V2s6uJkGBhsBavQ==
X-Received: by 2002:a05:6870:4348:b0:10e:55ba:83cb with SMTP id
 x8-20020a056870434800b0010e55ba83cbmr335694oah.217.1659032371285; 
 Thu, 28 Jul 2022 11:19:31 -0700 (PDT)
Received: from balboa.COMFAST ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05683004ae00b0061c7ac52b75sm560387otd.26.2022.07.28.11.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 11:19:31 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>
Subject: [PATCH] hw/riscv: remove 'fdt' param from riscv_setup_rom_reset_vec()
Date: Thu, 28 Jul 2022 15:19:26 -0300
Message-Id: <20220728181926.2123771-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The 'fdt' param is not being used in riscv_setup_rom_reset_vec().
Simplify the API by removing it. While we're at it, remove the redundant
'return' statement at the end of function.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Cc: Vijai Kumar K <vijai@behindbytes.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/boot.c            | 4 +---
 hw/riscv/microchip_pfsoc.c | 2 +-
 hw/riscv/shakti_c.c        | 3 +--
 hw/riscv/spike.c           | 2 +-
 hw/riscv/virt.c            | 2 +-
 include/hw/riscv/boot.h    | 2 +-
 6 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 06b4fc5ac3..1ae7596873 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -286,7 +286,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                                hwaddr start_addr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint64_t fdt_load_addr, void *fdt)
+                               uint64_t fdt_load_addr)
 {
     int i;
     uint32_t start_addr_hi32 = 0x00000000;
@@ -326,8 +326,6 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                           rom_base, &address_space_memory);
     riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof(reset_vec),
                                  kernel_entry);
-
-    return;
 }
 
 void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 10a5d0e501..7313153606 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -583,7 +583,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
         riscv_setup_rom_reset_vec(machine, &s->soc.u_cpus, firmware_load_addr,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].base,
                                   memmap[MICROCHIP_PFSOC_ENVM_DATA].size,
-                                  kernel_entry, fdt_load_addr, machine->fdt);
+                                  kernel_entry, fdt_load_addr);
     }
 }
 
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 90e2cf609f..e43cc9445c 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -66,8 +66,7 @@ static void shakti_c_machine_state_init(MachineState *mstate)
     riscv_setup_rom_reset_vec(mstate, &sms->soc.cpus,
                               shakti_c_memmap[SHAKTI_C_RAM].base,
                               shakti_c_memmap[SHAKTI_C_ROM].base,
-                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0,
-                              NULL);
+                              shakti_c_memmap[SHAKTI_C_ROM].size, 0, 0);
     if (mstate->firmware) {
         riscv_load_firmware(mstate->firmware,
                             shakti_c_memmap[SHAKTI_C_RAM].base,
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e41b6aa9f0..5ba34543c8 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -308,7 +308,7 @@ static void spike_board_init(MachineState *machine)
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
                               memmap[SPIKE_MROM].size, kernel_entry,
-                              fdt_load_addr, s->fdt);
+                              fdt_load_addr);
 
     /* initialize HTIF using symbols found in load_kernel */
     htif_mm_init(system_memory, mask_rom,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..2e9ed2628c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1299,7 +1299,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
     riscv_setup_rom_reset_vec(machine, &s->soc[0], start_addr,
                               virt_memmap[VIRT_MROM].base,
                               virt_memmap[VIRT_MROM].size, kernel_entry,
-                              fdt_load_addr, machine->fdt);
+                              fdt_load_addr);
 
     /*
      * Only direct boot kernel is currently supported for KVM VM,
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index d2db29721a..a36f7618f5 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -51,7 +51,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
                                hwaddr saddr,
                                hwaddr rom_base, hwaddr rom_size,
                                uint64_t kernel_entry,
-                               uint64_t fdt_load_addr, void *fdt);
+                               uint64_t fdt_load_addr);
 void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
                                   hwaddr rom_size,
                                   uint32_t reset_vec_size,
-- 
2.36.1


