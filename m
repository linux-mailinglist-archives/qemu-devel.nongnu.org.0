Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FC365BC79
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 09:50:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCcyd-0001dw-0z; Tue, 03 Jan 2023 03:48:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcyB-0001bD-Pq
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcyA-0007X3-84
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672735705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7KXtpG+7C3jP94gnszNmUGjaNP/TUycZmSujpd/usA=;
 b=X2pw5ONG/WbS8+oWHcbY31/IzjdZgvvTdTbZJ6GEY08H6Nz8TG+b2KL/qh1EU/cSkmY5uG
 rHTxJVVeMQ5mboCSJD5t0LPn9MThxpmFDzOncAf1TBhO/g1jkijfXBkZqDnDRkfPlD6gik
 1+aMy6TI5a80dwOpGlcYr6Ef6MPqFyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534--8pE4zUHPgK7BD_X2Bn9rg-1; Tue, 03 Jan 2023 03:48:20 -0500
X-MC-Unique: -8pE4zUHPgK7BD_X2Bn9rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D249811E9C;
 Tue,  3 Jan 2023 08:48:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50E5B40C1141;
 Tue,  3 Jan 2023 08:48:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 4/6] hw/rtc/mc146818rtc: Add a property for the availability
 of the slew tick policy
Date: Tue,  3 Jan 2023 09:47:59 +0100
Message-Id: <20230103084801.20437-5-thuth@redhat.com>
In-Reply-To: <20230103084801.20437-1-thuth@redhat.com>
References: <20230103084801.20437-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

We want to get rid of the "#ifdef TARGET_I386" statements in the mc146818
code, so we need a different way to decide whether the slew tick policy
is available or not. Introduce a new property "slew-tick-policy-available"
which can be set by the machines that support this tick policy.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/rtc/mc146818rtc.h |  1 +
 hw/i386/pc_piix.c            |  1 +
 hw/isa/lpc_ich9.c            |  1 +
 hw/isa/piix3.c               |  1 +
 hw/rtc/mc146818rtc.c         | 16 ++++++++++------
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 1db0fcee92..54af63d091 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -45,6 +45,7 @@ struct RTCState {
     QEMUTimer *coalesced_timer;
     Notifier clock_reset_notifier;
     LostTickPolicy lost_tick_policy;
+    bool slew_tick_policy_available;
     Notifier suspend_notifier;
     QLIST_ENTRY(RTCState) link;
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index bc9ea8cdae..382c6add3b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -233,6 +233,7 @@ static void pc_init1(MachineState *machine,
 
         rtc_state = isa_new(TYPE_MC146818_RTC);
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
+        qdev_prop_set_bit(DEVICE(rtc_state), "slew-tick-policy-available", true);
         isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
 
         i8257_dma_init(isa_bus, 0);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 498175c1cc..aeab4d8549 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -733,6 +733,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
 
     /* RTC */
     qdev_prop_set_int32(DEVICE(&lpc->rtc), "base_year", 2000);
+    qdev_prop_set_bit(DEVICE(&lpc->rtc), "slew-tick-policy-available", true);
     if (!qdev_realize(DEVICE(&lpc->rtc), BUS(isa_bus), errp)) {
         return;
     }
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c68e51ddad..825b1cbee2 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -316,6 +316,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
     /* RTC */
     qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
+    qdev_prop_set_bit(DEVICE(&d->rtc), "slew-tick-policy-available", true);
     if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
         return;
     }
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 947d68c257..86381a74c3 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -922,14 +922,16 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     rtc_set_date_from_host(isadev);
 
     switch (s->lost_tick_policy) {
-#ifdef TARGET_I386
-    case LOST_TICK_POLICY_SLEW:
-        s->coalesced_timer =
-            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
-        break;
-#endif
     case LOST_TICK_POLICY_DISCARD:
         break;
+    case LOST_TICK_POLICY_SLEW:
+#ifdef TARGET_I386
+        if (s->slew_tick_policy_available) {
+            s->coalesced_timer = timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
+            break;
+        }
+#endif
+        /* fallthrough */
     default:
         error_setg(errp, "Invalid lost tick policy.");
         return;
@@ -989,6 +991,8 @@ static Property mc146818rtc_properties[] = {
     DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
+    DEFINE_PROP_BOOL("slew-tick-policy-available", RTCState,
+                     slew_tick_policy_available, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.31.1


