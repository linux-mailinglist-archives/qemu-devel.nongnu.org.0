Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045853C6869
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 04:12:03 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m37tx-0004bQ-Vc
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 22:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37pr-0001wA-EJ; Mon, 12 Jul 2021 22:07:47 -0400
Received: from ozlabs.org ([203.11.71.1]:53609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m37po-0001ld-Ou; Mon, 12 Jul 2021 22:07:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GP3tg69GBz9sXL; Tue, 13 Jul 2021 12:07:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626142059;
 bh=74N7Svr2Vk/tf7wGdc+md9b2u3Z1EAU02s9IPkLsgPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S8UNsFgf00OpchRE0XiAoh1f/qZM8mV2O67DOpRjbC+I+Vdl5xl7KJBTOEqu5TySc
 QunwHe62oJXiPwzqGO8ouetwn9KjXuVRLT+Oe/CYu1+Z/S2uUDmaGgKinujR7azLgs
 wBx2BEnQRzmL8AUqfz6h1TBD4KcsjP4gyYJwyH/c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 3/3] mv64361: Remove extra break from a switch case
Date: Tue, 13 Jul 2021 12:07:36 +1000
Message-Id: <20210713020736.28960-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713020736.28960-1-david@gibson.dropbear.id.au>
References: <20210713020736.28960-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The switch case of writing PCI 1 IO base address had an extra break
statement that made part of the code unreachable. This did not cause a
problem as guests ususally leave this register at its default value.

Fixes: dcdf98a9015 ("Add emulation of Marvell MV64361 PPC system
       controller")
Reported-by: Coverity (CID 1458135)
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210712131259.B705B7456E3@zero.eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


