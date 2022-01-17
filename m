Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6167490C85
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 17:30:41 +0100 (CET)
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Utw-0003N2-J0
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 11:30:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9Uqa-0000ao-Q3
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:27:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9UqW-00012O-Dd
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 11:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642436823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RanLABclwS1rxfLdARyAScIv31MGF+bW4scJmZngNJQ=;
 b=I5aaw7RuDceY3sZpONNOpeuE9a3quNscj2d/ZjNZRuLq04RGLs/7KLTw68R2RHgrvKwHup
 B2N3ERHrFWki+dmuQaSptl5u8/wCmi2ffqM5vLsrpLoXYcAEVSpVfDWJhq2ZWaZ7zLW6CI
 fPTdjMmsXsMQOMDvK3li538G+j6Kgc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-zWB-XJ_jMOaU7y7vjtsfQw-1; Mon, 17 Jan 2022 11:26:55 -0500
X-MC-Unique: zWB-XJ_jMOaU7y7vjtsfQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B3D31083F62;
 Mon, 17 Jan 2022 16:26:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AFF105B950;
 Mon, 17 Jan 2022 16:26:53 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block/io: Update BSC only if want_zero is true
Date: Mon, 17 Jan 2022 17:26:48 +0100
Message-Id: <20220117162649.193501-2-hreitz@redhat.com>
In-Reply-To: <20220117162649.193501-1-hreitz@redhat.com>
References: <20220117162649.193501-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We update the block-status cache whenever we get new information from a
bdrv_co_block_status() call to the block driver.  However, if we have
passed want_zero=false to that call, it may flag areas containing zeroes
as data, and so we would update the block-status cache with wrong
information.

Therefore, we should not update the cache with want_zero=false.

Reported-by: Nir Soffer <nsoffer@redhat.com>
Fixes: 0bc329fbb009f8601cec23bf2bc48ead0c5a5fa2
       ("block: block-status cache for data regions")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/io.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index bb0a254def..4e4cb556c5 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2497,8 +2497,12 @@ static int coroutine_fn bdrv_co_block_status(BlockDriverState *bs,
              * non-protocol nodes, and then it is never used.  However, filling
              * the cache requires an RCU update, so double check here to avoid
              * such an update if possible.
+             *
+             * Check want_zero, because we only want to update the cache when we
+             * have accurate information about what is zero and what is data.
              */
-            if (ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
+            if (want_zero &&
+                ret == (BDRV_BLOCK_DATA | BDRV_BLOCK_OFFSET_VALID) &&
                 QLIST_EMPTY(&bs->children))
             {
                 /*
-- 
2.33.1


