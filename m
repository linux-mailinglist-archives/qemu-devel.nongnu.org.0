Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ECE9599A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 10:30:34 +0200 (CEST)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzzXG-0006Cc-0o
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 04:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54419)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1hzzST-0000bA-8g
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:25:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hzzSS-0004vA-Al
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 04:25:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36250)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>)
 id 1hzzSQ-0004tD-5U; Tue, 20 Aug 2019 04:25:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7045C18B3D84;
 Tue, 20 Aug 2019 08:25:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 729339F7C;
 Tue, 20 Aug 2019 08:25:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 10:24:59 +0200
Message-Id: <20190820082459.2101-6-quintela@redhat.com>
In-Reply-To: <20190820082459.2101-1-quintela@redhat.com>
References: <20190820082459.2101-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 20 Aug 2019 08:25:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 5/5] multifd: Use number of channels as
 listen backlog
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/socket.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/migration/socket.c b/migration/socket.c
index e63f5e1612..97c9efde59 100644
--- a/migration/socket.c
+++ b/migration/socket.c
@@ -178,10 +178,15 @@ static void socket_start_incoming_migration(SocketA=
ddress *saddr,
 {
     QIONetListener *listener =3D qio_net_listener_new();
     size_t i;
+    int num =3D 1;
=20
     qio_net_listener_set_name(listener, "migration-socket-listener");
=20
-    if (qio_net_listener_open_sync(listener, saddr, 1, errp) < 0) {
+    if (migrate_use_multifd()) {
+        num =3D migrate_multifd_channels();
+    }
+
+    if (qio_net_listener_open_sync(listener, saddr, num, errp) < 0) {
         object_unref(OBJECT(listener));
         return;
     }
--=20
2.21.0


