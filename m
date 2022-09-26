Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0535EB0A5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:59:36 +0200 (CEST)
Received: from localhost ([::1]:38078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octKI-0006Yn-HU
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4v-0008G0-Fr
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:39 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:44810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4t-0002AS-U4
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:37 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 d74-20020a4a524d000000b004755f8aae16so1222356oob.11
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bEv0r4uQfAAcTHe8q+ogFy53mtFMlPlNpf2Vxa9ZPHw=;
 b=UwPl+epvXpU6ZpsamYeFwfEBCjyyuymPV7wPcXBINcGCl7AIXe3AxdnOEhXrefbPOH
 tt8/kvC5Dzs5lP3+9I3ZnWuQhaAtjAZQCresk/CUX5sCR6RtY1dA9HSuaSRIM4C+v9lj
 a9HIWgJeRo4iLEikAE3qZs0YpEQCvqPPQcGBRNQw6/jJj7rEJk50+6wqoNTadguM9tah
 BEI4Atq1k2pWyMmDzRYNE1fQhfpTWe0FT3wB1p8lHlTo4o0p/2uSY5NL++RCBWmGOgrt
 pHhE1FfMiDpaCH+QU16kom7haUVntcJ8lFgH5mlXPg8oXXL8V2rNSAYtc+16MoHLA16d
 Czjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bEv0r4uQfAAcTHe8q+ogFy53mtFMlPlNpf2Vxa9ZPHw=;
 b=6/vn4xNkXqAVVekvV0E5mNKycs9NRhQQ5247cCOaMQJhElWLMDFWGRlCYvFn9/GT8H
 8ti1D2sqSZ53k9tpGAc4phDIO18POE4pI8v1wSCcilWAEtvmcXttl2lHlvznL/jo2QUI
 UUFaQ9Y0dAKj601pFu7HIK244z4j/3owWwou9F1vPCg0woF96h5YMiMhegfIsl4S5BT3
 1rxQAykbw4ucvQVPqGMNLXQCJFUsPKop8wLR8bM36JJV4B19fksfh43aMqmxWZJABADG
 sS9RMV4r7wBE3XAuGqThYyiwDn1bz/2CySi7bXgQKdE9uO+7RGQ5oVUszGayCkBNeJDv
 uZVA==
X-Gm-Message-State: ACrzQf0PZ65tUEenbxJhEI06JRDWkjQNHYg5S0N+S/s7TehgrZ4DHnTO
 +6348Jud516lyTJZlBwG8aNLL6dozUs=
X-Google-Smtp-Source: AMsMyM4z6BK6vT/x97ns5ZrJWDUu4sHT1JB+bAWImuZwVgClypQ+/AkKlzo3YdD+qMQQPb/5fXGF7A==
X-Received: by 2002:a4a:8887:0:b0:475:af37:295d with SMTP id
 j7-20020a4a8887000000b00475af37295dmr9308483ooa.85.1664213973704; 
 Mon, 26 Sep 2022 10:39:33 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 15/16] hw/riscv: set machine->fdt in spike_board_init()
Date: Mon, 26 Sep 2022 14:38:54 -0300
Message-Id: <20220926173855.1159396-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for the 'dumpdtb' QMP/HMP command for the spike
machine.

Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/riscv/spike.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 5ba34543c8..1e1d752c00 100644
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
@@ -304,6 +306,10 @@ static void spike_board_init(MachineState *machine)
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[SPIKE_DRAM].base,
                                    machine->ram_size, s->fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = s->fdt;
+
     /* load the reset vector */
     riscv_setup_rom_reset_vec(machine, &s->soc[0], memmap[SPIKE_DRAM].base,
                               memmap[SPIKE_MROM].base,
-- 
2.37.3


