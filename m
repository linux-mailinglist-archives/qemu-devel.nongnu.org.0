Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8132D47C5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:23:11 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3BH-0002XC-1J
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q8-0006e5-Ns
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:20 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:40901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q3-0000r7-1Z
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:19 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-EbtpAcyUM8OA5hq_mYIHKw-1; Wed, 09 Dec 2020 12:01:02 -0500
X-MC-Unique: EbtpAcyUM8OA5hq_mYIHKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C27A800D53;
 Wed,  9 Dec 2020 17:01:01 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77F205D6CF;
 Wed,  9 Dec 2020 17:01:00 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] spapr: Pass sPAPR machine state to some RTAS events
 handling functions
Date: Wed,  9 Dec 2020 18:00:51 +0100
Message-Id: <20201209170052.1431440-6-groug@kaod.org>
In-Reply-To: <20201209170052.1431440-1-groug@kaod.org>
References: <20201209170052.1431440-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some functions in hw/ppc/spapr_events.c get a pointer to the machine
state using qdev_get_machine(). Convert them to get it from their
caller when possible.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr_events.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 1add53547ec3..3f37b49fd8ad 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -480,9 +480,8 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(Spapr=
MachineState *spapr,
     return entry;
 }
=20
-static bool rtas_event_log_contains(uint32_t event_mask)
+static bool rtas_event_log_contains(SpaprMachineState *spapr, uint32_t eve=
nt_mask)
 {
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
     SpaprEventLogEntry *entry =3D NULL;
=20
     QTAILQ_FOREACH(entry, &spapr->pending_events, next) {
@@ -509,10 +508,10 @@ static void spapr_init_v6hdr(struct rtas_event_log_v6=
 *v6hdr)
     v6hdr->company =3D cpu_to_be32(RTAS_LOG_V6_COMPANY_IBM);
 }
=20
-static void spapr_init_maina(struct rtas_event_log_v6_maina *maina,
+static void spapr_init_maina(SpaprMachineState *spapr,
+                             struct rtas_event_log_v6_maina *maina,
                              int section_count)
 {
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
     struct tm tm;
     int year;
=20
@@ -560,7 +559,7 @@ static void spapr_powerdown_req(Notifier *n, void *opaq=
ue)
     entry->extended_length =3D sizeof(*new_epow);
=20
     spapr_init_v6hdr(v6hdr);
-    spapr_init_maina(maina, 3 /* Main-A, Main-B and EPOW */);
+    spapr_init_maina(spapr, maina, 3 /* Main-A, Main-B and EPOW */);
=20
     mainb->hdr.section_id =3D cpu_to_be16(RTAS_LOG_V6_SECTION_ID_MAINB);
     mainb->hdr.section_length =3D cpu_to_be16(sizeof(*mainb));
@@ -613,7 +612,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint=
8_t hp_action,
     entry->extended_length =3D sizeof(*new_hp);
=20
     spapr_init_v6hdr(v6hdr);
-    spapr_init_maina(maina, 3 /* Main-A, Main-B, HP */);
+    spapr_init_maina(spapr, maina, 3 /* Main-A, Main-B, HP */);
=20
     mainb->hdr.section_id =3D cpu_to_be16(RTAS_LOG_V6_SECTION_ID_MAINB);
     mainb->hdr.section_length =3D cpu_to_be16(sizeof(*mainb));
@@ -808,9 +807,9 @@ static uint32_t spapr_mce_get_elog_type(PowerPCCPU *cpu=
, bool recovered,
     return summary;
 }
=20
-static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
+static void spapr_mce_dispatch_elog(SpaprMachineState *spapr, PowerPCCPU *=
cpu,
+                                    bool recovered)
 {
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
     CPUState *cs =3D CPU(cpu);
     CPUPPCState *env =3D &cpu->env;
     uint64_t rtas_addr;
@@ -927,7 +926,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovere=
d)
         warn_report("Received a fwnmi while migration was in progress");
     }
=20
-    spapr_mce_dispatch_elog(cpu, recovered);
+    spapr_mce_dispatch_elog(spapr, cpu, recovered);
 }
=20
 static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
@@ -980,7 +979,7 @@ static void check_exception(PowerPCCPU *cpu, SpaprMachi=
neState *spapr,
      * interrupts.
      */
     for (i =3D 0; i < EVENT_CLASS_MAX; i++) {
-        if (rtas_event_log_contains(EVENT_CLASS_MASK(i))) {
+        if (rtas_event_log_contains(spapr, EVENT_CLASS_MASK(i))) {
             const SpaprEventSource *source =3D
                 spapr_event_sources_get_source(spapr->event_sources, i);
=20
@@ -1007,7 +1006,7 @@ static void event_scan(PowerPCCPU *cpu, SpaprMachineS=
tate *spapr,
     }
=20
     for (i =3D 0; i < EVENT_CLASS_MAX; i++) {
-        if (rtas_event_log_contains(EVENT_CLASS_MASK(i))) {
+        if (rtas_event_log_contains(spapr, EVENT_CLASS_MASK(i))) {
             const SpaprEventSource *source =3D
                 spapr_event_sources_get_source(spapr->event_sources, i);
=20
--=20
2.26.2


