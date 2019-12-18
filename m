Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95A124864
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 14:30:47 +0100 (CET)
Received: from localhost ([::1]:54540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihZPa-0002tl-HS
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 08:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihZCS-0006d8-TJ
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 08:17:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihZCR-0008OE-Ed
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 08:17:12 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42338)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihZCR-0008IQ-1y
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 08:17:11 -0500
Received: by mail-wr1-x443.google.com with SMTP id q6so2233931wro.9
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 05:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LiKPIkxf4u448xcJDFJUScrzTd5CAwun/iplBg2FxZw=;
 b=pXV6sZgMB0+2Em8h2/ws+/4SdmKHKKp6aztznYIe1KsBilsvLf0hdp9TlqsdE/sgxb
 A0KLZ9GVLeM8uNGztfWByu1zrIzG5Qk5t5lZwMRoWuAqZDB6idhSdfOPI2UJK7UCcPlr
 lIqDatk4WGS3QKemSFdzljfK2HkoPS+DY9Fn4ZuzL3bOjuPuWJh2gyxx0hdFKywgLMaN
 mDx2akzvZNQBa5sV7/Y/IlcCR1klJxZDS0rt40VbBET1/l8aT/guC/F9cQKM5FHJtMqO
 RQZ0rcoT43Kq2TzHxWE5Y2J6zM+LEp7Gqh4X3705bUkpFWgcmTtyB6m5eh/BsV+LutEK
 ETTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=LiKPIkxf4u448xcJDFJUScrzTd5CAwun/iplBg2FxZw=;
 b=qDbqe9lT7FrdjyNpAxEHyk5AfGOEoGbYn7No9zU0QMNQmNwebqXi+j3dFR8tuZ9Jog
 v2nYsJe6+ZWoGbeJu0cFngDhH46NhdJY4F3PHnuTmRgkUJA8m58BPSXpD7dkYdwc31/g
 v8M677KftK0+Mm3+PD+6HP8Vj4PqT9AJpO31cUWxXRu5hIXpEZuQiRLWYWLhbH8QnQx+
 wzWiQ8j+CtxvNLs1RYFfRemIFRi56/+PUlkir0BQIlDRBWy/CYt0vOjDb8PKU7VDiHdF
 t2qvB1MOSwAyuCccTa+lN1mvPxtMJgTafVtdXaWV0/DcKhreYi33q0QK3Pc1CJxuMzss
 V8Iw==
X-Gm-Message-State: APjAAAVKZWrGWjeOE545Pzxn4ol/LHIPwizA141U7X8BnGkjFVHUHWvv
 ttsiDjbAedR5qkSmDgA5GyFq3OXR
X-Google-Smtp-Source: APXvYqxQ62WfkgbO1rWH/lcaLvaoPh7dlOVzGEkJqADVUIQwce61/FukPik6mv9F4p59eE7cdMDZ6A==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr2777061wru.52.1576675029597;
 Wed, 18 Dec 2019 05:17:09 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id t1sm2447980wma.43.2019.12.18.05.17.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 05:17:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] block: eliminate BDRV_REQ_NO_SERIALISING
Date: Wed, 18 Dec 2019 14:17:04 +0100
Message-Id: <1576675026-25046-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576675026-25046-1-git-send-email-pbonzini@redhat.com>
References: <1576675026-25046-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-block@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is unused since commit 00e30f0 ("block/backup: use backup-top instead
of write notifiers", 2019-10-01), drop it to simplify the code.

While at it, drop redundant assertions on flags.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c            | 18 ++++--------------
 include/block/block.h | 12 ------------
 2 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/block/io.c b/block/io.c
index f75777f..b3a67fe 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1445,8 +1445,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
      * potential fallback support, if we ever implement any read flags
      * to pass through to drivers.  For now, there aren't any
      * passthrough flags.  */
-    assert(!(flags & ~(BDRV_REQ_NO_SERIALISING | BDRV_REQ_COPY_ON_READ |
-                       BDRV_REQ_PREFETCH)));
+    assert(!(flags & ~(BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH)));
 
     /* Handle Copy on Read and associated serialisation */
     if (flags & BDRV_REQ_COPY_ON_READ) {
@@ -1458,12 +1457,7 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         bdrv_mark_request_serialising(req, bdrv_get_cluster_size(bs));
     }
 
-    /* BDRV_REQ_SERIALISING is only for write operation */
-    assert(!(flags & BDRV_REQ_SERIALISING));
-
-    if (!(flags & BDRV_REQ_NO_SERIALISING)) {
-        bdrv_wait_serialising_requests(req);
-    }
+    bdrv_wait_serialising_requests(req);
 
     if (flags & BDRV_REQ_COPY_ON_READ) {
         int64_t pnum;
@@ -1711,7 +1705,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     bdrv_inc_in_flight(bs);
 
     /* Don't do copy-on-read if we read data before write operation */
-    if (atomic_read(&bs->copy_on_read) && !(flags & BDRV_REQ_NO_SERIALISING)) {
+    if (atomic_read(&bs->copy_on_read)) {
         flags |= BDRV_REQ_COPY_ON_READ;
     }
 
@@ -1852,8 +1846,6 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, uint64_t bytes,
         return -EPERM;
     }
 
-    /* BDRV_REQ_NO_SERIALISING is only for read operation */
-    assert(!(flags & BDRV_REQ_NO_SERIALISING));
     assert(!(bs->open_flags & BDRV_O_INACTIVE));
     assert((bs->open_flags & BDRV_O_NO_IO) == 0);
     assert(!(flags & ~BDRV_REQ_MASK));
@@ -3222,9 +3214,7 @@ static int coroutine_fn bdrv_co_copy_range_internal(
 
         /* BDRV_REQ_SERIALISING is only for write operation */
         assert(!(read_flags & BDRV_REQ_SERIALISING));
-        if (!(read_flags & BDRV_REQ_NO_SERIALISING)) {
-            bdrv_wait_serialising_requests(&req);
-        }
+        bdrv_wait_serialising_requests(&req);
 
         ret = src->bs->drv->bdrv_co_copy_range_from(src->bs,
                                                     src, src_offset,
diff --git a/include/block/block.h b/include/block/block.h
index 1df9848..9d43c02 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -51,18 +51,6 @@ typedef enum {
      */
     BDRV_REQ_MAY_UNMAP          = 0x4,
 
-    /*
-     * The BDRV_REQ_NO_SERIALISING flag is only valid for reads and means that
-     * we don't want wait_serialising_requests() during the read operation.
-     *
-     * This flag is used for backup copy-on-write operations, when we need to
-     * read old data before write (write notifier triggered). It is okay since
-     * we already waited for other serializing requests in the initiating write
-     * (see bdrv_aligned_pwritev), and it is necessary if the initiating write
-     * is already serializing (without the flag, the read would deadlock
-     * waiting for the serialising write to complete).
-     */
-    BDRV_REQ_NO_SERIALISING     = 0x8,
     BDRV_REQ_FUA                = 0x10,
     BDRV_REQ_WRITE_COMPRESSED   = 0x20,
 
-- 
1.8.3.1



