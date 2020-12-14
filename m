Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66F2D928A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:19:55 +0100 (CET)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogH4-0000PZ-59
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwy-0005wM-6z; Sun, 13 Dec 2020 23:59:08 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:47743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwu-0004u0-9Z; Sun, 13 Dec 2020 23:59:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfv42FZz9sWq; Mon, 14 Dec 2020 15:58:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921895;
 bh=DrMnRyJ9M8U0u6yno73lo3uVCJa/SpyEJKsDuEcTiA4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WkC2KzHAozKIK1mjLyg7oHNlD6dHuWuoHPqRulv6iupr2YcIHyNftpyr5ps/jp2x8
 WA/33ZVGEV9zl4/3DxNWZT6AtjkNY46uiquC21rRMugu31ILjxfoV0G/xz3Upnppf7
 XUnjW6imWRkCtyRDDzrdWQl2N9PeA3wIZg0ZTO3w=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 29/30] spapr: Pass sPAPR machine state to some RTAS events
 handling functions
Date: Mon, 14 Dec 2020 15:58:06 +1100
Message-Id: <20201214045807.41003-30-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Some functions in hw/ppc/spapr_events.c get a pointer to the machine
state using qdev_get_machine(). Convert them to get it from their
caller when possible.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201209170052.1431440-6-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_events.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 1add53547e..3f37b49fd8 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -480,9 +480,8 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(SpaprMachineState *spapr,
     return entry;
 }
 
-static bool rtas_event_log_contains(uint32_t event_mask)
+static bool rtas_event_log_contains(SpaprMachineState *spapr, uint32_t event_mask)
 {
-    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     SpaprEventLogEntry *entry = NULL;
 
     QTAILQ_FOREACH(entry, &spapr->pending_events, next) {
@@ -509,10 +508,10 @@ static void spapr_init_v6hdr(struct rtas_event_log_v6 *v6hdr)
     v6hdr->company = cpu_to_be32(RTAS_LOG_V6_COMPANY_IBM);
 }
 
-static void spapr_init_maina(struct rtas_event_log_v6_maina *maina,
+static void spapr_init_maina(SpaprMachineState *spapr,
+                             struct rtas_event_log_v6_maina *maina,
                              int section_count)
 {
-    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     struct tm tm;
     int year;
 
@@ -560,7 +559,7 @@ static void spapr_powerdown_req(Notifier *n, void *opaque)
     entry->extended_length = sizeof(*new_epow);
 
     spapr_init_v6hdr(v6hdr);
-    spapr_init_maina(maina, 3 /* Main-A, Main-B and EPOW */);
+    spapr_init_maina(spapr, maina, 3 /* Main-A, Main-B and EPOW */);
 
     mainb->hdr.section_id = cpu_to_be16(RTAS_LOG_V6_SECTION_ID_MAINB);
     mainb->hdr.section_length = cpu_to_be16(sizeof(*mainb));
@@ -613,7 +612,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
     entry->extended_length = sizeof(*new_hp);
 
     spapr_init_v6hdr(v6hdr);
-    spapr_init_maina(maina, 3 /* Main-A, Main-B, HP */);
+    spapr_init_maina(spapr, maina, 3 /* Main-A, Main-B, HP */);
 
     mainb->hdr.section_id = cpu_to_be16(RTAS_LOG_V6_SECTION_ID_MAINB);
     mainb->hdr.section_length = cpu_to_be16(sizeof(*mainb));
@@ -808,9 +807,9 @@ static uint32_t spapr_mce_get_elog_type(PowerPCCPU *cpu, bool recovered,
     return summary;
 }
 
-static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
+static void spapr_mce_dispatch_elog(SpaprMachineState *spapr, PowerPCCPU *cpu,
+                                    bool recovered)
 {
-    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     uint64_t rtas_addr;
@@ -927,7 +926,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
         warn_report("Received a fwnmi while migration was in progress");
     }
 
-    spapr_mce_dispatch_elog(cpu, recovered);
+    spapr_mce_dispatch_elog(spapr, cpu, recovered);
 }
 
 static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
@@ -980,7 +979,7 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
      * interrupts.
      */
     for (i = 0; i < EVENT_CLASS_MAX; i++) {
-        if (rtas_event_log_contains(EVENT_CLASS_MASK(i))) {
+        if (rtas_event_log_contains(spapr, EVENT_CLASS_MASK(i))) {
             const SpaprEventSource *source =
                 spapr_event_sources_get_source(spapr->event_sources, i);
 
@@ -1007,7 +1006,7 @@ static void event_scan(PowerPCCPU *cpu, SpaprMachineState *spapr,
     }
 
     for (i = 0; i < EVENT_CLASS_MAX; i++) {
-        if (rtas_event_log_contains(EVENT_CLASS_MASK(i))) {
+        if (rtas_event_log_contains(spapr, EVENT_CLASS_MASK(i))) {
             const SpaprEventSource *source =
                 spapr_event_sources_get_source(spapr->event_sources, i);
 
-- 
2.29.2


