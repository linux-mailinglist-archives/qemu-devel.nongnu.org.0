Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCFF62C037
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIrM-0007if-3I; Wed, 16 Nov 2022 08:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrH-0007Y4-Oz
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovIrF-0002jY-N6
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:53:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QH/+/7UJYS5MtViHT79nNUCSFC9rW6fu+qCQmkWOUeI=;
 b=YfPbvYO8EMnfVsKYVwmSolzmX9h6H2K83iexc0bR2JYBBmXt87i3Fc57zp4zegEBAaNXfx
 HwfgzXoUINqbwH0kf+US0iWpKOlCl3cI5+hbIqRYmocrElgVM58nOu+SEJMWfNf7h2G0jj
 9Gi2t1ufI6irlEiM7LMN+HbdN0osG0g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-afC2oFH9MFiU6PQnct7Kog-1; Wed, 16 Nov 2022 08:53:36 -0500
X-MC-Unique: afC2oFH9MFiU6PQnct7Kog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D5E43C10688;
 Wed, 16 Nov 2022 13:53:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5277340E80E3;
 Wed, 16 Nov 2022 13:53:35 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 2/6] block: assert that BlockDriver->bdrv_co_{amend/create}
 are called with graph rdlock taken
Date: Wed, 16 Nov 2022 08:53:27 -0500
Message-Id: <20221116135331.3052923-3-eesposit@redhat.com>
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

Both functions are only called by Job->run() callbacks, therefore
they must take the lock in the *_run() implementation.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/amend.c                    | 1 +
 block/create.c                   | 1 +
 include/block/block_int-common.h | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/block/amend.c b/block/amend.c
index f696a006e3..a155b6889b 100644
--- a/block/amend.c
+++ b/block/amend.c
@@ -45,6 +45,7 @@ static int coroutine_fn blockdev_amend_run(Job *job, Error **errp)
 {
     BlockdevAmendJob *s = container_of(job, BlockdevAmendJob, common);
     int ret;
+    GRAPH_RDLOCK_GUARD();
 
     job_progress_set_remaining(&s->common, 1);
     ret = s->bs->drv->bdrv_co_amend(s->bs, s->opts, s->force, errp);
diff --git a/block/create.c b/block/create.c
index 4df43f11f4..4048d71265 100644
--- a/block/create.c
+++ b/block/create.c
@@ -43,6 +43,7 @@ static int coroutine_fn blockdev_create_run(Job *job, Error **errp)
     int ret;
 
     GLOBAL_STATE_CODE();
+    GRAPH_RDLOCK_GUARD();
 
     job_progress_set_remaining(&s->common, 1);
     ret = s->drv->bdrv_co_create(s->opts, errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d45961a1d1..1e9bb91c98 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -251,6 +251,7 @@ struct BlockDriver {
                           Error **errp);
     void (*bdrv_close)(BlockDriverState *bs);
 
+    /* Called with graph rdlock taken */
     int coroutine_fn (*bdrv_co_create)(BlockdevCreateOptions *opts,
                                        Error **errp);
     /* Called with graph rdlock taken */
@@ -471,6 +472,7 @@ struct BlockDriver {
 
     int (*bdrv_probe)(const uint8_t *buf, int buf_size, const char *filename);
 
+    /* Called with graph rdlock taken. */
     int coroutine_fn (*bdrv_co_amend)(BlockDriverState *bs,
                                       BlockdevAmendOptions *opts,
                                       bool force,
-- 
2.31.1


