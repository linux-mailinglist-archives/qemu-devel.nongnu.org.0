Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96512638BCC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 15:03:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyZIB-0008UC-Rp; Fri, 25 Nov 2022 09:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZI5-0008Ra-BF
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:02:57 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oyZI3-0006pE-4m
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 09:02:52 -0500
Received: by mail-pl1-x62d.google.com with SMTP id io19so4069219plb.8
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 06:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FO9kY6bht34BHExoubEycbyhwUS3o+wWkOOwxtrIBJ0=;
 b=MXwy3f1BRoaHdJ6GcfHHtLMKogKvB1Dg1DQI4ELvuTpM0RSKMqQsek/YXSOYKrZmVp
 joGnaojcD4bMVeztw1xbuoJaAdHnv9EyqpLgWNYoV0g37/RMvPu/69CzBxF66dR5vy0w
 jmTaRjFQLyLJFKiJLssvSbWh714xctNavkJZi1enNr5M8x8gavMiTXC/IZhvEYVnqhUp
 /UKC1WyFPhhkotJFWzSv/OrnoJMxle606UGYtpQ5ipwYOXjoDHzSnHeAZzaBQComWTsF
 WmhrXZRu7XinRHaCm3K5629aJCLe3dMvfzDQtVzte8p2vjLv1zKtHKH19klZCfw3llt7
 xjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FO9kY6bht34BHExoubEycbyhwUS3o+wWkOOwxtrIBJ0=;
 b=EFqXTVSi6YSp50mV2aHwSoqq1DW6n7hbgJCnN65cYx6ZppWD2IZXF26xebRS9aIIsg
 Yet4EVaRtXk1/FyAP8yETEqQlsMKe9UT86l2T5ViUV4XhMEFpBROeDR11zvcL09GX5I+
 UZjI6FFas7eis50R7WdrH/8kwf8LQ+em1U24xWiaHpnyg2JQpy07qmhXrIz82g27rzaa
 +9qZQpvgUPavJRTvJlPu5YrAxXcplpP601gt6vXHbe1tQ9TVJMdv5PSiSJXrbXc4bPCx
 rv9VV4hX4zF+kFx24paVpLM4myel/kIpmoYN1064eDiwi/xVqE7N4AheMgprwiFo796f
 1FXQ==
X-Gm-Message-State: ANoB5pkAGqHZkrPxhcL8bFle0LQf9C2Sf4rS1Wcs5IKM31alf7xADZZ5
 TqchzIfIg2VHZoU4m5TgCQS7L7Jw1l4rRw==
X-Google-Smtp-Source: AA0mqf6vp3SadCCv8ypITdKYKtJxMJQorri+C6fasmOpgx+8nL5KVy9M+rGiz14kN9JoD3NtjwsmZw==
X-Received: by 2002:a17:90a:f0c2:b0:218:ac70:fdd5 with SMTP id
 fa2-20020a17090af0c200b00218ac70fdd5mr25365624pjb.123.1669384966746; 
 Fri, 25 Nov 2022 06:02:46 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 v29-20020aa799dd000000b00574a3dc1453sm2361278pfi.14.2022.11.25.06.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 06:02:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] e1000e: Remove pending interrupt flags
Date: Fri, 25 Nov 2022 23:02:42 +0900
Message-Id: <20221125140242.56158-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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
 hw/net/e1000e_core.h |  2 --
 hw/net/e1000e.c      |  3 ---
 hw/net/e1000e_core.c | 19 +++----------------
 hw/net/trace-events  |  2 --
 4 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index 4ddb4d2c39..5807da4fb6 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -95,10 +95,8 @@ struct E1000Core {
     E1000IntrDelayTimer tidv;
 
     E1000IntrDelayTimer itr;
-    bool itr_intr_pending;
 
     E1000IntrDelayTimer eitr[E1000E_MSIX_VEC_NUM];
-    bool eitr_intr_pending[E1000E_MSIX_VEC_NUM];
 
     VMChangeStateEntry *vmstate;
 
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 7523e9f5d2..459b12407a 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -630,12 +630,9 @@ static const VMStateDescription e1000e_vmstate = {
         VMSTATE_E1000E_INTR_DELAY_TIMER(core.tidv, E1000EState),
 
         VMSTATE_E1000E_INTR_DELAY_TIMER(core.itr, E1000EState),
-        VMSTATE_BOOL(core.itr_intr_pending, E1000EState),
 
         VMSTATE_E1000E_INTR_DELAY_TIMER_ARRAY(core.eitr, E1000EState,
                                               E1000E_MSIX_VEC_NUM),
-        VMSTATE_BOOL_ARRAY(core.eitr_intr_pending, E1000EState,
-                           E1000E_MSIX_VEC_NUM),
 
         VMSTATE_UINT32(core.itr_guest_value, E1000EState),
         VMSTATE_UINT32_ARRAY(core.eitr_guest_value, E1000EState,
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index fc9cdb4528..2ca49cf665 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -152,11 +152,6 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
 
     timer->running = false;
 
-    if (!timer->core->itr_intr_pending) {
-        trace_e1000e_irq_throttling_no_pending_interrupts();
-        return;
-    }
-
     if (msi_enabled(timer->core->owner)) {
         trace_e1000e_irq_msi_notify_postponed();
         /* Clear msi_causes_pending to fire MSI eventually */
@@ -178,11 +173,6 @@ e1000e_intrmgr_on_msix_throttling_timer(void *opaque)
 
     timer->running = false;
 
-    if (!timer->core->eitr_intr_pending[idx]) {
-        trace_e1000e_irq_throttling_no_pending_vec(idx);
-        return;
-    }
-
     trace_e1000e_irq_msix_notify_postponed_vec(idx);
     msix_notify(timer->core->owner, idx);
 }
@@ -2011,13 +2001,11 @@ e1000e_clear_ims_bits(E1000ECore *core, uint32_t bits)
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
 
@@ -2031,14 +2019,13 @@ e1000e_postpone_interrupt(bool *interrupt_pending,
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
2.38.1


