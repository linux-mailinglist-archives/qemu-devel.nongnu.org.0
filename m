Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB862C03D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:59:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImv-0000k8-UJ; Wed, 16 Nov 2022 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImr-0000gS-Vi
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-00081H-Ek
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wo/qRDH8s57DwZ9+HKzHDxsnu7HebCsUdmJvrjTvAMM=;
 b=etcIl0rhTmH1gH7MGF2XdFUBF4LLAGUHpunrDB5gtS9pDICH8LM670B9c+tJ4RpbsfzvM2
 2kqUGh/rYIHRgnel4Z2VG3iW/0N1gEUiZXq0jZ+/atpDiV5qVNSmrd8QYczUQt1fVA8LdF
 M3NA4lzvHjq+YS6sUs85l/2gvqD6NnM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-UxuLkavBPuuEdQXkAfZTbA-1; Wed, 16 Nov 2022 08:48:58 -0500
X-MC-Unique: UxuLkavBPuuEdQXkAfZTbA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1A93801755;
 Wed, 16 Nov 2022 13:48:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 744944A9265;
 Wed, 16 Nov 2022 13:48:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 16/20] block-gen: assert that bdrv_co_{read/write}v_vmstate
 are always called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:48:46 -0500
Message-Id: <20221116134850.3051419-17-eesposit@redhat.com>
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

The only caller of these functions is bdrv_{read/write}v_vmstate, a
generated_co_wrapper function that already takes the
graph read lock.

Protecting bdrv_co_{read/write}v_vmstate() implies that
BlockDriver->bdrv_{load/save}_vmstate() is always called with
graph rdlock taken.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c                       | 2 ++
 include/block/block_int-common.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/block/io.c b/block/io.c
index 0bf3919939..c9b451fecd 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2633,6 +2633,7 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
     if (ret < 0) {
@@ -2665,6 +2666,7 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
     int ret;
     IO_CODE();
+    assert_bdrv_graph_readable();
 
     ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
     if (ret < 0) {
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index bab0521943..568c2d3092 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -724,9 +724,11 @@ struct BlockDriver {
                                                  Error **errp);
     BlockStatsSpecific *(*bdrv_get_specific_stats)(BlockDriverState *bs);
 
+    /* Called with graph rdlock held. */
     int coroutine_fn (*bdrv_save_vmstate)(BlockDriverState *bs,
                                           QEMUIOVector *qiov,
                                           int64_t pos);
+    /* Called with graph rdlock held. */
     int coroutine_fn (*bdrv_load_vmstate)(BlockDriverState *bs,
                                           QEMUIOVector *qiov,
                                           int64_t pos);
-- 
2.31.1


