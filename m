Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B788E30CF73
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:58:11 +0100 (CET)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74cc-0006ZQ-Ob
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qm-0007UA-9F
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qa-0005rF-Iw
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ipcKvuCKgbZSHo1AHAsZ2iWX75udwfAkTGuvmAElvBE=;
 b=MstOJMWdzxq5jfF3DYfwpXgwISzOr9AXNkf/Tz0FjHeK3UCT6qMyGPGrb0pPcStjCV+Byr
 IfVm54RFklxLc+64kyNBVoLwnrDitFVlgxthOARdkDXW55gn0c8An+IiHw0d+fBQZB4Kp+
 YcrtmsGSVEWwdgGPK5cBqhWLPotHloU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-fSt0WVoHMgWqGew5nNg4Kw-1; Tue, 02 Feb 2021 17:45:41 -0500
X-MC-Unique: fSt0WVoHMgWqGew5nNg4Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B090801817;
 Tue,  2 Feb 2021 22:45:39 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DFD810016F5;
 Tue,  2 Feb 2021 22:45:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] block/io: bdrv_pad_request(): support
 qemu_iovec_init_extended failure
Date: Tue,  2 Feb 2021 16:45:15 -0600
Message-Id: <20210202224529.642055-7-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Make bdrv_pad_request() honest: return error if
qemu_iovec_init_extended() failed.

Update also bdrv_padding_destroy() to clean the structure for safety.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-6-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/block/io.c b/block/io.c
index 3b1aec366ede..39d943c33a39 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1665,6 +1665,7 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
         qemu_vfree(pad->buf);
         qemu_iovec_destroy(&pad->local_qiov);
     }
+    memset(pad, 0, sizeof(*pad));
 }

 /*
@@ -1674,33 +1675,42 @@ static void bdrv_padding_destroy(BdrvRequestPadding *pad)
  * read of padding, bdrv_padding_rmw_read() should be called separately if
  * needed.
  *
- * All parameters except @bs are in-out: they represent original request at
- * function call and padded (if padding needed) at function finish.
- *
- * Function always succeeds.
+ * Request parameters (@qiov, &qiov_offset, &offset, &bytes) are in-out:
+ *  - on function start they represent original request
+ *  - on failure or when padding is not needed they are unchanged
+ *  - on success when padding is needed they represent padded request
  */
-static bool bdrv_pad_request(BlockDriverState *bs,
-                             QEMUIOVector **qiov, size_t *qiov_offset,
-                             int64_t *offset, unsigned int *bytes,
-                             BdrvRequestPadding *pad)
+static int bdrv_pad_request(BlockDriverState *bs,
+                            QEMUIOVector **qiov, size_t *qiov_offset,
+                            int64_t *offset, unsigned int *bytes,
+                            BdrvRequestPadding *pad, bool *padded)
 {
     int ret;

     if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
-        return false;
+        if (padded) {
+            *padded = false;
+        }
+        return 0;
     }

     ret = qemu_iovec_init_extended(&pad->local_qiov, pad->buf, pad->head,
                                    *qiov, *qiov_offset, *bytes,
                                    pad->buf + pad->buf_len - pad->tail,
                                    pad->tail);
-    assert(ret == 0);
+    if (ret < 0) {
+        bdrv_padding_destroy(pad);
+        return ret;
+    }
     *bytes += pad->head + pad->tail;
     *offset -= pad->head;
     *qiov = &pad->local_qiov;
     *qiov_offset = 0;
+    if (padded) {
+        *padded = true;
+    }

-    return true;
+    return 0;
 }

 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
@@ -1750,7 +1760,11 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
         flags |= BDRV_REQ_COPY_ON_READ;
     }

-    bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad);
+    ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
+                           NULL);
+    if (ret < 0) {
+        return ret;
+    }

     tracked_request_begin(&req, bs, offset, bytes, BDRV_TRACKED_READ);
     ret = bdrv_aligned_preadv(child, &req, offset, bytes,
@@ -2173,8 +2187,11 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
          * bdrv_co_do_zero_pwritev() does aligning by itself, so, we do
          * alignment only if there is no ZERO flag.
          */
-        padded = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes,
-                                  &pad);
+        ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
+                               &padded);
+        if (ret < 0) {
+            return ret;
+        }
     }

     bdrv_inc_in_flight(bs);
-- 
2.30.0


