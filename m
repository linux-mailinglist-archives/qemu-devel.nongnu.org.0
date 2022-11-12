Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF99626645
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 02:53:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otfgS-0003U5-71; Fri, 11 Nov 2022 20:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otfgQ-0003Ts-99
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 20:51:46 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otfgO-0005I3-Kx
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 20:51:46 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 4so5625566pli.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 17:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8grnVfFhCf4IqG9/V3mzncjVBIJwid8+uRko3ngptU=;
 b=CUEiCfGzWAKwZYH7HIuguDGJc3dzl+r1iP4nRGGSVHM8Mi3Lcj2bnEeOVd873eHf+t
 YpxxUzkr1FeCbOlgAUDGm7KprgROoJ9lvK09XXRNe+jjWAqEHw8JJc/Pc/XtWbp24C49
 KQgPPDG+3X61dws3kXp0WqxFsSX7TKDQp0QE1vfU/xDmZyZtE0BqDMR5Q1eNRZC6FISb
 TsOChe4bKTG4019HJ5QaXrQb2pLNxmNVvCq15hobCW2udfTdlpUjJg48PS5Qo9QTFfrv
 kHcbZ1qcnDjNY4UUVvbYwNAd8lVtJtvf5TAbLPrbJ1peP5nw68DHR9qZa6G3rBOwFKU/
 Xa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8grnVfFhCf4IqG9/V3mzncjVBIJwid8+uRko3ngptU=;
 b=ZUi9AlCuNzmtCmJDtjwQN/pV8sMu86fcJOACp3fmdeDG8hyBqlX2vI+3IbQWxnxMBH
 a+y5eM24j6EfYPogK8NrPCJmUWw6rDcMRojkqh3lmNrO8Mr0MomLEZ63YyQaz+xv5lod
 ubW87SWbAIb+BuAyxqjC3I6HvUjaLDK3Rzt2tNUJu4maUU6POTSJBYtheMFTH0f61/gw
 0dSuQfQWNAcqV1lMO9eMUaJmF9zhgsmnKL9qB4kliNO9nF2jKaVCk3blDEY/4SkuvA2I
 P6vFebA5ZBL/blebb620FB6yWunfgn97kOdoWT/OMZI4O7CV/a0HMsvfdZDEyykUAQDL
 PupA==
X-Gm-Message-State: ANoB5plGMUJgGPUzQrboN03g1RNnLd/I7tgE7U7wS9BqcSCGSxpzZGyP
 SWGdA1RlyDNGi7TH3yS0xBWXxD02embUV/XF
X-Google-Smtp-Source: AA0mqf5oK3lUnY4HAGBC1R5Ccr8SFXgnmcKSjvPqfMSAL5uWX8M/MqlOsyTX+2WlYm5DsfcLIAx8pQ==
X-Received: by 2002:a17:90a:2b08:b0:213:30b2:4e4e with SMTP id
 x8-20020a17090a2b0800b0021330b24e4emr4637724pjc.193.1668217903266; 
 Fri, 11 Nov 2022 17:51:43 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-6e1e-8b39-f1a5-d250.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:6e1e:8b39:f1a5:d250])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b00174c235e1fdsm2365265plh.199.2022.11.11.17.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 17:51:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: gaosong@loongson.cn,
	stefanha@redhat.com
Subject: [PULL 1/1] hw/loongarch: Fix loongarch fdt addr confict
Date: Sat, 12 Nov 2022 11:51:33 +1000
Message-Id: <20221112015133.2593661-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112015133.2593661-1-richard.henderson@linaro.org>
References: <20221112015133.2593661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

From: Song Gao <gaosong@loongson.cn>

Fix LoongArch check-tcg error:
   TEST    hello on loongarch64
qemu-system-loongarch64: Some ROM regions are overlapping
These ROM regions might have been loaded by direct user request or by default.
They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.

The following two regions overlap (in the memory address space):
   hello ELF program header segment 0 (addresses 0x0000000000200000 - 0x0000000000242000)
   fdt (addresses 0x0000000000200000 - 0x0000000000300000)
make[1]: *** [Makefile:177: run-hello] Error 1

Fixes: 021836936ef ("hw/loongarch: Load FDT table into dram memory space")
Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221109020449.978064-1-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/virt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 5e4c2790bf..5136940b0b 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -793,13 +793,13 @@ static void loongarch_init(MachineState *machine)
     qemu_add_machine_init_done_notifier(&lams->machine_done);
     fdt_add_pcie_node(lams);
     /*
-     * Since lowmem region starts from 0, FDT base address is located
-     * at 2 MiB to avoid NULL pointer access.
-     *
+     * Since lowmem region starts from 0 and Linux kernel legacy start address
+     * at 2 MiB, FDT base address is located at 1 MiB to avoid NULL pointer
+     * access. FDT size limit with 1 MiB.
      * Put the FDT into the memory map as a ROM image: this will ensure
      * the FDT is copied again upon reset, even if addr points into RAM.
      */
-    fdt_base = 2 * MiB;
+    fdt_base = 1 * MiB;
     qemu_fdt_dumpdtb(machine->fdt, lams->fdt_size);
     rom_add_blob_fixed("fdt", machine->fdt, lams->fdt_size, fdt_base);
 }
-- 
2.34.1


