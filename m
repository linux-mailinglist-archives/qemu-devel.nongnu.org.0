Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2401F8EAC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 12:35:35 +0100 (CET)
Received: from localhost ([::1]:33634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUUSM-0001X9-KV
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 06:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iUUP2-0007GB-75
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 06:32:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iUUOy-00019W-9I
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 06:32:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30617
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iUUOw-00018Q-8q
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 06:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573558321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYXVAdmI2Yij9l24SfYiKOe4TibLH70qfactyLGf88g=;
 b=CQJEUXGYsL/u85Qyvy8PpMvjCY2PjYcLWo1F9vjB3tv20pt4Y2ww1RIsraEmvUi9rNaPd7
 CvHsViecLl2alz3NhJnAkVG7xzHEq4vn/VMjrbDfQlgjIWrDK1hPQm++hI4WihmvzVpuQZ
 BVVHsXq6OmhAEcg7GV62de6Uf5rsmpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-0C_wC0neN52SLwaMzv8S3w-1; Tue, 12 Nov 2019 06:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB711800D7A;
 Tue, 12 Nov 2019 11:30:42 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D227660600;
 Tue, 12 Nov 2019 11:30:31 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] blockdev: change qmp_blockdev_backup to make use of
 transactions
Date: Tue, 12 Nov 2019 12:30:11 +0100
Message-Id: <20191112113012.71136-8-slp@redhat.com>
In-Reply-To: <20191112113012.71136-1-slp@redhat.com>
References: <20191112113012.71136-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0C_wC0neN52SLwaMzv8S3w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change qmp_blockdev_backup() to create and start a transaction instead
of calling do_blockdev_backup() directly.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 blockdev.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index f94aaa98f0..152a0f7454 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3689,13 +3689,13 @@ XDbgBlockGraph *qmp_x_debug_query_block_graph(Error=
 **errp)
     return bdrv_get_xdbg_block_graph(errp);
 }
=20
-void qmp_blockdev_backup(BlockdevBackup *arg, Error **errp)
+void qmp_blockdev_backup(BlockdevBackup *backup, Error **errp)
 {
-    BlockJob *job;
-    job =3D do_blockdev_backup(arg, NULL, errp);
-    if (job) {
-        job_start(&job->job);
-    }
+    TransactionAction action =3D {
+        .type =3D TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP,
+        .u.blockdev_backup.data =3D backup,
+    };
+    blockdev_do_action(&action, errp);
 }
=20
 /* Parameter check and block job starting for drive mirroring.
--=20
2.23.0


