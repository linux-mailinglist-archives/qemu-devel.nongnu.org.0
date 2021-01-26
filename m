Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8210304055
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:32:03 +0100 (CET)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PNy-0004oP-Pk
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDR-0008JR-39
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDL-00064P-45
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6u5XuKpnFvlV6hWdWF7PutInEzQT7S6RUBNrhH/aCpQ=;
 b=UCkBJiA+iDSjps/QUqSOmefgIaL1wAsR6+RF2dGyQGMrVqoYut2pA6rOKn+OSCofHg1zMQ
 WhKH358eQ+Egwsv4BWvTJ86l8BYz1zs80fhUQf/KbFO14ixd6vRMft0nUX5r0TV+6fr3p7
 Ocarx2UZb4h87uaZEvmaj4RHgwg6POI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-hZMu84OmNLu8yRMg2ip70g-1; Tue, 26 Jan 2021 09:21:00 -0500
X-MC-Unique: hZMu84OmNLu8yRMg2ip70g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0730610AB040;
 Tue, 26 Jan 2021 14:20:37 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C7FF10023AB;
 Tue, 26 Jan 2021 14:20:36 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/53] block: include supported_read_flags into BDS structure
Date: Tue, 26 Jan 2021 15:19:31 +0100
Message-Id: <20210126142016.806073-9-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Add the new member supported_read_flags to the BlockDriverState
structure. It will control the flags set for copy-on-read operations.
Make the block generic layer evaluate supported read flags before they
go to a block driver.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 [vsementsov: use assert instead of abort]
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201216061703.70908-8-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  4 ++++
 block/io.c                | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f3d0a0e60a..92d3754ead 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -881,6 +881,10 @@ struct BlockDriverState {
     /* I/O Limits */
     BlockLimits bl;
 
+    /*
+     * Flags honored during pread
+     */
+    unsigned int supported_read_flags;
     /* Flags honored during pwrite (so far: BDRV_REQ_FUA,
      * BDRV_REQ_WRITE_UNCHANGED).
      * If a driver does not support BDRV_REQ_WRITE_UNCHANGED, those
diff --git a/block/io.c b/block/io.c
index 95b1c56c06..d203435a73 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1453,6 +1453,9 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
     if (flags & BDRV_REQ_COPY_ON_READ) {
         int64_t pnum;
 
+        /* The flag BDRV_REQ_COPY_ON_READ has reached its addressee */
+        flags &= ~BDRV_REQ_COPY_ON_READ;
+
         ret = bdrv_is_allocated(bs, offset, bytes, &pnum);
         if (ret < 0) {
             goto out;
@@ -1474,9 +1477,11 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         goto out;
     }
 
+    assert(!(flags & ~bs->supported_read_flags));
+
     max_bytes = ROUND_UP(MAX(0, total_bytes - offset), align);
     if (bytes <= max_bytes && bytes <= max_transfer) {
-        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, 0);
+        ret = bdrv_driver_preadv(bs, offset, bytes, qiov, qiov_offset, flags);
         goto out;
     }
 
@@ -1489,7 +1494,8 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
 
             ret = bdrv_driver_preadv(bs, offset + bytes - bytes_remaining,
                                      num, qiov,
-                                     qiov_offset + bytes - bytes_remaining, 0);
+                                     qiov_offset + bytes - bytes_remaining,
+                                     flags);
             max_bytes -= num;
         } else {
             num = bytes_remaining;
-- 
2.29.2


