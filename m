Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF4B6EBCFF
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:27:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqREV-0007XI-OJ; Sun, 23 Apr 2023 00:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDu-0006U7-S4
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:15 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDr-0001Mu-Lb
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1a814fe0ddeso38398485ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223669; x=1684815669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KPyCZWCVVg6wHqDWD/p3CCxFj3CRpWbe+8CQ620i9Po=;
 b=fMsFzNWef2wpS4qz7XKKEw9O23LElOftko18ET/08GMtXnBkV+ioyqRN4Tll8skbGq
 besOBMpJwJgfxEObraTX7jrDUcemAV0bzZYi4gfDZkNWBTin0SrcjHyYZU2bXF8UIJfj
 SLlzBbdwlPD6qGU7jlt19z5LCx6ni/axb/Ohmvi5UjNKyfzA2LG7weTddZQ4H1dwqMSH
 /GMjTX6necL+6YYhSOS+Zj46uD3n5xTH8A5RHTdAjDZmgRhvKiMpHuLcKfqmk/6B4fRr
 MegxQEJ9ccki4r3o3INZl8agw6LJjwd5PVuzva2DOA+8ERN3qgLVPYM6rZo62JHZFzm0
 62sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223669; x=1684815669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KPyCZWCVVg6wHqDWD/p3CCxFj3CRpWbe+8CQ620i9Po=;
 b=ei848BsoVmIXnGSgmr8ruikHd9kIiECe3eeQftMSa5BAHIgfJI0TI7jfUg3LAnMUTS
 hoX3yAwo1nMevPWoFFiabYnhqxqmyX3SEsKDMJV00bioaTf+HHfap4JW8ZRjEyLnJT/Q
 WNUEmo0qAO9rxzEaQtKU0jbTrpoLU3m7cRnq2EfEqxtHLfnCgb0fomVFzLq//UKBah1m
 Q7RXEoWnnMiB6WczpmD/8Derr8Ot6oUl3hjHyOIBH3dSIAPyiLbOqCtibDzoX+FGxHRk
 2Hmn3rRFPW+Yz5rgB6rq8aeiKX7/mSDjKVyTWbjvxaYbm/XLzFX5hULeClmHp2yPXIbu
 6FCQ==
X-Gm-Message-State: AAQBX9d9X3upmmOhLnJcsCOx05L0UNiCSs1OSXQFCDzee4+kHJdAEI6P
 eiyTbRL2jETx0clfp79k/fT8JA==
X-Google-Smtp-Source: AKy350ZXaXxl/AgbpuwjDFn1vOUmtMX68EEjEtDXnNLBDg6vBRXbb4EV0UptMZGSAKgMdfIbOcQzJw==
X-Received: by 2002:a17:903:249:b0:1a6:7510:170a with SMTP id
 j9-20020a170903024900b001a67510170amr11337201plh.11.1682223668996; 
 Sat, 22 Apr 2023 21:21:08 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:21:08 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 43/47] e1000e: Notify only new interrupts
Date: Sun, 23 Apr 2023 13:18:29 +0900
Message-Id: <20230423041833.5302-44-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In MSI-X mode, if there are interrupts already notified but not cleared
and a new interrupt arrives, e1000e incorrectly notifies the notified
ones again along with the new one.

To fix this issue, replace e1000e_update_interrupt_state() with
two new functions: e1000e_raise_interrupts() and
e1000e_lower_interrupts(). These functions don't only raise or lower
interrupts, but it also performs register writes which updates the
interrupt state. Before it performs a register write, these function
determines the interrupts already raised, and compares with the
interrupts raised after the register write to determine the interrupts
to notify.

The introduction of these functions made tracepoints which assumes that
the caller of e1000e_update_interrupt_state() performs register writes
obsolete. These tracepoints are now removed, and alternative ones are
added to the new functions.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.h |   2 -
 hw/net/e1000e_core.c | 153 +++++++++++++++++++------------------------
 hw/net/trace-events  |   2 +
 3 files changed, 69 insertions(+), 88 deletions(-)

diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index 213a70530d..66b025cc43 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -111,8 +111,6 @@ struct E1000Core {
     PCIDevice *owner;
     void (*owner_start_recv)(PCIDevice *d);
 
-    uint32_t msi_causes_pending;
-
     int64_t timadj;
 };
 
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 347162a9d0..78373d7db7 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -165,14 +165,14 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
 
     timer->running = false;
 
-    if (msi_enabled(timer->core->owner)) {
-        trace_e1000e_irq_msi_notify_postponed();
-        /* Clear msi_causes_pending to fire MSI eventually */
-        timer->core->msi_causes_pending = 0;
-        e1000e_set_interrupt_cause(timer->core, 0);
-    } else {
-        trace_e1000e_irq_legacy_notify_postponed();
-        e1000e_set_interrupt_cause(timer->core, 0);
+    if (timer->core->mac[IMS] & timer->core->mac[ICR]) {
+        if (msi_enabled(timer->core->owner)) {
+            trace_e1000e_irq_msi_notify_postponed();
+            msi_notify(timer->core->owner, 0);
+        } else {
+            trace_e1000e_irq_legacy_notify_postponed();
+            e1000e_raise_legacy_irq(timer->core);
+        }
     }
 }
 
@@ -366,10 +366,6 @@ static void
 e1000e_intrmgr_fire_all_timers(E1000ECore *core)
 {
     int i;
-    uint32_t val = e1000e_intmgr_collect_delayed_causes(core);
-
-    trace_e1000e_irq_adding_delayed_causes(val, core->mac[ICR]);
-    core->mac[ICR] |= val;
 
     if (core->itr.running) {
         timer_del(core->itr.timer);
@@ -1974,13 +1970,6 @@ void(*e1000e_phyreg_writeops[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE])
     }
 };
 
-static inline void
-e1000e_clear_ims_bits(E1000ECore *core, uint32_t bits)
-{
-    trace_e1000e_irq_clear_ims(bits, core->mac[IMS], core->mac[IMS] & ~bits);
-    core->mac[IMS] &= ~bits;
-}
-
 static inline bool
 e1000e_postpone_interrupt(E1000IntrDelayTimer *timer)
 {
@@ -2038,7 +2027,6 @@ e1000e_msix_notify_one(E1000ECore *core, uint32_t cause, uint32_t int_cfg)
     effective_eiac = core->mac[EIAC] & cause;
 
     core->mac[ICR] &= ~effective_eiac;
-    core->msi_causes_pending &= ~effective_eiac;
 
     if (!(core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
         core->mac[IMS] &= ~effective_eiac;
@@ -2130,33 +2118,17 @@ e1000e_fix_icr_asserted(E1000ECore *core)
     trace_e1000e_irq_fix_icr_asserted(core->mac[ICR]);
 }
 
-static void
-e1000e_send_msi(E1000ECore *core, bool msix)
+static void e1000e_raise_interrupts(E1000ECore *core,
+                                    size_t index, uint32_t causes)
 {
-    uint32_t causes = core->mac[ICR] & core->mac[IMS] & ~E1000_ICR_ASSERTED;
-
-    core->msi_causes_pending &= causes;
-    causes ^= core->msi_causes_pending;
-    if (causes == 0) {
-        return;
-    }
-    core->msi_causes_pending |= causes;
+    bool is_msix = msix_enabled(core->owner);
+    uint32_t old_causes = core->mac[IMS] & core->mac[ICR];
+    uint32_t raised_causes;
 
-    if (msix) {
-        e1000e_msix_notify(core, causes);
-    } else {
-        if (!e1000e_itr_should_postpone(core)) {
-            trace_e1000e_irq_msi_notify(causes);
-            msi_notify(core->owner, 0);
-        }
-    }
-}
+    trace_e1000e_irq_set(index << 2,
+                         core->mac[index], core->mac[index] | causes);
 
-static void
-e1000e_update_interrupt_state(E1000ECore *core)
-{
-    bool interrupts_pending;
-    bool is_msix = msix_enabled(core->owner);
+    core->mac[index] |= causes;
 
     /* Set ICR[OTHER] for MSI-X */
     if (is_msix) {
@@ -2178,40 +2150,58 @@ e1000e_update_interrupt_state(E1000ECore *core)
      */
     core->mac[ICS] = core->mac[ICR];
 
-    interrupts_pending = (core->mac[IMS] & core->mac[ICR]) ? true : false;
-    if (!interrupts_pending) {
-        core->msi_causes_pending = 0;
-    }
-
     trace_e1000e_irq_pending_interrupts(core->mac[ICR] & core->mac[IMS],
                                         core->mac[ICR], core->mac[IMS]);
 
-    if (is_msix || msi_enabled(core->owner)) {
-        if (interrupts_pending) {
-            e1000e_send_msi(core, is_msix);
-        }
-    } else {
-        if (interrupts_pending) {
-            if (!e1000e_itr_should_postpone(core)) {
-                e1000e_raise_legacy_irq(core);
-            }
+    raised_causes = core->mac[IMS] & core->mac[ICR] & ~old_causes;
+    if (!raised_causes) {
+        return;
+    }
+
+    if (is_msix) {
+        e1000e_msix_notify(core, raised_causes & ~E1000_ICR_ASSERTED);
+    } else if (!e1000e_itr_should_postpone(core)) {
+        if (msi_enabled(core->owner)) {
+            trace_e1000e_irq_msi_notify(raised_causes);
+            msi_notify(core->owner, 0);
         } else {
-            e1000e_lower_legacy_irq(core);
+            e1000e_raise_legacy_irq(core);
         }
     }
 }
 
-static void
-e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val)
+static void e1000e_lower_interrupts(E1000ECore *core,
+                                    size_t index, uint32_t causes)
 {
-    trace_e1000e_irq_set_cause_entry(val, core->mac[ICR]);
+    trace_e1000e_irq_clear(index << 2,
+                           core->mac[index], core->mac[index] & ~causes);
 
-    val |= e1000e_intmgr_collect_delayed_causes(core);
-    core->mac[ICR] |= val;
+    core->mac[index] &= ~causes;
 
-    trace_e1000e_irq_set_cause_exit(val, core->mac[ICR]);
+    /*
+     * Make sure ICR and ICS registers have the same value.
+     * The spec says that the ICS register is write-only.  However in practice,
+     * on real hardware ICS is readable, and for reads it has the same value as
+     * ICR (except that ICS does not have the clear on read behaviour of ICR).
+     *
+     * The VxWorks PRO/1000 driver uses this behaviour.
+     */
+    core->mac[ICS] = core->mac[ICR];
+
+    trace_e1000e_irq_pending_interrupts(core->mac[ICR] & core->mac[IMS],
+                                        core->mac[ICR], core->mac[IMS]);
 
-    e1000e_update_interrupt_state(core);
+    if (!(core->mac[IMS] & core->mac[ICR]) &&
+        !msix_enabled(core->owner) && !msi_enabled(core->owner)) {
+        e1000e_lower_legacy_irq(core);
+    }
+}
+
+static void
+e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val)
+{
+    val |= e1000e_intmgr_collect_delayed_causes(core);
+    e1000e_raise_interrupts(core, ICR, val);
 }
 
 static inline void
@@ -2477,30 +2467,27 @@ e1000e_set_ics(E1000ECore *core, int index, uint32_t val)
 static void
 e1000e_set_icr(E1000ECore *core, int index, uint32_t val)
 {
-    uint32_t icr = 0;
     if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
         trace_e1000e_irq_icr_process_iame();
-        e1000e_clear_ims_bits(core, core->mac[IAM]);
+        e1000e_lower_interrupts(core, IMS, core->mac[IAM]);
     }
 
-    icr = core->mac[ICR] & ~val;
     /*
      * Windows driver expects that the "receive overrun" bit and other
      * ones to be cleared when the "Other" bit (#24) is cleared.
      */
-    icr = (val & E1000_ICR_OTHER) ? (icr & ~E1000_ICR_OTHER_CAUSES) : icr;
-    trace_e1000e_irq_icr_write(val, core->mac[ICR], icr);
-    core->mac[ICR] = icr;
-    e1000e_update_interrupt_state(core);
+    if (val & E1000_ICR_OTHER) {
+        val |= E1000_ICR_OTHER_CAUSES;
+    }
+    e1000e_lower_interrupts(core, ICR, val);
 }
 
 static void
 e1000e_set_imc(E1000ECore *core, int index, uint32_t val)
 {
     trace_e1000e_irq_ims_clear_set_imc(val);
-    e1000e_clear_ims_bits(core, val);
-    e1000e_update_interrupt_state(core);
+    e1000e_lower_interrupts(core, IMS, val);
 }
 
 static void
@@ -2521,9 +2508,6 @@ e1000e_set_ims(E1000ECore *core, int index, uint32_t val)
 
     uint32_t valid_val = val & ims_valid_mask;
 
-    trace_e1000e_irq_set_ims(val, core->mac[IMS], core->mac[IMS] | valid_val);
-    core->mac[IMS] |= valid_val;
-
     if ((valid_val & ims_ext_mask) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_PBA_CLR) &&
         msix_enabled(core->owner)) {
@@ -2536,7 +2520,7 @@ e1000e_set_ims(E1000ECore *core, int index, uint32_t val)
         e1000e_intrmgr_fire_all_timers(core);
     }
 
-    e1000e_update_interrupt_state(core);
+    e1000e_raise_interrupts(core, IMS, valid_val);
 }
 
 static void
@@ -2609,28 +2593,25 @@ static uint32_t
 e1000e_mac_icr_read(E1000ECore *core, int index)
 {
     uint32_t ret = core->mac[ICR];
-    trace_e1000e_irq_icr_read_entry(ret);
 
     if (core->mac[IMS] == 0) {
         trace_e1000e_irq_icr_clear_zero_ims();
-        core->mac[ICR] = 0;
+        e1000e_lower_interrupts(core, ICR, 0xffffffff);
     }
 
     if (!msix_enabled(core->owner)) {
         trace_e1000e_irq_icr_clear_nonmsix_icr_read();
-        core->mac[ICR] = 0;
+        e1000e_lower_interrupts(core, ICR, 0xffffffff);
     }
 
     if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
         trace_e1000e_irq_icr_clear_iame();
-        core->mac[ICR] = 0;
+        e1000e_lower_interrupts(core, ICR, 0xffffffff);
         trace_e1000e_irq_icr_process_iame();
-        e1000e_clear_ims_bits(core, core->mac[IAM]);
+        e1000e_lower_interrupts(core, IMS, core->mac[IAM]);
     }
 
-    trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
-    e1000e_update_interrupt_state(core);
     return ret;
 }
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 64d776bc2a..d171dc8179 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -205,6 +205,8 @@ e1000e_irq_msix_notify_postponed_vec(int idx) "Sending MSI-X postponed by EITR[%
 e1000e_irq_legacy_notify(bool level) "IRQ line state: %d"
 e1000e_irq_msix_notify_vec(uint32_t vector) "MSI-X notify vector 0x%x"
 e1000e_irq_postponed_by_xitr(uint32_t reg) "Interrupt postponed by [E]ITR register 0x%x"
+e1000e_irq_clear(uint32_t offset, uint32_t old, uint32_t new) "Clearing interrupt register 0x%x: 0x%x --> 0x%x"
+e1000e_irq_set(uint32_t offset, uint32_t old, uint32_t new) "Setting interrupt register 0x%x: 0x%x --> 0x%x"
 e1000e_irq_clear_ims(uint32_t bits, uint32_t old_ims, uint32_t new_ims) "Clearing IMS bits 0x%x: 0x%x --> 0x%x"
 e1000e_irq_set_ims(uint32_t bits, uint32_t old_ims, uint32_t new_ims) "Setting IMS bits 0x%x: 0x%x --> 0x%x"
 e1000e_irq_fix_icr_asserted(uint32_t new_val) "ICR_ASSERTED bit fixed: 0x%x"
-- 
2.40.0


