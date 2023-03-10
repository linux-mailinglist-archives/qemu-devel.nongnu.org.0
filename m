Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057096B4FA5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagy0-0003mJ-7Q; Fri, 10 Mar 2023 12:55:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagxx-0003kL-9j
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagxv-0002pE-2b
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678470937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RitocbdoLpW1Xp/b3/4Z4VLVmr1YkektDJZ1jjja9s=;
 b=Xr7qVs5tQo8ZFIOQujRCyshpswBf8ydxuv/x1V3T/FPHNQMXrC1TLorV9H+lTI2/3/+d99
 EWoOWqbsX7kNDXytZ7Vuk5aVAcSrpRBWM0BHFgSGKJ1NhVah2Mg5l4nU73QUZgf0I6vnZ7
 zHS6UXaK2ivTpP7IFJzttwcyl9CH4Vk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-8R7yW-RaM5OrbBKbmxelcQ-1; Fri, 10 Mar 2023 12:55:34 -0500
X-MC-Unique: 8R7yW-RaM5OrbBKbmxelcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5EB5811E6E;
 Fri, 10 Mar 2023 17:55:33 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F24021121318;
 Fri, 10 Mar 2023 17:55:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 1/3] block/fuse: Let PUNCH_HOLE write zeroes
Date: Fri, 10 Mar 2023 18:55:27 +0100
Message-Id: <20230310175529.240379-2-kwolf@redhat.com>
In-Reply-To: <20230310175529.240379-1-kwolf@redhat.com>
References: <20230310175529.240379-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Hanna Czenczek <hreitz@redhat.com>

fallocate(2) says about PUNCH_HOLE: "After a successful call, subsequent
reads from this range will return zeros."  As it is, PUNCH_HOLE is
implemented as a call to blk_pdiscard(), which does not guarantee this.

We must call blk_pwrite_zeroes() instead.  The difference to ZERO_RANGE
is that we pass the `BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK` flags to
the call -- the storage is supposed to be unmapped, and a slow fallback
by actually writing zeroes as data is not allowed.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/1507
Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
Message-Id: <20230227104725.33511-2-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/export/fuse.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index e5fc4af165..06fa41079e 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -673,7 +673,16 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         do {
             int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
 
-            ret = blk_pdiscard(exp->common.blk, offset, size);
+            ret = blk_pwrite_zeroes(exp->common.blk, offset, size,
+                                    BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK);
+            if (ret == -ENOTSUP) {
+                /*
+                 * fallocate() specifies to return EOPNOTSUPP for unsupported
+                 * operations
+                 */
+                ret = -EOPNOTSUPP;
+            }
+
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-- 
2.39.2


