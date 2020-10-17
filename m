Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD11A291457
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Oct 2020 22:39:21 +0200 (CEST)
Received: from localhost ([::1]:53050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTsz2-0004Z4-Q4
	for lists+qemu-devel@lfdr.de; Sat, 17 Oct 2020 16:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTsvi-0000i2-RG; Sat, 17 Oct 2020 16:35:54 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:13755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kTsvf-0004ZM-LE; Sat, 17 Oct 2020 16:35:54 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B5EEC747632;
 Sat, 17 Oct 2020 22:35:46 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 67C9A74762E; Sat, 17 Oct 2020 22:35:46 +0200 (CEST)
Message-Id: <2b7a5594c8c41dcae0ade3354a13540f83570ab0.1602965621.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1602965621.git.balaton@eik.bme.hu>
References: <cover.1602965621.git.balaton@eik.bme.hu>
Subject: [PATCH 4/6] sun4u: use qdev instead of legacy m48t59_init() function
Date: Sat, 17 Oct 2020 22:13:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/17 16:35:46
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Herve Poussineau <hpoussin@reactos.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/sparc64/sun4u.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index ad5ca2472a..a89ebed6f0 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -671,10 +671,12 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     pci_ide_create_devs(pci_dev);
 
     /* Map NVRAM into I/O (ebus) space */
-    nvram = m48t59_init(NULL, 0, 0, NVRAM_SIZE, 1968, 59);
-    s = SYS_BUS_DEVICE(nvram);
+    dev = qdev_new("sysbus-m48t59");
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
     memory_region_add_subregion(pci_address_space_io(ebus), 0x2000,
                                 sysbus_mmio_get_region(s, 0));
+    nvram = NVRAM(dev);
  
     initrd_size = 0;
     initrd_addr = 0;
-- 
2.21.3


