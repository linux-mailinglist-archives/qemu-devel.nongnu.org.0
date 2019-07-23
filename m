Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72D71C88
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 18:09:22 +0200 (CEST)
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpxLu-0008BR-0I
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 12:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56948)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hpxLi-0007nC-P1
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 12:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hpxLh-00065c-ST
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 12:09:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45021)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hpxLh-00065J-Nb
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 12:09:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB50630BA078;
 Tue, 23 Jul 2019 16:09:08 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A572019D71;
 Tue, 23 Jul 2019 16:09:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 12:08:59 -0400
Message-Id: <20190723160859.27250-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 23 Jul 2019 16:09:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] pc-dimm: fix crash when invalid slot number is
 used
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
Cc: david@gibson.dropbear.id.au, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU will crash with:
  Segmentation fault (core dumped)
when negative slot number is used, ex:
  qemu-system-x86_64 -m 1G,maxmem=20G,slots=256 \
      -object memory-backend-ram,id=mem1,size=1G \
      -device pc-dimm,id=dimm1,memdev=mem1,slot=-2

fix it by checking that slot number is within valid range.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/mem/pc-dimm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index b1239fd0d3..29c785799c 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -38,6 +38,13 @@ void pc_dimm_pre_plug(PCDIMMDevice *dimm, MachineState *machine,
 
     slot = object_property_get_int(OBJECT(dimm), PC_DIMM_SLOT_PROP,
                                    &error_abort);
+    if ((slot < 0 || slot >= machine->ram_slots) &&
+         slot != PC_DIMM_UNASSIGNED_SLOT) {
+        error_setg(&local_err, "invalid slot number, valid range is [0-%"
+                   PRIu64 "]", machine->ram_slots - 1);
+        goto out;
+    }
+
     slot = pc_dimm_get_free_slot(slot == PC_DIMM_UNASSIGNED_SLOT ? NULL : &slot,
                                  machine->ram_slots, &local_err);
     if (local_err) {
-- 
2.18.1


