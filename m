Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98724621175
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNs7-00080o-Dk; Tue, 08 Nov 2022 07:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrm-0007lJ-Do
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrg-0000xW-VR
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aASdHM9LagztoXP2FajDKQImWulyF1tSzWXi9fWzA68=;
 b=IDEg3XnQzipWP5W3C3OyYj5nagdYzEVs+0xTdWPg8Bbe/7zPHDxzKT9HxfvB7Q0RDa3lMI
 FekXk3rcP07dg4fnCwQlZ7doEMezrO003VGp2w4M0y63b7Nox75rR2gIKPb7Bh97GiRqk/
 3xiiY4Capu+jHhTfqrfkHF8QAqt9/EM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-LbHrORqhM9Kows41wFC5RQ-1; Tue, 08 Nov 2022 07:38:03 -0500
X-MC-Unique: LbHrORqhM9Kows41wFC5RQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70ADA3817A67;
 Tue,  8 Nov 2022 12:38:02 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 569249E70;
 Tue,  8 Nov 2022 12:38:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 07/13] block: Don't use subtree drains in
 bdrv_drop_intermediate()
Date: Tue,  8 Nov 2022 13:37:32 +0100
Message-Id: <20221108123738.530873-8-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Instead of using a subtree drain from the top node (which also drains
child nodes of base that we're not even interested in), use a normal
drain for base, which automatically drains all of the parents, too.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 5828b970e4..2f6b25875f 100644
--- a/block.c
+++ b/block.c
@@ -5581,7 +5581,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
     GLOBAL_STATE_CODE();
 
     bdrv_ref(top);
-    bdrv_subtree_drained_begin(top);
+    bdrv_drained_begin(base);
 
     if (!top->drv || !base->drv) {
         goto exit;
@@ -5654,7 +5654,7 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
 
     ret = 0;
 exit:
-    bdrv_subtree_drained_end(top);
+    bdrv_drained_end(base);
     bdrv_unref(top);
     return ret;
 }
-- 
2.38.1


