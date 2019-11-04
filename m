Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E3EDB44
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 10:08:33 +0100 (CET)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRYLg-00040x-IQ
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 04:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iRYHa-0007Og-4a
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 04:04:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iRYHY-0003JR-17
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 04:04:17 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60095
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1iRYHX-00034l-SZ
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 04:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572858243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hT5Z3TYNMcaiyYP/Nvw6MDMmwNVAlQDViWN92O18NNo=;
 b=H9GwoVuDLaZjEOsuIFqwG7gfld3oluJsuJRtD4nRf6liz0niMSta1L/LHzH+yquDaLv0qm
 4SbNcvIP6R0ZhPyz13M+QaSJcRPiKZG8ATDLnsNLBDjpZnFwTA1RfBZeZuHWAVWOEGgblC
 pOLd335R8qdZaJcAXS1gst5wsMa6tzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-ULR8YgewMUWnsluifsrzjQ-1; Mon, 04 Nov 2019 04:04:00 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7692E107ACC2;
 Mon,  4 Nov 2019 09:03:59 +0000 (UTC)
Received: from localhost (ovpn-117-85.ams2.redhat.com [10.36.117.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B4D5D9CD;
 Mon,  4 Nov 2019 09:03:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 5/5] block/file-posix: Let post-EOF fallocate serialize
Date: Mon,  4 Nov 2019 10:03:47 +0100
Message-Id: <20191104090347.27278-6-mreitz@redhat.com>
In-Reply-To: <20191104090347.27278-1-mreitz@redhat.com>
References: <20191104090347.27278-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ULR8YgewMUWnsluifsrzjQ-1
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

The XFS kernel driver has a bug that may cause data corruption for qcow2
images as of qemu commit c8bb23cbdbe32f.  We can work around it by
treating post-EOF fallocates as serializing up until infinity (INT64_MAX
in practice).

Cc: qemu-stable@nongnu.org
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20191101152510.11719-4-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 0b7e904d48..1f0f61a02b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2721,6 +2721,42 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t o=
ffset, int bytes,
     RawPosixAIOData acb;
     ThreadPoolFunc *handler;
=20
+#ifdef CONFIG_FALLOCATE
+    if (offset + bytes > bs->total_sectors * BDRV_SECTOR_SIZE) {
+        BdrvTrackedRequest *req;
+        uint64_t end;
+
+        /*
+         * This is a workaround for a bug in the Linux XFS driver,
+         * where writes submitted through the AIO interface will be
+         * discarded if they happen beyond a concurrently running
+         * fallocate() that increases the file length (i.e., both the
+         * write and the fallocate() happen beyond the EOF).
+         *
+         * To work around it, we extend the tracked request for this
+         * zero write until INT64_MAX (effectively infinity), and mark
+         * it as serializing.
+         *
+         * We have to enable this workaround for all filesystems and
+         * AIO modes (not just XFS with aio=3Dnative), because for
+         * remote filesystems we do not know the host configuration.
+         */
+
+        req =3D bdrv_co_get_self_request(bs);
+        assert(req);
+        assert(req->type =3D=3D BDRV_TRACKED_WRITE);
+        assert(req->offset <=3D offset);
+        assert(req->offset + req->bytes >=3D offset + bytes);
+
+        end =3D INT64_MAX & -(uint64_t)bs->bl.request_alignment;
+        req->bytes =3D end - req->offset;
+        req->overlap_bytes =3D req->bytes;
+
+        bdrv_mark_request_serialising(req, bs->bl.request_alignment);
+        bdrv_wait_serialising_requests(req);
+    }
+#endif
+
     acb =3D (RawPosixAIOData) {
         .bs             =3D bs,
         .aio_fildes     =3D s->fd,
--=20
2.21.0


