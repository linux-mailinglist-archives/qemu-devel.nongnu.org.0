Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05021AFA1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 08:42:54 +0200 (CEST)
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtmkH-0003As-EI
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 02:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jtmjV-0002ln-P1
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 02:42:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31401
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1jtmjU-0000Mo-8B
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 02:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594363323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dGZDk5ix7kWt3UdNg4HMVyUJ00TOCk7aFAmsJBJ+7bA=;
 b=JEI4zsBS4Vl4bwpvU+XZ6s0ikdlBX46V/nPoGfN3wbT09c1Le3wauaG1/ooAY65kZzQOag
 fatNbHqDSUsp1oH34BPAJcWUNtHRvC+dtHA6LKAsAtBpUjMk6o73906r/3Lavn12Mp8cix
 TmhT1J/KyG4RFq3oz22HpLEsmWo8yvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-J0JvGhNfNviCY0A8suSCQQ-1; Fri, 10 Jul 2020 02:42:01 -0400
X-MC-Unique: J0JvGhNfNviCY0A8suSCQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00038108C309;
 Fri, 10 Jul 2020 06:41:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-227.pek2.redhat.com [10.72.12.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC6795F7D8;
 Fri, 10 Jul 2020 06:41:41 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	peter.maydell@linaro.org,
	jasowang@redhat.com
Subject: [PATCH] vhost-vdpa :Fix Coverity CID 1430270 / CID 1420267
Date: Fri, 10 Jul 2020 14:41:30 +0800
Message-Id: <20200710064130.22838-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 23:35:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mhabets@solarflare.com, qemu-devel@nongnu.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 kevin.tian@intel.com, parav@mellanox.com, vmireyno@marvell.com,
 cunming.liang@intel.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 ian@iankelling.org, aadam@redhat.com, rdunlap@infradead.org,
 maxime.coquelin@redhat.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the function聽vhost_vdpa_dma_map/unmap, The聽struct msg聽was not聽initialized all its fields.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index a3d17fe0f9..b9265f3761 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -38,7 +38,7 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
                               void *vaddr, bool readonly)
 {
-    struct vhost_msg_v2 msg;
+    struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
     int ret = 0;
 
@@ -61,7 +61,7 @@ static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
 static int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova,
                                 hwaddr size)
 {
-    struct vhost_msg_v2 msg;
+    struct vhost_msg_v2 msg = {};
     int fd = v->device_fd;
     int ret = 0;
 
-- 
2.21.1


