Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3705D34A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:47:53 +0200 (CEST)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiL0a-0002Kr-Gj
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58574)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiKNj-0006fn-Ek
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiKNd-0000V8-SR
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52184)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiKNb-0000Rs-Ug
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:36 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8522B307D84B;
 Tue,  2 Jul 2019 15:07:33 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id F00FA702D8;
 Tue,  2 Jul 2019 15:07:29 +0000 (UTC)
Date: Tue, 2 Jul 2019 11:07:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190619094907.10131-6-pagupta@redhat.com>
References: <20190702150606.24851-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702150606.24851-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 02 Jul 2019 15:07:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/22] hmp: Handle virtio-pmem when printing
 memory device infos
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Print the memory device info just like for PCDIMM/NVDIMM.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20190619094907.10131-6-pagupta@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 monitor/hmp-cmds.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index c283dde0e9..1c97926432 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2653,6 +2653,7 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
     Error *err = NULL;
     MemoryDeviceInfoList *info_list = qmp_query_memory_devices(&err);
     MemoryDeviceInfoList *info;
+    VirtioPMEMDeviceInfo *vpi;
     MemoryDeviceInfo *value;
     PCDIMMDeviceInfo *di;
 
@@ -2662,19 +2663,9 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
         if (value) {
             switch (value->type) {
             case MEMORY_DEVICE_INFO_KIND_DIMM:
-                di = value->u.dimm.data;
-                break;
-
             case MEMORY_DEVICE_INFO_KIND_NVDIMM:
-                di = value->u.nvdimm.data;
-                break;
-
-            default:
-                di = NULL;
-                break;
-            }
-
-            if (di) {
+                di = value->type == MEMORY_DEVICE_INFO_KIND_DIMM ?
+                     value->u.dimm.data : value->u.nvdimm.data;
                 monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
                                MemoryDeviceInfoKind_str(value->type),
                                di->id ? di->id : "");
@@ -2687,6 +2678,18 @@ void hmp_info_memory_devices(Monitor *mon, const QDict *qdict)
                                di->hotplugged ? "true" : "false");
                 monitor_printf(mon, "  hotpluggable: %s\n",
                                di->hotpluggable ? "true" : "false");
+                break;
+            case MEMORY_DEVICE_INFO_KIND_VIRTIO_PMEM:
+                vpi = value->u.virtio_pmem.data;
+                monitor_printf(mon, "Memory device [%s]: \"%s\"\n",
+                               MemoryDeviceInfoKind_str(value->type),
+                               vpi->id ? vpi->id : "");
+                monitor_printf(mon, "  memaddr: 0x%" PRIx64 "\n", vpi->memaddr);
+                monitor_printf(mon, "  size: %" PRIu64 "\n", vpi->size);
+                monitor_printf(mon, "  memdev: %s\n", vpi->memdev);
+                break;
+            default:
+                g_assert_not_reached();
             }
         }
     }
-- 
MST


