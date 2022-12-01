Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711263F258
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 15:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0kFN-0008IR-6l; Thu, 01 Dec 2022 09:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFG-0008HV-6z; Thu, 01 Dec 2022 09:08:59 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1p0kFD-0008Eo-1s; Thu, 01 Dec 2022 09:08:57 -0500
X-QQ-mid: bizesmtp72t1669903722t4obvrvc
Received: from ubuntu.. ( [111.196.135.79]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 01 Dec 2022 22:08:41 +0800 (CST)
X-QQ-SSF: 01200000002000B0B000B00A0000000
X-QQ-FEAT: inqCuoEDTHIRURCC9RU8h9oXy3mhMjNaNIS7UgZ+8p1KuHKwy/1OOyOHJZjPk
 xerYgKzGrx82tEIpGey3Ag4/hBQ0GAUDk/HPlSdRIqmb/JcRCUGKy5cUkdVeqFdwED+Ay8N
 DK8SEb3q7rW2gNvWsCHYNqaR9V1NBkOygdGLBiZLmkmM2J6gzilK7QWluIv+AYlOMtrz7dR
 b+uur0xWGmcZzChfKiK4eRViyEltyOiw/GZEvJIjIGKQmI7ExC1oEEnbQJ/Xb0oeuQTTwG8
 x2nlqeKpNIrxwXZapt+xLqQSujfcia4dnzGO6XfkoUXhBFCdBT9Ngw01xYeAjtO/js9NXzQ
 DTbEYNa1HKu30v3LAz/5XiLJAb05w6JOzZtkfy5JD3Cfzi8a0c=
X-QQ-GoodBg: 0
From: Bin Meng <bmeng@tinylab.org>
To: Alistair Francis <Alistair.Francis@wdc.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Vijai Kumar K <vijai@behindbytes.com>, qemu-riscv@nongnu.org
Subject: [PATCH 13/15] hw/intc: sifive_plic: Change "priority-base" to start
 from interrupt source 0
Date: Thu,  1 Dec 2022 22:08:09 +0800
Message-Id: <20221201140811.142123-13-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201140811.142123-1-bmeng@tinylab.org>
References: <20221201140811.142123-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

At present the SiFive PLIC model "priority-base" expects interrupt
priority register base starting from source 1 instead source 0,
that's why on most platforms "priority-base" is set to 0x04 except
'opentitan' machine. 'opentitan' should have set "priority-base"
to 0x04 too.

Note the irq number calculation in sifive_plic_{read,write} is
correct as the codes make up for the irq number by adding 1.

Let's simply update "priority-base" to start from interrupt source
0 and add a comment to make it crystal clear.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 include/hw/riscv/microchip_pfsoc.h | 2 +-
 include/hw/riscv/shakti_c.h        | 2 +-
 include/hw/riscv/sifive_e.h        | 2 +-
 include/hw/riscv/sifive_u.h        | 2 +-
 include/hw/riscv/virt.h            | 2 +-
 hw/intc/sifive_plic.c              | 5 +++--
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 9720bac2d5..c10d87a601 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -152,7 +152,7 @@ enum {
 
 #define MICROCHIP_PFSOC_PLIC_NUM_SOURCES        187
 #define MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES     7
-#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x04
+#define MICROCHIP_PFSOC_PLIC_PRIORITY_BASE      0x00
 #define MICROCHIP_PFSOC_PLIC_PENDING_BASE       0x1000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_BASE        0x2000
 #define MICROCHIP_PFSOC_PLIC_ENABLE_STRIDE      0x80
diff --git a/include/hw/riscv/shakti_c.h b/include/hw/riscv/shakti_c.h
index daf0aae13f..539fe1156d 100644
--- a/include/hw/riscv/shakti_c.h
+++ b/include/hw/riscv/shakti_c.h
@@ -65,7 +65,7 @@ enum {
 #define SHAKTI_C_PLIC_NUM_SOURCES 28
 /* Excluding Priority 0 */
 #define SHAKTI_C_PLIC_NUM_PRIORITIES 2
-#define SHAKTI_C_PLIC_PRIORITY_BASE 0x04
+#define SHAKTI_C_PLIC_PRIORITY_BASE 0x00
 #define SHAKTI_C_PLIC_PENDING_BASE 0x1000
 #define SHAKTI_C_PLIC_ENABLE_BASE 0x2000
 #define SHAKTI_C_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 9e58247fd8..b824a79e2d 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -89,7 +89,7 @@ enum {
  */
 #define SIFIVE_E_PLIC_NUM_SOURCES 53
 #define SIFIVE_E_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_E_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_E_PLIC_PRIORITY_BASE 0x00
 #define SIFIVE_E_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_E_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_E_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index 8f63a183c4..e680d61ece 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -158,7 +158,7 @@ enum {
 
 #define SIFIVE_U_PLIC_NUM_SOURCES 54
 #define SIFIVE_U_PLIC_NUM_PRIORITIES 7
-#define SIFIVE_U_PLIC_PRIORITY_BASE 0x04
+#define SIFIVE_U_PLIC_PRIORITY_BASE 0x00
 #define SIFIVE_U_PLIC_PENDING_BASE 0x1000
 #define SIFIVE_U_PLIC_ENABLE_BASE 0x2000
 #define SIFIVE_U_PLIC_ENABLE_STRIDE 0x80
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 7c23aea4a0..37819c168c 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -99,7 +99,7 @@ enum {
 #define VIRT_IRQCHIP_MAX_GUESTS_BITS 3
 #define VIRT_IRQCHIP_MAX_GUESTS ((1U << VIRT_IRQCHIP_MAX_GUESTS_BITS) - 1U)
 
-#define VIRT_PLIC_PRIORITY_BASE 0x04
+#define VIRT_PLIC_PRIORITY_BASE 0x00
 #define VIRT_PLIC_PENDING_BASE 0x1000
 #define VIRT_PLIC_ENABLE_BASE 0x2000
 #define VIRT_PLIC_ENABLE_STRIDE 0x80
diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 2bd292410d..7a6a358c57 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -140,7 +140,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
     SiFivePLICState *plic = opaque;
 
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
-        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq = (addr - plic->priority_base) >> 2;
 
         return plic->source_priority[irq];
     } else if (addr_between(addr, plic->pending_base, plic->num_sources >> 3)) {
@@ -187,7 +187,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
     SiFivePLICState *plic = opaque;
 
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2)) {
-        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
+        uint32_t irq = (addr - plic->priority_base) >> 2;
 
         if (((plic->num_priorities + 1) & plic->num_priorities) == 0) {
             /*
@@ -428,6 +428,7 @@ static Property sifive_plic_properties[] = {
     /* number of interrupt sources including interrupt source 0 */
     DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
     DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities, 0),
+    /* interrupt priority register base starting from source 0 */
     DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, 0),
     DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0),
     DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
-- 
2.34.1


