Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE46667D3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 09:37:01 +0200 (CEST)
Received: from localhost ([::1]:47200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlq71-0001KC-M0
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 03:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39077)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hlq6S-0007fT-N7
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hlq6R-0000ot-Ku
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40255)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hlq6R-0000oK-FV
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 50687C049589;
 Fri, 12 Jul 2019 07:36:21 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-201.sin2.redhat.com
 [10.67.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 082F3608AB;
 Fri, 12 Jul 2019 07:36:17 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: mst@redhat.com
Date: Fri, 12 Jul 2019 13:05:53 +0530
Message-Id: <20190712073554.21918-3-pagupta@redhat.com>
In-Reply-To: <20190712073554.21918-1-pagupta@redhat.com>
References: <20190712073554.21918-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 12 Jul 2019 07:36:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/3] virtio pmem: remove memdev null check
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
Cc: pagupta@redhat.com, peter.maydell@linaro.org, cohuck@redhat.com,
 qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity reports that when we're assigning vi->size we handle the 
"pmem->memdev is NULL" case; but we then pass it into 
object_get_canonical_path(), which unconditionally dereferences it
and will crash if it is NULL. If this pointer can be NULL then we
need to do something else here.

We are removing 'pmem->memdev' null check here as memdev will never
be null in this function.

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 hw/virtio/virtio-pmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index adbfb603ab..17c196d107 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -134,8 +134,8 @@ static void virtio_pmem_fill_device_info(const VirtIOPMEM *pmem,
                                          VirtioPMEMDeviceInfo *vi)
 {
     vi->memaddr = pmem->start;
-    vi->size = pmem->memdev ? memory_region_size(&pmem->memdev->mr) : 0;
-    vi->memdev = object_get_canonical_path(OBJECT(pmem->memdev));
+    vi->size    = memory_region_size(&pmem->memdev->mr);
+    vi->memdev  = object_get_canonical_path(OBJECT(pmem->memdev));
 }
 
 static MemoryRegion *virtio_pmem_get_memory_region(VirtIOPMEM *pmem,
-- 
2.14.5


