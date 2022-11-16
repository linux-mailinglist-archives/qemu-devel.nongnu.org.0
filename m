Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A262C05C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:03:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIrJ-0007cC-FB; Wed, 16 Nov 2022 08:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrG-0007Uc-Fl
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrE-0002ih-HY
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNpqTpAQbuZtCAGRbUHSH2DtrE1j72lEjkUIqHAQEgE=;
 b=Dr1jaqMaLXowBE2a+UngA0nuz4fKOrKOe/Itis1c6EAca5l79I692JdZTq0zedRZjz2mgh
 Dt+Q6e21HqD1A+w3f8ETJPW4bo0fqaHugawUSk48JlRRlbYIg9tpCbXhBoDXyH6472SY6t
 QSq6MzhAsclDh46SBIB+AjcDoA3hmoA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-rSIcNVqQOi2vVx4yrjz13g-1; Wed, 16 Nov 2022 08:53:36 -0500
X-MC-Unique: rSIcNVqQOi2vVx4yrjz13g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51B55811E7A;
 Wed, 16 Nov 2022 13:53:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 067BD40C6EC3;
 Wed, 16 Nov 2022 13:53:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 4/6] block/dirty-bitmap: assert that
 BlockDriver->bdrv_co_*_dirty_bitmap are always called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:53:29 -0500
Message-Id: <20221116135331.3052923-5-eesposit@redhat.com>
In-Reply-To: <20221116135331.3052923-1-eesposit@redhat.com>
References: <20221116135331.3052923-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

The only callers are the respective bdrv_*_dirty_bitmap() functions that
take care of creating a new coroutine (that already takes the graph
rdlock).

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/dirty-bitmap.c             | 2 ++
 include/block/block_int-common.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 21cf592889..92c70a7282 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -392,6 +392,7 @@ int coroutine_fn
 bdrv_co_remove_persistent_dirty_bitmap(BlockDriverState *bs, const char *name,
                                        Error **errp)
 {
+    assert_bdrv_graph_readable();
     if (bs->drv && bs->drv->bdrv_co_remove_persistent_dirty_bitmap) {
         return bs->drv->bdrv_co_remove_persistent_dirty_bitmap(bs, name, errp);
     }
@@ -413,6 +414,7 @@ bdrv_co_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                    uint32_t granularity, Error **errp)
 {
     BlockDriver *drv = bs->drv;
+    assert_bdrv_graph_readable();
 
     if (!drv) {
         error_setg_errno(errp, ENOMEDIUM,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 9e441cb93b..3064822508 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -789,9 +789,11 @@ struct BlockDriver {
     void (*bdrv_drain_end)(BlockDriverState *bs);
 
     bool (*bdrv_supports_persistent_dirty_bitmap)(BlockDriverState *bs);
+    /* Called with graph rdlock held. */
     bool coroutine_fn (*bdrv_co_can_store_new_dirty_bitmap)(
         BlockDriverState *bs, const char *name, uint32_t granularity,
         Error **errp);
+    /* Called with graph rdlock held. */
     int coroutine_fn (*bdrv_co_remove_persistent_dirty_bitmap)(
         BlockDriverState *bs, const char *name, Error **errp);
 };
-- 
2.31.1


