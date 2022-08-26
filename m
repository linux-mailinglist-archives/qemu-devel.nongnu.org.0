Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E4A5A2955
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 16:25:59 +0200 (CEST)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRaHW-0002ty-2d
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 10:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4X-0008Dv-Tm; Fri, 26 Aug 2022 10:12:36 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oRa4W-00040a-EJ; Fri, 26 Aug 2022 10:12:33 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-11d2dcc31dbso2184681fac.7; 
 Fri, 26 Aug 2022 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PLxCnDavL3XAQX8RlAlWZXySX+ubp7/4OOfpwRVaIdY=;
 b=AZNTvMppp4bPra/lwMf0liAKErAZqwPwCvSjt7tH3OamR3vXZE8p+JZrajMo4ydTSW
 D0OEosBQoPYMvFR4KLVJRFnlinX83nNe29lsFuoh0Um6pXRF05EAReiACsASCMAuq/Bd
 w2H+MMJYDkI3g6QedxVypgQVSGToE//j7Ti/kDBMxNQHWoI2v3MR03C8S1hjEO/TzaUz
 FBc54itBA1fm8DJj07/pcmJ7UrlToWgohjvat3OcKN9/g0HUATHFkKFaed2Mne1qqANV
 1wbVUHbDBJM3ukOtHLxRuTg/vkJU4qN00002IPCrks8hCuemDKBJTxsWrG17+Q5OLRqR
 1q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PLxCnDavL3XAQX8RlAlWZXySX+ubp7/4OOfpwRVaIdY=;
 b=wzGNspxCYjxZfJq/oj1jmwAeN2c6mNPuWYfwtZ2coCmUUV7AWZDABNzStOG2xniCNY
 QaHE+H8Oi2KzH/JjFw8OPidE0Me8G7/8k+726sSBW2BTRcYM6QrmgHTPecS0WyKYf9bR
 WgYDbuoNGGoG3lkFWoZukl395JwAGvj2FXFGe+z0ocoBymRblZmJdMlOAxxnqLLO1BDX
 AOwKh1YpCXAi4T/6I87wulEfNoiKE/mMPvLYpnrKY24brnPyH0dyg776HEot5OkxH15c
 vG4i/YX+yPmoyUTAK5WuFykh8OCDGqgOL/Iuxocmz/GzK5VC9We9ps0RKrPtaVVVDn5N
 jI4A==
X-Gm-Message-State: ACgBeo0NLdXE5qj/R5tCOWonn8OyJEtAbI7FW60Okoq9zeYlXe9TfDqO
 H1EnFSUkObwd+9qYe6RyXM1FkyjjhGA=
X-Google-Smtp-Source: AA6agR7Dxyq0cEfo7wHc8aXbyZIvIzeo06PmX9KNU5m/bGuOrS0MYR7nFbA5gAKgVguufPEWka9zoQ==
X-Received: by 2002:a05:6870:89a9:b0:101:d81d:e970 with SMTP id
 f41-20020a05687089a900b00101d81de970mr1904032oaq.43.1661523150563; 
 Fri, 26 Aug 2022 07:12:30 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b00344aa3f17d9sm1087736oih.10.2022.08.26.07.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 07:12:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 alistair.francis@wdc.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH for-7.2 v4 12/21] hw/riscv: set machine->fdt in
 spike_board_init()
Date: Fri, 26 Aug 2022 11:11:41 -0300
Message-Id: <20220826141150.7201-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826141150.7201-1-danielhb413@gmail.com>
References: <20220826141150.7201-1-danielhb413@gmail.com>
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

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the spike machine.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/spike.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index e41b6aa9f0..17f517bfa6 100644
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
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = s->fdt;
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
-- 
2.37.2


