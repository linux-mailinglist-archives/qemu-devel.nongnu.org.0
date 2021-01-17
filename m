Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA022F95AA
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 22:57:52 +0100 (CET)
Received: from localhost ([::1]:50466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G3U-00020F-05
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 16:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzw-0005fO-FJ
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:12 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzu-0005UE-NQ
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920450; x=1642456450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C7kLb/dLKvceUuugL5WR1qhXHe61Zw6p6y3CStuAUtE=;
 b=hbWpbpc2PVHquWQgdeeTGQL1y85CIwp0XyJXSBryVKAwHRkIj2zJH+tG
 wRhtG0+ALOPSnCwapDiyZfcSAIdV4WKM4gwAnjVXioDoVgxVX52v1Tq0l
 WKFksrRe2vu9T114ozGBNsSGG9zg+K6CdWKZl00RQp7/tegwprIAWa+8N
 qY/2M7rx0BQ3O1RtiGwdEeviwJSqjrFthFV8SVt+vC/bmU6qaq3INll4l
 0t5dxC6cho4esYDseploBVFKS/XlF94jUI9Ftdg3VkBltk1CACIc1UzFd
 s3Tut9J+ia3i6LY1ktJER7kszhHVrtum/Vq2Z//nkomgiACQyNVnERvVG Q==;
IronPort-SDR: pVov1Kv8njF6/SK0VrZMqLTwtH4NQvP94mjSvV+LtptXGWvoKU7ttbkXnT8/7WnMxOnrjmkQVs
 1mzyYPoAygiY0SmUrEwfuFp/jL0PFiulSZwyDMaQtfHIlSbasHzJA9ZnAIDFRF2n706jsb2e7g
 Od539p/jpRzY2qsfeUh5qZJnYY80ucIb8P/WnWhAEMBbTbLZigXaDLnTCRRYQRzp8RJkKxE5C5
 MA2dpd6XFCzeN2LLZeXLM09iv6MKly4AcpgY1dB0V7L1oN+GCQQyzQov8rakbcExcLqlkLnWn2
 Mtg=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645962"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:05 +0800
IronPort-SDR: DlTcTHIapLc9teGm7RWuFsAb/p71cfa8DebFPfRbuyglp5dl2hAgo7Iy+UHgk1tmz7E5ugvi3I
 5ykDT3adbiQG9lR8HKgMdRaRV0pZfaEiJziMeC77s4kCKq0LsnHJBoFC6b4U2O4kApSv5Pn6aB
 JetRsUhcRiV2eN4t6LDUoEfK3RyiAtJaOizyKHE/zXRwfTGv9WiZlSyQl32cjwN6w8LffRirdq
 mU5K7mbS5X5EVesh+svNUwox/Z1eZmT+WwPW1RZk2bs/uRJ7r8N2jRXbohWeGv4h0VIVf/rrEf
 AYWzgVfxKgK1OPLVMS5JLx0I
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:45 -0800
IronPort-SDR: n+DgM66gduYWBDuBVegLFnpXc5CUM9jfXgdtWrx4/Kih/oQGFIxLc4ykEqcMO9tJSPESzjVKLC
 RJ0XPweIh5n44JTLQb3kITMeHxzBUVJYC+E0yQaKVMbOOsmOvI1TfeLXwNotm/KYqNqOrel+pg
 llzWOuyGSDtaWF5Bxd8JxiuKBUslwzdmjcGe6QFPV/hxS+zgOCQghlKGM6Ytk/uAsAWBdB9Lvx
 Rls+KQFOOwz7R1ycEwxcymiVXxAF+zDQZEFSFefIu3Btg4UD8agNiq2xl63MhdNEfJVAN2cqT4
 3RU=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:05 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/12] gdb: riscv: Add target description
Date: Sun, 17 Jan 2021 13:53:54 -0800
Message-Id: <20210117215403.2277103-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Sylvain Pelissier <sylvain.pelissier@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sylvain Pelissier <sylvain.pelissier@gmail.com>

Target description is not currently implemented in RISC-V
architecture. Thus GDB won't set it properly when attached.
The patch implements the target description response.

Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210106204141.14027-1-sylvain.pelissier@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8227d7aea9..6aafe4e62c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -557,6 +557,18 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static gchar *riscv_gdb_arch_name(CPUState *cs)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    if (riscv_cpu_is_32bit(env)) {
+        return g_strdup("riscv:rv32");
+    } else {
+        return g_strdup("riscv:rv64");
+    }
+}
+
 static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
@@ -592,6 +604,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
 #endif
+    cc->gdb_arch_name = riscv_gdb_arch_name;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = riscv_translate_init;
     cc->tlb_fill = riscv_cpu_tlb_fill;
-- 
2.29.2


