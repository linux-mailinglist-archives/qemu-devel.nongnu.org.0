Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CF678728
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:05:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK33f-0003w0-CZ; Mon, 23 Jan 2023 15:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33X-0003rq-6G
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pK33U-0005jw-01
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674504271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBjPg5PzJ5sOh9yR6sFRUSXxSz+BW0v18YTeNVXw93Y=;
 b=GtFwWNcf59n53BDKq1ehp778WGHcMoGkWes2aNaEDKtqkKeSTQCjmMN0CNWbd9etm/rD7M
 opPuoPfwyskACww8IuIwwn1NIa9YHEvGaCGoxTcPq3XZ6L1rd8ZGssiuQOfMB5uvBvYu2C
 iNcGaJqH8UvAl67ZxVz9tr8pLN3OaHY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-1Wq8hbefOZqx5KbINNDb9w-1; Mon, 23 Jan 2023 15:04:27 -0500
X-MC-Unique: 1Wq8hbefOZqx5KbINNDb9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACC141C189A1;
 Mon, 23 Jan 2023 20:04:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C612C15BA0;
 Mon, 23 Jan 2023 20:04:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 3/3] block/blkio: Fix inclusion of required headers
Date: Mon, 23 Jan 2023 15:04:17 -0500
Message-Id: <20230123200417.169053-4-stefanha@redhat.com>
In-Reply-To: <20230123200417.169053-1-stefanha@redhat.com>
References: <20230123200417.169053-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

From: Peter Krempa <pkrempa@redhat.com>

After recent header file inclusion rework the build fails when the blkio
module is enabled:

../block/blkio.c: In function ‘blkio_detach_aio_context’:
../block/blkio.c:321:24: error: implicit declaration of function ‘bdrv_get_aio_context’; did you mean ‘qemu_get_aio_context’? [-Werror=implicit-function-declaration]
  321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
      |                        ^~~~~~~~~~~~~~~~~~~~
      |                        qemu_get_aio_context
../block/blkio.c:321:24: error: nested extern declaration of ‘bdrv_get_aio_context’ [-Werror=nested-externs]
../block/blkio.c:321:24: error: passing argument 1 of ‘aio_set_fd_handler’ makes pointer from integer without a cast [-Werror=int-conversion]
  321 |     aio_set_fd_handler(bdrv_get_aio_context(bs),
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~
      |                        |
      |                        int
In file included from /home/pipo/git/qemu.git/include/qemu/job.h:33,
                 from /home/pipo/git/qemu.git/include/block/blockjob.h:30,
                 from /home/pipo/git/qemu.git/include/block/block_int-global-state.h:28,
                 from /home/pipo/git/qemu.git/include/block/block_int.h:27,
                 from ../block/blkio.c:13:
/home/pipo/git/qemu.git/include/block/aio.h:476:37: note: expected ‘AioContext *’ but argument is of type ‘int’
  476 | void aio_set_fd_handler(AioContext *ctx,
      |                         ~~~~~~~~~~~~^~~
../block/blkio.c: In function ‘blkio_file_open’:
../block/blkio.c:821:34: error: passing argument 2 of ‘blkio_attach_aio_context’ makes pointer from integer without a cast [-Werror=int-conversion]
  821 |     blkio_attach_aio_context(bs, bdrv_get_aio_context(bs));
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                  |
      |                                  int

Fix it by including 'block/block-io.h' which contains the required
declarations.

Fixes: e2c1c34f139f49ef909bb4322607fb8b39002312
Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 2bc956011404a1ab03342aefde0087b5b4762562.1674477350.git.pkrempa@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/blkio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/blkio.c b/block/blkio.c
index 5eae3adfaf..6ad86b23d1 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -19,6 +19,8 @@
 #include "qemu/module.h"
 #include "exec/memory.h" /* for ram_block_discard_disable() */
 
+#include "block/block-io.h"
+
 /*
  * Keep the QEMU BlockDriver names identical to the libblkio driver names.
  * Using macros instead of typing out the string literals avoids typos.
-- 
2.39.0


