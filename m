Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDA1642EF2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:36:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKw-0008CM-3M; Mon, 05 Dec 2022 12:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FKS-0007vP-Vw
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:33 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FJx-0007Q4-Ny
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BTbmtRTWkaGpB084Oy/aaHAxrpUjT9n/cLcMxn66Nak=; b=ka1k+Td9DHaCTV72UN5G8eba/6
 cacN0U+NHZmSRSd/tvTCXO63kV3dEcv8qYFw0Z63TcOXpih1EF+weFjTTkkvoPX0oPXiX2AmTHoDE
 n8XaW4iVu5OlyWP8y6efSImuE2t9sjZd640JEYe9Jke1O4bWrvJBF5z3xKWumXrpuLQO2gg15ENCW
 AYJnPKQijmL3+sMhKRyAo77mYM7ERZ2FSNH5AWuKwC3Av3SoZDD0Zvstkuw9P5dDHwPw+wNzTcfuz
 36dun6Q6m4oqimUZQEK1aCylmK7A8Hega1TjG7lKt1DROe/L0aRXFN10ZsendvmEDb6Li1aET1cDi
 0ez3pl9Q==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJw-003TwY-SN; Mon, 05 Dec 2022 17:32:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKn-Q4; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 18/21] kvm/ioapic: mark gsi-2 used in ioapic routing init
Date: Mon,  5 Dec 2022 17:31:34 +0000
Message-Id: <20221205173137.607044-19-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

From: Ankur Arora <ankur.a.arora@oracle.com>

GSI-2/IOAPIC pin-2 is treated specially while initing
IRQ routing: PIC does not use it at all while the IOAPIC
maps virq=0 to pin-2 and does not use GSI-2.
(all other GSIs are identity mapped to pins.)

This results in any later code which allocates a virq
to be assigned GSI-2. This virq is in-turn used to
remap interrupts to HYPERVISOR_CALLBACK_VECTOR (0xf3)
to deliver to the guest.

Ordinarily this would be okay, but if the event delivery is
via direct injection via KVM_REQ_EVENT (without going
through the LAPIC) we see vmentry failure.

This works fine for any other values of GSI.

As a workaround, mark GSI-2 used.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/kvm/kvm-all.c  | 5 +++++
 hw/i386/kvm/ioapic.c | 1 +
 include/sysemu/kvm.h | 1 +
 3 files changed, 7 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8a227515b7..b40cfc4144 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1677,6 +1677,11 @@ static void set_gsi(KVMState *s, unsigned int gsi)
     set_bit(gsi, s->used_gsi_bitmap);
 }
 
+void kvm_irqchip_set_gsi(KVMState *s, unsigned int gsi)
+{
+    set_gsi(s, gsi);
+}
+
 static void clear_gsi(KVMState *s, unsigned int gsi)
 {
     clear_bit(gsi, s->used_gsi_bitmap);
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index ee7c8ef68b..5fab0d35c9 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -43,6 +43,7 @@ void kvm_pc_setup_irq_routing(bool pci_enabled)
             }
         }
     }
+    kvm_irqchip_set_gsi(s, 2);
     kvm_irqchip_commit_routes(s);
 }
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 8e882fbe96..a249ea480f 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -512,6 +512,7 @@ static inline void kvm_irqchip_commit_route_changes(KVMRouteChange *c)
 }
 
 void kvm_irqchip_release_virq(KVMState *s, int virq);
+void kvm_irqchip_set_gsi(KVMState *s, unsigned int gsi);
 
 int kvm_irqchip_add_adapter_route(KVMState *s, AdapterInfo *adapter);
 int kvm_irqchip_add_hv_sint_route(KVMState *s, uint32_t vcpu, uint32_t sint);
-- 
2.35.3


