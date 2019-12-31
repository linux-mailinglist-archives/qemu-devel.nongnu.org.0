Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F612D8F0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Dec 2019 14:21:17 +0100 (CET)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imHSW-0000Ym-3P
	for lists+qemu-devel@lfdr.de; Tue, 31 Dec 2019 08:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1imHC3-0005OT-25
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1imHC1-00031m-PQ
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47572)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1imHC1-0002yK-Hl
 for qemu-devel@nongnu.org; Tue, 31 Dec 2019 08:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577797453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6dKx2tmc0F5/ADsZ61KIwjXwMVRPeQJ0LUttbF8Psc=;
 b=HP7xtaCTZ4HA96B0iWzi1QugmkIrN2NwYyr+4t2DgpPovgdUq12ip+DTfxHD7nsbpuejm4
 MleDOqciJMNive/YolxAYJ+6xFmHwI0lPZd3/4+eE0B/HPZFy7DGieRIHdXAaCdVI5hrCu
 Vg7lMF/SFfS+yKaIujvVpuNXuzqZoaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-688ZpDg5OI-VylyLDIBzSw-1; Tue, 31 Dec 2019 08:04:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50A6410054E3
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7F6F78E96
 for <qemu-devel@nongnu.org>; Tue, 31 Dec 2019 13:04:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/86] arm:mps2: use memdev for RAM
Date: Tue, 31 Dec 2019 14:03:09 +0100
Message-Id: <1577797450-88458-26-git-send-email-imammedo@redhat.com>
In-Reply-To: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 688ZpDg5OI-VylyLDIBzSw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

PS:
 while at it add check for user supplied RAM size and error
 out if it mismatches board expected value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/mps2.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index d002b12..930124d 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -55,7 +55,6 @@ typedef struct {
     MachineState parent;
=20
     ARMv7MState armv7m;
-    MemoryRegion psram;
     MemoryRegion ssram1;
     MemoryRegion ssram1_m;
     MemoryRegion ssram23;
@@ -118,6 +117,12 @@ static void mps2_common_init(MachineState *machine)
         exit(1);
     }
=20
+    if (machine->ram_size !=3D mc->default_ram_size) {
+        error_report("Invalid RAM size, should be %" PRIi64 " Bytes",
+                     mc->default_ram_size);
+        exit(EXIT_FAILURE);
+    }
+
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -146,9 +151,7 @@ static void mps2_common_init(MachineState *machine)
      * This is of no use for QEMU so we don't implement it (as if
      * zbt_boot_ctrl is always zero).
      */
-    memory_region_allocate_system_memory(&mms->psram,
-                                         NULL, "mps.ram", 16 * MiB);
-    memory_region_add_subregion(system_memory, 0x21000000, &mms->psram);
+    memory_region_add_subregion(system_memory, 0x21000000, machine->ram);
=20
     switch (mmc->fpga_type) {
     case FPGA_AN385:
@@ -338,6 +341,8 @@ static void mps2_class_init(ObjectClass *oc, void *data=
)
=20
     mc->init =3D mps2_common_init;
     mc->max_cpus =3D 1;
+    mc->default_ram_size =3D 16 * MiB;
+    mc->default_ram_id =3D "mps.ram";
 }
=20
 static void mps2_an385_class_init(ObjectClass *oc, void *data)
--=20
2.7.4


