Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EA946EB1B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:26:04 +0100 (CET)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLJ5-000324-Bo
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:26:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvLFo-0006Sb-0q
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:22:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvLFl-0000Rk-Fi
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639063355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LILtCWFZXwrUjsjxSL9DCVD9cFqDqkPTnD4ChBgUzFU=;
 b=cxgvo+5YqRZB8eRQi/E59P2urzoYD6QwRCcMR013M89Mibryil6IhQOpmibVH3ym/1hCn7
 bHXvvqVh9OHCTowMqCZW6IZjqPla2am+LBRwmnNf121D9hzWoz6xlvqBMsCfeMx+VzKoyg
 tEpnrCuezQO/9eJngg3xnVkSZSpqDok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-by83AjBCPnWlyMp_wh3p7w-1; Thu, 09 Dec 2021 10:22:25 -0500
X-MC-Unique: by83AjBCPnWlyMp_wh3p7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58D2D100C660;
 Thu,  9 Dec 2021 15:22:24 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 820465BE0A;
 Thu,  9 Dec 2021 15:22:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] vvfat: Fix size of temporary qcow file
Date: Thu,  9 Dec 2021 16:18:15 +0100
Message-Id: <20211209151815.23495-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The size of the qcow size was calculated so that only the FAT partition
would fit on it, but not the whole disk. However, offsets relative to
the whole disk are used to access it, so increase its size to be large
enough for that.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vvfat.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index 05e78e3c27..9deb552e0e 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -1230,6 +1230,7 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
                  dirname, cyls, heads, secs));
 
     s->sector_count = cyls * heads * secs - s->offset_to_bootsector;
+    bs->total_sectors = cyls * heads * secs;
 
     if (qemu_opt_get_bool(opts, "rw", false)) {
         if (!bdrv_is_read_only(bs)) {
@@ -1250,8 +1251,6 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
         }
     }
 
-    bs->total_sectors = cyls * heads * secs;
-
     if (init_directories(s, dirname, heads, secs, errp)) {
         ret = -EIO;
         goto fail;
@@ -3137,8 +3136,8 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
     }
 
     opts = qemu_opts_create(bdrv_qcow->create_opts, NULL, 0, &error_abort);
-    qemu_opt_set_number(opts, BLOCK_OPT_SIZE, s->sector_count * 512,
-                        &error_abort);
+    qemu_opt_set_number(opts, BLOCK_OPT_SIZE,
+                        bs->total_sectors * BDRV_SECTOR_SIZE, &error_abort);
     qemu_opt_set(opts, BLOCK_OPT_BACKING_FILE, "fat:", &error_abort);
 
     ret = bdrv_create(bdrv_qcow, s->qcow_filename, opts, errp);
-- 
2.31.1


