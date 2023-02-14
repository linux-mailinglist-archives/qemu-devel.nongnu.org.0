Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5BE696B38
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyv4-0000kl-Ik; Tue, 14 Feb 2023 12:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pRyv2-0000kV-Bx
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:16:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pRyuy-0004Ut-FT
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676394995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+xDnfroDKrE7MZIL3tNRjkakvJkhUC6sm9BW0qIJtbA=;
 b=RbVpZVAqy0sCtUD+vuUVmsv+bOkkNX+94K0b2rP7VlHr490HxVvo6U3LTES3x5K3YlVe0o
 fiAX9EkDi+YhYSDkiXiRacW0KDcQj3N+kUiigRMr8D65bgojamR1SYrim75t1mMP2WKU6r
 7a26GjutrTWEpvdlKH/lIAOLUzzddgk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-NvGvJLidMO6JFUjmaS9dDg-1; Tue, 14 Feb 2023 12:16:28 -0500
X-MC-Unique: NvGvJLidMO6JFUjmaS9dDg-1
Received: by mail-qv1-f71.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso9110753qvb.21
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:16:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+xDnfroDKrE7MZIL3tNRjkakvJkhUC6sm9BW0qIJtbA=;
 b=amQKj9yAu7nHGKzHa4kQTj0WFPsRG2xIP4UX/7HcqG9Vv9dZhAlW7L2CFO57AzHheQ
 SeaWRL+hlXELaFJvS01kZnNBJ9RGuhVuuriTeM4bxs8Fz4wQlszPveq9P33sQ3ZJLSf/
 Kk8ESkcJU47Fxgey1WzadRhdfyO4Kx12ZMb7nlvQNJ5LDVgou9vzdb+WLfUcuHEntGjI
 o5uRNKXCri7rvgdxu+vdAEDRXVWXXxe+7tNYy2wQ2N2UAmsAefzdIPN62ifcOjyG/x/M
 GvTSMAX1eOUEODagZbgd8zyf+AOE6rXgX9csIaOsl/Qq/pYwTpm+PRJZmaX3gF7tc7RG
 bi4g==
X-Gm-Message-State: AO0yUKWm++OZf6gpV4iFQ/CWhCSRoxBn4L1GC+VflN+K9JPohu5ARk0K
 v7vXi9Vof07WpXd9r4zxXBFgrLHgrnjxd5AKxbwPgEEV/3g6ftYVIUeNyFza6Mhga3J5YyErW14
 dsEaUoq/PmZOxQTXNcUyWapettgqcmUEFP8fVsK31KUAIpYZPnAs0nvCSYE48qpbLiHHndjEW
X-Received: by 2002:a05:6214:c48:b0:56e:b21c:61e5 with SMTP id
 r8-20020a0562140c4800b0056eb21c61e5mr5028883qvj.47.1676394986635; 
 Tue, 14 Feb 2023 09:16:26 -0800 (PST)
X-Google-Smtp-Source: AK7set8cDwUez7gIRFbxs2IHqe//zIDFQ5BXdbDef4USZg8Vgoey+E3wKR7WDSuLTRw3K9FgDuxZ0w==
X-Received: by 2002:a05:6214:c48:b0:56e:b21c:61e5 with SMTP id
 r8-20020a0562140c4800b0056eb21c61e5mr5028831qvj.47.1676394986207; 
 Tue, 14 Feb 2023 09:16:26 -0800 (PST)
Received: from step1.redhat.com (host-79-46-200-90.retail.telecomitalia.it.
 [79.46.200.90]) by smtp.gmail.com with ESMTPSA id
 3-20020ac85743000000b003b86d3ca969sm5432104qtx.51.2023.02.14.09.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:16:25 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Aihua Liang <aliang@redhat.com>
Subject: [PATCH v2] block: temporarily hold the new AioContext of bs_top in
 bdrv_append()
Date: Tue, 14 Feb 2023 18:16:21 +0100
Message-Id: <20230214171621.11574-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
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

bdrv_append() is called with bs_top AioContext held, but
bdrv_attach_child_noperm() could change the AioContext of bs_top.

bdrv_replace_node_noperm() calls bdrv_drained_begin() starting from
commit 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()").
bdrv_drained_begin() can call BDRV_POLL_WHILE that assumes the new lock
is taken, so let's temporarily hold the new AioContext to prevent QEMU
from failing in BDRV_POLL_WHILE when it tries to release the wrong
AioContext.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2168209
Reported-by: Aihua Liang <aliang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- released the right lock in the error path [Kevin]
- held the new lock until the end of the function [Kevin]

v1: https://lore.kernel.org/qemu-devel/20230214105156.316586-1-sgarzare@redhat.com/
---
 block.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/block.c b/block.c
index aa9062f2c1..036fce19e0 100644
--- a/block.c
+++ b/block.c
@@ -5266,6 +5266,8 @@ int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
  * child.
  *
  * This function does not create any image files.
+ *
+ * The caller must hold the AioContext lock for @bs_top.
  */
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
@@ -5273,11 +5275,14 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     int ret;
     BdrvChild *child;
     Transaction *tran = tran_new();
+    AioContext *old_context, *new_context = NULL;
 
     GLOBAL_STATE_CODE();
 
     assert(!bs_new->backing);
 
+    old_context = bdrv_get_aio_context(bs_top);
+
     child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
                                      &child_of_bds, bdrv_backing_role(bs_new),
                                      tran, errp);
@@ -5286,6 +5291,19 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
+    /*
+     * bdrv_attach_child_noperm could change the AioContext of bs_top.
+     * bdrv_replace_node_noperm calls bdrv_drained_begin, so let's temporarily
+     * hold the new AioContext, since bdrv_drained_begin calls BDRV_POLL_WHILE
+     * that assumes the new lock is taken.
+     */
+    new_context = bdrv_get_aio_context(bs_top);
+
+    if (old_context != new_context) {
+        aio_context_release(old_context);
+        aio_context_acquire(new_context);
+    }
+
     ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
     if (ret < 0) {
         goto out;
@@ -5297,6 +5315,11 @@ out:
 
     bdrv_refresh_limits(bs_top, NULL, NULL);
 
+    if (new_context && old_context != new_context) {
+        aio_context_release(new_context);
+        aio_context_acquire(old_context);
+    }
+
     return ret;
 }
 
-- 
2.39.1


