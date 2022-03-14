Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB3F4D87DD
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:15:13 +0100 (CET)
Received: from localhost ([::1]:40850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmPf-0007Sf-FX
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:15:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1nTldu-0006Fs-Pc
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:25:51 -0400
Received: from [2001:8b0:10b:1236::1] (port=41662 helo=casper.infradead.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1nTlds-0002Hx-S5
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=O6xqusn4ODZ2fcJu46nr1a5IoiLNYs+kXPiehf6bvq4=; b=NIckz06LafAcR5n4DH1v4B0SVd
 P4T9qqpHJ+SYf2UHz6Lu1kl3Pzt1qvhEWVNrvSiSbawq45CZNKWh5DXpkh1q0GbNbeo07bLgs5N2z
 61vdo3+4Bvlmt/LJrjAFtdEDoZbHR0UCcd4lsQBQ5/W3g/9rvfBSdbmsP1dWEgiJ8WPQSexOPvzMl
 lqny7dLSoCC94bShH6ctLG84uwLxr+NS/US2of++2+/RaqdezeA9Eb8rG02bbJ8BK/2x9Vp5p003H
 57k8mYlrAri4J+kUJeMfpuPzoioMD/+qBG+YHLO7A4omRNCqpbEaflXH8dGoWVhz6ggqUc4YjMANv
 NS2kuwUQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTldp-0047ZB-DS; Mon, 14 Mar 2022 14:25:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nTldo-000dAU-KD; Mon, 14 Mar 2022 14:25:44 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] target/i386: Fix sanity check on max APIC ID / X2APIC
 enablement
Date: Mon, 14 Mar 2022 14:25:41 +0000
Message-Id: <20220314142544.150555-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:8b0:10b:1236::1
 (failed)
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+a709675fe440e0b94d32+6777+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check on x86ms->apic_id_limit in pc_machine_done() had two problems.

Firstly, we need KVM to support the X2APIC API in order to allow IRQ
delivery to APICs >= 255. So we need to call/check kvm_enable_x2apic(),
which was done elsewhere in *some* cases but not all.

Secondly, microvm needs the same check. So move it from pc_machine_done()
to x86_cpus_init() where it will work for both.

The check in kvm_cpu_instance_init() is now redundant and can be dropped.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Acked-by: Claudio Fontana <cfontana@suse.de>
---
 hw/i386/pc.c              |  8 --------
 hw/i386/x86.c             | 16 ++++++++++++++++
 target/i386/kvm/kvm-cpu.c |  2 +-
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd55fc725c..d3ab28fec5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -740,14 +740,6 @@ void pc_machine_done(Notifier *notifier, void *data)
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     }
-
-
-    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
-        !kvm_irqchip_in_kernel()) {
-        error_report("current -smp configuration requires kernel "
-                     "irqchip support.");
-        exit(EXIT_FAILURE);
-    }
 }
 
 void pc_guest_info_init(PCMachineState *pcms)
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 4cf107baea..8da55d58ea 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -39,6 +39,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/xen.h"
 #include "trace.h"
 
 #include "hw/i386/x86.h"
@@ -123,6 +124,21 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
      */
     x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
                                                       ms->smp.max_cpus - 1) + 1;
+
+    /*
+     * Can we support APIC ID 255 or higher?
+     *
+     * Under Xen: yes.
+     * With userspace emulated lapic: no
+     * With KVM's in-kernel lapic: only if X2APIC API is enabled.
+     */
+    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
+        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
+        error_report("current -smp configuration requires kernel "
+                     "irqchip and X2APIC API support.");
+        exit(EXIT_FAILURE);
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index d95028018e..c60cb2dafb 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -165,7 +165,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
         /* only applies to builtin_x86_defs cpus */
         if (!kvm_irqchip_in_kernel()) {
             x86_cpu_change_kvm_default("x2apic", "off");
-        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
+        } else if (kvm_irqchip_is_split()) {
             x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
         }
 
-- 
2.33.1


