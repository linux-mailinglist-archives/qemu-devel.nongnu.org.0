Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF716B139D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 22:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa17X-000361-SR; Wed, 08 Mar 2023 16:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pa17T-00035B-Mp
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 16:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pa17S-0007pW-Aw
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 16:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678310081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8/SIKRDithAjEhANHTT4LO4v/XIQ6z36mmvkIy15cEs=;
 b=GNJOHRQJq2LINIwZdtaNjkXqzzR5obMz1oCWEURTcMItHtd/L5ZxuR5A/a+gpzSuHusBP0
 hxxGo8ro1vi8fQlEhzpmDhNFo/nvwiiFyaDv+NZHQLQvKR2YEKGfKGNEejA9N3lHCjiKMu
 HmEg5d9wD6aV0EVBRkPOlX8/8KAoVXI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-6yCB4JfYOIGrKCoWgiwI5A-1; Wed, 08 Mar 2023 16:14:37 -0500
X-MC-Unique: 6yCB4JfYOIGrKCoWgiwI5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83AC33C0257E;
 Wed,  8 Mar 2023 21:14:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6A3D440D9;
 Wed,  8 Mar 2023 21:14:36 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] block: add missing coroutine_fn to
 bdrv_sum_allocated_file_size()
Date: Wed,  8 Mar 2023 16:14:35 -0500
Message-Id: <20230308211435.346375-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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


