Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FA685DFC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:37:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3v8-0006VN-8C; Tue, 31 Jan 2023 22:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3v6-0006Uu-Cj
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:24 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3v4-0000Qg-Pw
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:36:24 -0500
Received: by mail-pl1-x636.google.com with SMTP id n13so1678433plf.11
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEMZ+8i6PiEHu0HMZDSd3axjDLwfNLs2Zat3qCkOTgQ=;
 b=k01BSWJkh3WYJNEXBO/f7d7PXMSmgB48bEaP4frGJx3S8qDSOAkfINSD7/Fa9U3I0e
 6f7cqtMx8xjBGV1C42P+FJW60ujrfP5k7F1B78aZVDby6HbAB2M/ZpiGHht45lXT7B59
 WndR45i/rzS7W/kk99do8s4ikqeARFbM8O8KvfhxVe06f5gjqoK4vJPqZ6fXvYdaJl5a
 rdQ4UZaCKdPp/xO20k3a4mqJ9PbD4GUg6X6ltTkTBYZQ6S0zrrPhz+5hGl7Z/df1TpDU
 OB7uP8ggKcDlA31WTfYWZ1FvU6w5zP40ae1yUCqnj1wDuc7LSWFprSu0ebzC5iTuHFvp
 I46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEMZ+8i6PiEHu0HMZDSd3axjDLwfNLs2Zat3qCkOTgQ=;
 b=ajm/WD9CRbEDNvL+lo+RQern8gUwO99K7erUK7NmdtB5QSHsKhoRWkDU6DudvCVaoh
 hSDNa1cEww5vGts5g4ie0eyGwyJuma4nu5a73ID1P/oO01pbNSE9SZNQENwgUBq9r/hK
 4GnTOWihu4zkCYZbLh3jHU/4UA/uJHloZF5BAUm5KDH7Unz8ZDC38ovxdvG+TkiXppAo
 EySTPR0Su7RtKrDBq3FeJYS+ITxwTeNJ1r1Na51JS3JmSl0koU/UxfGR5H2yTo6k5s2S
 lH/d/lcqU2gQWIk6caorm6P1yzRKqn81LrmasR+28VMxXg7JU/E26NCB1ezSY/nKbl26
 0VyQ==
X-Gm-Message-State: AO0yUKUFwraCPqOuVfwWt+II44LUgzUoGPGo+gqKdaHpeT9Lr5N0DUFD
 9w388/snZz5P00E7oZTotzn7mQ==
X-Google-Smtp-Source: AK7set9Fcfgm6v0eNDeRo/a4CwDEHOub4X706dgyY7mR86ahUm7U2EhJLh38JDTfEaMoIE80xBHz8g==
X-Received: by 2002:a05:6a20:4411:b0:bf:e16:f3f with SMTP id
 ce17-20020a056a20441100b000bf0e160f3fmr1127166pzb.33.1675222582116; 
 Tue, 31 Jan 2023 19:36:22 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:36:21 -0800 (PST)
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
Subject: [PATCH v5 11/29] e1000e: Remove pending interrupt flags
Date: Wed,  1 Feb 2023 12:35:21 +0900
Message-Id: <20230201033539.30049-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
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


