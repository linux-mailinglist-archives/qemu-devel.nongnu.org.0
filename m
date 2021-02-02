Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A030CF69
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:54:49 +0100 (CET)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74ZM-0001y9-LU
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qi-0007SA-90
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qa-0005rP-Pr
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjWp062lj1SotM/eEnEpsQzhzjDP0JGbDkCiWNkEbTU=;
 b=aCb7D9P+pAngiUi9sk0XFS74SumkaVFmleGp53uMQB27Ry+h+bGrbind2lSw7vCWFxLwYM
 rGIzhnq+RwQFRkUJgmrN3Lau2FssO2GJg4Zx1uZXHh5Rj514CEdF5uu/3Ja33mOgHzHG2Q
 fhqxxzagbJEkCYSA9FeWvpBTlPA5HeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-Xd7f1T0ENp-i_sbhfZ5-yA-1; Tue, 02 Feb 2021 17:45:40 -0500
X-MC-Unique: Xd7f1T0ENp-i_sbhfZ5-yA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D71A4804022;
 Tue,  2 Feb 2021 22:45:38 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A05310016F5;
 Tue,  2 Feb 2021 22:45:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] block/io: refactor bdrv_pad_request(): move
 bdrv_pad_request() up
Date: Tue,  2 Feb 2021 16:45:14 -0600
Message-Id: <20210202224529.642055-6-eblake@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Prepare for the following patch when bdrv_pad_request() will be able to
fail. Update the comments.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201211183934.169161-5-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweak]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c     | 25 +++++++++++++++++++------
 block/io.c.rej | 40 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 6 deletions(-)
 create mode 100644 block/io.c.rej

diff --git a/block/io.c b/block/io.c
index c8c9dea55466..3b1aec366ede 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2135,6 +2135,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     uint64_t align = bs->bl.request_alignment;
     BdrvRequestPadding pad;
     int ret;
+    bool padded = false;

     trace_bdrv_co_pwritev(child->bs, offset, bytes, flags);

@@ -2166,20 +2167,32 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return 0;
     }

+    if (!(flags & BDRV_REQ_ZERO_WRITE)) {
+        /*
+         * Pad request for following read-modify-write cycle.
+         * bdrv_co_do_zero_pwritev() does aligning by itself, so, we do
+         * alignment only if there is no ZERO flag.
+         */
+        padded = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes,
+                                  &pad);
+    }
+
     bdrv_inc_in_flight(bs);
-    /*
-     * Align write if necessary by performing a read-modify-write cycle.
-     * Pad qiov with the read parts and be sure to have a tracked request not
-     * only for bdrv_aligned_pwritev, but also for the reads of the RMW cycle.
-     */
     tracked_request_begin(&req, bs, offset, bytes, BDRV_TRACKED_WRITE);

     if (flags & BDRV_REQ_ZERO_WRITE) {
+        assert(!padded);
         ret = bdrv_co_do_zero_pwritev(child, offset, bytes, flags, &req);
         goto out;
     }

-    if (bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad)) {
+    if (padded) {
+        /*
+         * Request was unaligned to request_alignment and therefore
+         * padded.  We are going to do read-modify-write, and must
+         * serialize the request to prevent interactions of the
+         * widened region with other transactions.
+         */
         bdrv_make_request_serialising(&req, align);
         bdrv_padding_rmw_read(child, &req, &pad, false);
     }
diff --git a/block/io.c.rej b/block/io.c.rej
new file mode 100644
index 000000000000..f52df016263b
--- /dev/null
+++ b/block/io.c.rej
@@ -0,0 +1,40 @@
+diff a/block/io.c b/block/io.c	(rejected hunks)
+@@ -2138,20 +2139,32 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
+         return 0;
+     }
+ 
++    if (!(flags & BDRV_REQ_ZERO_WRITE)) {
++        /*
++         * Pad request for following read-modify-write cycle.
++         * bdrv_co_do_zero_pwritev() does aligning by itself, so, we do
++         * alignment only if there is no ZERO flag.
++         */
++        padded = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes,
++                                  &pad);
++    }
++
+     bdrv_inc_in_flight(bs);
+-    /*
+-     * Align write if necessary by performing a read-modify-write cycle.
+-     * Pad qiov with the read parts and be sure to have a tracked request not
+-     * only for bdrv_aligned_pwritev, but also for the reads of the RMW cycle.
+-     */
+     tracked_request_begin(&req, bs, offset, bytes, BDRV_TRACKED_WRITE);
+ 
+     if (flags & BDRV_REQ_ZERO_WRITE) {
++        assert(!padded);
+         ret = bdrv_co_do_zero_pwritev(child, offset, bytes, flags, &req);
+         goto out;
+     }
+ 
+-    if (bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad)) {
++    if (padded) {
++        /*
++         * Request was unaligned to request_alignment and therefore padded.
++         * We are going to do read-modify-write. User is not prepared to widened
++         * request intersections with other requests, so we serialize the
++         * request.
++         */
+         bdrv_mark_request_serialising(&req, align);
+         bdrv_padding_rmw_read(child, &req, &pad, false);
+     }
-- 
2.30.0


