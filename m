Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0E14F19B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 18:51:56 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixaSS-0004ob-0P
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 12:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ixaLk-0003Au-KC
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:45:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ixaLj-0004h3-Fr
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:45:00 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:34405
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ixaLj-0004gT-BY
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580492699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5LRfQ5sKsOuscvW/woHxAejuTxhwKv2TY1mM/n+QBw=;
 b=Rhha1wMPG5U2jvSJGV7WlRNu3vtP/ysGFxBifZ9ordAb/dFLwgqZV9EB8HZdcmkRdX8DEw
 hEBPVLVIL1bRy2KTzHaV0ULTMMLVsFHYrnS4fRswJAj1qht/0EMp0QlIPzAgWy67gnzGVE
 EtJ2s7nJJLCKtYicaSIRxjc/MHVUW/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-7Hu66hmNPLCyKYsJr_Ghvg-1; Fri, 31 Jan 2020 12:44:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEA6A107ACC4;
 Fri, 31 Jan 2020 17:44:53 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2E97FB60;
 Fri, 31 Jan 2020 17:44:53 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/17] file-posix: Support BDRV_ZERO_OPEN
Date: Fri, 31 Jan 2020 11:44:30 -0600
Message-Id: <20200131174436.2961874-12-eblake@redhat.com>
In-Reply-To: <20200131174436.2961874-1-eblake@redhat.com>
References: <20200131174436.2961874-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 7Hu66hmNPLCyKYsJr_Ghvg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: david.edmondson@oracle.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A single lseek(SEEK_DATA) is sufficient to tell us if a raw file is
completely sparse, in which case it reads as all zeroes.  Not done
here, but possible extension for the future: when working with block
devices instead of files, there may be various ways with ioctl or
similar to quickly probe if a given block device is known to be
completely unmapped where unmapped regions read as zero.  But for now,
block devices remain without a .bdrv_known_zeroes, because most block
devices have random content without an explicit pre-zeroing pass.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/file-posix.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index ff9e39ab882f..b4d73dd0363b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2541,6 +2541,19 @@ static int find_allocation(BlockDriverState *bs, off=
_t start,
 #endif
 }

+static int raw_known_zeroes(BlockDriverState *bs)
+{
+    /* This callback is only installed for files, not block devices. */
+    int r =3D BDRV_ZERO_CREATE | BDRV_ZERO_TRUNCATE;
+    off_t data, hole;
+
+    if (find_allocation(bs, 0, &data, &hole) =3D=3D -ENXIO) {
+        r |=3D BDRV_ZERO_OPEN;
+    }
+
+    return r;
+}
+
 /*
  * Returns the allocation status of the specified offset.
  *
@@ -3071,7 +3084,7 @@ BlockDriver bdrv_file =3D {
     .bdrv_close =3D raw_close,
     .bdrv_co_create =3D raw_co_create,
     .bdrv_co_create_opts =3D raw_co_create_opts,
-    .bdrv_known_zeroes =3D bdrv_known_zeroes_truncate,
+    .bdrv_known_zeroes =3D raw_known_zeroes,
     .bdrv_co_block_status =3D raw_co_block_status,
     .bdrv_co_invalidate_cache =3D raw_co_invalidate_cache,
     .bdrv_co_pwrite_zeroes =3D raw_co_pwrite_zeroes,
--=20
2.24.1


