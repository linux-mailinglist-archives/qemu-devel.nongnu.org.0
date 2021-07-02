Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053633BA3AD
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 19:34:18 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzN3Q-0006Zw-Vs
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 13:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuN-0000fs-CJ; Fri, 02 Jul 2021 13:24:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1lzMuE-0005q3-Fg; Fri, 02 Jul 2021 13:24:55 -0400
Received: by mail-ej1-x62a.google.com with SMTP id o5so17285780ejy.7;
 Fri, 02 Jul 2021 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XCS1eBTmFVni55Vw7riktXNyIAlpsaxYTIa8S2YQ34E=;
 b=AnAEcSYUJGuGG7M0TNGvLHt/FQZLfp8seTq5leB5LrX9PwOrdrgetUd+c6/gJGF8k1
 cOsExRDvViLcefAsvMKRBtErYazpJNUNqoWdK8L7vH5QRTXdDs3ImFCCBCZhgA4wfE/W
 ZxcG5fRhZNYsovhpoV42SuoLt3zJX7lmzIyeyp41Qxmu0gPEuWVVQ5jGx1W+G7uja2xG
 y6iT+fdgix3yCJBlLlMC18/ElDDVoWyO1i0QJrCZpnMJBrti9IJ8SOIhB7kX6eaSGkOm
 9bk2I8rhqp07XcPessreoNKa0/ET5OkjfhNiUiBjVgO6sMyZd48v9VLoKPUC9CpbmZnm
 5oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XCS1eBTmFVni55Vw7riktXNyIAlpsaxYTIa8S2YQ34E=;
 b=qVZZ2vAIqqsKkMLbEAnm8xM7sSCYl7vcOGLRG+OiD5vgQU4MAUbSBbK8mlQHZGi5nq
 HVnuw3wbJfJiJfhlIoLa1aZ3AXpBpVZFmxhvXf58GCI5Tdi5mpt2i+A/ICVy4Ne24Ilf
 FIuFVyj8W9WiflGl+1r2RACxrirWV67PozQM4f5wNOEKDCaB6DfK9T6WSQkh1AF8zdFq
 KN8qF/rEzg8JjSdeg6RTSnTHt2MWG0bHopF0Tj+KlJBpI0enzXUCk6mWkx0yzrlrqKR8
 7mlmY/wtyo51bfg604Xvx2jaouZ+yRi5pMUNNNer8CV/Fr/8UqNT6+j5tv0FkL4+N4a0
 2C7w==
X-Gm-Message-State: AOAM5318l6qZPjcdWduLTq1X+V4Kown7pwXNtPOqF0UQ1sYTeEQBOMkv
 lHfKx3c7dcCLnDUubosJvGJ8sYR1bLCY2A==
X-Google-Smtp-Source: ABdhPJyUigsaJh4pwoLz6etRpJUBGObKxVJF2459VSGaM+ok2xHPpL/zE+J6AgUKL8VtXK3ZQvXkZw==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr829215ejy.532.1625246684810; 
 Fri, 02 Jul 2021 10:24:44 -0700 (PDT)
Received: from kwango.redhat.com (ip-94-112-132-16.net.upcbroadband.cz.
 [94.112.132.16])
 by smtp.gmail.com with ESMTPSA id ar27sm1242229ejc.100.2021.07.02.10.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 10:24:44 -0700 (PDT)
From: Ilya Dryomov <idryomov@gmail.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 5/6] block/rbd: add write zeroes support
Date: Fri,  2 Jul 2021 19:23:55 +0200
Message-Id: <20210702172356.11574-6-idryomov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20210702172356.11574-1-idryomov@gmail.com>
References: <20210702172356.11574-1-idryomov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=idryomov@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 ct@flyingcircus.io, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
---
 block/rbd.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/block/rbd.c b/block/rbd.c
index 380ad28861ad..3152bc8ba00a 100644
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
2.19.2


