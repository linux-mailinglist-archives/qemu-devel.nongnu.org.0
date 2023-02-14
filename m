Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A669617D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 11:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRsuu-00047b-Jn; Tue, 14 Feb 2023 05:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pRsus-00046h-HS
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:52:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pRsuq-00083p-QL
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 05:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676371923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wPoppuO/EDNvrC99t5QiUeZdA+Npz0EmIu2FD4IBuwM=;
 b=VbEaSjfBBEaz5q4s+06wdpLW622vjz3/ZfgcKQ6ExJMzqnWZr2AGa+BVx5HkTfT3t5d22m
 a34g5VF93UELJKL2NFN1b/WxcQy5Ng1eYvn6IfH2yd+Yp6cwMnwi5t2pFIqOLlxp/SUZaO
 0Tk263kELyogPVGFhChJABBodf0A4a4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-c3xWlg8nNvyagCafd5R2Nw-1; Tue, 14 Feb 2023 05:52:02 -0500
X-MC-Unique: c3xWlg8nNvyagCafd5R2Nw-1
Received: by mail-qt1-f198.google.com with SMTP id
 hf20-20020a05622a609400b003abcad051d2so9026152qtb.12
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 02:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wPoppuO/EDNvrC99t5QiUeZdA+Npz0EmIu2FD4IBuwM=;
 b=PNjRL3Tdg5yIhT5TPhKoexnmdyO/b2ROM+XyF3e44gvf2PAwCQZThc8+Uy8TRM13Vy
 0MLAQWEeG49o6eyXi0yjj9/hTf+pfQYEgWRkZTnfSke4Dg2VHwbml+apK41N3eAGyA3X
 0OZjdTJqO3JlKo/OqL98k4Cy2yrwM8OLmpmifJUBgBSEORyiRXR73QfriGCBBT7aYKS7
 7mFkWcoHk0tXB5vWUAGDxjW4OiAsEBSXlg/SDY2aqy8gBk49R44I3rRW9NwIFlT3fq2o
 2qPNgT3RVcfYVi15riRXY7OoRaW4daXXR/zyfod6RxDovjcALLO2sk6jDcB+rrDavDee
 3NNA==
X-Gm-Message-State: AO0yUKXiaToYYka7NCfG6arcPJXe7rWSVY5Qtz/LKS5UdfMLv3bMJ80Z
 IccykcPpJVrImyhLbRY9vlF7iv7iLODaS0xrlZwzhsVzfnG5CfNYkfyzKI8bnd3JPw7agVUrAI8
 rC/X67lsJxLcVD4UJAP2Ec/+Vz5xtEX+AudSaoyXwAdlQgocp4oPXh2KVO05kaVsaqkKEO1w7
X-Received: by 2002:ac8:5350:0:b0:3b9:bd8d:bb22 with SMTP id
 d16-20020ac85350000000b003b9bd8dbb22mr27776406qto.14.1676371920998; 
 Tue, 14 Feb 2023 02:52:00 -0800 (PST)
X-Google-Smtp-Source: AK7set9baghTpCS5WDnH3zPTvSpNv3cHJmxLlqrPp1TxQLP6znOIm70lL92MEHxIg5twlmbK3W2F8Q==
X-Received: by 2002:ac8:5350:0:b0:3b9:bd8d:bb22 with SMTP id
 d16-20020ac85350000000b003b9bd8dbb22mr27776386qto.14.1676371920665; 
 Tue, 14 Feb 2023 02:52:00 -0800 (PST)
Received: from step1.redhat.com (host-82-57-51-111.retail.telecomitalia.it.
 [82.57.51.111]) by smtp.gmail.com with ESMTPSA id
 5-20020ac85605000000b003b85f9a56c9sm10918264qtr.97.2023.02.14.02.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 02:52:00 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Aihua Liang <aliang@redhat.com>
Subject: [PATCH] block: temporarily hold the new AioContext of bs_top in
 bdrv_append()
Date: Tue, 14 Feb 2023 11:51:56 +0100
Message-Id: <20230214105156.316586-1-sgarzare@redhat.com>
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
I'm not sure whether to use the following Fixes tag. That commit added the
calls to bdrv_drained_begin() in bdrv_replace_node_noperm(), but maybe the
problem was pre-existing.

Fixes: 2398747128 ("block: Don't poll in bdrv_replace_child_noperm()")

Note: a local reproducer is attached in the BZ, it is based on the Aihua Liang
report and it hits the issue with a 20% ratio.
---
 block.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/block.c b/block.c
index aa9062f2c1..0e2bc11e0b 100644
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
+    AioContext *old_context, *new_context;
 
     GLOBAL_STATE_CODE();
 
     assert(!bs_new->backing);
 
+    old_context = bdrv_get_aio_context(bs_top);
+
     child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
                                      &child_of_bds, bdrv_backing_role(bs_new),
                                      tran, errp);
@@ -5286,11 +5291,29 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
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
     }
 
+    if (old_context != new_context) {
+        aio_context_release(new_context);
+        aio_context_acquire(old_context);
+    }
+
     ret = bdrv_refresh_perms(bs_new, tran, errp);
 out:
     tran_finalize(tran, ret);
-- 
2.39.1


