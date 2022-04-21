Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30D850A944
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:33:47 +0200 (CEST)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcYk-0000s9-NU
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWc-0006Fc-0A
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWX-0005bk-Eh
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:33 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcVg-000Caf-9L; Thu, 21 Apr 2022 20:30:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:19 +0100
Message-Id: <20220421193100.5098-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/50] dino: use QOM cast instead of directly referencing
 parent_obj
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use a QOM cast in both dino_chip_read_with_attrs() and dino_chip_write_with_attrs()
instead of directly referencing parent_obj.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index d3cd8578a1..77b8089664 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -205,6 +205,7 @@ static MemTxResult dino_chip_read_with_attrs(void *opaque, hwaddr addr,
                                              MemTxAttrs attrs)
 {
     DinoState *s = opaque;
+    PCIHostState *phb = PCI_HOST_BRIDGE(s);
     MemTxResult ret = MEMTX_OK;
     AddressSpace *io;
     uint16_t ioaddr;
@@ -214,7 +215,7 @@ static MemTxResult dino_chip_read_with_attrs(void *opaque, hwaddr addr,
     case DINO_PCI_IO_DATA ... DINO_PCI_IO_DATA + 3:
         /* Read from PCI IO space. */
         io = &address_space_io;
-        ioaddr = s->parent_obj.config_reg + (addr & 3);
+        ioaddr = phb->config_reg + (addr & 3);
         switch (size) {
         case 1:
             val = address_space_ldub(io, ioaddr, attrs, &ret);
@@ -297,6 +298,7 @@ static MemTxResult dino_chip_write_with_attrs(void *opaque, hwaddr addr,
                                               MemTxAttrs attrs)
 {
     DinoState *s = opaque;
+    PCIHostState *phb = PCI_HOST_BRIDGE(s);
     AddressSpace *io;
     MemTxResult ret;
     uint16_t ioaddr;
@@ -308,7 +310,7 @@ static MemTxResult dino_chip_write_with_attrs(void *opaque, hwaddr addr,
     case DINO_IO_DATA ... DINO_PCI_IO_DATA + 3:
         /* Write into PCI IO space.  */
         io = &address_space_io;
-        ioaddr = s->parent_obj.config_reg + (addr & 3);
+        ioaddr = phb->config_reg + (addr & 3);
         switch (size) {
         case 1:
             address_space_stb(io, ioaddr, val, attrs, &ret);
-- 
2.20.1


