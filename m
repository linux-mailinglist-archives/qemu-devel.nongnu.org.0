Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9250D6AD7FB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:10:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRS7-00080F-5O; Tue, 07 Mar 2023 02:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRS4-0007wL-9O
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRS2-0005Rk-Lk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jd4tabl404FHfSElMYbFZAHJXlSGxMqSX5jlXNGPQWw=;
 b=UupM3iAyTTyOMzgvIx957fgx16rH7C83zUfFVgMw9iVsS4a+r1+14U/JE0kddGLt9aFAC9
 qR4Vc1THTGAuCLICMeYBnAPtWvUlHSROTSL3E5SdBNIYcPPSpQeWec/Z4p1DxYODUfpDAh
 KFf8Dn7/vtpUygyOuu0PMjxTbsF2Z1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-VYH67MptOTyE4ltMKqnxuA-1; Tue, 07 Mar 2023 02:09:30 -0500
X-MC-Unique: VYH67MptOTyE4ltMKqnxuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A89B802DD4;
 Tue,  7 Mar 2023 07:09:30 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62132400F8FA;
 Tue,  7 Mar 2023 07:09:28 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 12/51] e1000e: Remove pending interrupt flags
Date: Tue,  7 Mar 2023 15:07:37 +0800
Message-Id: <20230307070816.34833-13-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

They are duplicate of running throttling timer flags and incomplete as
the flags are not cleared when the interrupts are fired or the device is
reset.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e.c      |  5 ++---
 hw/net/e1000e_core.c | 19 +++----------------
 hw/net/e1000e_core.h |  2 --
 hw/net/trace-events  |  2 --
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index d591d01..0bc222d 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -631,12 +631,11 @@ static const VMStateDescription e1000e_vmstate = {
         VMSTATE_E1000E_INTR_DELAY_TIMER(core.tidv, E1000EState),
 
         VMSTATE_E1000E_INTR_DELAY_TIMER(core.itr, E1000EState),
-        VMSTATE_BOOL(core.itr_intr_pending, E1000EState),
+        VMSTATE_UNUSED(1),
 
         VMSTATE_E1000E_INTR_DELAY_TIMER_ARRAY(core.eitr, E1000EState,
                                               E1000E_MSIX_VEC_NUM),
-        VMSTATE_BOOL_ARRAY(core.eitr_intr_pending, E1000EState,
-                           E1000E_MSIX_VEC_NUM),
+        VMSTATE_UNUSED(E1000E_MSIX_VEC_NUM),
 
         VMSTATE_UINT32(core.itr_guest_value, E1000EState),
         VMSTATE_UINT32_ARRAY(core.eitr_guest_value, E1000EState,
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 87f964c..37aec6a 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -154,11 +154,6 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
 
     timer->running = false;
 
-    if (!timer->core->itr_intr_pending) {
-        trace_e1000e_irq_throttling_no_pending_interrupts();
-        return;
-    }
-
     if (msi_enabled(timer->core->owner)) {
         trace_e1000e_irq_msi_notify_postponed();
         /* Clear msi_causes_pending to fire MSI eventually */
@@ -180,11 +175,6 @@ e1000e_intrmgr_on_msix_throttling_timer(void *opaque)
 
     timer->running = false;
 
-    if (!timer->core->eitr_intr_pending[idx]) {
-        trace_e1000e_irq_throttling_no_pending_vec(idx);
-        return;
-    }
-
     trace_e1000e_irq_msix_notify_postponed_vec(idx);
     msix_notify(timer->core->owner, idx);
 }
@@ -2015,13 +2005,11 @@ e1000e_clear_ims_bits(E1000ECore *core, uint32_t bits)
 }
 
 static inline bool
-e1000e_postpone_interrupt(bool *interrupt_pending,
-                           E1000IntrDelayTimer *timer)
+e1000e_postpone_interrupt(E1000IntrDelayTimer *timer)
 {
     if (timer->running) {
         trace_e1000e_irq_postponed_by_xitr(timer->delay_reg << 2);
 
-        *interrupt_pending = true;
         return true;
     }
 
@@ -2035,14 +2023,13 @@ e1000e_postpone_interrupt(bool *interrupt_pending,
 static inline bool
 e1000e_itr_should_postpone(E1000ECore *core)
 {
-    return e1000e_postpone_interrupt(&core->itr_intr_pending, &core->itr);
+    return e1000e_postpone_interrupt(&core->itr);
 }
 
 static inline bool
 e1000e_eitr_should_postpone(E1000ECore *core, int idx)
 {
-    return e1000e_postpone_interrupt(&core->eitr_intr_pending[idx],
-                                     &core->eitr[idx]);
+    return e1000e_postpone_interrupt(&core->eitr[idx]);
 }
 
 static void
diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index b8f38c4..d0a14b4 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -95,10 +95,8 @@ struct E1000Core {
     E1000IntrDelayTimer tidv;
 
     E1000IntrDelayTimer itr;
-    bool itr_intr_pending;
 
     E1000IntrDelayTimer eitr[E1000E_MSIX_VEC_NUM];
-    bool eitr_intr_pending[E1000E_MSIX_VEC_NUM];
 
     VMChangeStateEntry *vmstate;
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 4c0ec3f..8fa4299 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -201,10 +201,8 @@ e1000e_rx_metadata_ipv6_filtering_disabled(void) "IPv6 RX filtering disabled by
 e1000e_vlan_vet(uint16_t vet) "Setting VLAN ethernet type 0x%X"
 
 e1000e_irq_msi_notify(uint32_t cause) "MSI notify 0x%x"
-e1000e_irq_throttling_no_pending_interrupts(void) "No pending interrupts to notify"
 e1000e_irq_msi_notify_postponed(void) "Sending MSI postponed by ITR"
 e1000e_irq_legacy_notify_postponed(void) "Raising legacy IRQ postponed by ITR"
-e1000e_irq_throttling_no_pending_vec(int idx) "No pending interrupts for vector %d"
 e1000e_irq_msix_notify_postponed_vec(int idx) "Sending MSI-X postponed by EITR[%d]"
 e1000e_irq_legacy_notify(bool level) "IRQ line state: %d"
 e1000e_irq_msix_notify_vec(uint32_t vector) "MSI-X notify vector 0x%x"
-- 
2.7.4


