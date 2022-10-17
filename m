Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DDC601820
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:56:15 +0200 (CEST)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okWDe-0008Pe-3d
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVga-0004zZ-7D; Mon, 17 Oct 2022 15:22:04 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:38811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVgY-00032W-MU; Mon, 17 Oct 2022 15:22:03 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1322d768ba7so14399963fac.5; 
 Mon, 17 Oct 2022 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFMFtM7kKT2i4qXvxZxwYogw4Xl5VgeswLzxx97oPqU=;
 b=BeTuG7aW3vXCzprA/PiCaQaWvCelmhxI37omepGX4JkngCd4cqEzLoDI4TR9WnEwOd
 pXGBnj4lBPRaw5dbIk78ofpTd3WUeIHqKJZbQqkiOPF9NHzU/uLCxqorBJfLQMJ3PtBG
 tAu2J1sKQ9e4sEJs8khzoXP4g8HyJOmhYUGaG/Qc8xyLmSrtcueRc5/eW9ZEmm0veM8/
 vIGMRveYLnfM5jfBBLa6tfSb6MnyK6cE3VngwdK0Uleg2GHYJiadPuLoS39ZO1DWkZOH
 oC0NYV8K4GBrWo5LWELV0M1vvtJlkZnA9H4huJaY6FDYsEMve5fcbSJ/Q4FuMClvVeQU
 Miaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFMFtM7kKT2i4qXvxZxwYogw4Xl5VgeswLzxx97oPqU=;
 b=DGmcyu+o/laHvBP/4SwuUz7ivwl5jd8QbuH3snjHqMuzvASCILAvkGDqLLA8ctvV7B
 lNcQxZNov29Hb5OnsIDOu2ONbIjwwswLpP8qTex95qqi+7ItJAZT9WY3xWgGU5umJZXG
 EgEk0BMggB/1VSNb79LEmQYtVHGqGisYVXwrK4K+THWCKwt0mdPPqWwqi7+O1YzPwSqd
 RnFJah0rLiQyYMc3J1zt/1M8kYhDtsZnxmQfOCkbLeaPZ84LmWWJu0evpJzyV9L47H6V
 TJ5KyzlgDWxSJl8jfX+32x45mx5U/voRm+Rwylfr4NVcGL6PEcNoQL8UIJCu4jul/2Uv
 JHFw==
X-Gm-Message-State: ACrzQf1ZY6bpIBRcgfHbsQkUOQXxgvIuD7dWcbOt2otvQb25WMftkofy
 C4+9baXz5yWDlT3F3sASv7vqX1tDHXQ=
X-Google-Smtp-Source: AMsMyM6OfaxoA48LWmj2CMiSGSdpa8IFlkA31uiwA71uF1uQhhTDizZ0TrYzc8nrnSwWL0ZlYhmalQ==
X-Received: by 2002:a05:6871:a6:b0:12b:8d8d:d7b with SMTP id
 u38-20020a05687100a600b0012b8d8d0d7bmr16453395oaa.197.1666034521524; 
 Mon, 17 Oct 2022 12:22:01 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:22:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 38/38] hw/riscv: set machine->fdt in spike_board_init()
Date: Mon, 17 Oct 2022 16:20:09 -0300
Message-Id: <20221017192009.92404-39-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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
Message-Id: <20220926173855.1159396-16-danielhb413@gmail.com>
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


