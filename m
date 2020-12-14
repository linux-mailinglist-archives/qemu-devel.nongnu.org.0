Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FB62D9746
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:21:08 +0100 (CET)
Received: from localhost ([::1]:33416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolud-0007qh-P8
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1koltd-0006pQ-UX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:20:05 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:57294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1koltc-0000B5-Br
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:20:05 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-HMpIoKg1OjeqJd93EEQkOQ-1; Mon, 14 Dec 2020 06:19:58 -0500
X-MC-Unique: HMpIoKg1OjeqJd93EEQkOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A16D0800D53;
 Mon, 14 Dec 2020 11:19:57 +0000 (UTC)
Received: from bahia.lan (ovpn-114-254.ams2.redhat.com [10.36.114.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E1021002388;
 Mon, 14 Dec 2020 11:19:56 +0000 (UTC)
Subject: [PATCH] spapr: Fix DR properties of the root node
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Dec 2020 12:19:55 +0100
Message-ID: <160794479566.35245.17809158217760761558.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Section 13.5.2 of LoPAPR mandates various DR related indentifiers
for all hot-pluggable entities to be exposed in the "ibm,drc-indexes",
"ibm,drc-power-domains", "ibm,drc-names" and "ibm,drc-types" properties
of their parent node. These properties are created with spapr_dt_drc().

PHBs and LMBs are both children of the machine. Their DR identifiers
are thus supposed to be exposed in the afore mentioned properties of
the root node.

When PHB hot-plug support was added, an extra call to spapr_dt_drc()
was introduced: this overwrites the existing properties, previously
populated with the LMB identifiers, and they end up containing only
PHB identifiers. This went unseen so far because linux doesn't care,
but this is still not conformant with LoPAPR.

Fortunately spapr_dt_drc() is able to handle multiple DR entity types
at the same time. Use that to handle DR indentifiers for PHBs and LMBs
with a single call to spapr_dt_drc(). While here also account for PMEM
DR identifiers, which were forgotten when NVDIMM hot-plug support was
added. Also add an assert to prevent further misuse of spapr_dt_drc().

With -m 1G,maxmem=3D2G,slots=3D8 passed on the QEMU command line we get:

Without this patch:

/proc/device-tree/ibm,drc-indexes
=09=09 0000001f 20000001 20000002 20000003
=09=09 20000000 20000005 20000006 20000007
=09=09 20000004 20000009 20000008 20000010
=09=09 20000011 20000012 20000013 20000014
=09=09 20000015 20000016 20000017 20000018
=09=09 20000019 2000000a 2000000b 2000000c
=09=09 2000000d 2000000e 2000000f 2000001a
=09=09 2000001b 2000001c 2000001d 2000001e

These are the DRC indexes for the 31 possible PHBs.

With this patch:

/proc/device-tree/ibm,drc-indexes
=09=09 0000002b 90000000 90000001 90000002
=09=09 90000003 90000004 90000005 90000006
=09=09 90000007 20000001 20000002 20000003
=09=09 20000000 20000005 20000006 20000007
=09=09 20000004 20000009 20000008 20000010
=09=09 20000011 20000012 20000013 20000014
=09=09 20000015 20000016 20000017 20000018
=09=09 20000019 2000000a 2000000b 2000000c
=09=09 2000000d 2000000e 2000000f 2000001a
=09=09 2000001b 2000001c 2000001d 2000001e
=09=09 80000004 80000005 80000006 80000007

And now we also have the 4 ((2G - 1G) / 256M) LMBs and the
8 (slots) PMEMs.

Fixes: 3998ccd09298 ("spapr: populate PHB DRC entries for root DT node")
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c     |   21 ++++++++++++---------
 hw/ppc/spapr_drc.c |    6 ++++++
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 16d42ba7a937..b2f9896c8bed 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1119,6 +1119,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool =
reset, size_t space)
     MachineState *machine =3D MACHINE(spapr);
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
+    uint32_t root_drc_type_mask =3D 0;
     int ret;
     void *fdt;
     SpaprPhbState *phb;
@@ -1193,8 +1194,18 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool=
 reset, size_t space)
=20
     spapr_dt_cpus(fdt, spapr);
=20
+    /* ibm,drc-indexes and friends */
     if (smc->dr_lmb_enabled) {
-        _FDT(spapr_dt_drc(fdt, 0, NULL, SPAPR_DR_CONNECTOR_TYPE_LMB));
+        root_drc_type_mask |=3D SPAPR_DR_CONNECTOR_TYPE_LMB;
+    }
+    if (smc->dr_phb_enabled) {
+        root_drc_type_mask |=3D SPAPR_DR_CONNECTOR_TYPE_PHB;
+    }
+    if (mc->nvdimm_supported) {
+        root_drc_type_mask |=3D SPAPR_DR_CONNECTOR_TYPE_PMEM;
+    }
+    if (root_drc_type_mask) {
+        _FDT(spapr_dt_drc(fdt, 0, NULL, root_drc_type_mask));
     }
=20
     if (mc->has_hotpluggable_cpus) {
@@ -1232,14 +1243,6 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool=
 reset, size_t space)
         }
     }
=20
-    if (smc->dr_phb_enabled) {
-        ret =3D spapr_dt_drc(fdt, 0, NULL, SPAPR_DR_CONNECTOR_TYPE_PHB);
-        if (ret < 0) {
-            error_report("Couldn't set up PHB DR device tree properties");
-            exit(1);
-        }
-    }
-
     /* NVDIMM devices */
     if (mc->nvdimm_supported) {
         spapr_dt_persistent_memory(spapr, fdt);
diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index f991cf89a08a..fc7e321fcdf6 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -832,6 +832,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner,=
 uint32_t drc_type_mask)
     GString *drc_names, *drc_types;
     int ret;
=20
+    /*
+     * This should really be only called once per node since it overwrites
+     * the OF properties if they already exist.
+     */
+    g_assert(!fdt_get_property(fdt, offset, "ibm,drc-indexes", NULL));
+
     /* the first entry of each properties is a 32-bit integer encoding
      * the number of elements in the array. we won't know this until
      * we complete the iteration through all the matching DRCs, but



