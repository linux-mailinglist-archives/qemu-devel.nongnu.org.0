Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B31D4894
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 21:41:00 +0200 (CEST)
Received: from localhost ([::1]:56396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ0mZ-0002Hy-6n
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 15:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Py-0000wc-Q2
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0Px-00045D-Jn
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50860)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iJ0Px-00044Z-9J
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C5B9309BDA3;
 Fri, 11 Oct 2019 19:17:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-210.ams2.redhat.com
 [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54A8066A01;
 Fri, 11 Oct 2019 19:17:35 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, eric.auger@redhat.com,
 richardw.yang@linux.intel.com
Subject: [PULL 19/21] migration/multifd: initialize packet->magic/version once
 at setup stage
Date: Fri, 11 Oct 2019 20:16:44 +0100
Message-Id: <20191011191646.226814-20-dgilbert@redhat.com>
In-Reply-To: <20191011191646.226814-1-dgilbert@redhat.com>
References: <20191011191646.226814-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 11 Oct 2019 19:17:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

MultiFDPacket_t's magic and version field never changes during
migration, so move these two fields in setup stage.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20191011085050.17622-4-richardw.yang@linux.intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 84c5953a84..963e795ed0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -793,8 +793,6 @@ static void multifd_send_fill_packet(MultiFDSendParam=
s *p)
     MultiFDPacket_t *packet =3D p->packet;
     int i;
=20
-    packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
-    packet->version =3D cpu_to_be32(MULTIFD_VERSION);
     packet->flags =3D cpu_to_be32(p->flags);
     packet->pages_alloc =3D cpu_to_be32(p->pages->allocated);
     packet->pages_used =3D cpu_to_be32(p->pages->used);
@@ -1240,6 +1238,8 @@ int multifd_save_setup(void)
         p->packet_len =3D sizeof(MultiFDPacket_t)
                       + sizeof(ram_addr_t) * page_count;
         p->packet =3D g_malloc0(p->packet_len);
+        p->packet->magic =3D cpu_to_be32(MULTIFD_MAGIC);
+        p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);
         p->name =3D g_strdup_printf("multifdsend_%d", i);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
--=20
2.23.0


