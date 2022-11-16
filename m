Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634A362C029
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImw-0000kE-2Q; Wed, 16 Nov 2022 08:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImp-0000fT-DJ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-000810-2G
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yinl0pSM3o2c/4hIiFf86CIDWq3Dli2+EqExA1nqS7M=;
 b=WzpcMUT9LKixGF3iPYvxaiJwCqKh8ZrB2gQJ4HmLZXe8Ga+Xfw9Da5b/M38eXmSvaDumQU
 Qc6ILhWGbpJYu091m/0ES5tRcl2OoUzzVME9fNCBEsOxrHpzZzR2ba/pj2eHMzGZT4MZ/d
 pvsBhwnXp6OnosDjc/wzCyL5VO6+bfE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-bV-QpyNvM_KvbUuP-8PLAw-1; Wed, 16 Nov 2022 08:48:57 -0500
X-MC-Unique: bV-QpyNvM_KvbUuP-8PLAw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5B94101A52A;
 Wed, 16 Nov 2022 13:48:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 669494A9268;
 Wed, 16 Nov 2022 13:48:56 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 13/20] block-gen: assert that bdrv_co_pwrite_{zeros/sync} is
 always called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:43 -0500
Message-Id: <20221116134850.3051419-14-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

Already protected by bdrv_co_pwrite callers.

Protecting bdrv_co_do_pwrite_zeroes() implies that
BlockDriver->bdrv_co_pwrite_zeroes() is always called with
graph rdlock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c                       | 3 +++
 include/block/block_int-common.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/block/io.c b/block/io.c
index 9280fb9f38..92c74648fb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -904,6 +904,7 @@ int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
 {
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     ret = bdrv_co_pwrite(child, offset, bytes, buf, flags);
     if (ret < 0) {
@@ -1660,6 +1661,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
                         bs->bl.request_alignment);
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer, MAX_BOUNCE_BUFFER);
 
+    assert_bdrv_graph_readable();
     bdrv_check_request(offset, bytes, &error_abort);
 
     if (!drv) {
@@ -2124,6 +2126,7 @@ int coroutine_fn bdrv_co_pwrite_zeroes(BdrvChild *child, int64_t offset,
 {
     IO_CODE();
     trace_bdrv_co_pwrite_zeroes(child->bs, offset, bytes, flags);
+    assert_bdrv_graph_readable();
 
     if (!(child->bs->open_flags & BDRV_O_UNMAP)) {
         flags &= ~BDRV_REQ_MAY_UNMAP;
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d44f825d95..e8d2e4b6c7 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -549,6 +549,8 @@ struct BlockDriver {
      * would use a compact metadata representation to implement this.  This
      * function pointer may be NULL or return -ENOSUP and .bdrv_co_writev()
      * will be called instead.
+     *
+     * Called with graph rdlock taken.
      */
     int coroutine_fn (*bdrv_co_pwrite_zeroes)(BlockDriverState *bs,
         int64_t offset, int64_t bytes, BdrvRequestFlags flags);
-- 
2.31.1


