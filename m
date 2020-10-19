Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2632923F1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:52:59 +0200 (CEST)
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQuY-0008Vr-92
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUQqV-0004BL-M8
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:48:47 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:46608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUQqU-0002pl-5r
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:48:47 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-t-NR6bF1NKaOly_2ZnBqUw-1; Mon, 19 Oct 2020 04:48:38 -0400
X-MC-Unique: t-NR6bF1NKaOly_2ZnBqUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F678805F05;
 Mon, 19 Oct 2020 08:48:36 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CDDF672C6;
 Mon, 19 Oct 2020 08:48:28 +0000 (UTC)
Subject: [PATCH 3/5] spapr: Use appropriate getter for PC_DIMM_SLOT_PROP
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Mon, 19 Oct 2020 10:48:27 +0200
Message-ID: <160309730758.2739814.15821922745424652642.stgit@bahia.lan>
In-Reply-To: <160309727218.2739814.14722724927730985344.stgit@bahia.lan>
References: <160309727218.2739814.14722724927730985344.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 04:48:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PC_DIMM_SLOT_PROP property is defined as:

    DEFINE_PROP_INT32(PC_DIMM_SLOT_PROP, PCDIMMDevice, slot,
                      PC_DIMM_UNASSIGNED_SLOT),

Use object_property_get_int() instead of object_property_get_uint().
Since spapr_memory_plug() only gets called if pc_dimm_pre_plug()
succeeded, we expect to have a valid >=3D 0 slot number, either because
the user passed a valid slot number or because pc_dimm_get_free_slot()
picked one up for us.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 115fc52e3b06..1b173861152f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3433,7 +3433,8 @@ static void spapr_memory_plug(HotplugHandler *hotplug=
_dev, DeviceState *dev,
     Error *local_err =3D NULL;
     SpaprMachineState *ms =3D SPAPR_MACHINE(hotplug_dev);
     PCDIMMDevice *dimm =3D PC_DIMM(dev);
-    uint64_t size, addr, slot;
+    uint64_t size, addr;
+    int64_t slot;
     bool is_nvdimm =3D object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
=20
     size =3D memory_device_get_region_size(MEMORY_DEVICE(dev), &error_abor=
t);
@@ -3450,11 +3451,13 @@ static void spapr_memory_plug(HotplugHandler *hotpl=
ug_dev, DeviceState *dev,
                        spapr_ovec_test(ms->ov5_cas, OV5_HP_EVT),
                        &local_err);
     } else {
-        slot =3D object_property_get_uint(OBJECT(dimm),
-                                        PC_DIMM_SLOT_PROP, &local_err);
+        slot =3D object_property_get_int(OBJECT(dimm),
+                                       PC_DIMM_SLOT_PROP, &local_err);
         if (local_err) {
             goto out_unplug;
         }
+        /* We should have valid slot number at this point */
+        g_assert(slot >=3D 0);
         spapr_add_nvdimm(dev, slot, &local_err);
     }
=20



