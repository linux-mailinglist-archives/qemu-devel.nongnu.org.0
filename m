Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD950613EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbCI-0007yV-QW; Mon, 31 Oct 2022 16:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCF-0007u3-14; Mon, 31 Oct 2022 16:15:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbCD-0001Bm-GI; Mon, 31 Oct 2022 16:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zLFSj1SiBfpXp2BAt8zDnh97wrdCPVXno/jH9FcZqso=; b=l2gwMwDdYLPLTpNdS3g64w45pY
 toRipf9YiMzHSuynnovWnsDJkpz5MJwq5FGpLzsVLyMg77DY2W2MBX9p8Hd1LB+R8la2cKs7DB/Uf
 UaBGp5m77pzdTfW4TzrDQ0p6lnhT7ioMeTRQdN1D81j2xHSL7Vg3nyF950O9bTYd9C3ZUzI+6n+G0
 iprNsSOPDqcYtrt6+KJ/UtrLnZ0HwhMr4bDwhvJfpPfSPawZuiPg8hUs3CKsyNyxvU51le70TE7BI
 FDcXEtUbj1iJ5/lBUo5bU0c0WcvsQ9+GeKE38nGruNjn81iDHsT645o/UfFuEQZMNSIad1CRqz4QI
 iueqY2fBSy85vjimV9cxo3EyTXgN1s3oJvQtwYfVcPlr71id9SyoeZ30ogj5XglKtTfd9vI/VGlGx
 9ljh25Ukiqlz//gIfTb1IbOk3j0K4Hs4Hwpgqd41rXJBbNOIq1iJ0nDCdW53IhTXbRX56fKRk7dFh
 xPS7vBYUnZtyBs8Cz2UfIyVFqeJpW1lr3exUe8gcbmtvMJgh9z5EsgJmvqFa0F8eU7NdlVdW/uWf3
 tGuwiYvpfpxTUfJVVc8dYs7MaXqAoVsRdEWQrclzOKshR46IKKDkZn5p5y8cj/FSg7xUxEsQZXHLv
 EXA2ftdjWJB/1fgV3o0rhJQpCan1WIcSjrOwrzUqw=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC4-0003Dd-Ay; Mon, 31 Oct 2022 20:15:40 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:31 +0000
Message-Id: <20221031201435.677168-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 10/14] hw/ppc/mac.h: Move PROM and KERNEL defines to board code
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

The PROM_FILENAME and KERNEL_* defines are used by mac_oldworld and
mac_newworld but they don't have to be identical so these could be
moved to the individual boards.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <5fa693334adf166d23931c81d81ada4e3441ed7d.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac.h          | 4 ----
 hw/ppc/mac_newworld.c | 4 ++++
 hw/ppc/mac_oldworld.c | 7 ++++++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index fe77a6c6db..3e2df262ee 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -30,10 +30,6 @@
 #include "hw/sysbus.h"
 
 #define NVRAM_SIZE        0x2000
-#define PROM_FILENAME    "openbios-ppc"
-
-#define KERNEL_LOAD_ADDR 0x01000000
-#define KERNEL_GAP       0x00100000
 
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 873c9f5cb4..c75c59fe3e 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -83,9 +83,13 @@
 
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
+#define PROM_FILENAME "openbios-ppc"
 #define PROM_BASE 0xfff00000
 #define PROM_SIZE (1 * MiB)
 
+#define KERNEL_LOAD_ADDR 0x01000000
+#define KERNEL_GAP       0x00100000
+
 #define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
 typedef struct Core99MachineState Core99MachineState;
 DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 47a1abf248..ae8e0ff30a 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -58,10 +58,15 @@
 
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
-#define GRACKLE_BASE 0xfec00000
+#define PROM_FILENAME "openbios-ppc"
 #define PROM_BASE 0xffc00000
 #define PROM_SIZE (4 * MiB)
 
+#define KERNEL_LOAD_ADDR 0x01000000
+#define KERNEL_GAP       0x00100000
+
+#define GRACKLE_BASE 0xfec00000
+
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
 {
-- 
2.30.2


