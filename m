Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FBF5E7D45
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 16:37:26 +0200 (CEST)
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1objnx-0004pJ-4U
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 10:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1objfg-0000AX-D0
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1objfe-00038h-42
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663943329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ARDOS8EtbuwxH5nVp8ajQV+fQayiY4lSim3rjBYgN+Q=;
 b=aHv+eAaLmmszHm+ZLEIumz+yHp4LhFzywpzB9jQM9us4iTskXvHKB5+M5jJTwF7INMGP4g
 DIRyuYUVQNPinLL6dL7Zv1DiFtuM059jp/JjklBx0oBbqyldOw1uhanw/UXwCiEyHt72W7
 HS4Grz+6IQweyafzzdabLpaysxXJPP0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-2oCYjnf5N2-aC2ZbNNpYpg-1; Fri, 23 Sep 2022 10:28:46 -0400
X-MC-Unique: 2oCYjnf5N2-aC2ZbNNpYpg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C78633C0F686;
 Fri, 23 Sep 2022 14:28:45 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7AD0492B04;
 Fri, 23 Sep 2022 14:28:44 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, luzhipeng@cestc.cn,
 qemu-devel@nongnu.org
Subject: [PATCH] file-posix: Remove unused s->discard_zeroes
Date: Fri, 23 Sep 2022 16:28:38 +0200
Message-Id: <20220923142838.91043-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The field is unused (only ever set, but never read) since commit
ac9185603. Additionally, the commit message of commit 34fa110e already
explained earlier why it's unreliable. Remove it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 256de1f456..47c14430c8 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -154,7 +154,6 @@ typedef struct BDRVRawState {
 
     bool has_discard:1;
     bool has_write_zeroes:1;
-    bool discard_zeroes:1;
     bool use_linux_aio:1;
     bool use_linux_io_uring:1;
     int page_cache_inconsistent; /* errno from fdatasync failure */
@@ -755,7 +754,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             ret = -EINVAL;
             goto fail;
         } else {
-            s->discard_zeroes = true;
             s->has_fallocate = true;
         }
     } else {
@@ -769,19 +767,12 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
     }
 
     if (S_ISBLK(st.st_mode)) {
-#ifdef BLKDISCARDZEROES
-        unsigned int arg;
-        if (ioctl(s->fd, BLKDISCARDZEROES, &arg) == 0 && arg) {
-            s->discard_zeroes = true;
-        }
-#endif
 #ifdef __linux__
         /* On Linux 3.10, BLKDISCARD leaves stale data in the page cache.  Do
          * not rely on the contents of discarded blocks unless using O_DIRECT.
          * Same for BLKZEROOUT.
          */
         if (!(bs->open_flags & BDRV_O_NOCACHE)) {
-            s->discard_zeroes = false;
             s->has_write_zeroes = false;
         }
 #endif
-- 
2.37.3


