Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866FF1B0CF1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 15:39:53 +0200 (CEST)
Received: from localhost ([::1]:35820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQWeO-0005k1-In
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 09:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jQWXh-0004M4-MV
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:33:03 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jQWXY-0004ce-J5
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:32:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31653
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jQWXY-0004a2-37
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 09:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587389565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bap6ceJwml4SlZOkLptyTKbBRJeROgfUbVXe4M3j/2M=;
 b=PqJ3n89BceV1Hi2ja2jK2V1GgnWY3rl9M2pX4qem3ZcnThsUkigCfLbYR4tJvsWfhimBu7
 eb+vFBgCEknaiSYG+gvpYkEH2uT9zlM9xB0cPFS4ZCzGRn1o9M2BJuMURDE/AKZJoSjdks
 RpyW726bVPICP2pduv8TMlQLmW/E/tE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-8RwFn6zMNruHnpLlZUF5YA-1; Mon, 20 Apr 2020 09:32:43 -0400
X-MC-Unique: 8RwFn6zMNruHnpLlZUF5YA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88511DB23;
 Mon, 20 Apr 2020 13:32:40 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-38.ams2.redhat.com [10.36.114.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FAF511E7E7;
 Mon, 20 Apr 2020 13:32:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 4/9] qcow2: Support BDRV_REQ_ZERO_WRITE for truncate
Date: Mon, 20 Apr 2020 15:32:09 +0200
Message-Id: <20200420133214.28921-5-kwolf@redhat.com>
In-Reply-To: <20200420133214.28921-1-kwolf@redhat.com>
References: <20200420133214.28921-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 03:29:13
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If BDRV_REQ_ZERO_WRITE is set and we're extending the image, calling
qcow2_cluster_zeroize() with flags=3D0 does the right thing: It doesn't
undo any previous preallocation, but just adds the zero flag to all
relevant L2 entries. If an external data file is in use, a write_zeroes
request to the data file is made instead.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 6c6d6101ce..7a70c1c090 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1726,6 +1726,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverStat=
e *bs, QDict *options,
=20
     bs->supported_zero_flags =3D header.version >=3D 3 ?
                                BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK :=
 0;
+    bs->supported_truncate_flags =3D BDRV_REQ_ZERO_WRITE;
=20
     /* Repair image if dirty */
     if (!(flags & (BDRV_O_CHECK | BDRV_O_INACTIVE)) && !bs->read_only &&
@@ -4213,6 +4214,14 @@ static int coroutine_fn qcow2_co_truncate(BlockDrive=
rState *bs, int64_t offset,
         g_assert_not_reached();
     }
=20
+    if ((flags & BDRV_REQ_ZERO_WRITE) && offset > old_length) {
+        ret =3D qcow2_cluster_zeroize(bs, old_length, offset - old_length,=
 0);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Failed to zero out the new area"=
);
+            goto fail;
+        }
+    }
+
     if (prealloc !=3D PREALLOC_MODE_OFF) {
         /* Flush metadata before actually changing the image size */
         ret =3D qcow2_write_caches(bs);
--=20
2.20.1


