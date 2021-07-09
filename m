Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6B3C23C9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:56:23 +0200 (CEST)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q3K-0002zo-6y
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyP-0003LS-Fv
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyM-0003Pq-If
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmV3zdmoPexiywPMo1gfqXVA6i9ERH1AQvdAQO4EcIs=;
 b=Zj+UywDT/M1Beq7jtO3PhoXPUNnXDQRxdKPM+Twe3i9ts6b+g53boSc3n8eDBwXX/PEbtz
 QqCkNkJAqYG2WeOwrkLXgc1C4jzGzn6TgL9YLDleJLUifzl09WvpXeDnD4BGm5n8X4ZRmr
 mn8uof44sG92e2g4dq7jeKnFS1OgI14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-H4GNnmjsO2i8HhA4I7YFeA-1; Fri, 09 Jul 2021 08:51:10 -0400
X-MC-Unique: H4GNnmjsO2i8HhA4I7YFeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12D72188CBE1;
 Fri,  9 Jul 2021 12:51:09 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A32E60843;
 Fri,  9 Jul 2021 12:51:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/28] block/rbd: add write zeroes support
Date: Fri,  9 Jul 2021 14:50:14 +0200
Message-Id: <20210709125035.191321-8-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Peter Lieven <pl@kamp.de>

This patch wittingly sets BDRV_REQ_NO_FALLBACK and silently ignores
BDRV_REQ_MAY_UNMAP for older librbd versions.

The rationale for this is as follows (citing Ilya Dryomov current RBD
maintainer):

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
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Message-Id: <20210702172356.11574-6-idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/block/rbd.c b/block/rbd.c
index 380ad28861..3152bc8ba0 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -75,7 +75,8 @@ typedef enum {
     RBD_AIO_READ,
     RBD_AIO_WRITE,
     RBD_AIO_DISCARD,
-    RBD_AIO_FLUSH
+    RBD_AIO_FLUSH,
+    RBD_AIO_WRITE_ZEROES
 } RBDAIOCmd;
 
 typedef struct BDRVRBDState {
@@ -999,6 +1000,10 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK;
+#endif
+
     /* When extending regular files, we get zeros from the OS */
     bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
 
@@ -1123,6 +1128,18 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
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
@@ -1193,6 +1210,16 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
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
@@ -1473,6 +1500,9 @@ static BlockDriver bdrv_rbd = {
     .bdrv_co_pwritev        = qemu_rbd_co_pwritev,
     .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
     .bdrv_co_pdiscard       = qemu_rbd_co_pdiscard,
+#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
+    .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
+#endif
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.31.1


