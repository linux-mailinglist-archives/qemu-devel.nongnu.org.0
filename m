Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBD08BDA5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 17:48:57 +0200 (CEST)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxZ2f-0005tv-39
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 11:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hxZ0w-000461-8l
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 11:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hxZ0u-0002RV-7K
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 11:47:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35652)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hxZ0r-0002JF-Po
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 11:47:08 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B846019D335
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 15:47:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C7A080487;
 Tue, 13 Aug 2019 15:47:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9DEE7113644B; Tue, 13 Aug 2019 17:46:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Aug 2019 17:46:28 +0200
Message-Id: <20190813154653.20568-5-armbru@redhat.com>
In-Reply-To: <20190813154653.20568-1-armbru@redhat.com>
References: <20190813154653.20568-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 13 Aug 2019 15:47:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 04/29] memory: Fix type of
 IOMMUMemoryRegionClass member @parent_class
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TYPE_IOMMU_MEMORY_REGION is a direct subtype of TYPE_MEMORY_REGION.
Its instance struct is IOMMUMemoryRegion, and its first member is a
MemoryRegion.  Correct.  Its class struct is IOMMUMemoryRegionClass,
and its first member is a DeviceClass.  Wrong.  Messed up when commit
1221a474676 introduced the QOM type.  It even included hw/qdev-core.h
just for that.

TYPE_MEMORY_REGION doesn't bother to define a class struct.  This is
fine, it simply defaults to its super-type TYPE_OBJECT's class struct
ObjectClass.  Changing IOMMUMemoryRegionClass's first member's type to
ObjectClass would be a minimal fix, if a bit brittle: if
TYPE_MEMORY_REGION ever acquired own class struct, we'd have to update
IOMMUMemoryRegionClass to use it.

Fix it the clean and robust way instead: give TYPE_MEMORY_REGION its
own class struct MemoryRegionClass now, and use it for
IOMMUMemoryRegionClass's first member.

Revert the include of hw/qdev-core.h, and fix the few files that have
come to rely on it.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20190812052359.30071-5-armbru@redhat.com>
---
 hw/net/pcnet.h          |  1 +
 include/exec/memory.h   | 10 ++++++++--
 hw/display/vga-isa-mm.c |  1 +
 memory.c                |  1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/net/pcnet.h b/hw/net/pcnet.h
index 40831a7845..28d19a5c6f 100644
--- a/hw/net/pcnet.h
+++ b/hw/net/pcnet.h
@@ -8,6 +8,7 @@
 #define PCNET_LOOPTEST_NOCRC	2
=20
 #include "exec/memory.h"
+#include "hw/irq.h"
=20
 /* BUS CONFIGURATION REGISTERS */
 #define BCR_MSRDA    0
diff --git a/include/exec/memory.h b/include/exec/memory.h
index bb0961ddb9..d99eb25d2e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -20,12 +20,12 @@
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
 #include "exec/ramlist.h"
+#include "qemu/bswap.h"
 #include "qemu/queue.h"
 #include "qemu/int128.h"
 #include "qemu/notify.h"
 #include "qom/object.h"
 #include "qemu/rcu.h"
-#include "hw/qdev-core.h"
=20
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
=20
@@ -205,6 +205,12 @@ struct MemoryRegionOps {
     } impl;
 };
=20
+typedef struct MemoryRegionClass {
+    /* private */
+    ObjectClass parent_class;
+} MemoryRegionClass;
+
+
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD
 };
@@ -237,7 +243,7 @@ enum IOMMUMemoryRegionAttr {
  */
 typedef struct IOMMUMemoryRegionClass {
     /* private */
-    struct DeviceClass parent_class;
+    MemoryRegionClass parent_class;
=20
     /*
      * Return a TLB entry that contains a given address.
diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 215e649719..a790f69b6d 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
 #include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/display/vga.h"
diff --git a/memory.c b/memory.c
index 5d8c9a9234..09d9b254fd 100644
--- a/memory.c
+++ b/memory.c
@@ -3245,6 +3245,7 @@ void memory_region_init_rom_device(MemoryRegion *mr=
,
 static const TypeInfo memory_region_info =3D {
     .parent             =3D TYPE_OBJECT,
     .name               =3D TYPE_MEMORY_REGION,
+    .class_size         =3D sizeof(MemoryRegionClass),
     .instance_size      =3D sizeof(MemoryRegion),
     .instance_init      =3D memory_region_initfn,
     .instance_finalize  =3D memory_region_finalize,
--=20
2.21.0


