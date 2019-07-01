Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96426167
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTO9Y-0001Jr-7V
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:07:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTO6v-0008E8-Oo
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTO10-0005F2-Fk
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:58:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59138)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hTO10-0005Ed-Ae
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:58:30 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 964ED811BD
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 09:58:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 301AB60FB1;
	Wed, 22 May 2019 09:58:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 13222A200; Wed, 22 May 2019 11:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 11:58:19 +0200
Message-Id: <20190522095821.15240-2-kraxel@redhat.com>
In-Reply-To: <20190522095821.15240-1-kraxel@redhat.com>
References: <20190522095821.15240-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 22 May 2019 09:58:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/3] console: add dmabuf modifier field.
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

dmabufs can have a format modifier (DRM_FORMAT_MOD_*) which is used for
tiled layouts for example.  Add a field to QemuDmaBuf so we can carry
around that information.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index fef900db76a5..f9816968487c 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -175,6 +175,7 @@ typedef struct QemuDmaBuf {
     uint32_t  height;
     uint32_t  stride;
     uint32_t  fourcc;
+    uint64_t  modifier;
     uint32_t  texture;
     bool      y0_top;
 } QemuDmaBuf;
-- 
2.18.1


