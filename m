Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFC52EF679
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 18:33:06 +0100 (CET)
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxvdJ-0005U7-TO
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 12:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kxvbx-0004tm-5f
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:31:42 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:33726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kxvbt-0004vB-TW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 12:31:40 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-pf8g46BfMVm5PHjO02jCnA-1; Fri, 08 Jan 2021 12:31:30 -0500
X-MC-Unique: pf8g46BfMVm5PHjO02jCnA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1955612A7;
 Fri,  8 Jan 2021 17:31:29 +0000 (UTC)
Received: from bahia.lan (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292E15D9E2;
 Fri,  8 Jan 2021 17:31:27 +0000 (UTC)
Subject: [PATCH] spapr: Improve handling of memory unplug with old guests
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 08 Jan 2021 18:31:27 +0100
Message-ID: <161012708715.801107.11418801796987916516.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
trying to unplug memory from a guest that doesn't support it (eg. rhel6)
no longer generates an error like it used to. Instead, it leaves the
memory around : only a subsequent reboot or manual use of drmgr within
the guest can complete the hot-unplug sequence. A flag was added to
SpaprMachineClass so that this new behavior only applies to the default
machine type.

We can do better. CAS processes all pending hot-unplug requests. This
means that we don't really care about what the guest supports if
the hot-unplug request happens before CAS.

All guests that we care for, even old ones, set enough bits in OV5
that lead to a non-empty bitmap in spapr->ov5_cas. Use that as a
heuristic to decide if CAS has already occured or not.

Always accept unplug requests that happen before CAS since CAS will
process them. Restore the previous behavior of rejecting them after
CAS when we know that the guest doesn't support memory hot-unplug.

This behavior is suitable for all machine types : this allows to
drop the pre_6_0_memory_unplug flag.

Fixes: 1e8b5b1aa16b ("spapr: Allow memory unplug to always succeed")
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c              |   24 +++++++++++++-----------
 hw/ppc/spapr_events.c       |    3 +--
 hw/ppc/spapr_ovec.c         |    7 +++++++
 include/hw/ppc/spapr.h      |    2 +-
 include/hw/ppc/spapr_ovec.h |    1 +
 5 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2c403b574e37..6c47466fc2f1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4048,6 +4048,18 @@ static void spapr_machine_device_unplug(HotplugHandl=
er *hotplug_dev,
     }
 }
=20
+bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr)
+{
+    return spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT) ||
+        /*
+         * CAS will process all pending unplug requests.
+         *
+         * HACK: a guest could theoretically have cleared all bits in OV5,
+         * but none of the guests we care for do.
+         */
+        spapr_ovec_empty(spapr->ov5_cas);
+}
+
 static void spapr_machine_device_unplug_request(HotplugHandler *hotplug_de=
v,
                                                 DeviceState *dev, Error **=
errp)
 {
@@ -4056,16 +4068,9 @@ static void spapr_machine_device_unplug_request(Hotp=
lugHandler *hotplug_dev,
     SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
=20
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-        if (!smc->pre_6_0_memory_unplug ||
-            spapr_ovec_test(sms->ov5_cas, OV5_HP_EVT)) {
+        if (spapr_memory_hot_unplug_supported(sms)) {
             spapr_memory_unplug_request(hotplug_dev, dev, errp);
         } else {
-            /* NOTE: this means there is a window after guest reset, prior=
 to
-             * CAS negotiation, where unplug requests will fail due to the
-             * capability not being detected yet. This is a bit different =
than
-             * the case with PCI unplug, where the events will be queued a=
nd
-             * eventually handled by the guest after boot
-             */
             error_setg(errp, "Memory hot unplug not supported for this gue=
st");
         }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_CPU_CORE)) {
@@ -4543,11 +4548,8 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
  */
 static void spapr_machine_5_2_class_options(MachineClass *mc)
 {
-    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
-
     spapr_machine_6_0_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
-    smc->pre_6_0_memory_unplug =3D true;
 }
=20
 DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 6aedd988b3d0..d51daedfa6e0 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -658,8 +658,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint=
8_t hp_action,
         /* we should not be using count_indexed value unless the guest
          * supports dedicated hotplug event source
          */
-        g_assert(!SPAPR_MACHINE_GET_CLASS(spapr)->pre_6_0_memory_unplug ||
-                 spapr_ovec_test(spapr->ov5_cas, OV5_HP_EVT));
+        g_assert(spapr_memory_hot_unplug_supported(spapr));
         hp->drc_id.count_indexed.count =3D
             cpu_to_be32(drc_id->count_indexed.count);
         hp->drc_id.count_indexed.index =3D
diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
index dd003f1763fd..b2567caa5cf4 100644
--- a/hw/ppc/spapr_ovec.c
+++ b/hw/ppc/spapr_ovec.c
@@ -125,6 +125,13 @@ bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr=
)
     return test_bit(bitnr, ov->bitmap) ? true : false;
 }
=20
+bool spapr_ovec_empty(SpaprOptionVector *ov)
+{
+    g_assert(ov);
+
+    return bitmap_empty(ov->bitmap, OV_MAXBITS);
+}
+
 static void guest_byte_to_bitmap(uint8_t entry, unsigned long *bitmap,
                                  long bitmap_offset)
 {
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 1cc19575f548..3ad2ff713279 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -142,7 +142,6 @@ struct SpaprMachineClass {
     hwaddr rma_limit;          /* clamp the RMA to this size */
     bool pre_5_1_assoc_refpoints;
     bool pre_5_2_numa_associativity;
-    bool pre_6_0_memory_unplug;
=20
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio,=20
@@ -950,4 +949,5 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwa=
ddr pagesize,
=20
 void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
 hwaddr spapr_get_rtas_addr(void);
+bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
 #endif /* HW_SPAPR_H */
diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
index d4dee9e06a01..48b716a060c2 100644
--- a/include/hw/ppc/spapr_ovec.h
+++ b/include/hw/ppc/spapr_ovec.h
@@ -71,6 +71,7 @@ void spapr_ovec_cleanup(SpaprOptionVector *ov);
 void spapr_ovec_set(SpaprOptionVector *ov, long bitnr);
 void spapr_ovec_clear(SpaprOptionVector *ov, long bitnr);
 bool spapr_ovec_test(SpaprOptionVector *ov, long bitnr);
+bool spapr_ovec_empty(SpaprOptionVector *ov);
 SpaprOptionVector *spapr_ovec_parse_vector(target_ulong table_addr, int ve=
ctor);
 int spapr_dt_ovec(void *fdt, int fdt_offset,
                   SpaprOptionVector *ov, const char *name);



