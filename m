Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0EC3B9E13
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:22:46 +0200 (CEST)
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFNl-0002Zh-Ac
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFM4-0001QS-Dk
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:21:00 -0400
Received: from kerio.kamp.de ([195.62.97.192]:54614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFM0-0007FF-Jr
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:21:00 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 2 Jul 2021 11:09:42 +0200
Received: (qmail 37506 invoked from network); 2 Jul 2021 09:09:43 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 2 Jul 2021 09:09:43 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id C405713DD29; Fri,  2 Jul 2021 11:09:43 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V4 5/6] block/rbd: add write zeroes support
Date: Fri,  2 Jul 2021 11:09:34 +0200
Message-Id: <20210702090935.15300-6-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702090935.15300-1-pl@kamp.de>
References: <20210702090935.15300-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this patch wittingly sets BDRV_REQ_NO_FALLBACK and silently ignores BDRV_REQ_MAY_UNMAP
for older librbd versions.

The rationale for this is as following (citing Ilya Dryomov current RBD maintainer):
---8<---
a) remove the BDRV_REQ_MAY_UNMAP check in qemu_rbd_co_pwrite_zeroes()
   and as a consequence always unmap if librbd is too old

   It's not clear what qemu's expectation is but in general Write
   Zeroes is allowed to unmap.  The only guarantee is that subsequent
   reads return zeroes, everything else is a hint.  This is how it is
   specified in the kernel and in the NVMe spec.

   In particular, block/nvme.c implements it as follows:

   if (flags & BDRV_REQ_MAY_UNMAP) {
       cdw12 |= (1 << 25);
   }

   This sets the Deallocate bit.  But if it's not set, the device may
   still deallocate:

   """
   If the Deallocate bit (CDW12.DEAC) is set to '1' in a Write Zeroes
   command, and the namespace supports clearing all bytes to 0h in the
   values read (e.g., bits 2:0 in the DLFEAT field are set to 001b)
   from a deallocated logical block and its metadata (excluding
   protection information), then for each specified logical block, the
   controller:
   - should deallocate that logical block;

   ...

   If the Deallocate bit is cleared to '0' in a Write Zeroes command,
   and the namespace supports clearing all bytes to 0h in the values
   read (e.g., bits 2:0 in the DLFEAT field are set to 001b) from
   a deallocated logical block and its metadata (excluding protection
   information), then, for each specified logical block, the
   controller:
   - may deallocate that logical block;
   """

   https://nvmexpress.org/wp-content/uploads/NVM-Express-NVM-Command-Set-Specification-2021.06.02-Ratified-1.pdf

b) set BDRV_REQ_NO_FALLBACK in supported_zero_flags

   Again, it's not clear what qemu expects here, but without it we end
   up in a ridiculous situation where specifying the "don't allow slow
   fallback" switch immediately fails all efficient zeroing requests on
   a device where Write Zeroes is always efficient:

   $ qemu-io -c 'help write' | grep -- '-[zun]'
    -n, -- with -z, don't allow slow fallback
    -u, -- with -z, allow unmapping
    -z, -- write zeroes using blk_co_pwrite_zeroes

   $ qemu-io -f rbd -c 'write -z -u -n 0 1M' rbd:foo/bar
   write failed: Operation not supported
--->8---

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/block/rbd.c b/block/rbd.c
index be0471944a..149317d33c 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -63,7 +63,8 @@ typedef enum {
     RBD_AIO_READ,
     RBD_AIO_WRITE,
     RBD_AIO_DISCARD,
-    RBD_AIO_FLUSH
+    RBD_AIO_FLUSH,
+    RBD_AIO_WRITE_ZEROES
 } RBDAIOCmd;
 
 typedef struct BDRVRBDState {
@@ -705,6 +706,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
+#endif
+
     /* When extending regular files, we get zeros from the OS */
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
@@ -827,6 +832,18 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
     case RBD_AIO_FLUSH:
         r = rbd_aio_flush(s->image, c);
         break;
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    case RBD_AIO_WRITE_ZEROES: {
+        int zero_flags = 0;
+#ifdef RBD_WRITE_ZEROES_FLAG_THICK_PROVISION
+        if (!(flags & BDRV_REQ_MAY_UNMAP)) {
+            zero_flags = RBD_WRITE_ZEROES_FLAG_THICK_PROVISION;
+        }
+#endif
+        r = rbd_aio_write_zeroes(s->image, offset, bytes, c, zero_flags, 0);
+        break;
+    }
+#endif
     default:
         r = -EINVAL;
     }
@@ -897,6 +914,16 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
     return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
 }
 
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+static int
+coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                                      int count, BdrvRequestFlags flags)
+{
+    return qemu_rbd_start_co(bs, offset, count, NULL, flags,
+                             RBD_AIO_WRITE_ZEROES);
+}
+#endif
+
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1120,6 +1147,9 @@ static BlockDriver bdrv_rbd = {
     .bdrv_co_pwritev        = qemu_rbd_co_pwritev,
     .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
     .bdrv_co_pdiscard       = qemu_rbd_co_pdiscard,
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
+#endif
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.17.1



