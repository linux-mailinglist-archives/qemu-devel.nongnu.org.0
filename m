Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164CE72B4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 14:36:48 +0100 (CET)
Received: from localhost ([::1]:53814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP5CQ-0002Z6-77
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 09:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iP3xh-00043E-I7
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iP3xg-0002Sl-3l
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:29 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43471)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iP3xf-0002SK-VZ
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 08:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572265047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4yoWAkbu15EIciX01QYDu36TS21E+/DI2SOJps+PMEs=;
 b=OkWUfyKIXIqVXwadBnA4eK6/7mb5qqa2tth23kqohnVKgK4krGqw4jEOgmWQUeLfzeF2ue
 baEjz7+xflGoSoQpvJ/PeQgnmT1+sWsts3LVi/iUOvEXdv9aNJSQuzqpg4oETjcsPcBgET
 v3s7ZHTG/sKFpewgqRF+TYk3WtZXEz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-jwUhd48OOceWIe6y3FY-vA-1; Mon, 28 Oct 2019 08:17:21 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CA7A476;
 Mon, 28 Oct 2019 12:17:20 +0000 (UTC)
Received: from localhost (ovpn-117-83.ams2.redhat.com [10.36.117.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2176C26186;
 Mon, 28 Oct 2019 12:17:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 65/69] block: Evaluate @exact in protocol drivers
Date: Mon, 28 Oct 2019 13:14:57 +0100
Message-Id: <20191028121501.15279-66-mreitz@redhat.com>
In-Reply-To: <20191028121501.15279-1-mreitz@redhat.com>
References: <20191028121501.15279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jwUhd48OOceWIe6y3FY-vA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have two protocol drivers that return success when trying to shrink a
block device even though they cannot shrink it.  This behavior is now
only allowed with exact=3Dfalse, so they should return an error with
exact=3Dtrue.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190918095144.955-6-mreitz@redhat.com
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 8 +++++++-
 block/iscsi.c      | 7 ++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index a3e8a8aa70..e0ea1a7446 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2033,6 +2033,7 @@ static int coroutine_fn raw_co_truncate(BlockDriverSt=
ate *bs, int64_t offset,
     }
=20
     if (S_ISREG(st.st_mode)) {
+        /* Always resizes to the exact @offset */
         return raw_regular_truncate(bs, s->fd, offset, prealloc, errp);
     }
=20
@@ -2043,7 +2044,12 @@ static int coroutine_fn raw_co_truncate(BlockDriverS=
tate *bs, int64_t offset,
     }
=20
     if (S_ISCHR(st.st_mode) || S_ISBLK(st.st_mode)) {
-        if (offset > raw_getlength(bs)) {
+        int64_t cur_length =3D raw_getlength(bs);
+
+        if (offset !=3D cur_length && exact) {
+            error_setg(errp, "Cannot resize device files");
+            return -ENOTSUP;
+        } else if (offset > cur_length) {
             error_setg(errp, "Cannot grow device files");
             return -EINVAL;
         }
diff --git a/block/iscsi.c b/block/iscsi.c
index 677946cf09..2aea7e3f13 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2127,6 +2127,7 @@ static int coroutine_fn iscsi_co_truncate(BlockDriver=
State *bs, int64_t offset,
                                           Error **errp)
 {
     IscsiLun *iscsilun =3D bs->opaque;
+    int64_t cur_length;
     Error *local_err =3D NULL;
=20
     if (prealloc !=3D PREALLOC_MODE_OFF) {
@@ -2146,7 +2147,11 @@ static int coroutine_fn iscsi_co_truncate(BlockDrive=
rState *bs, int64_t offset,
         return -EIO;
     }
=20
-    if (offset > iscsi_getlength(bs)) {
+    cur_length =3D iscsi_getlength(bs);
+    if (offset !=3D cur_length && exact) {
+        error_setg(errp, "Cannot resize iSCSI devices");
+        return -ENOTSUP;
+    } else if (offset > cur_length) {
         error_setg(errp, "Cannot grow iSCSI devices");
         return -EINVAL;
     }
--=20
2.21.0


