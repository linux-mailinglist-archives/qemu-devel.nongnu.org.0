Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB0A5AC136
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Sep 2022 21:45:34 +0200 (CEST)
Received: from localhost ([::1]:48252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUZ5B-0007IV-Ob
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 15:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYv4-0007Fn-AN; Sat, 03 Sep 2022 15:35:11 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:34762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUYv1-0005QP-GE; Sat, 03 Sep 2022 15:35:04 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso12951324fac.1; 
 Sat, 03 Sep 2022 12:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MKKyio2KeN9Vgbf9Aj2APvfD3VWLkoUGAYr+gnarUpY=;
 b=JsuhKXTFHQL31vadDMO2WR26WmVUbT6dN2G9epHpDaYbJrlCAtTpAahZKm8cb3sbYU
 oksFL7NP5mWI4Lk67R2wQ0Z5fUCXpo0ePs1jM/SoHx7mT/W9Ndu5rkD/10+zJhFfpTT+
 T3lhXWpnJY4/5Jd0vkzQUYJdI3CLWZpO1wp1cCfjcQimMKQo+bTgYfAFFbgU+9ahfefF
 JvsGw4HT5bRsTosNMuNel4tFu02IGXCBPCGTvvwFE5A+8RsS5Yh17vDuu59CcsutM9Lt
 iUTJLpobz7RHs7brFK6OlAiyB2aK86j8R4oIebskMHTBpJ5dq5gvmHXfpSYOuOh9bIyG
 F0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MKKyio2KeN9Vgbf9Aj2APvfD3VWLkoUGAYr+gnarUpY=;
 b=6r5sA+09DUDoy97M5RDs1j7wEGqubH5d0GBs56ZGeLP+O3y0XV1AGdA710l3RgkEz8
 +wRMEng7sH2yGlAIhrBM+poXkoKm/nPI0TvfN0B+GBWsLmAVpW5rYTsj7qVyXpsqzKhU
 oD31nXPMHbWxnK0n0dIElE9NPwS3X3zRY1WKs4poQ06N37BqT8p3/Rg3Qxu7/j53WNOD
 hyBjp0C1eXl42nJDaguugMlj1QeZEamnxFwyc7GM0L0xxaR7EQsD1pvYDoEScaTcDCnv
 lhzjCvEU9Rnq9Tp+NMY+N4bLXAO9y1JSBQFsPShHQcPbxNV142GooJAVCI2otijbd2DL
 AS1A==
X-Gm-Message-State: ACgBeo24UKxVTv5KNyKt2g8Av8H29+exvTneuXWUYCzd0Rb+P5Yg1qHX
 Pc8zexMANFVq8dqlOcpNwZ+WGgGU4wh4Kw==
X-Google-Smtp-Source: AA6agR7GHtvKJLCP137jdTaC7avCGejyexlTb7Ia8eNjp0b/Vf+qQsW5Eh0HucFxNtq3IXAQfPqOkQ==
X-Received: by 2002:a05:6871:1d6:b0:10e:6a7f:cc3b with SMTP id
 q22-20020a05687101d600b0010e6a7fcc3bmr5140318oad.210.1662233701371; 
 Sat, 03 Sep 2022 12:35:01 -0700 (PDT)
Received: from balboa.COMFAST (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 m2-20020a4aab82000000b00425806a20f5sm1843906oon.3.2022.09.03.12.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Sep 2022 12:35:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v5 12/14] hw/riscv: set machine->fdt in spike_board_init()
Date: Sat,  3 Sep 2022 16:34:18 -0300
Message-Id: <20220903193420.115986-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903193420.115986-1-danielhb413@gmail.com>
References: <20220903193420.115986-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
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

This will enable support for the 'dumpdtb' QMP/HMP command for the spike
machine.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/spike.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e41b6aa9f0..1fa41164b3 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -40,6 +40,8 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 
+#include <libfdt.h>
+
 static const MemMapEntry spike_memmap[] = {
     [SPIKE_MROM] =     {     0x1000,     0xf000 },
     [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
@@ -304,6 +306,13 @@ static void spike_board_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * the 'dumpdtb' QMP/HMP command.
+     */
+    machine->fdt = s->fdt;
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
-- 
2.37.2


