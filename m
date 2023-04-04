Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D64956D5F3D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 13:39:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjeze-00017M-KB; Tue, 04 Apr 2023 07:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjezb-00016q-Cd
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pjeza-0003SX-1d
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680608305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rbvKIXfSNN1KTIF8TOv/5LXnSXVqrxwq+jrZxoGhmG0=;
 b=hGUa/kGhmR+l1ciff9Gtho7PG/O/CX1JpEV33jVPYxAWJfTv0bMuOkMJGrjSYo35V15+UR
 4qYAmRBZ6htkWbdxneX5xM03oxsML/eD1+7S4xENwu3TzzpEsiuG544sO9zXIwn6bUQ2J2
 265KUDwdSnqlnuPN9xHRp7Ci/o+cf+Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-HtvMFCLvNcO7e1iJMg17rQ-1; Tue, 04 Apr 2023 07:38:22 -0400
X-MC-Unique: HtvMFCLvNcO7e1iJMg17rQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB4AD800B23;
 Tue,  4 Apr 2023 11:38:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 596AA2166B26;
 Tue,  4 Apr 2023 11:38:21 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] block/nvme: use AIO_WAIT_WHILE_UNLOCKED()
Date: Tue,  4 Apr 2023 07:20:44 -0400
Message-Id: <20230404112044.427062-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

A few Admin Queue commands are submitted during nvme_file_open(). They
are synchronous since device initialization cannot continue until the
commands complete.

AIO_WAIT_WHILE() is currently used, but the block/nvme.c code actually
doesn't rely on the AioContext lock. Replace it with
AIO_WAIT_WHILE_UNLOCKED(NULL, condition). There is no change in behavior
and the dependency on the AioContext lock is eliminated.

This is a step towards removing the AioContext lock.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nvme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 5b744c2bda..829b9c04db 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -512,7 +512,6 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
 {
     BDRVNVMeState *s = bs->opaque;
     NVMeQueuePair *q = s->queues[INDEX_ADMIN];
-    AioContext *aio_context = bdrv_get_aio_context(bs);
     NVMeRequest *req;
     int ret = -EINPROGRESS;
     req = nvme_get_free_req_nowait(q);
@@ -521,7 +520,7 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
     }
     nvme_submit_command(q, req, cmd, nvme_admin_cmd_sync_cb, &ret);
 
-    AIO_WAIT_WHILE(aio_context, ret == -EINPROGRESS);
+    AIO_WAIT_WHILE_UNLOCKED(NULL, ret == -EINPROGRESS);
     return ret;
 }
 
-- 
2.39.2


