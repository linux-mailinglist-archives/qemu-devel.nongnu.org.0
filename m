Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA501A0F1F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 16:27:57 +0200 (CEST)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLpCm-0001o2-U6
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 10:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jLpBa-0000Kb-85
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:26:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jLpBZ-0006tJ-5h
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:26:42 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41011
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jLpBZ-0006t0-1Y
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 10:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586269600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xxkNIPUSk68oKmOyRdypuozHb+nsPqyvaf9O6pCNozU=;
 b=e9WDcjXE1tY1tSMAuqNtUCO7wXrGXsLVLG7cpEjuKX8nQMMO5VcH6JSSr0nP62HsBWwy1G
 IZwnNWK9Q8WzBCYVE3UyaXDRby5EDUFlUr8QmTknHUKBtIdfoUsBYFCg9t0rhnWNh6vK7Z
 JCkudbIJqqsTpr6bYL9Z5M4Kpw1v1to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-l6RWNUpBO6655txutobxDA-1; Tue, 07 Apr 2020 10:26:35 -0400
X-MC-Unique: l6RWNUpBO6655txutobxDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F38DA800D53;
 Tue,  7 Apr 2020 14:26:33 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-253.ams2.redhat.com
 [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F19E65DA60;
 Tue,  7 Apr 2020 14:26:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 3/7] backup: don't acquire aio_context in backup_clean
Date: Tue,  7 Apr 2020 16:26:12 +0200
Message-Id: <20200407142616.7961-4-kwolf@redhat.com>
In-Reply-To: <20200407142616.7961-1-kwolf@redhat.com>
References: <20200407142616.7961-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

All code-paths leading to backup_clean (via job_clean) have the job's
context already acquired. The job's context is guaranteed to be the same
as the one used by backup_top via backup_job_create.

Since the previous logic effectively acquired the lock twice, this
broke cleanup of backups for disks using IO threads, since the BDRV_POLL_WH=
ILE
in bdrv_backup_top_drop -> bdrv_do_drained_begin would only release the loc=
k
once, thus deadlocking with the IO thread.

This is a partial revert of 0abf2581717a19.

Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200407115651.69472-4-s.reiter@proxmox.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/backup.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 7430ca5883..a7a7dcaf4c 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -126,11 +126,7 @@ static void backup_abort(Job *job)
 static void backup_clean(Job *job)
 {
     BackupBlockJob *s =3D container_of(job, BackupBlockJob, common.job);
-    AioContext *aio_context =3D bdrv_get_aio_context(s->backup_top);
-
-    aio_context_acquire(aio_context);
     bdrv_backup_top_drop(s->backup_top);
-    aio_context_release(aio_context);
 }
=20
 void backup_do_checkpoint(BlockJob *job, Error **errp)
--=20
2.20.1


