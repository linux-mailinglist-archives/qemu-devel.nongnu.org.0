Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1491A6EE2E3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:23:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIVi-0006r2-JG; Tue, 25 Apr 2023 09:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006QK-Ah
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUt-0006aB-4D
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHk8N0f96tL2rJPj52DQrzGBU6ROjgou1ZioErz5vyc=;
 b=NWZH4z2WKmUJu5E20yQKkS673HmAcwLLKypwilsaS6j8qJW9xdlkaRql+pj2W7PilR2zd4
 jHF9YWDU67AhBiodNwHfL9pFcDme328UwuyXndrWn6pj1tBP4R5zIx++AgTstVs9dpeqUn
 UizB0i3fFsFaQEZpQvzAYlqfvAHcA+4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-qDzI0NqCNpC9btpex2oOvw-1; Tue, 25 Apr 2023 09:14:15 -0400
X-MC-Unique: qDzI0NqCNpC9btpex2oOvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAA363C1022A;
 Tue, 25 Apr 2023 13:14:14 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1AE40C2064;
 Tue, 25 Apr 2023 13:14:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 11/25] block: add missing coroutine_fn to
 bdrv_sum_allocated_file_size()
Date: Tue, 25 Apr 2023 15:13:45 +0200
Message-Id: <20230425131359.259007-12-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Hajnoczi <stefanha@redhat.com>

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
Message-Id: <20230308211435.346375-1-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index d79a52ca74..5ec1a3897e 100644
--- a/block.c
+++ b/block.c
@@ -5750,7 +5750,7 @@ exit:
  * sums the size of all data-bearing children.  (This excludes backing
  * children.)
  */
-static int64_t bdrv_sum_allocated_file_size(BlockDriverState *bs)
+static int64_t coroutine_fn bdrv_sum_allocated_file_size(BlockDriverState *bs)
 {
     BdrvChild *child;
     int64_t child_size, sum = 0;
-- 
2.40.0


