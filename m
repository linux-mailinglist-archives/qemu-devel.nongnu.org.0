Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B4876523
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 14:07:37 +0200 (CEST)
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqz0Y-0002jk-D3
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 08:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58677)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hqyyy-0005W6-Un
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:06:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hqyys-000850-Ch
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:05:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55109)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hqyyr-0007y6-N2
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:05:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B418181F35;
 Fri, 26 Jul 2019 12:05:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-30.ams2.redhat.com
 [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54D331001B14;
 Fri, 26 Jul 2019 12:05:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C0E7114641B; Fri, 26 Jul 2019 14:05:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 14:05:39 +0200
Message-Id: <20190726120542.9894-26-armbru@redhat.com>
In-Reply-To: <20190726120542.9894-1-armbru@redhat.com>
References: <20190726120542.9894-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 26 Jul 2019 12:05:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 25/28] numa: Move remaining NUMA declarations
 from sysemu.h to numa.h
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit e35704ba9c "numa: Move NUMA declarations from sysemu.h to
numa.h" left a few NUMA-related macros behind.  Move them now.

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 exec.c                   | 2 +-
 hw/core/numa.c           | 1 +
 hw/mem/pc-dimm.c         | 1 +
 hw/pci/pci.c             | 2 +-
 hw/ppc/spapr.c           | 1 +
 include/sysemu/hostmem.h | 2 +-
 include/sysemu/numa.h    | 9 +++++++--
 include/sysemu/sysemu.h  | 7 -------
 8 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/exec.c b/exec.c
index 4d9e146c79..f0ac29aa26 100644
--- a/exec.c
+++ b/exec.c
@@ -45,7 +45,7 @@
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "sysemu/dma.h"
-#include "sysemu/numa.h"
+#include "sysemu/hostmem.h"
 #include "sysemu/hw_accel.h"
 #include "exec/address-spaces.h"
 #include "sysemu/xen-mapcache.h"
diff --git a/hw/core/numa.c b/hw/core/numa.c
index d817f06ead..450c522dd8 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "sysemu/hostmem.h"
 #include "sysemu/numa.h"
 #include "exec/cpu-common.h"
 #include "exec/ramlist.h"
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index fa90d4fc6c..938706d5a7 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
+#include "sysemu/hostmem.h"
 #include "sysemu/numa.h"
 #include "trace.h"
=20
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 9001b81daa..4b6ffab13d 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -34,7 +34,7 @@
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
 #include "net/net.h"
-#include "sysemu/sysemu.h"
+#include "sysemu/numa.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/range.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 06d23a5004..4044e61a0c 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/hostmem.h"
 #include "sysemu/numa.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index afeb5db1b1..4dbdadd39e 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -13,7 +13,7 @@
 #ifndef SYSEMU_HOSTMEM_H
 #define SYSEMU_HOSTMEM_H
=20
-#include "sysemu/sysemu.h" /* for MAX_NODES */
+#include "sysemu/numa.h"
 #include "qapi/qapi-types-machine.h"
 #include "qom/object.h"
 #include "exec/memory.h"
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 4c4c1dee9b..7a4ce89765 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -2,13 +2,18 @@
 #define SYSEMU_NUMA_H
=20
 #include "qemu/bitmap.h"
-#include "sysemu/sysemu.h"
-#include "sysemu/hostmem.h"
 #include "qapi/qapi-types-machine.h"
 #include "exec/cpu-common.h"
=20
 struct CPUArchId;
=20
+#define MAX_NODES 128
+#define NUMA_NODE_UNASSIGNED MAX_NODES
+#define NUMA_DISTANCE_MIN         10
+#define NUMA_DISTANCE_DEFAULT     20
+#define NUMA_DISTANCE_MAX         254
+#define NUMA_DISTANCE_UNREACHABLE 255
+
 extern int nb_numa_nodes;   /* Number of NUMA nodes */
 extern bool have_numa_distance;
=20
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index ac18a1184a..227202999d 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -117,13 +117,6 @@ extern QEMUClockType rtc_clock;
 extern const char *mem_path;
 extern int mem_prealloc;
=20
-#define MAX_NODES 128
-#define NUMA_NODE_UNASSIGNED MAX_NODES
-#define NUMA_DISTANCE_MIN         10
-#define NUMA_DISTANCE_DEFAULT     20
-#define NUMA_DISTANCE_MAX         254
-#define NUMA_DISTANCE_UNREACHABLE 255
-
 #define MAX_OPTION_ROMS 16
 typedef struct QEMUOptionRom {
     const char *name;
--=20
2.21.0


