Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF3594C4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 09:24:46 +0200 (CEST)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hglFW-00083S-4r
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 03:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47803)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hglEs-0007eu-IQ
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 03:24:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hglEr-0004Us-Ga
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 03:24:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46402)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hglEr-0004RI-A0
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 03:24:05 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6E09F308FBAC
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 07:24:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57D8C6013A;
 Fri, 28 Jun 2019 07:23:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB30811AA3; Fri, 28 Jun 2019 09:23:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 28 Jun 2019 09:23:57 +0200
Message-Id: <20190628072357.31782-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 28 Jun 2019 07:24:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] virtio-gpu: fix unmap in error path
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We land here in case not everything we've asked for could be mapped.
So unmap only the bytes which have actually been mapped.

Also we didn't access anything, so acces_len can be 0.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2b0f66b1d68d..475a018c027c 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1048,9 +1048,9 @@ static int virtio_gpu_load(QEMUFile *f, void *opaque, size_t size,
                 if (res->iov[i].iov_base) {
                     dma_memory_unmap(VIRTIO_DEVICE(g)->dma_as,
                                      res->iov[i].iov_base,
-                                     res->iov[i].iov_len,
+                                     len,
                                      DMA_DIRECTION_TO_DEVICE,
-                                     res->iov[i].iov_len);
+                                     0);
                 }
                 /* ...and the mappings for previous loop iterations */
                 res->iov_cnt = i;
-- 
2.18.1


