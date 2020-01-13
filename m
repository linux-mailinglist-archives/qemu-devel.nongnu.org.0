Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52113952C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 16:48:52 +0100 (CET)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir1xT-0002g0-5V
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 10:48:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ir1v2-0001Az-QK
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 10:46:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>) id 1ir1v1-0001jl-Os
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 10:46:20 -0500
Received: from mail.dornerworks.com ([12.207.209.150]:20480
 helo=webmail.dornerworks.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Jeff.Kubascik@dornerworks.com>)
 id 1ir1uz-0001ZO-Fx; Mon, 13 Jan 2020 10:46:17 -0500
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: [PATCH] arm/gicv3: update virtual irq state after IAR register read
Date: Mon, 13 Jan 2020 10:46:07 -0500
Message-ID: <20200113154607.97032-1-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 12.207.209.150
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The IAR0/IAR1 register is used to acknowledge an interrupt - a read of the
register activates the highest priority pending interrupt and provides its
interrupt ID. Activating an interrupt can change the CPU's virtual interrupt
state - this change makes sure the virtual irq state is updated.

Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
---
Hello,

I am using the ARMv8 version of QEMU configured with the gicv3 interrupt
controller to run the Xen hypervisor with RTEMS as a guest VM (AArch32). I
have noticed that when Xen injects a virtual irq to the guest VM, the guest
gets stuck in the interrupt handler.

The guest's interrupt handler does the following in order:
  - Reads IAR1 to acknowledge the interrupt and get the INTID
  - Unmasks interrupts by clearing the I bit in the CPSR register
  - Dispatches the interrupt to the appropriate driver
  - Restores the I bit in the CPSR state
  - Writes the INTID to EOIR1 to drop priority and deactivate the interrupt

However, when the I bit was cleared, QEMU immediately raised the same
virtual interrupt again. This process repeated itself indefinitely.

The read of the IAR1 register should activate the interrupt and prevent it
from firing again. However, the gicv3 device code wasn't updating the
irq_line_state, so the CPU_INTERRUPT_VIRQ flag remained set. Therefore, when
I bit was cleared, the CPU immediately switched to the exception handler.

I have tested this patch, and it works for Xen with both an AArch64 Linux
guest and an AArch32 RTEMS guest.

Sincerely,
Jeff Kubascik
---
 hw/intc/arm_gicv3_cpuif.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index a254b0ce87..08e000e33c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -664,6 +664,9 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
     trace_gicv3_icv_iar_read(ri->crm == 8 ? 0 : 1,
                              gicv3_redist_affid(cs), intid);
+
+    gicv3_cpuif_virt_update(cs);
+
     return intid;
 }
 
-- 
2.17.1


