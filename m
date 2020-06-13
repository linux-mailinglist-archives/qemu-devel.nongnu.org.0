Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2AA1F838A
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Jun 2020 15:47:28 +0200 (CEST)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jk6VL-0004YF-6L
	for lists+qemu-devel@lfdr.de; Sat, 13 Jun 2020 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jk6TG-0002US-2G; Sat, 13 Jun 2020 09:45:18 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:47663)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jk6TD-0002Sy-9A; Sat, 13 Jun 2020 09:45:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 62C17748DD0;
 Sat, 13 Jun 2020 15:45:00 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 31259748DD1; Sat, 13 Jun 2020 15:45:00 +0200 (CEST)
Message-Id: <dc05efa9c54fb4cafdcea70c396c0790bf99c849.1592055375.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1592055375.git.balaton@eik.bme.hu>
References: <cover.1592055375.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 4/5] mac_oldworld: Rename ppc_heathrow_reset reset to
 ppc_heathrow_cpu_reset
Date: Sat, 13 Jun 2020 15:36:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/13 09:45:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Howard Spoelstra <hsp.cat7@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function resets a CPU not the whole machine so reflect that in
its name.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_oldworld.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 4dd872c1a3..9138752ccb 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -73,7 +73,7 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
     return (addr & 0x0fffffff) + KERNEL_LOAD_ADDR;
 }
 
-static void ppc_heathrow_reset(void *opaque)
+static void ppc_heathrow_cpu_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
 
@@ -127,7 +127,7 @@ static void ppc_heathrow_init(MachineState *machine)
 
         /* Set time-base frequency to 16.6 Mhz */
         cpu_ppc_tb_init(env,  TBFREQ);
-        qemu_register_reset(ppc_heathrow_reset, cpu);
+        qemu_register_reset(ppc_heathrow_cpu_reset, cpu);
     }
 
     /* allocate RAM */
-- 
2.21.3


