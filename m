Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D562EA0C8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:26:57 +0100 (CET)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZFY-0000OV-DK
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZCB-00066E-35; Mon, 04 Jan 2021 18:23:28 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:55658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwZC7-0007yk-PE; Mon, 04 Jan 2021 18:23:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9BA387470EF;
 Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 176DA7470E6; Tue,  5 Jan 2021 00:23:20 +0100 (CET)
Message-Id: <783ab6ddf9920774805db48bdbf0cc4acff6af79.1609802040.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1609802040.git.balaton@eik.bme.hu>
References: <cover.1609802040.git.balaton@eik.bme.hu>
Subject: [PATCH v4 2/4] ppc440_pcix: Fix register write trace event
Date: Tue, 05 Jan 2021 00:14:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

The trace event for pci_host_config_write() was also using the trace
event for read. Add corresponding trace and correct this.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index ed05f2fc9a..017c48624f 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -117,3 +117,4 @@ ppc440_pcix_set_irq(int irq_num) "PCI irq %d"
 ppc440_pcix_update_pim(int idx, uint64_t size, uint64_t la) "Added window %d of size=0x%" PRIx64 " to CPU=0x%" PRIx64
 ppc440_pcix_update_pom(int idx, uint32_t size, uint64_t la, uint64_t pcia) "Added window %d of size=0x%x from CPU=0x%" PRIx64 " to PCI=0x%" PRIx64
 ppc440_pcix_reg_read(uint64_t addr, uint32_t val) "addr 0x%" PRIx64 " = 0x%" PRIx32
+ppc440_pcix_reg_write(uint64_t addr, uint32_t val, uint32_t size) "addr 0x%" PRIx64 " = 0x%" PRIx32 " size 0x%" PRIx32
-- 
2.21.3


