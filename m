Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A191062C02B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:54:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImz-0000nu-Pd; Wed, 16 Nov 2022 08:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImt-0000iT-VR
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImm-00080a-4l
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjkJK6fNxX7PuZBAO179pYQpUeHznsG1I0kwLAp/h5g=;
 b=VomFCq5EJFZ2Jiqa8Rx47MbR5bQcXH6B3cnAPI5CU21FS8XDt9L1uZEZvSJP1Xvx1ctr66
 F/xdRISloyYXsgvjYY+NhwK7KSSCXT4FHO7/4BZNgsTb6PS3m75OqHXrvfDel2YYCZiHmu
 BXiN2zl9aneTg+7Jonj1+qUwqVUrtfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-9hvFmt71McqzwyPi_hupHg-1; Wed, 16 Nov 2022 08:48:56 -0500
X-MC-Unique: 9hvFmt71McqzwyPi_hupHg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A636385A5B6;
 Wed, 16 Nov 2022 13:48:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 598604A9266;
 Wed, 16 Nov 2022 13:48:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 10/20] block-gen: assert that {bdrv/blk}_co_truncate is always
 called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:40 -0500
Message-Id: <20221116134850.3051419-11-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

This function, in addition to be called by a generated_co_wrapper,
is also called by the blk_* API.
The strategy is to always take the lock at the function called
when the coroutine is created, to avoid recursive locking.

Protecting bdrv_co_truncate() implies that
BlockDriver->bdrv_co_truncate() is always called with
graph rdlock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-backend.c            | 1 +
 block/io.c                       | 1 +
 include/block/block_int-common.h | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index 333d50fb3f..0686cd6942 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2370,6 +2370,7 @@ int coroutine_fn blk_co_truncate(BlockBackend *blk, int64_t offset, bool exact,
                                  Error **errp)
 {
     IO_OR_GS_CODE();
+    GRAPH_RDLOCK_GUARD();
     if (!blk_is_available(blk)) {
         error_setg(errp, "No medium inserted");
         return -ENOMEDIUM;
diff --git a/block/io.c b/block/io.c
index 9bcb19e5ee..ac12725fb2 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3295,6 +3295,7 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     int64_t old_size, new_bytes;
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     /* if bs->drv == NULL, bs is closed, so there's nothing to do here */
     if (!drv) {
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index fd9f40a815..d666b0c441 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -681,6 +681,8 @@ struct BlockDriver {
      *
      * If @exact is true and this function fails but would succeed
      * with @exact = false, it should return -ENOTSUP.
+     *
+     * Called with graph rdlock held.
      */
     int coroutine_fn (*bdrv_co_truncate)(BlockDriverState *bs, int64_t offset,
                                          bool exact, PreallocMode prealloc,
-- 
2.31.1


