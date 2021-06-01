Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1FE396CD1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 07:30:48 +0200 (CEST)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnwzG-00016q-NN
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 01:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lnwy5-000070-4N
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lnwy2-0005mK-PH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 01:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622525368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7/lGE3Q3O38oapozsEntEQplElt+NleYNusY1XC20t4=;
 b=GkIXcz0ZFj9TvX8KOAVZGCF49Ad99M+AyFsaxs+jaKMfTRJE1IlEs54I+5+7Xt6hVwPTRe
 K364CgK/7R4j636kKl+eTLxdd83STeoAAsyd9kUCPh9+6Dv0bLi/cXVDo2SQV59DeyizHY
 nq8hZfAUZgcnMQMWqCNKyNUVFn9qwsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-bvQK2ZyhPt298fUpMSSKnQ-1; Tue, 01 Jun 2021 01:29:26 -0400
X-MC-Unique: bvQK2ZyhPt298fUpMSSKnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A653107ACC7;
 Tue,  1 Jun 2021 05:29:25 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-23.bne.redhat.com [10.64.54.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A84D360CCE;
 Tue,  1 Jun 2021 05:29:20 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Date: Tue,  1 Jun 2021 15:30:04 +0800
Message-Id: <20210601073004.106490-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We possibly populate empty nodes where memory isn't included and might
be hot added at late time. The FDT memory nodes can't be created due
to conflicts on their names if multiple empty nodes are specified.
For example, the VM fails to start with the following error messages.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
  -accel kvm -machine virt,gic-version=host                        \
  -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
  -object memory-backend-ram,id=mem0,size=512M                     \
  -object memory-backend-ram,id=mem1,size=512M                     \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
  -numa node,nodeid=2                                              \
  -numa node,nodeid=3                                              \
    :
  -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes

  qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
                       FDT_ERR_EXISTS

This fixes the issue by using NUMA node ID or zero in the memory node
name to avoid the conflicting memory node names. With this applied, the
VM can boot successfully with above command lines.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/boot.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index d7b059225e..3169bdf595 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
     char *nodename;
     int ret;
 
-    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+    if (numa_node_id >= 0) {
+        nodename = g_strdup_printf("/memory@%d", numa_node_id);
+    } else {
+        nodename = g_strdup("/memory@0");
+    }
+
     qemu_fdt_add_subnode(fdt, nodename);
     qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
     ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
-- 
2.23.0


