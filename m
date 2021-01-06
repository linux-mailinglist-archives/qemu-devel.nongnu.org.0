Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678302EB8B8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:55:37 +0100 (CET)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzv6-0000is-Em
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzew-00060x-50; Tue, 05 Jan 2021 22:38:54 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59467 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeu-0006Ob-Cq; Tue, 05 Jan 2021 22:38:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpJ70Dcz9sWs; Wed,  6 Jan 2021 14:38:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904312;
 bh=CY0H8sKR3IFSQjPCsBd6ufCfxXS4CpbLM0Ucsm2WTvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o3ox8V47E/rTRpBu2HWJxgMe0a73V9o+NLr4uATw+zd4BK9xqFXPD5/vzUsVTxLh3
 74IMyqE3edpqV5wIYoFXRdjtjOKHdCnQgGNGN32T0jRnfQ2j4dwxUcim8JlygHjUav
 UFq8M00dJnX2zOPypdqjKh7VMY7CHAOCJ3w8j1aw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 21/22] ppc440_pcix: Fix register write trace event
Date: Wed,  6 Jan 2021 14:38:15 +1100
Message-Id: <20210106033816.232598-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan via <qemu-ppc@nongnu.org>

The trace event for pci_host_config_write() was also using the trace
event for read. Add corresponding trace and correct this.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <a6c7dcf7153cc537123ed8ceac060f2f64a883cb.1609636173.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/ppc440_pcix.c | 2 +-
 hw/ppc/trace-events  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index eb1290ffc8..7829d3e556 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -169,7 +169,7 @@ static void ppc440_pcix_reg_write4(void *opaque, hwaddr addr,
 {
     struct PPC440PCIXState *s = opaque;
 
-    trace_ppc440_pcix_reg_read(addr, val);
+    trace_ppc440_pcix_reg_write(addr, val, size);
     switch (addr) {
     case PCI_VENDOR_ID ... PCI_MAX_LAT:
         stl_le_p(s->dev->config + addr, val);
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 6d8d095aa2..1e91984526 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -96,3 +96,4 @@ ppc440_pcix_set_irq(int irq_num) "PCI irq %d"
 ppc440_pcix_update_pim(int idx, uint64_t size, uint64_t la) "Added window %d of size=0x%" PRIx64 " to CPU=0x%" PRIx64
 ppc440_pcix_update_pom(int idx, uint32_t size, uint64_t la, uint64_t pcia) "Added window %d of size=0x%x from CPU=0x%" PRIx64 " to PCI=0x%" PRIx64
 ppc440_pcix_reg_read(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
+ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr 0x%" PRIx64 " = 0x%" PRIx32 " size 0x%" PRIx32
-- 
2.29.2


