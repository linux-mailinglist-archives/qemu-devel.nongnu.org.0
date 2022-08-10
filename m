Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B007C58F2DE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:14:54 +0200 (CEST)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLrAL-0001wc-Aw
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqii-0005qv-TX
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqig-0007GH-53
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:46:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id bs25so287654wrb.2
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=LxSeMItdX80JUjkCqXJgBhLVTwmp50MmNGKVChYDIkyimBCZggvVswojH2xaylxdrl
 GqF64fQ3rYkS8TgZapgQSQ1ChYk+cpE5OMLLYfHahXpuypIqzE5Ozrj51yCqRstntxCR
 XBwYtD/FhG+6iAAP4Gp12XgbPvkBiblJXb3IQf+Zpb2WcllJxn6cxa5likf6q9upV1Hh
 bbMFgMLxfjkk4lvnviYPyDt1chW4aK6QfinXZYmYrbSWwLmznOVfWMcUFc6LttE+8P9I
 VqHauCCK7uKPdbhguExtlE9NNoH6ReIcZ6+EN33AG/9K0zSdzrvwCgmMmUqOlHl5Gqz5
 CUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=4VMHQuAgWueOOW/2vq5O+yFUyQgD2E8gHZxnXsC4j6CliLzBucQCZGrEna4jBWmfQR
 DBodyM4cHZV0LEwfCYztWAyY2VKDZf72xs3FLxpYjNB3542BRyjtuk7R2B2KnrI6Pk+W
 RtwebN1EnaJexDed32JPt9g5fCxUEpuLhF70xLeSKuIjKviiIkAv4TACJPZkvQht/3D1
 bvRzQN7Obue0qEli6QtKodb7ouOGq9DNK01NPrHaPOb3gw/oxyEHOCmXZu6T/cVrhLhK
 /7/mu9v1K6klgj9P+PyIxY0i912ZaeoXfGG2QSQCu0O0HSZUtqtMROeoWsACwcnE7pFd
 JKxQ==
X-Gm-Message-State: ACgBeo0vDna+TbhxWPEvc0ahWdV6TbWJLxvjTJMGaLHrMaoyGbJiwApv
 5vJpubG1aRE3xTXeApxK4mPvVJNayuQjNTcD
X-Google-Smtp-Source: AA6agR5cEsZTkeIM60/maHEsT+mjTmhiJMFDBRHpKpDsKgto5han/ZWpbkiQUCdEYeIR/fPfWekWiA==
X-Received: by 2002:a5d:5887:0:b0:220:81c9:8ab7 with SMTP id
 n7-20020a5d5887000000b0022081c98ab7mr17748783wrf.702.1660157176721; 
 Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/4] hw/riscv: virt: fix uart node name
Date: Wed, 10 Aug 2022 19:46:09 +0100
Message-Id: <20220810184612.157317-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Conor Dooley <conor.dooley@microchip.com>

"uart" is not a node name that complies with the dt-schema.
Change the node name to "serial" to ix warnings seen during
dt-validate on a dtbdump of the virt machine such as:
/stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..6c61a406c4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -917,7 +917,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name;
     MachineState *mc = MACHINE(s);
 
-    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
+    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-- 
2.37.1


