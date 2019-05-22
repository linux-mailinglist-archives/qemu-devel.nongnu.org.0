Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A962526166
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:07:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTO9W-0001KB-Mq
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:07:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTO6u-0008E8-NW
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:04:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTO12-0005Gi-Ft
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:58:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47546)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hTO12-0005GJ-B1
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:58:32 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC0E13D953
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 09:58:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2FBA52855B;
	Wed, 22 May 2019 09:58:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1B512A205; Wed, 22 May 2019 11:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 11:58:20 +0200
Message-Id: <20190522095821.15240-3-kraxel@redhat.com>
In-Reply-To: <20190522095821.15240-1-kraxel@redhat.com>
References: <20190522095821.15240-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 22 May 2019 09:58:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 2/3] vfio/display: set dmabuf modifier field
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill the new QemuDmaBuf->modifier field properly from plane info.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/vfio/display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index a3d9c8f5beac..13969180b2dd 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -248,6 +248,7 @@ static VFIODMABuf *vfio_display_get_dmabuf(VFIOPCIDevice *vdev,
     dmabuf->buf.height = plane.height;
     dmabuf->buf.stride = plane.stride;
     dmabuf->buf.fourcc = plane.drm_format;
+    dmabuf->buf.modifier = plane.drm_format_mod;
     dmabuf->buf.fd     = fd;
     if (plane_type == DRM_PLANE_TYPE_CURSOR) {
         vfio_display_update_cursor(dmabuf, &plane);
-- 
2.18.1


