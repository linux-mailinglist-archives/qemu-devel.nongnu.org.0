Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2841BE061
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 16:13:31 +0200 (CEST)
Received: from localhost ([::1]:45288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTnSs-00066b-LE
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jTnR8-0004CW-A9
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:11:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jTnR7-0003oS-R7
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:11:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53543
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jTnR7-0003nH-Bd
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 10:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588169499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apBcOFWD2uRliMp77K+UWvEH/xort9oA7Zb3Jz6Hh8g=;
 b=NVnME+zwtEpk8MB8NGR5aZGCpjmtys092U8TY8yE+us6naQqlggz66qoKna3rBaJT2RhAe
 Ipcgm/R3FyQkUdlIEgAoN8JmqMDOoeBR1kPAT/roV9F66dCyjta+y90keZdXo7ZZeZi9v9
 oeEgPOOOzoSDx8IAYvVU3mCaK9v81AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-IU7izZ1TOSiMMQNEubjOVA-1; Wed, 29 Apr 2020 10:11:38 -0400
X-MC-Unique: IU7izZ1TOSiMMQNEubjOVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65B03106B784;
 Wed, 29 Apr 2020 14:11:32 +0000 (UTC)
Received: from localhost (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ACDE5D9C9;
 Wed, 29 Apr 2020 14:11:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/4] block: Use bdrv_make_empty() where possible
Date: Wed, 29 Apr 2020 16:11:24 +0200
Message-Id: <20200429141126.85159-3-mreitz@redhat.com>
In-Reply-To: <20200429141126.85159-1-mreitz@redhat.com>
References: <20200429141126.85159-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:18:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block/replication.c | 6 ++----
 block/vvfat.c       | 4 +---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index da013c2041..cc6a40d577 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -331,9 +331,8 @@ static void secondary_do_checkpoint(BDRVReplicationStat=
e *s, Error **errp)
         return;
     }
=20
-    ret =3D s->active_disk->bs->drv->bdrv_make_empty(s->active_disk->bs);
+    ret =3D bdrv_make_empty(s->active_disk, errp);
     if (ret < 0) {
-        error_setg(errp, "Cannot make active disk empty");
         return;
     }
=20
@@ -343,9 +342,8 @@ static void secondary_do_checkpoint(BDRVReplicationStat=
e *s, Error **errp)
         return;
     }
=20
-    ret =3D s->hidden_disk->bs->drv->bdrv_make_empty(s->hidden_disk->bs);
+    ret =3D bdrv_make_empty(s->hidden_disk, errp);
     if (ret < 0) {
-        error_setg(errp, "Cannot make hidden disk empty");
         return;
     }
 }
diff --git a/block/vvfat.c b/block/vvfat.c
index 6d5c090dec..34c121c07a 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -2960,9 +2960,7 @@ static int do_commit(BDRVVVFATState* s)
         return ret;
     }
=20
-    if (s->qcow->bs->drv && s->qcow->bs->drv->bdrv_make_empty) {
-        s->qcow->bs->drv->bdrv_make_empty(s->qcow->bs);
-    }
+    bdrv_make_empty(s->qcow, NULL);
=20
     memset(s->used_clusters, 0, sector2cluster(s, s->sector_count));
=20
--=20
2.25.4


