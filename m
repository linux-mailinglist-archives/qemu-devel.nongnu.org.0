Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE24924AA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:21:50 +0100 (CET)
Received: from localhost ([::1]:47836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mYe-0004Xr-TR
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:21:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mV7-0001mN-NX
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:18:09 -0500
Received: from [2a00:1450:4864:20::334] (port=35613
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mV6-0007AS-68
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:18:09 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso4985053wmj.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tavoIU4sI6uto8gF1YrjoBKuqZZVg88pzAuFbLKB1ms=;
 b=CK5skjgbNOpGkX6xZDa9jSl8s5LZsnTXoqr/pGOmSegD/4S6Y6ESGXPMssaCIHCGK6
 zz909ZRMJfA8/tX68oLdm/NBOG06WfcYUL+erYyTpKP3MtTV4+ZT8TCCZjTXfF6zjxLM
 6Ii4nuPVi6eOg6MGAlPpQQ2QjhAXVouGsMRfZTc8u1WGEEdXzVvmi4M805zF4fM82oT8
 FJb4kGR4g12FPkNC+xTmFBJ2Z2YugPyUjumIpNJiaw+Lz+1cnGKEIroOsYIYoz5prqrX
 UPZT1r+Ih93fGRsn/uWNaahrw3Y4LQ56dCWsSe2aN50CTtZd8qjeMFsJ/7y+pyjvHGM+
 B53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tavoIU4sI6uto8gF1YrjoBKuqZZVg88pzAuFbLKB1ms=;
 b=ENHmK9Uyy9poSxCjS/UUPUC56msjvzQlinPMTyZjEkEWNyc6K5TgBNX4XA0EgQvSCC
 +St4geKIU+/cexxFeBEWpECl+a/azDBWidDXzB3GfgpnmLYNITiXOHGub39K9/gGa0NF
 fUIOQ+nHUP/JKRx8z/sBVhec/sCO7OlqZFiFd86jNbf+OyYKQriVNC2pRyrhLaHoTsld
 XslvCmwEGXaMSPAm78r/Q1wvtsB+AhJfXqBr0YGLQSXsVvxOkdsazDc52HQGOpsAW6in
 60BbZpJxKDRGzRprvvx5p9cgyLZQpiIUTabjEW8E1sOLMEXsbvEDMdlAoA6FHrQTqdtv
 /n5w==
X-Gm-Message-State: AOAM532vTg50rGXys7q0uFedwhYPi806WF+CuSox4pfVzPLNJ0s51wn1
 bNlwUTKqaUyGd+zJ5T6+bD9RQg==
X-Google-Smtp-Source: ABdhPJxV+PCzAMfuzF0t8P6YJItpUc108uFIckn3/JHlnN4x2Olg7FxcZCALstLg6njCG9iTJuqZ9g==
X-Received: by 2002:a5d:4d0c:: with SMTP id z12mr24703118wrt.253.1642504686985; 
 Tue, 18 Jan 2022 03:18:06 -0800 (PST)
Received: from localhost.localdomain ([122.167.36.211])
 by smtp.gmail.com with ESMTPSA id p4sm2156939wmq.40.2022.01.18.03.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 03:18:06 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v2 2/3] hw/riscv: Remove macros for ELF BIOS image names
Date: Tue, 18 Jan 2022 16:47:35 +0530
Message-Id: <20220118111736.454150-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118111736.454150-1-apatel@ventanamicro.com>
References: <20220118111736.454150-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=apatel@ventanamicro.com; helo=mail-wm1-x334.google.com
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
Cc: Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that RISC-V Spike machine can use BIN BIOS images, we remove
the macros used for ELF BIOS image names.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 hw/riscv/spike.c        | 4 ++--
 include/hw/riscv/boot.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 597df4c288..d059a67f9b 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -260,11 +260,11 @@ static void spike_board_init(MachineState *machine)
      */
     if (riscv_is_32bit(&s->soc[0])) {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM].base,
+                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     } else {
         firmware_end_addr = riscv_find_and_load_firmware(machine,
-                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM].base,
+                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM].base,
                                     htif_symbol_callback);
     }
 
diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index baff11dd8a..d486392cd0 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -25,9 +25,7 @@
 #include "hw/riscv/riscv_hart.h"
 
 #define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
-#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
 #define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
-#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
 
 bool riscv_is_32bit(RISCVHartArrayState *harts);
 
-- 
2.25.1


