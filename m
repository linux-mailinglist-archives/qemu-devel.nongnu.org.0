Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4708962C09F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:12:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ52-000112-PD; Wed, 16 Nov 2022 09:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4s-0000l9-WD
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4q-00068P-1Q
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aSbumGyBQHztlg3imwPXMNJnG2wiSX+4N94DeWeRBMI=;
 b=QisKXrTXjGMAs4e0LDRv7cDuvMW4Fr6ptZAmTVQbITGEvPDMWtKzlL2AeWpDQ3XXUpR0EG
 XMUm7vOPL+JtJPs6v701Jl4I5OB2J7Mv3AlBxyFdh8sFoyVcTRoHoB6lus/53kczWFP2n0
 IVLwk6UvYKpA8d1xDXXLIm6fPzRPoLI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-LMHVf8tVMs2Khcoi0OG54w-1; Wed, 16 Nov 2022 09:07:38 -0500
X-MC-Unique: LMHVf8tVMs2Khcoi0OG54w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90A7F3810D37;
 Wed, 16 Nov 2022 14:07:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 019C6C2C8C9;
 Wed, 16 Nov 2022 14:07:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 05/15] block: use bdrv_co_refresh_total_sectors when possible
Date: Wed, 16 Nov 2022 09:07:20 -0500
Message-Id: <20221116140730.3056048-6-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In some places we are sure we are always running in a
coroutine, therefore it's useless to call the generated_co_wrapper,
instead call directly the _co_ function.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c | 6 +++---
 block/copy-on-read.c  | 2 +-
 block/io.c            | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index fc19cf423e..6a84a2a019 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1235,8 +1235,8 @@ void blk_set_disable_request_queuing(BlockBackend *blk, bool disable)
     blk->disable_request_queuing = disable;
 }
 
-static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
-                                  int64_t bytes)
+static coroutine_fn int blk_check_byte_request(BlockBackend *blk,
+                                               int64_t offset, int64_t bytes)
 {
     int64_t len;
 
@@ -1253,7 +1253,7 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
     }
 
     if (!blk->allow_write_beyond_eof) {
-        len = bdrv_getlength(blk_bs(blk));
+        len = bdrv_co_getlength(blk_bs(blk));
         if (len < 0) {
             return len;
         }
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 815ac1d835..74f7727a02 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -122,7 +122,7 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
 
 static int64_t cor_getlength(BlockDriverState *bs)
 {
-    return bdrv_getlength(bs->file->bs);
+    return bdrv_co_getlength(bs->file->bs);
 }
 
 
diff --git a/block/io.c b/block/io.c
index 99867fe148..3f65c57f82 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3381,7 +3381,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     if (new_bytes && backing) {
         int64_t backing_len;
 
-        backing_len = bdrv_getlength(backing->bs);
+        backing_len = bdrv_co_getlength(backing->bs);
         if (backing_len < 0) {
             ret = backing_len;
             error_setg_errno(errp, -ret, "Could not get backing file size");
@@ -3411,7 +3411,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         goto out;
     }
 
-    ret = bdrv_refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
+    ret = bdrv_co_refresh_total_sectors(bs, offset >> BDRV_SECTOR_BITS);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not refresh total sector count");
     } else {
-- 
2.31.1


