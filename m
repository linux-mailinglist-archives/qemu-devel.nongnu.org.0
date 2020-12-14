Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E342D95D7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:09:40 +0100 (CET)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koknT-0007YM-TX
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kokk7-0004Qo-Pd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:06:11 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:22887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kokk3-0006vE-I3
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:06:11 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-jOogFDbZNR-yYZPVccP1cw-1; Mon, 14 Dec 2020 05:05:54 -0500
X-MC-Unique: jOogFDbZNR-yYZPVccP1cw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB303800D55;
 Mon, 14 Dec 2020 10:05:52 +0000 (UTC)
Received: from bahia.lan (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE8971CB4;
 Mon, 14 Dec 2020 10:05:51 +0000 (UTC)
Subject: [PATCH REPOST] spapr: Allow memory unplug to always succeed
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Dec 2020 11:05:50 +0100
Message-ID: <160794035064.23292.17560963281911312439.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

It is currently impossible to hot-unplug a memory device between
machine reset and CAS.

(qemu) device_del dimm1
Error: Memory hot unplug not supported for this guest

This limitation was introduced in order to provide an explicit
error path for older guests that didn't support hot-plug event
sources (and thus memory hot-unplug).

The linux kernel has been supporting these since 4.11. All recent
enough guests are thus capable of handling the removal of a memory
device at all time, including during early boot.

Lift the limitation for the latest machine type. This means that
trying to unplug memory from a guest that doesn't support it will
likely just do nothing and the memory will only get removed at
next reboot. Such older guests can still get the existing behavior
by using an older machine type.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
This patch was initially posted before the compat machine types
for 6.0 got merged upstream. During the same period, David was
also transitioning from github to gitlab, and the patch didn't
applied cleanly. Now it does. Just reposting it unchanged for
convenience.
---
 hw/ppc/spapr.c         |    6 +++++-
 hw/ppc/spapr_events.c  |    3 ++-
 include/hw/ppc/spapr.h |    1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index dee48a0043bb..481c800a5a33 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4051,7 +4051,8 @@ static void spapr_machine_device_unplug_request(Hotpl=
ugHandler *hotplug_dev,
     SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
=20
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        if (spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
+        if (!smc->pre_6_0_memory_unplug ||
+            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
             spapr_memory_unplug_request(hotplug_dev, dev, errp);
         } else {
             /* NOTE: this means there is a window after guest reset, prior=
 to
@@ -4537,8 +4538,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
  */
 static void spapr_machine_5_2_class_options(MachineClass *mc)
 {
+    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
+
     spapr_machine_6_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    smc->pre_6_0_memory_unplug =3D true;
 }
=20
 DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 3f37b49fd8ad..6aedd988b3d0 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -658,7 +658,8 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint=
8_t hp_action,
         /* we should not be using count_indexed value unless the guest
          * supports dedicated hotplug event source
          */
-        g_assert(spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
+        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplug ||
+                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
         hp->drc_id.count_indexed.count =3D
             cpu_to_be32(drc_id->count_indexed.count);
         hp->drc_id.count_indexed.index =3D
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index e0f10f252c08..06a5b4259f20 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -139,6 +139,7 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
+    bool pre_6_0_memory_unplug;
=20
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,=20



