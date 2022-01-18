Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD9492BD3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:02:57 +0100 (CET)
Received: from localhost ([::1]:45354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rsm-0002P7-BI
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:02:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUt-0006PO-Jy
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUo-00061O-Q1
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUit603A3uNQkUhU7v54C81byKLM5MT2P7CEzhQOJII=;
 b=IQuH4YsaiFFWXpHw3EZr7bD9azmr/DC0vmt99YUSWL47FBA9bsogfk2w3/h6DaFK4jPycm
 4eimRDeQzddj5rLgDmLDiveyPXJz3HTtJ01PoxO9BBgPsmtIOR8OtGY9PMs6Trm8eK+If8
 HokmrxdJGZn8GsKzHxk3VHxK/sI6PbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-eRtUkNbtMjSOIhko0xO9RA-1; Tue, 18 Jan 2022 11:37:52 -0500
X-MC-Unique: eRtUkNbtMjSOIhko0xO9RA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7451B134E91;
 Tue, 18 Jan 2022 16:28:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC572348F8;
 Tue, 18 Jan 2022 16:28:24 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 08/12] reopen: add a transaction to drain_end nodes picked in
 bdrv_reopen_parse_file_or_backing
Date: Tue, 18 Jan 2022 11:27:34 -0500
Message-Id: <20220118162738.1366281-9-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the options given to reopen_state,
bdrv_reopen_parse_file_or_backing could pick another bs
that could be from another graph, and thus not protected
by subtree_drained_begin called by the callers of this
function.

We can't simply drain-undrain here, because of transactions.
To simplify the logic, transactions always assume that they
are run under drain, so the various subtree_drain introduced
so far always take care of covering tran_commit().

And since we cannot directly do it, as the transaction is
created/committed higher above, we can just add a new
transaction to the list that just executes subtree_drained_end
to match the drained_begin done in this function.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index fb5bc3077a..fcc44a49a0 100644
--- a/block.c
+++ b/block.c
@@ -4522,6 +4522,10 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
     return bdrv_reopen(bs, opts, true, errp);
 }
 
+TransactionActionDrv bdrv_drv_subtree_end = {
+    .clean = (void (*)(void *)) bdrv_subtree_drained_end_unlocked,
+};
+
 /*
  * Take a BDRVReopenState and check if the value of 'backing' in the
  * reopen_state->options QDict is valid or not.
@@ -4550,6 +4554,7 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
     const char *child_name = is_backing ? "backing" : "file";
     QObject *value;
     const char *str;
+    int ret = 0;
 
     assert(qemu_in_main_thread());
 
@@ -4573,6 +4578,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
                        "cycle", str, child_name, bs->node_name);
             return -EINVAL;
         }
+        /* This will be paired with a drained_end in tran_commit */
+        bdrv_subtree_drained_begin_unlocked(new_child_bs);
         break;
     default:
         /*
@@ -4583,18 +4590,19 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
     }
 
     if (old_child_bs == new_child_bs) {
-        return 0;
+        goto end;
     }
 
     if (old_child_bs) {
         if (bdrv_skip_implicit_filters(old_child_bs) == new_child_bs) {
-            return 0;
+            goto end;
         }
 
         if (old_child_bs->implicit) {
             error_setg(errp, "Cannot replace implicit %s child of %s",
                        child_name, bs->node_name);
-            return -EPERM;
+            ret = -EPERM;
+            goto end;
         }
     }
 
@@ -4605,7 +4613,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
          */
         error_setg(errp, "'%s' is a %s filter node that does not support a "
                    "%s child", bs->node_name, bs->drv->format_name, child_name);
-        return -EINVAL;
+        ret = -EINVAL;
+        goto end;
     }
 
     if (is_backing) {
@@ -4614,8 +4623,14 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
         reopen_state->old_file_bs = old_child_bs;
     }
 
-    return bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
+    ret =  bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
                                            tran, errp);
+
+end:
+    if (new_child_bs) {
+        tran_add(tran, &bdrv_drv_subtree_end, new_child_bs);
+    }
+    return ret;
 }
 
 /*
-- 
2.31.1


