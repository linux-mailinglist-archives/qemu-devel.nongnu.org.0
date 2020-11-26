Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A72C5DAD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 22:57:27 +0100 (CET)
Received: from localhost ([::1]:49698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPGY-0002I9-Sk
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 16:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9r-0001s0-TB; Thu, 26 Nov 2020 16:50:31 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60636
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9m-0005ng-B6; Thu, 26 Nov 2020 16:50:31 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id CE7FE39005E9;
 Thu, 26 Nov 2020 22:50:21 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] hw/arm/virt: Disable highmem when on hypervisor.framework
Date: Thu, 26 Nov 2020 22:50:17 +0100
Message-Id: <20201126215017.41156-9-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Apple M1 only supports up to 36 bits of physical address space. That
means we can not fit the 64bit MMIO BAR region into our address space.

To fix this, let's not expose a 64bit MMIO BAR region when running on
Apple Silicon.

I have not been able to find a way to enumerate that easily, so let's
just assume we always have that little PA space on hypervisor.framework
systems.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/arm/virt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..d74053ecd4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -45,6 +45,7 @@
 #include "hw/display/ramfb.h"
 #include "net/net.h"
 #include "sysemu/device_tree.h"
+#include "sysemu/hvf.h"
 #include "sysemu/numa.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
@@ -1746,6 +1747,14 @@ static void machvirt_init(MachineState *machine)
     unsigned int smp_cpus = machine->smp.cpus;
     unsigned int max_cpus = machine->smp.max_cpus;
 
+    /*
+     * On Hypervisor.framework capable systems, we only have 36 bits of PA
+     * space, which is not enough to fit a 64bit BAR space
+     */
+    if (hvf_enabled()) {
+        vms->highmem = false;
+    }
+
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
      * to create a VM with the right number of IPA bits.
-- 
2.24.3 (Apple Git-128)


