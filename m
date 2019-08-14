Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602928DC86
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 19:59:37 +0200 (CEST)
Received: from localhost ([::1]:34748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxxYe-0003CG-Fq
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 13:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38422)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hxxV7-0007yy-F3
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 13:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hxxV5-0005DR-Fc
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 13:55:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54174)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hxxV3-0005C6-Mm
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 13:55:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC1B16374E;
 Wed, 14 Aug 2019 17:55:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-212.ams2.redhat.com
 [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97AB6909EA;
 Wed, 14 Aug 2019 17:55:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	mst@redhat.com
Date: Wed, 14 Aug 2019 18:55:35 +0100
Message-Id: <20190814175535.2023-4-dgilbert@redhat.com>
In-Reply-To: <20190814175535.2023-1-dgilbert@redhat.com>
References: <20190814175535.2023-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 14 Aug 2019 17:55:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 3/3] vhost: Fix memory region section
 comparison
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
Cc: peter.maydell@linaro.org, maxime.coquelin@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Using memcmp to compare structures wasn't safe,
as I found out on ARM when I was getting falce miscompares.

Use the helper function for comparing the MRSs.

Fixes: ade6d081fc33948e56e6

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/vhost.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index bc899fc60e..2ef4bc720f 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -451,8 +451,13 @@ static void vhost_commit(MemoryListener *listener)
         changed =3D true;
     } else {
         /* Same size, lets check the contents */
-        changed =3D n_old_sections && memcmp(dev->mem_sections, old_sect=
ions,
-                         n_old_sections * sizeof(old_sections[0])) !=3D =
0;
+        for (int i =3D 0; i < n_old_sections; i++) {
+            if (!MemoryRegionSection_eq(&old_sections[i],
+                                        &dev->mem_sections[i])) {
+                changed =3D true;
+                break;
+            }
+        }
     }
=20
     trace_vhost_commit(dev->started, changed);
--=20
2.21.0


