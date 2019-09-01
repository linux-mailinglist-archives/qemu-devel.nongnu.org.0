Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B87A46E9
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Sep 2019 05:10:55 +0200 (CEST)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4GGU-0007Tr-7n
	for lists+qemu-devel@lfdr.de; Sat, 31 Aug 2019 23:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzt-0007kk-QP
 for qemu-devel@nongnu.org; Sat, 31 Aug 2019 22:53:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i4Fzs-0006nS-Cm
 for qemu-devel@nongnu.org; Sat, 31 Aug 2019 22:53:45 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i4Fzs-0006lH-5U; Sat, 31 Aug 2019 22:53:44 -0400
Received: by mail-pg1-x544.google.com with SMTP id u17so5487289pgi.6;
 Sat, 31 Aug 2019 19:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=SNHWgb1fo+XKyhdKAZWato+/FHeDfiKXz9WIzLRD6mY=;
 b=kA2kbX3KSP13yKPnDH5rRK6pZmnWoJ16B3cWkarHJYxuz3kvVzNO4d5fNtRFDq2ZlH
 i4tKUMhJO01x0nlFU1Es7dcz1ahjKK5YKbzwNlBlSsnVihPHGelqcdWVV2qmhb4ID22r
 KoM+5UtMHS17krKUpjjc9+pMfFGFZKaxOGbjyHk19cawth/5HSlC+HF8Whid+mSfah+M
 VcNjLv+VUI4MbgmjkdZwEUYNJpYjuhMCvB6SivQzcC55cPhPwD4981WE2Q0xwsknsCUD
 8Iu8EN6eL9/7q5tLjJ/+3edlYMcdSw8ilrCjmnfMIB5cn8JLKAv/9Fb4Z00ADH+I2l+W
 NYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=SNHWgb1fo+XKyhdKAZWato+/FHeDfiKXz9WIzLRD6mY=;
 b=Vguih8qNbOcQpf1eSmCVteB0vEaznCpCJad4KOO5iFTobmmvFkwqi8DhSYh/vBnyUb
 cc4yQQvHVmQ1NXwWZTMCBL7YoL8EbtNYfz7sw5jkn0KvbmgFTDTQQ/27Wsrrt1yTHRq7
 tcTmE5RX1hIjWQpPnhkpG3JqNcAGfTujqEbEvJLlcd6k0n1fz7iXEEV/wBxPE/peRceK
 +SMrRCeNtgCqF8QYfYQHDidMzA0rbRjak2cTxT1HA2MxAnzO2A6DOcPYs9Ze+mYbHg5L
 UhQpOZG3+cZSRaw+MF5URWKANIENgySAvwACyzaTxlCbOMqFRTRfRDfrnIBDzgyaEDru
 qoWQ==
X-Gm-Message-State: APjAAAVxiJLG/SaTXcIMfYMdPW4/1to4FxPYizxCTvnvTcxE+YVcK2qF
 cBNPDCXkA4x6IW9kGmADSjw=
X-Google-Smtp-Source: APXvYqxvx4yvMAk+r+EANUTFlKLJ/xyJtpdrsQxt/OzOsgvKyunpVO6+0ipuaSaQenB5gsf3zCDXgA==
X-Received: by 2002:a17:90a:1916:: with SMTP id
 22mr6637044pjg.62.1567306422756; 
 Sat, 31 Aug 2019 19:53:42 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id p10sm11453307pff.132.2019.08.31.19.53.41
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Sat, 31 Aug 2019 19:53:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Sat, 31 Aug 2019 19:53:03 -0700
Message-Id: <1567306391-2682-23-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
References: <1567306391-2682-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v7 22/30] riscv: sifive_u: Reference PRCI
 clocks in UART and ethernet nodes
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have added a PRCI node, update existing UART and ethernet
nodes to reference PRCI as their clock sources, to keep in sync with
the Linux kernel device tree.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c              |  7 ++++---
 include/hw/riscv/sifive_u_prci.h | 10 ++++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index da8ee64..3b1fe46 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -78,7 +78,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    char ethclk_names[] = "pclk\0hclk\0tx_clk";
+    char ethclk_names[] = "pclk\0hclk";
     uint32_t plic_phandle, prci_phandle, ethclk_phandle, phandle = 1;
     uint32_t uartclk_phandle;
     uint32_t hfclk_phandle, rtcclk_phandle;
@@ -263,7 +263,7 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
-        ethclk_phandle, ethclk_phandle, ethclk_phandle);
+        prci_phandle, PRCI_CLK_GEMGXLPLL, prci_phandle, PRCI_CLK_GEMGXLPLL);
     qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
         sizeof(ethclk_names));
     qemu_fdt_setprop_cell(fdt, nodename, "#address-cells", 1);
@@ -293,7 +293,8 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_UART0].base,
         0x0, memmap[SIFIVE_U_UART0].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "clocks", uartclk_phandle);
+    qemu_fdt_setprop_cells(fdt, nodename, "clocks",
+        prci_phandle, PRCI_CLK_TLCLK);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupt-parent", plic_phandle);
     qemu_fdt_setprop_cell(fdt, nodename, "interrupts", SIFIVE_U_UART0_IRQ);
 
diff --git a/include/hw/riscv/sifive_u_prci.h b/include/hw/riscv/sifive_u_prci.h
index 60a2eab..0a531fd 100644
--- a/include/hw/riscv/sifive_u_prci.h
+++ b/include/hw/riscv/sifive_u_prci.h
@@ -78,4 +78,14 @@ typedef struct SiFiveUPRCIState {
     uint32_t clkmuxstatus;
 } SiFiveUPRCIState;
 
+/*
+ * Clock indexes for use by Device Tree data and the PRCI driver.
+ *
+ * These values are from sifive-fu540-prci.h in the Linux kernel.
+ */
+#define PRCI_CLK_COREPLL        0
+#define PRCI_CLK_DDRPLL         1
+#define PRCI_CLK_GEMGXLPLL      2
+#define PRCI_CLK_TLCLK          3
+
 #endif /* HW_SIFIVE_U_PRCI_H */
-- 
2.7.4


