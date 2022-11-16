Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAC62C074
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImx-0000kh-3h; Wed, 16 Nov 2022 08:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImr-0000gQ-R9
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-00080g-Ei
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mro4V6JNIQKqh1xbG4rtdd/lPqkptajad1lwxt70p2k=;
 b=iSV0RX6jPYB7n291azve8PH2yvHpCykDT8k9Cu6uuWcJlZsuYXk6/8GL2wNnK3IRtm+R/d
 BV7NRZGf0ZSj+SxN8WTAWxVIA7NtSv2wWuHuu+p2h3FxinuFkTg211b5KVdrsnJCGxI/oq
 n7z1fGhiAJxN5o7pqeXViRJtpig56TA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-33CxAhczMsee5qBMhDjQlg-1; Wed, 16 Nov 2022 08:48:56 -0500
X-MC-Unique: 33CxAhczMsee5qBMhDjQlg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F1F811E75;
 Wed, 16 Nov 2022 13:48:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF7A4A9266;
 Wed, 16 Nov 2022 13:48:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 11/20] block-gen: assert that bdrv_co_{check/invalidate_cache}
 are always called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:41 -0500
Message-Id: <20221116134850.3051419-12-eesposit@redhat.com>
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

The only callers of these functions are the respective
generated_co_wrapper, and they already take the lock.

Protecting bdrv_co_{check/invalidate_cache}() implies that
BlockDriver->bdrv_co_{check/invalidate_cache}() is always called with
graph rdlock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                          | 2 ++
 include/block/block_int-common.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/block.c b/block.c
index 1c870d85e6..c7611bed9e 100644
--- a/block.c
+++ b/block.c
@@ -5375,6 +5375,7 @@ int coroutine_fn bdrv_co_check(BlockDriverState *bs,
                                BdrvCheckResult *res, BdrvCheckMode fix)
 {
     IO_CODE();
+    assert_bdrv_graph_readable();
     if (bs->drv == NULL) {
         return -ENOMEDIUM;
     }
@@ -6590,6 +6591,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
     IO_CODE();
 
     assert(!(bs->open_flags & BDRV_O_INACTIVE));
+    assert_bdrv_graph_readable();
 
     if (bs->drv->bdrv_co_invalidate_cache) {
         bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d666b0c441..f285a6b8f7 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -641,6 +641,7 @@ struct BlockDriver {
 
     /*
      * Invalidate any cached meta-data.
+     * Called with graph rdlock held.
      */
     void coroutine_fn (*bdrv_co_invalidate_cache)(BlockDriverState *bs,
                                                   Error **errp);
@@ -726,6 +727,7 @@ struct BlockDriver {
     /*
      * Returns 0 for completed check, -errno for internal errors.
      * The check results are stored in result.
+     * Called with graph rdlock held.
      */
     int coroutine_fn (*bdrv_co_check)(BlockDriverState *bs,
                                       BdrvCheckResult *result,
-- 
2.31.1


