Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7C30DCC8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:31:12 +0100 (CET)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JBX-0003My-DN
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J5g-0005Tr-0L
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7J5e-0000Eh-7N
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXB/BfjzR1YQKH5VA9RWBG+vnBSdnOEwWoOO4quYZnA=;
 b=dUgHpkDhEVjI/jkT0vmSrba9iYOFXqpw67C7lIRAon8OUpHrI/ZTMjpnBqc/ArCwPsez6B
 15+sU2bo85oZg0vBfsdEry9OeVgwwmo+f0raJ8miL7APi01God5d97ETpNguWIkAbRdrzv
 6cgGgfLDJenD78lS0cXaUznZ5hzOObA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-TgUXKPF8M5qpoLuc4a91kw-1; Wed, 03 Feb 2021 09:25:03 -0500
X-MC-Unique: TgUXKPF8M5qpoLuc4a91kw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64B6B19611A2;
 Wed,  3 Feb 2021 14:25:01 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81B2719C59;
 Wed,  3 Feb 2021 14:24:57 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/20] block/io: refactor bdrv_pad_request(): move
 bdrv_pad_request() up
Date: Wed,  3 Feb 2021 08:24:21 -0600
Message-Id: <20210203142436.703098-6-eblake@redhat.com>
In-Reply-To: <20210203142436.703098-1-eblake@redhat.com>
References: <20210203142436.703098-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 block/io.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

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
-- 
2.30.0


