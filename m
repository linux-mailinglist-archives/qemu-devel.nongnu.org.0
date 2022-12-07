Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BEA645AAB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uKw-0007gt-94; Wed, 07 Dec 2022 08:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKs-0007ef-2n
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKq-0006TH-2I
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kY/3GCcoTjZRdvJspd0/Zl5zKwpr5doLHuuMLKPJYw=;
 b=Mw0KVX4zCfmTegynqRyxgaO1UCwcB/JGxvVtAYjnT1qKvG41nlmXYHB/Z2/kgA3ORlE6+z
 Wnfz5GjQMZ5sjfZO1pCqtYSnmAtnkSfvnRry0o5xSqpUgqCySA/U8E/ax4n9LEnRkERr5g
 uA0/X+gzDH85UOMzMxN39z5L3a2Fnto=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-VZPXauDsOymQjfIgfX7wqA-1; Wed, 07 Dec 2022 08:19:36 -0500
X-MC-Unique: VZPXauDsOymQjfIgfX7wqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD42C185A794;
 Wed,  7 Dec 2022 13:19:35 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF4B91121314;
 Wed,  7 Dec 2022 13:19:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 10/18] block: Fix locking in external_snapshot_prepare()
Date: Wed,  7 Dec 2022 14:18:30 +0100
Message-Id: <20221207131838.239125-11-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

bdrv_img_create() polls internally (when calling bdrv_create(), which is
a co_wrapper), so it can't be called while holding the lock of any
AioContext except the current one without causing deadlocks. Drop the
lock around the call in external_snapshot_prepare().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c    | 4 ++++
 blockdev.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/block.c b/block.c
index 6191ac1f44..44d59362d6 100644
--- a/block.c
+++ b/block.c
@@ -6924,6 +6924,10 @@ bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
     return true;
 }
 
+/*
+ * Must not be called while holding the lock of an AioContext other than the
+ * current one.
+ */
 void bdrv_img_create(const char *filename, const char *fmt,
                      const char *base_filename, const char *base_fmt,
                      char *options, uint64_t img_size, int flags, bool quiet,
diff --git a/blockdev.c b/blockdev.c
index 8ffb3d9537..011e48df7b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1524,10 +1524,14 @@ static void external_snapshot_prepare(BlkActionState *common,
                 goto out;
             }
             bdrv_refresh_filename(state->old_bs);
+
+            aio_context_release(aio_context);
             bdrv_img_create(new_image_file, format,
                             state->old_bs->filename,
                             state->old_bs->drv->format_name,
                             NULL, size, flags, false, &local_err);
+            aio_context_acquire(aio_context);
+
             if (local_err) {
                 error_propagate(errp, local_err);
                 goto out;
-- 
2.38.1


