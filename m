Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480DB6B14E4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:19:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa26d-0008HF-Fn; Wed, 08 Mar 2023 17:17:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pa26Z-0008GS-Ps
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:17:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pa26Y-0007TS-7M
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678313869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8/SIKRDithAjEhANHTT4LO4v/XIQ6z36mmvkIy15cEs=;
 b=FI/ihz1KFzyEGLLd90+fPg5J8P7fcln/e/15PDzKZz1OSvTMbo9TEdyBoH6VmWAuFG5+5H
 dZhYxymSDocrnNzs+JLqwP7Nh56Ls8WmiCNAxXLNbGiGZLLacJtHBtOiAEgmkfypB8wFaW
 rXJxlpMJ+uVuxaOvNAc9s8hcYbKExDw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-NeSxp5bDPNSRqUTCilz8TQ-1; Wed, 08 Mar 2023 17:17:41 -0500
X-MC-Unique: NeSxp5bDPNSRqUTCilz8TQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E0DC185A794;
 Wed,  8 Mar 2023 22:17:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BAD240C945A;
 Wed,  8 Mar 2023 22:17:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2] block: add missing coroutine_fn to
 bdrv_sum_allocated_file_size()
Date: Wed,  8 Mar 2023 17:17:39 -0500
Message-Id: <20230308221739.352066-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

Not a coroutine_fn, you say?

  static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
  {
      BdrvChild *child;
      int64_t child_size, sum = 0;

      QLIST_FOREACH(child, &bs->children, next) {
          if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                             BDRV_CHILD_FILTERED))
          {
              child_size = bdrv_co_get_allocated_file_size(child->bs);
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Well what do we have here?!

I rest my case, your honor.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 0dd604d0f6..a79297f99b 100644
--- a/block.c
+++ b/block.c
@@ -5749,7 +5749,7 @@ exit:
  * sums the size of all data-bearing children.  (This excludes backing
  * children.)
  */
-static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn bdrv_sum_allocated_file_size(BlockDriverState *bs)
 {
     BdrvChild *child;
     int64_t child_size, sum = 0;
-- 
2.39.2


