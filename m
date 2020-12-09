Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C172D47C8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:24:04 +0100 (CET)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3C7-0003tP-D0
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q6-0006bb-5z
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:18 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:42315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kn2q0-0000pm-Q1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:16 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-1bqiYXxoMeazFzYXYgunxQ-1; Wed, 09 Dec 2020 12:00:59 -0500
X-MC-Unique: 1bqiYXxoMeazFzYXYgunxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B445510054FF;
 Wed,  9 Dec 2020 17:00:58 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B47A05D6CF;
 Wed,  9 Dec 2020 17:00:57 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] spapr: Pass sPAPR machine state down to
 spapr_pci_switch_vga()
Date: Wed,  9 Dec 2020 18:00:49 +0100
Message-Id: <20201209170052.1431440-4-groug@kaod.org>
In-Reply-To: <20201209170052.1431440-1-groug@kaod.org>
References: <20201209170052.1431440-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
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

This allows to drop a user of qdev_get_machine().

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/ppc/spapr.h | 2 +-
 hw/ppc/spapr_hcall.c   | 7 ++++---
 hw/ppc/spapr_pci.c     | 3 +--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index b7ced9faebf5..e0f10f252c08 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -834,7 +834,7 @@ int spapr_dma_dt(void *fdt, int node_off, const char *p=
ropname,
                  uint32_t liobn, uint64_t window, uint32_t size);
 int spapr_tcet_dma_dt(void *fdt, int node_off, const char *propname,
                       SpaprTceTable *tcet);
-void spapr_pci_switch_vga(bool big_endian);
+void spapr_pci_switch_vga(SpaprMachineState *spapr, bool big_endian);
 void spapr_hotplug_req_add_by_index(SpaprDrc *drc);
 void spapr_hotplug_req_remove_by_index(SpaprDrc *drc);
 void spapr_hotplug_req_add_by_count(SpaprDrcType drc_type,
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 1d8e8e6a888f..c0ea0bd5794b 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1351,6 +1351,7 @@ static target_ulong h_logical_dcbf(PowerPCCPU *cpu, S=
paprMachineState *spapr,
 }
=20
 static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
+                                           SpaprMachineState *spapr,
                                            target_ulong mflags,
                                            target_ulong value1,
                                            target_ulong value2)
@@ -1365,12 +1366,12 @@ static target_ulong h_set_mode_resource_le(PowerPCC=
PU *cpu,
     switch (mflags) {
     case H_SET_MODE_ENDIAN_BIG:
         spapr_set_all_lpcrs(0, LPCR_ILE);
-        spapr_pci_switch_vga(true);
+        spapr_pci_switch_vga(spapr, true);
         return H_SUCCESS;
=20
     case H_SET_MODE_ENDIAN_LITTLE:
         spapr_set_all_lpcrs(LPCR_ILE, LPCR_ILE);
-        spapr_pci_switch_vga(false);
+        spapr_pci_switch_vga(spapr, false);
         return H_SUCCESS;
     }
=20
@@ -1411,7 +1412,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, Spapr=
MachineState *spapr,
=20
     switch (resource) {
     case H_SET_MODE_RESOURCE_LE:
-        ret =3D h_set_mode_resource_le(cpu, args[0], args[2], args[3]);
+        ret =3D h_set_mode_resource_le(cpu, spapr, args[0], args[2], args[=
3]);
         break;
     case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
         ret =3D h_set_mode_resource_addr_trans_mode(cpu, args[0],
diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 2d9b88b93122..149bf4c21d22 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -2490,9 +2490,8 @@ static int spapr_switch_one_vga(DeviceState *dev, voi=
d *opaque)
     return 0;
 }
=20
-void spapr_pci_switch_vga(bool big_endian)
+void spapr_pci_switch_vga(SpaprMachineState *spapr, bool big_endian)
 {
-    SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
     SpaprPhbState *sphb;
=20
     /*
--=20
2.26.2


