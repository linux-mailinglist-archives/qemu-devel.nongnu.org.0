Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A131CAD16
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:00:59 +0200 (CEST)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2cb-0001Hm-N4
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:00:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2Kl-0000OD-3T
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49689
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2Kf-0000Fr-4p
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7aOk/BXPBSopj9gx0iL/4RO/rqlNhssjAKXQj5V6Nw=;
 b=hfSFog76orfMMqWenYu2OcbDx6+FpRtNwr2C+8J9uDBRUsj/PvTt+lisOd46FMXJD5Q66O
 TjI56zv0O19hrmMFvU6aot37gvV+e32aLNOsbXkAL2/8rbn/GhNqdE4obr3uCILNtqfOxc
 IktIJdpHc594yVdoDw3iPSdoplv5RNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-pIKo1VWQPG6fzoO4CsTDUg-1; Fri, 08 May 2020 08:42:21 -0400
X-MC-Unique: pIKo1VWQPG6fzoO4CsTDUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D9C835B8B;
 Fri,  8 May 2020 12:42:20 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 532F46E715;
 Fri,  8 May 2020 12:42:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/30] vhdx: Rework truncation logic
Date: Fri,  8 May 2020 14:41:34 +0200
Message-Id: <20200508124135.252565-30-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:25:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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

From: Eric Blake <eblake@redhat.com>

The vhdx driver uses truncation for image growth, with a special case
for blocks that already read as zero but which are only being
partially written.  But with a bit of rearranging, it's just as easy
to defer the decision on whether truncation resulted in zeroes to the
actual allocation attempt, reducing the number of places that still
use bdrv_has_zero_init_truncate.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200428202905.770727-9-eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vhdx.c | 89 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 38 deletions(-)

diff --git a/block/vhdx.c b/block/vhdx.c
index e11fb7413a..53e756438a 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1240,12 +1240,16 @@ exit:
 /*
  * Allocate a new payload block at the end of the file.
  *
- * Allocation will happen at 1MB alignment inside the file
+ * Allocation will happen at 1MB alignment inside the file.
+ *
+ * If @need_zero is set on entry but not cleared on return, then truncatio=
n
+ * could not guarantee that the new portion reads as zero, and the caller
+ * will take care of it instead.
  *
  * Returns the file offset start of the new payload block
  */
 static int vhdx_allocate_block(BlockDriverState *bs, BDRVVHDXState *s,
-                                    uint64_t *new_offset)
+                               uint64_t *new_offset, bool *need_zero)
 {
     int64_t current_len;
=20
@@ -1262,6 +1266,17 @@ static int vhdx_allocate_block(BlockDriverState *bs,=
 BDRVVHDXState *s,
         return -EINVAL;
     }
=20
+    if (*need_zero) {
+        int ret;
+
+        ret =3D bdrv_truncate(bs->file, *new_offset + s->block_size, false=
,
+                            PREALLOC_MODE_OFF, BDRV_REQ_ZERO_WRITE, NULL);
+        if (ret !=3D -ENOTSUP) {
+            *need_zero =3D false;
+            return ret;
+        }
+    }
+
     return bdrv_truncate(bs->file, *new_offset + s->block_size, false,
                          PREALLOC_MODE_OFF, 0, NULL);
 }
@@ -1355,18 +1370,38 @@ static coroutine_fn int vhdx_co_writev(BlockDriverS=
tate *bs, int64_t sector_num,
                 /* in this case, we need to preserve zero writes for
                  * data that is not part of this write, so we must pad
                  * the rest of the buffer to zeroes */
-
-                /* if we are on a posix system with ftruncate() that exten=
ds
-                 * a file, then it is zero-filled for us.  On Win32, the r=
aw
-                 * layer uses SetFilePointer and SetFileEnd, which does no=
t
-                 * zero fill AFAIK */
-
-                /* Queue another write of zero buffers if the underlying f=
ile
-                 * does not zero-fill on file extension */
-
-                if (bdrv_has_zero_init_truncate(bs->file->bs) =3D=3D 0) {
-                    use_zero_buffers =3D true;
-
+                use_zero_buffers =3D true;
+                /* fall through */
+            case PAYLOAD_BLOCK_NOT_PRESENT: /* fall through */
+            case PAYLOAD_BLOCK_UNMAPPED:
+            case PAYLOAD_BLOCK_UNMAPPED_v095:
+            case PAYLOAD_BLOCK_UNDEFINED:
+                bat_prior_offset =3D sinfo.file_offset;
+                ret =3D vhdx_allocate_block(bs, s, &sinfo.file_offset,
+                                          &use_zero_buffers);
+                if (ret < 0) {
+                    goto exit;
+                }
+                /*
+                 * once we support differencing files, this may also be
+                 * partially present
+                 */
+                /* update block state to the newly specified state */
+                vhdx_update_bat_table_entry(bs, s, &sinfo, &bat_entry,
+                                            &bat_entry_offset,
+                                            PAYLOAD_BLOCK_FULLY_PRESENT);
+                bat_update =3D true;
+                /*
+                 * Since we just allocated a block, file_offset is the
+                 * beginning of the payload block. It needs to be the
+                 * write address, which includes the offset into the
+                 * block, unless the entire block needs to read as
+                 * zeroes but truncation was not able to provide them,
+                 * in which case we need to fill in the rest.
+                 */
+                if (!use_zero_buffers) {
+                    sinfo.file_offset +=3D sinfo.block_offset;
+                } else {
                     /* zero fill the front, if any */
                     if (sinfo.block_offset) {
                         iov1.iov_len =3D sinfo.block_offset;
@@ -1378,7 +1413,7 @@ static coroutine_fn int vhdx_co_writev(BlockDriverSta=
te *bs, int64_t sector_num,
                     }
=20
                     /* our actual data */
-                    qemu_iovec_concat(&hd_qiov, qiov,  bytes_done,
+                    qemu_iovec_concat(&hd_qiov, qiov, bytes_done,
                                       sinfo.bytes_avail);
=20
                     /* zero fill the back, if any */
@@ -1393,29 +1428,7 @@ static coroutine_fn int vhdx_co_writev(BlockDriverSt=
ate *bs, int64_t sector_num,
                         sectors_to_write +=3D iov2.iov_len >> BDRV_SECTOR_=
BITS;
                     }
                 }
-                /* fall through */
-            case PAYLOAD_BLOCK_NOT_PRESENT: /* fall through */
-            case PAYLOAD_BLOCK_UNMAPPED:
-            case PAYLOAD_BLOCK_UNMAPPED_v095:
-            case PAYLOAD_BLOCK_UNDEFINED:
-                bat_prior_offset =3D sinfo.file_offset;
-                ret =3D vhdx_allocate_block(bs, s, &sinfo.file_offset);
-                if (ret < 0) {
-                    goto exit;
-                }
-                /* once we support differencing files, this may also be
-                 * partially present */
-                /* update block state to the newly specified state */
-                vhdx_update_bat_table_entry(bs, s, &sinfo, &bat_entry,
-                                            &bat_entry_offset,
-                                            PAYLOAD_BLOCK_FULLY_PRESENT);
-                bat_update =3D true;
-                /* since we just allocated a block, file_offset is the
-                 * beginning of the payload block. It needs to be the
-                 * write address, which includes the offset into the block=
 */
-                if (!use_zero_buffers) {
-                    sinfo.file_offset +=3D sinfo.block_offset;
-                }
+
                 /* fall through */
             case PAYLOAD_BLOCK_FULLY_PRESENT:
                 /* if the file offset address is in the header zone,
--=20
2.25.3


