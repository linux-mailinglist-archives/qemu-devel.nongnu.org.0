Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733342D2EB5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:55:38 +0100 (CET)
Received: from localhost ([::1]:56516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfKz-0004Sj-8K
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kmfJD-0003ul-Jw
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:53:47 -0500
Received: from us-smtp-delivery-162.mimecast.com ([216.205.24.162]:56916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kmfJ9-0004tS-EM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 10:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com;
 s=mimecast20180716; t=1607442821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r73GKTt29gImGgtWQnItmpV7IWG2WGJZmlhlsZqEIg8=;
 b=Itd1aR7uVa5tB2YR1Xrk4k8pQ+WwV6KYOSbSpdtqpe6X/b5ZyEwZ8JDJb5ibqYF+m8hIxq
 D6GClcBV4L2H2kSrivvLCgJclAjSeH/8X5qw34+lDqBD3nMfV7/i3pxKHENOz+to7qZjnS
 HYJ2HPyk63rlyeUz4StK5rxrtHstjWY=
Received: from g2t4623.austin.hp.com (g2t4623.austin.hp.com [15.73.212.78])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-JVP0Wgg3NJScyiDhs-W5jQ-1; Tue, 08 Dec 2020 10:53:40 -0500
X-MC-Unique: JVP0Wgg3NJScyiDhs-W5jQ-1
Received: from g1t6215.austin.hpicorp.net (g1t6215.austin.hpicorp.net
 [15.67.1.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by g2t4623.austin.hp.com (Postfix) with ESMTPS id 4E712101;
 Tue,  8 Dec 2020 15:53:39 +0000 (UTC)
Received: from MCMILLAN13.auth.hpicorp.net (unknown [15.75.1.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by g1t6215.austin.hpicorp.net (Postfix) with ESMTPS id 08116B8;
 Tue,  8 Dec 2020 15:53:38 +0000 (UTC)
From: erich.mcmillan@hp.com
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, kraxel@redhat.com,
 Erich-McMillan <erich.mcmillan@hp.com>
Subject: [PATCH v7] hw/i386/pc: add max combined fw size as machine
 configuration option
Date: Tue,  8 Dec 2020 09:53:38 -0600
Message-Id: <20201208155338.14-1-erich.mcmillan@hp.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA62A171 smtp.mailfrom=erich.mcmillan@hp.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.162;
 envelope-from=erich.mcmillan@hp.com; helo=us-smtp-delivery-162.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Erich-McMillan <erich.mcmillan@hp.com>

At Hewlett Packard Inc. we have a need for increased fw size to enable test=
ing of our custom fw.

Rebase v6 patch to d73c46e4

Signed-off-by: Erich McMillan <erich.mcmillan@hp.com>
---=0D
=0D
Changes since v6:=0D
=0D
     Rebase v6 onto d73c46e4=0D

 hw/i386/pc.c         | 51 ++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_sysfw.c   | 15 +++----------
 include/hw/i386/pc.h |  2 ++
 3 files changed, 56 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 17b514d1da..7c83c13ff9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1582,6 +1582,50 @@ static void pc_machine_set_max_ram_below_4g(Object *=
obj, Visitor *v,
     pcms->max_ram_below_4g =3D value;
 }
=20
+static void pc_machine_get_max_fw_size(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    PCMachineState *pcms =3D PC_MACHINE(obj);
+    uint64_t value =3D pcms->max_fw_size;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    PCMachineState *pcms =3D PC_MACHINE(obj);
+    Error *error =3D NULL;
+    uint64_t value;
+
+    visit_type_size(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    /*
+    * We don't have a theoretically justifiable exact lower bound on the b=
ase
+    * address of any flash mapping. In practice, the IO-APIC MMIO range is
+    * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving =
free
+    * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to =
8MB in
+    * size.
+    */
+    if (value > 16 * MiB) {
+        error_setg(errp,
+                   "User specified max allowed firmware size %" PRIu64 " i=
s "
+                   "greater than 16MiB. If combined firwmare size exceeds =
"
+                   "16MiB the system may not boot, or experience intermitt=
ent"
+                   "stability issues.",
+                   value);
+        return;
+    }
+
+    pcms->max_fw_size =3D value;
+}
+
 static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms =3D PC_MACHINE(obj);
@@ -1597,6 +1641,7 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbus_enabled =3D true;
     pcms->sata_enabled =3D true;
     pcms->pit_enabled =3D true;
+    pcms->max_fw_size =3D 8 * MiB;
 #ifdef CONFIG_HPET
     pcms->hpet_enabled =3D true;
 #endif
@@ -1723,6 +1768,12 @@ static void pc_machine_class_init(ObjectClass *oc, v=
oid *data)
=20
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
+
+    object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
+        pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
+        NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
+        "Maximum combined firmware size");
 }
=20
 static const TypeInfo pc_machine_info =3D {
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index b6c0822fe3..f8bd3a8b85 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -39,15 +39,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
=20
-/*
- * We don't have a theoretically justifiable exact lower bound on the base
- * address of any flash mapping. In practice, the IO-APIC MMIO range is
- * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving fre=
e
- * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB=
 in
- * size.
- */
-#define FLASH_SIZE_LIMIT (8 * MiB)
-
 #define FLASH_SECTOR_SIZE 4096
=20
 static void pc_isa_bios_init(MemoryRegion *rom_memory,
@@ -140,7 +131,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcm=
s)
  * Stop at the first pcms->flash[0] lacking a block backend.
  * Set each flash's size from its block backend.  Fatal error if the
  * size isn't a non-zero multiple of 4KiB, or the total size exceeds
- * FLASH_SIZE_LIMIT.
+ * pcms->max_fw_size.
  *
  * If pcms->flash[0] has a block backend, its memory is passed to
  * pc_isa_bios_init().  Merging several flash devices for isa-bios is
@@ -182,10 +173,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
         }
         if ((hwaddr)size !=3D size
             || total_size > HWADDR_MAX - size
-            || total_size + size > FLASH_SIZE_LIMIT) {
+            || total_size + size > pcms->max_fw_size) {
             error_report("combined size of system firmware exceeds "
                          "%" PRIu64 " bytes",
-                         FLASH_SIZE_LIMIT);
+                         pcms->max_fw_size);
             exit(1);
         }
=20
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 911e460097..9f44decb65 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -44,6 +44,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    uint64_t max_fw_size;
=20
     /* NUMA information: */
     uint64_t numa_nodes;
@@ -60,6 +61,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
+#define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
=20
 /**
  * PCMachineClass:
--=20
2.25.1


