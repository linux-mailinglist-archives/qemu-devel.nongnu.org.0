Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4861754E7
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 08:52:21 +0100 (CET)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8fsC-0008RB-H1
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 02:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j8fhk-00056L-GK
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j8fhj-0003qg-8c
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37136
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j8fhj-0003qW-53
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:41:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583134890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30CA7IrGHM4v2O7WQXzXM07+zf53bwhYkoctQZoaqcs=;
 b=K+YHOhe18tfsw6Fa9g36Ggm74uoeLOsR4v+hN3vvoj4PgezToAC50mAl1k9lV50iv2wgAw
 rMuYomWWE2fQCttwA1rQMNyR4jjjIRa3ocJkjRe0UfXqnAg7BnV6YVRJwUJlGDAcPo9BV1
 afGa54fI1EIo469HMahuZKOqF/H5ibk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-NfA8JnfzM-2aQVg6PdtQPA-1; Mon, 02 Mar 2020 02:41:28 -0500
X-MC-Unique: NfA8JnfzM-2aQVg6PdtQPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BB47DB61;
 Mon,  2 Mar 2020 07:41:27 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-58.pek2.redhat.com
 [10.72.12.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 455A360BF3;
 Mon,  2 Mar 2020 07:41:24 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 19/23] block/replication.c: Ignore requests after failover
Date: Mon,  2 Mar 2020 15:40:32 +0800
Message-Id: <1583134836-23991-20-git-send-email-jasowang@redhat.com>
In-Reply-To: <1583134836-23991-1-git-send-email-jasowang@redhat.com>
References: <1583134836-23991-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Jason Wang <jasowang@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

After failover the Secondary side of replication shouldn't change state, be=
cause
it now functions as our primary disk.

In replication_start, replication_do_checkpoint, replication_stop, ignore
the request if current state is BLOCK_REPLICATION_DONE (sucessful failover)=
 or
BLOCK_REPLICATION_FAILOVER (failover in progres i.e. currently merging acti=
ve
and hidden images into the base image).

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Acked-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 block/replication.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/block/replication.c b/block/replication.c
index d6681b6..413d954 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -450,6 +450,17 @@ static void replication_start(ReplicationState *rs, Re=
plicationMode mode,
     aio_context_acquire(aio_context);
     s =3D bs->opaque;
=20
+    if (s->stage =3D=3D BLOCK_REPLICATION_DONE ||
+        s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
+        /*
+         * This case happens when a secondary is promoted to primary.
+         * Ignore the request because the secondary side of replication
+         * doesn't have to do anything anymore.
+         */
+        aio_context_release(aio_context);
+        return;
+    }
+
     if (s->stage !=3D BLOCK_REPLICATION_NONE) {
         error_setg(errp, "Block replication is running or done");
         aio_context_release(aio_context);
@@ -574,6 +585,17 @@ static void replication_do_checkpoint(ReplicationState=
 *rs, Error **errp)
     aio_context_acquire(aio_context);
     s =3D bs->opaque;
=20
+    if (s->stage =3D=3D BLOCK_REPLICATION_DONE ||
+        s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
+        /*
+         * This case happens when a secondary was promoted to primary.
+         * Ignore the request because the secondary side of replication
+         * doesn't have to do anything anymore.
+         */
+        aio_context_release(aio_context);
+        return;
+    }
+
     if (s->mode =3D=3D REPLICATION_MODE_SECONDARY) {
         secondary_do_checkpoint(s, errp);
     }
@@ -590,7 +612,7 @@ static void replication_get_error(ReplicationState *rs,=
 Error **errp)
     aio_context_acquire(aio_context);
     s =3D bs->opaque;
=20
-    if (s->stage !=3D BLOCK_REPLICATION_RUNNING) {
+    if (s->stage =3D=3D BLOCK_REPLICATION_NONE) {
         error_setg(errp, "Block replication is not running");
         aio_context_release(aio_context);
         return;
@@ -632,6 +654,17 @@ static void replication_stop(ReplicationState *rs, boo=
l failover, Error **errp)
     aio_context_acquire(aio_context);
     s =3D bs->opaque;
=20
+    if (s->stage =3D=3D BLOCK_REPLICATION_DONE ||
+        s->stage =3D=3D BLOCK_REPLICATION_FAILOVER) {
+        /*
+         * This case happens when a secondary was promoted to primary.
+         * Ignore the request because the secondary side of replication
+         * doesn't have to do anything anymore.
+         */
+        aio_context_release(aio_context);
+        return;
+    }
+
     if (s->stage !=3D BLOCK_REPLICATION_RUNNING) {
         error_setg(errp, "Block replication is not running");
         aio_context_release(aio_context);
--=20
2.5.0


