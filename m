Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8466B05BA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 12:21:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZrqA-0005by-4G; Wed, 08 Mar 2023 06:20:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9591d7c4daecea4c87af+7136+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZrq6-0005bD-Dd
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 06:20:10 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+9591d7c4daecea4c87af+7136+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pZrq2-0005zA-Uh
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 06:20:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yEUf8NsPtAfK86nZD4LzsdOV1m7cdo90l6wQAWDLNl0=; b=nps++KGJ4YSMI3bD+B9GzHjIVH
 YZ0zrTkzfiikytEAcqicf+ZtRUhTzbyzYVR5S3ljVk0whm1ICDc5qhRLDrmaOnUrvXs38McyEHLAb
 7TRh1WShYiK3g84nRRAxBUUZfsKZ0mlvNoFROojnIvMSBGyufoyRUTCdAEhz/gmdZ7Ey+QnpHhtvh
 nt4QK5sqi9NdyJ2jkDP3ZSK4vWA2poef56lmaYYz3sv52KKYJBRi4sH8tfe/iCpEUlMgfSJgtSARH
 mR2yKBNoUT+YwzmEvkGb72NGBxnyEHXI8rFoT/Jj4FbbXRO2HrzJa+0CtfWIpDz8e0pQkFRzLDn2z
 M/R/cviw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pZrpr-00HMr7-2k; Wed, 08 Mar 2023 11:19:56 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pZrpq-00BS0Z-0K; Wed, 08 Mar 2023 11:19:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 1/3] hw/intc/ioapic: Update KVM routes before redelivering
 IRQ, on RTE update
Date: Wed,  8 Mar 2023 11:19:50 +0000
Message-Id: <20230308111952.2728440-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230308111952.2728440-1-dwmw2@infradead.org>
References: <20230308111952.2728440-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+9591d7c4daecea4c87af+7136+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

A Linux guest will perform IRQ migration after the IRQ has happened,
updating the RTE to point to the new destination CPU and then unmasking
the interrupt.

However, when the guest updates the RTE, ioapic_mem_write() calls
ioapic_service(), which redelivers the pending level interrupt via
kvm_set_irq(), *before* calling ioapic_update_kvm_routes() which sets
the new target CPU.

Thus, the IRQ which is supposed to go to the new target CPU is instead
misdelivered to the previous target. An example where the guest kernel
is attempting to migrate from CPU#2 to CPU#0 shows:

xenstore_read tx 0 path control/platform-feature-xs_reset_watches
ioapic_set_irq vector: 11 level: 1
ioapic_set_remote_irr set remote irr for pin 11
ioapic_service: trigger KVM IRQ 11
[    0.523627] The affinity mask was 0-3 and the handler is on 2
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
ioapic_update_kvm_routes: update KVM route for IRQ 11: fee02000 8021
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x18021
xenstore_reset_watches
ioapic_set_irq vector: 11 level: 1
ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x1c021
[    0.524569] ioapic_ack_level IRQ 11 moveit = 1
ioapic_eoi_broadcast EOI broadcast for vector 33
ioapic_clear_remote_irr clear remote irr for pin 11 vector 33
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
ioapic_mem_read ioapic mem read addr 0x10 regsel: 0x26 size 0x4 retval 0x18021
[    0.525235] ioapic_finish_move IRQ 11 calls irq_move_masked_irq()
[    0.526147] irq_do_set_affinity for IRQ 11, 0
[    0.526732] ioapic_set_affinity for IRQ 11, 0
[    0.527330] ioapic_setup_msg_from_msi for IRQ11 target 0
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x27
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x27 size 0x4 val 0x0
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x27 size 0x4 val 0x26
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x18021
[    0.527623] ioapic_set_affinity returns 0
[    0.527623] ioapic_finish_move IRQ 11 calls unmask_ioapic_irq()
ioapic_mem_write ioapic mem write addr 0x0 regsel: 0x26 size 0x4 val 0x26
ioapic_mem_write ioapic mem write addr 0x10 regsel: 0x26 size 0x4 val 0x8021
ioapic_set_remote_irr set remote irr for pin 11
ioapic_service: trigger KVM IRQ 11
ioapic_update_kvm_routes: update KVM route for IRQ 11: fee00000 8021
[    0.529571] The affinity mask was 0 and the handler is on 2
[    xenstore_watch path memory/target token FFFFFFFF92847D40

There are no other code paths in ioapic_mem_write() which need the KVM
IRQ routing table to be updated, so just shift the call from the end
of the function to happen right before the call to ioapic_service()
and thus deliver the re-enabled IRQ to the right place.

Alternative fixes might have been just to remove the part in
ioapic_service() which delivers the IRQ via kvm_set_irq() because
surely delivering as MSI ought to work just fine anyway in all cases?
That code lacks a comment justifying its existence.

Or maybe in the specific case shown in the above log, it would have
sufficed for ioapic_update_kvm_routes() to update the route *even*
when the IRQ is masked. It's not like it's actually going to get
triggered unless QEMU deliberately does so, anyway? But that only
works because the target CPU happens to be in the high word of the
RTE; if something in the *low* word (vector, perhaps) was changed
at the same time as the unmask, we'd still trigger with stale data.

Fixes: 15eafc2e602f "kvm: x86: add support for KVM_CAP_SPLIT_IRQCHIP"
Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/intc/ioapic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 6364ecab1b..716ffc8bbb 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -405,6 +405,7 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                 s->ioredtbl[index] |= ro_bits;
                 s->irq_eoi[index] = 0;
                 ioapic_fix_edge_remote_irr(&s->ioredtbl[index]);
+                ioapic_update_kvm_routes(s);
                 ioapic_service(s);
             }
         }
@@ -417,8 +418,6 @@ ioapic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         ioapic_eoi_broadcast(val);
         break;
     }
-
-    ioapic_update_kvm_routes(s);
 }
 
 static const MemoryRegionOps ioapic_io_ops = {
-- 
2.39.0


