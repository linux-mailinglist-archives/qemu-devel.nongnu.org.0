Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B99F280
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 20:40:19 +0200 (CEST)
Received: from localhost ([::1]:55708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2gOA-00085k-MF
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 14:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i2g83-0002vY-Qz
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i2g82-0005Ue-HK
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 14:23:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18221)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i2g7z-0005SO-PI; Tue, 27 Aug 2019 14:23:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1CDE78980EA;
 Tue, 27 Aug 2019 18:23:35 +0000 (UTC)
Received: from localhost (unknown [10.40.205.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA7F5196AE;
 Tue, 27 Aug 2019 18:23:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 27 Aug 2019 20:23:06 +0200
Message-Id: <20190827182313.25983-9-mreitz@redhat.com>
In-Reply-To: <20190827182313.25983-1-mreitz@redhat.com>
References: <20190827182313.25983-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 27 Aug 2019 18:23:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/15] vmdk: Reject invalid compressed writes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compressed writes generally have to write full clusters, not just in
theory but also in practice when it comes to vmdk's streamOptimized
subformat.  It currently is just silently broken for writes with
non-zero in-cluster offsets:

$ qemu-img create -f vmdk -o subformat=3DstreamOptimized foo.vmdk 1M
$ qemu-io -c 'write 4k 4k' -c 'read 4k 4k' foo.vmdk
wrote 4096/4096 bytes at offset 4096
4 KiB, 1 ops; 00.01 sec (443.724 KiB/sec and 110.9309 ops/sec)
read failed: Invalid argument

(The technical reason is that vmdk_write_extent() just writes the
incomplete compressed data actually to offset 4k.  When reading the
data, vmdk_read_extent() looks at offset 0 and finds the compressed data
size to be 0, because that is what it reads from there.  This yields an
error.)

For incomplete writes with zero in-cluster offsets, the error path when
reading the rest of the cluster is a bit different, but the result is
the same:

$ qemu-img create -f vmdk -o subformat=3DstreamOptimized foo.vmdk 1M
$ qemu-io -c 'write 0k 4k' -c 'read 4k 4k' foo.vmdk
wrote 4096/4096 bytes at offset 0
4 KiB, 1 ops; 00.01 sec (362.641 KiB/sec and 90.6603 ops/sec)
read failed: Invalid argument

(Here, vmdk_read_extent() finds the data and then sees that the
uncompressed data is short.)

It is better to reject invalid writes than to make the user believe they
might have succeeded and then fail when trying to read it back.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20190815153638.4600-5-mreitz@redhat.com
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/vmdk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/vmdk.c b/block/vmdk.c
index a7f82e665e..fed3b50c8a 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1734,6 +1734,16 @@ static int vmdk_write_extent(VmdkExtent *extent, i=
nt64_t cluster_offset,
     if (extent->compressed) {
         void *compressed_data;
=20
+        /* Only whole clusters */
+        if (offset_in_cluster ||
+            n_bytes > (extent->cluster_sectors * SECTOR_SIZE) ||
+            (n_bytes < (extent->cluster_sectors * SECTOR_SIZE) &&
+             offset + n_bytes !=3D extent->end_sector * SECTOR_SIZE))
+        {
+            ret =3D -EINVAL;
+            goto out;
+        }
+
         if (!extent->has_marker) {
             ret =3D -EINVAL;
             goto out;
--=20
2.21.0


