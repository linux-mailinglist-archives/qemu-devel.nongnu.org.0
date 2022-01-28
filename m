Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A34A0417
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:09:52 +0100 (CET)
Received: from localhost ([::1]:49214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaNL-0007oM-3i
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaEl-0005FK-Ka
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:01:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaEg-0006CZ-PR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643410849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oo0zc4lwSaENTPa+/5xfJRoQq2f3HFiWhel286hKfEg=;
 b=Zttr0TU3lswUgw+ywvnuUQ5h+9pXPvRMnvo8l/E3qFBGEsrX3X4vznHBXcsx/LvCgXk89T
 40brP1oyfd8UWs4ZzvvaKVlbACsjoqBrBi7kN14m1A07RWEJcgEX8ARAD0nHev/+U5CY9j
 UXCQx9Mnr9PjX7KuTljFQiqaCl5Fnrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-XGUdnE20MGimJdxgNVkcYQ-1; Fri, 28 Jan 2022 18:00:46 -0500
X-MC-Unique: XGUdnE20MGimJdxgNVkcYQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FA0E51081;
 Fri, 28 Jan 2022 23:00:45 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34475108A0;
 Fri, 28 Jan 2022 23:00:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] block/io: Update BSC only if want_zero is true
Date: Fri, 28 Jan 2022 17:00:02 -0600
Message-Id: <20220128230003.1114719-4-eblake@redhat.com>
In-Reply-To: <20220128230003.1114719-1-eblake@redhat.com>
References: <20220128230003.1114719-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>, qemu-stable@nongnu.org,
 Nir Soffer <nsoffer@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

We update the block-status cache whenever we get new information from a
bdrv_co_block_status() call to the block driver.  However, if we have
passed want_zero=false to that call, it may flag areas containing zeroes
as data, and so we would update the block-status cache with wrong
information.

Therefore, we should not update the cache with want_zero=false.

Reported-by: Nir Soffer <nsoffer@redhat.com>
Fixes: 0bc329fbb00 ("block: block-status cache for data regions")
Reviewed-by: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220118170000.49423-2-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index bb0a254def11..4e4cb556c586 100644
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
2.34.1


