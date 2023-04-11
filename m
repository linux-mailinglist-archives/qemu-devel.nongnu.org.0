Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCEF6DDEC6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 17:03:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmFWW-0003Sg-9z; Tue, 11 Apr 2023 11:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFWB-0003AA-5Y
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmFW5-00026Z-QG
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 11:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681225329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yk6XrmlIUFJdPomV6PWM1z6FDlsknQiMyAzUw9gF7Bw=;
 b=JBPWX0LyBkQiSCiC2tNBnlVbaGAIdq7d1+i28ADu76Jeg/j9PEGVnbdNpV8mjLE35EfqmX
 TwECDUjGHXtmjHvrmLJQcYskOls8qXsOfOcKYUFF0JErn4+6MZaYMj0C2//3F1G7ao2Xzp
 VEZSdhfLlvAMpvgqVzfb229xYUYnbpM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-KatLiOhePnK0w0XOF-r77Q-1; Tue, 11 Apr 2023 11:02:07 -0400
X-MC-Unique: KatLiOhePnK0w0XOF-r77Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB56B280048E;
 Tue, 11 Apr 2023 15:02:06 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10CD040BC797;
 Tue, 11 Apr 2023 15:02:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/10] block: move has_variable_length to BlockLimits
Date: Tue, 11 Apr 2023 17:01:40 +0200
Message-Id: <20230411150147.318637-4-kwolf@redhat.com>
In-Reply-To: <20230411150147.318637-1-kwolf@redhat.com>
References: <20230411150147.318637-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

At the protocol level, has_variable_length only needs to be true in the
very special case of host CD-ROM drives, so that they do not need an
explicit monitor command to read the new size when a disc is loaded
in the tray.

However, at the format level has_variable_length has to be true for all
raw blockdevs and for all filters, even though in practice the length
depends on the underlying file and thus will not change except in the
case of host CD-ROM drives.

As a first step towards computing an accurate value of has_variable_length,
add the value into the BlockLimits structure and initialize the field
from the BlockDriver.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20230407153303.391121-2-pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h | 8 ++++++++
 block.c                          | 2 +-
 block/io.c                       | 6 ++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d419017328..a6d271f25d 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -855,6 +855,14 @@ typedef struct BlockLimits {
 
     /* maximum number of iovec elements */
     int max_iov;
+
+    /*
+     * true if the length of the underlying file can change, and QEMU
+     * is expected to adjust automatically.  Mostly for CD-ROM drives,
+     * whose length is zero when the tray is empty (they don't need
+     * an explicit monitor command to load the disk inside the guest).
+     */
+    bool has_variable_length;
 } BlockLimits;
 
 typedef struct BdrvOpBlocker BdrvOpBlocker;
diff --git a/block.c b/block.c
index e0c6c648b1..6a805ff0ea 100644
--- a/block.c
+++ b/block.c
@@ -5849,7 +5849,7 @@ int64_t coroutine_fn bdrv_co_nb_sectors(BlockDriverState *bs)
     if (!drv)
         return -ENOMEDIUM;
 
-    if (drv->has_variable_length) {
+    if (bs->bl.has_variable_length) {
         int ret = bdrv_co_refresh_total_sectors(bs, bs->total_sectors);
         if (ret < 0) {
             return ret;
diff --git a/block/io.c b/block/io.c
index 8974d46941..932aeb5844 100644
--- a/block/io.c
+++ b/block/io.c
@@ -182,6 +182,8 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
                                 drv->bdrv_aio_preadv ||
                                 drv->bdrv_co_preadv_part) ? 1 : 512;
 
+    bs->bl.has_variable_length = drv->has_variable_length;
+
     /* Take some limits from the children as a default */
     have_limits = false;
     QLIST_FOREACH(c, &bs->children, next) {
@@ -190,6 +192,10 @@ void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
             bdrv_merge_limits(&bs->bl, &c->bs->bl);
             have_limits = true;
         }
+
+        if (c->role & BDRV_CHILD_FILTERED) {
+            bs->bl.has_variable_length |= c->bs->bl.has_variable_length;
+        }
     }
 
     if (!have_limits) {
-- 
2.39.2


