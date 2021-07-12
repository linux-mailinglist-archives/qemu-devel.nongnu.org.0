Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BC73C5D6D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:39:27 +0200 (CEST)
Received: from localhost ([::1]:60174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2w9e-000764-MP
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m2vkC-0005HG-UP; Mon, 12 Jul 2021 09:13:09 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m2vkA-0001eK-8L; Mon, 12 Jul 2021 09:13:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D552D74570D;
 Mon, 12 Jul 2021 15:12:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B705B7456E3; Mon, 12 Jul 2021 15:12:59 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] mv64361: Remove extra break from a switch case
Date: Mon, 12 Jul 2021 15:11:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Message-Id: <20210712131259.B705B7456E3@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The switch case of writing PCI 1 IO base address had an extra break
statement that made part of the code unreachable. This did not cause a
problem as guests ususally leave this register at its default value.

Reported-by: Coverity (CID 1458135)
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/pci-host/mv64361.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index 20510d8680..92b0f5d047 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -687,7 +687,6 @@ static void mv64361_write(void *opaque, hwaddr addr, uint64_t val,
     case MV64340_PCI_1_IO_BASE_ADDR:
         s->pci[1].io_base = val & 0x30fffffULL;
         warn_swap_bit(val);
-        break;
         if (!(s->cpu_conf & BIT(27))) {
             s->pci[1].remap[4] = (val & 0xffffULL) << 16;
         }
-- 
2.21.4


