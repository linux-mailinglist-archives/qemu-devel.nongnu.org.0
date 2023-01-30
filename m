Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE1680F7F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:54:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUW4-00046x-Mv; Mon, 30 Jan 2023 08:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVx-00045Z-Cu
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:05 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUVs-0003d9-WB
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:05 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 nn18-20020a17090b38d200b0022bfb584987so11155098pjb.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEMZ+8i6PiEHu0HMZDSd3axjDLwfNLs2Zat3qCkOTgQ=;
 b=7sZrB1nHqhcosZUwdxtS42F+8zwqI+xpKsp4k/+xSxqYLBk1dA7WmoVY2iFZb+7I4f
 F3gBBiAiXgsHUHjsVMu1X4w3MpSizBzc4SIPxTyG5jV4KKdDkcyK3OsjPFuvcCwWrno1
 2rbYa/P6MOamivSMrn0kCRusjpt00b7Wv4Lj/fD57jzhHXTSwGR8KCwZm8s3hO3SUSrU
 YkZqPH4w10bEod2MV+bUE7kT/o0tkEWUmcelfgqLWZEzj3Cy/VP0zf5GnSawOGXaVble
 hGyQkC/wuzIW76l1t73I1mCuDW6zix5SSgF2D9fJFd4FpF84egl8glxD/Y7+b3WAlLby
 A8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEMZ+8i6PiEHu0HMZDSd3axjDLwfNLs2Zat3qCkOTgQ=;
 b=1YYkKYpOBufkNpgEC82Efq62we6ryRxgrmhOzXzfWZvzRRfF6u+EwN6t7kl4q1urwK
 2QY158EVDW51GNZn2pmANsapW0bSWABJ1eTapFjyouOLF3tXNgLCCQl/vC3FdM2Nm63z
 hyj6lDz3J9t2/bMQ4o7Ti76Nft99Sq2mDehM9yyDeSMdJp89DZ6A4Xx8ubQWb1pRp9Jf
 3yFdPbrCAttN/M3iN7++4V2nQaTCh8idyzkfO44cfTQhv4UwQANfPERJccf4t9JbWbJT
 CyqWAd5Eo+f8MJAR6AyCBhV4r6VlG5cjXPxx567KCspgO1bCh4KPEI58cyj5qLxo3v1h
 s0LQ==
X-Gm-Message-State: AO0yUKXJLLNMcS5NhNI9c2nY1MgvCfq/PnGUewkQ76Me6JQLaX9kq2Pw
 GhvWfZKD3bdcWJJF/pRbod10ig==
X-Google-Smtp-Source: AK7set/k216iFYTJhQlF9FyI6K1lsQwGNk6VpYkosE2bVmxYZVEbiTCTPFiFor4Cs7hN8SSWKvwnmQ==
X-Received: by 2002:a17:902:c412:b0:196:82a0:4187 with SMTP id
 k18-20020a170902c41200b0019682a04187mr5048809plk.36.1675086479989; 
 Mon, 30 Jan 2023 05:47:59 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:47:59 -0800 (PST)
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
Subject: [PATCH v4 11/28] e1000e: Remove pending interrupt flags
Date: Mon, 30 Jan 2023 22:46:58 +0900
Message-Id: <20230130134715.76604-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1029.google.com
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


