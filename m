Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C881830406C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:36:16 +0100 (CET)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PS3-00018D-S2
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDb-0000AP-5v
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDQ-00067U-PJ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28CVvT2G54J3FZYJjfNlAQL8l3qmUnDe43AQPKaBGkY=;
 b=ZsmFYRTfY6RR9C5hsCSrig3U6Lyx5JHAuYf2Lh5jhbsVNk6WK4s7JgRRde6ypp0YsVqDte
 mYCXVyS3NrCW/mL+6ludJ6geii0RTpUTrm9iR4es7YZ05yHa4GdyCadNUjdA8WgYGuUR29
 WVyecyqwsbF0WW9jGNqoc3gj6AX6JPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-qRsQLkOfOTaCQfWlaXFRSw-1; Tue, 26 Jan 2021 09:21:02 -0500
X-MC-Unique: qRsQLkOfOTaCQfWlaXFRSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7494F81451D;
 Tue, 26 Jan 2021 14:20:39 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4FD85D739;
 Tue, 26 Jan 2021 14:20:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/53] copy-on-read: skip non-guest reads if no copy needed
Date: Tue, 26 Jan 2021 15:19:32 +0100
Message-Id: <20210126142016.806073-10-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

If the flag BDRV_REQ_PREFETCH was set, skip idling read/write
operations in COR-driver. It can be taken into account for the
COR-algorithms optimization. That check is being made during the
block stream job by the moment.

Add the BDRV_REQ_PREFETCH flag to the supported_read_flags of the
COR-filter.

block: Modify the comment for the flag BDRV_REQ_PREFETCH as we are
going to use it alone and pass it to the COR-filter driver for further
processing.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201216061703.70908-9-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  8 +++++---
 block/copy-on-read.c  | 14 ++++++++++----
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 127bdf3392..81fcaad5ac 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -72,9 +72,11 @@ typedef enum {
     BDRV_REQ_NO_FALLBACK        = 0x100,
 
     /*
-     * BDRV_REQ_PREFETCH may be used only together with BDRV_REQ_COPY_ON_READ
-     * on read request and means that caller doesn't really need data to be
-     * written to qiov parameter which may be NULL.
+     * BDRV_REQ_PREFETCH makes sense only in the context of copy-on-read
+     * (i.e., together with the BDRV_REQ_COPY_ON_READ flag or when a COR
+     * filter is involved), in which case it signals that the COR operation
+     * need not read the data into memory (qiov) but only ensure they are
+     * copied to the top layer (i.e., that COR operation is done).
      */
     BDRV_REQ_PREFETCH  = 0x200,
 
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 71560984f6..9cad9e1b8c 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -50,6 +50,8 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    bs->supported_read_flags = BDRV_REQ_PREFETCH;
+
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
         (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
 
@@ -172,10 +174,14 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
             }
         }
 
-        ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
-                                  local_flags);
-        if (ret < 0) {
-            return ret;
+        /* Skip if neither read nor write are needed */
+        if ((local_flags & (BDRV_REQ_PREFETCH | BDRV_REQ_COPY_ON_READ)) !=
+            BDRV_REQ_PREFETCH) {
+            ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
+                                      local_flags);
+            if (ret < 0) {
+                return ret;
+            }
         }
 
         offset += n;
-- 
2.29.2


