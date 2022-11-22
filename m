Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC4633F85
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUew-0005aw-W3; Tue, 22 Nov 2022 09:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oxUeu-0005aV-QG
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oxUet-0007t0-0v
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:54:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669128837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wEYkjL7rLm+21/b6MXcJkp0xV7XKySABioC3C+j+vTY=;
 b=PV3sHJzGTvSYiUE3QUlSbhSe76C0iB8x0GYqDvvTHs2xNDM4QJ818rfg/BEpAt7W+R1JK5
 dN2Cx2J6x+TRckymPji7NKau/L2JuoM84TE1VR41Ba+H/16+NebIZkxoHYIS8TZD+FNXhR
 MK3Q5aRcB/F9VeUNsetvCGZ0nn2DUlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-CwAaisoWNM6kELe6jQHUIw-1; Tue, 22 Nov 2022 09:53:55 -0500
X-MC-Unique: CwAaisoWNM6kELe6jQHUIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE68885A588
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 14:53:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04EF5C1908C;
 Tue, 22 Nov 2022 14:53:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: eperezma@redhat.com, eric.auger@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] vhost-vdpa: skip TPM CRB memory section
Date: Tue, 22 Nov 2022 18:53:49 +0400
Message-Id: <20221122145349.86072-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
warning") removed the warning on vfio_listener_region_add() path.

An error is reported for vhost-vdpa case:
qemu-kvm: vhost_vdpa_listener_region_add received unaligned region

Skip the CRB device.

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=2141965

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..9d7206e4b8 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -19,6 +19,7 @@
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/vhost-shadow-virtqueue.h"
 #include "hw/virtio/vhost-vdpa.h"
+#include "sysemu/tpm.h"
 #include "exec/address-spaces.h"
 #include "migration/blocker.h"
 #include "qemu/cutils.h"
@@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
 {
     Int128 llend;
 
+    if (TPM_IS_CRB(section->mr->owner)) {
+        /* The CRB command buffer has its base address unaligned. */
+        return true;
+    }
+
     if ((!memory_region_is_ram(section->mr) &&
          !memory_region_is_iommu(section->mr)) ||
         memory_region_is_protected(section->mr) ||
-- 
2.38.1


