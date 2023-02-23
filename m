Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DCF6A05F6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:22:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8jA-0006AL-OU; Thu, 23 Feb 2023 05:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8j8-00069c-Jd
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:26 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8j6-00027Y-UZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:21:26 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 d1-20020a17090a3b0100b00229ca6a4636so12448073pjc.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEMZ+8i6PiEHu0HMZDSd3axjDLwfNLs2Zat3qCkOTgQ=;
 b=u2a9fOVi1YgAKzlv5RJzwfktrcZbV1OjJLetnYrHhzi1Zki2yyJQ8CyKVjA1rQp3MO
 gjzxglGXUNJS+gGVbfngGL1tZmtLHhuc3ioAIq5o5i81K1s3kgU6nh8DuohvZCbco6eu
 hNMQ4lhiP5y7C7w02RDyKQEtPm/iQahOn/QQN5mZwEmmfdNAFdFIFIgkmjPXzY55b9j4
 Nt7iCq6x+35UhjcAddhAU4VtjXwjiS5RttUvpOLNw1a4iGStk9N3iTMh/NnLt6O2z/qJ
 LMY3sjS672gtphBdVK62Km5Oedc0IU9+DqWikITDtsmWnEhOdRXVnpcxeQ/eIID7BwcM
 RDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEMZ+8i6PiEHu0HMZDSd3axjDLwfNLs2Zat3qCkOTgQ=;
 b=rxJ/NBmDAEoGwfT8GcaM+PM2lbhkBzEtOgpdwc84qDVtwoSe3RXNyiTJyN9OjPzPb3
 0jRbcaxblpB7//8sjlApXbChiAw1gQznQTrHXTJqJluW3Hwh9mhzLUJxK4IheOJ7pRco
 5W0EX7nEteF46ad1qC8pt/UZGaHYaG4b3KezPAOn85quOpIF/odUgUkoljbX9YEeS5Gq
 ZEIUfqRDKsdXnWHxpLSqEoqT1KciLvVWTVgsTpSRPIq4egRSUtuOsoOp4szU5ZvqPKU3
 XJWXx82KnkZOBdNY1cwXujUxy7/cbaMmQ+9gDWO+ZLEmlWP5oK4U4TPda62ID/trGfZt
 wN1g==
X-Gm-Message-State: AO0yUKXAxAJnNbMUfSDs6zvORLkauTe+h8/TzGOuUOzHdyDEjf/MiBhm
 2TApzzvzlyfx2SHT3xggTfUl2g==
X-Google-Smtp-Source: AK7set+wkQ97ENmCDtvZ/zSaxBzaRplX4ctu6Io9HzTgycWYM+sQOpR5E0BYot34NQRCTLKAsCtHMA==
X-Received: by 2002:a17:902:da8e:b0:19a:73fb:6175 with SMTP id
 j14-20020a170902da8e00b0019a73fb6175mr12899339plx.27.1677147683703; 
 Thu, 23 Feb 2023 02:21:23 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:21:23 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 12/34] e1000e: Remove pending interrupt flags
Date: Thu, 23 Feb 2023 19:19:56 +0900
Message-Id: <20230223102018.141748-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

They are duplicate of running throttling timer flags and incomplete as
the flags are not cleared when the interrupts are fired or the device is
reset.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e.c      |  5 ++---
 hw/net/e1000e_core.c | 19 +++----------------
 hw/net/e1000e_core.h |  2 --
 hw/net/trace-events  |  2 --
 4 files changed, 5 insertions(+), 23 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index d591d01c07..0bc222d354 100644
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
index 87f964cdc1..37aec6a970 100644
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
index b8f38c47a0..d0a14b4523 100644
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
index 4c0ec3fda1..8fa4299704 100644
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
2.39.1


