Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC81B2439
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 18:38:11 +0200 (CEST)
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8oaI-0005C0-Nj
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 12:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i8oXY-0002II-KC
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 12:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i8oXX-0001ob-PX
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 12:35:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59418)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i8oXX-0001nz-Kb
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 12:35:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F33B0307D847
 for <qemu-devel@nongnu.org>; Fri, 13 Sep 2019 16:35:18 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 644B460CC0;
 Fri, 13 Sep 2019 16:35:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	quintela@redhat.com,
	peterx@redhat.com
Date: Fri, 13 Sep 2019 17:35:06 +0100
Message-Id: <20190913163507.1403-2-dgilbert@redhat.com>
In-Reply-To: <20190913163507.1403-1-dgilbert@redhat.com>
References: <20190913163507.1403-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 13 Sep 2019 16:35:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] migration/rdma: Don't moan about
 disconnects at the end
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

If we've already finished the migration or something has
already gone wrong, don't moan about the migration stream disconnecting.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 78e6b72bac..0fcf02f48e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3253,10 +3253,14 @@ static void rdma_cm_poll_handler(void *opaque)
=20
     if (cm_event->event =3D=3D RDMA_CM_EVENT_DISCONNECTED ||
         cm_event->event =3D=3D RDMA_CM_EVENT_DEVICE_REMOVAL) {
-        error_report("receive cm event, cm event is %d", cm_event->event=
);
-        rdma->error_state =3D -EPIPE;
-        if (rdma->return_path) {
-            rdma->return_path->error_state =3D -EPIPE;
+        if (!rdma->error_state &&
+            migration_incoming_get_current()->state !=3D
+              MIGRATION_STATUS_COMPLETED) {
+            error_report("receive cm event, cm event is %d", cm_event->e=
vent);
+            rdma->error_state =3D -EPIPE;
+            if (rdma->return_path) {
+                rdma->return_path->error_state =3D -EPIPE;
+            }
         }
=20
         if (mis->migration_incoming_co) {
--=20
2.21.0


