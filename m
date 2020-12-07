Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F32D1296
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:54:22 +0100 (CET)
Received: from localhost ([::1]:52026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGy5-0003Tg-H2
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kmGhd-0002dk-RB
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:37:25 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:56890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kmGhX-0008IK-Gs
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:37:18 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-tgZ7i0M2NUatt06dngos8g-1; Mon, 07 Dec 2020 08:37:09 -0500
X-MC-Unique: tgZ7i0M2NUatt06dngos8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2447858180;
 Mon,  7 Dec 2020 13:37:07 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DCB160BE2;
 Mon,  7 Dec 2020 13:37:04 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0] spapr: Allow memory unplug to always succeed
Date: Mon,  7 Dec 2020 14:37:04 +0100
Message-Id: <20201207133704.952459-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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
Based-on: 20201109173928.1001764-1-cohuck@redhat.com
---
 include/hw/ppc/spapr.h | 1 +
 hw/ppc/spapr.c         | 6 +++++-
 hw/ppc/spapr_events.c  | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index b7ced9faebf5..7aa630350326 100644
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
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 7e954bc84bed..f0b26b2af30d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4044,7 +4044,8 @@ static void spapr_machine_device_unplug_request(Hotpl=
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
@@ -4530,8 +4531,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
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
index 1add53547ec3..c30123177b16 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -659,7 +659,8 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint=
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
--=20
2.26.2


