Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C056615D411
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 09:50:09 +0100 (CET)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Wfo-0001Va-2V
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 03:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mprivozn@redhat.com>) id 1j2Wdm-0007Yv-JL
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:48:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mprivozn@redhat.com>) id 1j2Wdl-00042w-Dn
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:48:02 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24452
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mprivozn@redhat.com>) id 1j2Wdl-00042I-Aj
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 03:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581670080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bwu+4t0/HKzEP8pExfC2i6Q4uBXSErdypIyIiP5+nOo=;
 b=Ueu+Il/5fgI+Xwm6OmfV2TLOA5t7d9trE99hgGPD8XyZ4BH1Du4SdTNDymDphZnB3/orA9
 8a8Vxop2KO5pKANhZxLbOCvJci5nOJLX20XE8K3fv2hzwOzTy/ihMdqMWDrk1SMRNKWznw
 6Dk+zZP/+DJ/Fpq3AmDNYwp03JfXn7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-PQzo0OSRMDOKwEckNCSMlg-1; Fri, 14 Feb 2020 03:47:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A71B800D5A;
 Fri, 14 Feb 2020 08:47:55 +0000 (UTC)
Received: from moe.redhat.com (unknown [10.43.2.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135BB6031D;
 Fri, 14 Feb 2020 08:47:51 +0000 (UTC)
From: Michal Privoznik <mprivozn@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Report stringified errno in VFIO related errors
Date: Fri, 14 Feb 2020 09:47:39 +0100
Message-Id: <2dc5a0962a38b912e4fa4900f9813b7ea1a9273c.1581670009.git.mprivozn@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: PQzo0OSRMDOKwEckNCSMlg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In a few places we report errno formatted as a negative integer.
This is not as user friendly as it can be. Use strerror() and/or
error_setg_errno() instead.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
---
 hw/vfio/common.c    | 2 +-
 util/vfio-helpers.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5ca11488d6..a3a2a82d99 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -352,7 +352,7 @@ static int vfio_dma_map(VFIOContainer *container, hwadd=
r iova,
         return 0;
     }
=20
-    error_report("VFIO_MAP_DMA: %d", -errno);
+    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
     return -errno;
 }
=20
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 813f7ec564..ddd9a96e76 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -545,7 +545,7 @@ static int qemu_vfio_do_mapping(QEMUVFIOState *s, void =
*host, size_t size,
     trace_qemu_vfio_do_mapping(s, host, size, iova);
=20
     if (ioctl(s->container, VFIO_IOMMU_MAP_DMA, &dma_map)) {
-        error_report("VFIO_MAP_DMA: %d", -errno);
+        error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
         return -errno;
     }
     return 0;
@@ -570,7 +570,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IO=
VAMapping *mapping,
     assert(QEMU_IS_ALIGNED(mapping->size, qemu_real_host_page_size));
     assert(index >=3D 0 && index < s->nr_mappings);
     if (ioctl(s->container, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        error_setg(errp, "VFIO_UNMAP_DMA failed: %d", -errno);
+        error_setg_errno(errp, errno, "VFIO_UNMAP_DMA failed");
     }
     memmove(mapping, &s->mappings[index + 1],
             sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
@@ -669,7 +669,7 @@ int qemu_vfio_dma_reset_temporary(QEMUVFIOState *s)
     trace_qemu_vfio_dma_reset_temporary(s);
     qemu_mutex_lock(&s->lock);
     if (ioctl(s->container, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        error_report("VFIO_UNMAP_DMA: %d", -errno);
+        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
         qemu_mutex_unlock(&s->lock);
         return -errno;
     }
--=20
2.24.1


