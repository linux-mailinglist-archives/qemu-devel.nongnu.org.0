Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018043AEB7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 11:09:35 +0200 (CEST)
Received: from localhost ([::1]:44474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfISb-0001KC-NG
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 05:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfIRB-0000cN-1F
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:08:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mfIR7-0002ex-IO
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635239279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BmDlwMqBBFmjzYOnTJWCf3/yKAjKm2MPEF/TqICZQZ0=;
 b=HqzImPEC3kNIlTKn1Ng9zMatgUoYLWodZoa7Bozpe4iTZv1EehmE6rolxU8uHkSH8NyW0f
 +TVIqKOj+Cafvqd2Y/FHOyuQ/wh9MMwd+eY9TfBjRKOTf2rs761nrGIisZD3w3QDQ0xPoB
 y0cQS4gcz8gclPFM5ZdbauC4FVP+774=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-1tyxtLOBNPWDQZQxb7_PRg-1; Tue, 26 Oct 2021 05:07:56 -0400
X-MC-Unique: 1tyxtLOBNPWDQZQxb7_PRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E1FE9F92C;
 Tue, 26 Oct 2021 09:07:55 +0000 (UTC)
Received: from localhost (unknown [10.39.193.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89FF15C1A1;
 Tue, 26 Oct 2021 09:07:47 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block-backend: Silence clang -m32 compiler warning
Date: Tue, 26 Oct 2021 11:07:45 +0200
Message-Id: <20211026090745.30800-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to e7e588d432d31ecebc26358e47201dd108db964c, there is a
warning in block/block-backend.c that qiov->size <= INT64_MAX is always
true on machines where size_t is narrower than a uint64_t.  In said
commit, we silenced this warning by casting to uint64_t.

The commit introducing this warning here
(a93d81c84afa717b0a1a6947524d8d1fbfd6bbf5) anticipated it and so tried
to address it the same way.  However, it only did so in one of two
places where this comparison occurs, and so we still need to fix up the
other one.

Fixes: a93d81c84afa717b0a1a6947524d8d1fbfd6bbf5
       ("block-backend: convert blk_aio_ functions to int64_t bytes
       paramter")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 39cd99df2b..12ef80ea17 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1540,7 +1540,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
                             QEMUIOVector *qiov, BdrvRequestFlags flags,
                             BlockCompletionFunc *cb, void *opaque)
 {
-    assert(qiov->size <= INT64_MAX);
+    assert((uint64_t)qiov->size <= INT64_MAX);
     return blk_aio_prwv(blk, offset, qiov->size, qiov,
                         blk_aio_write_entry, flags, cb, opaque);
 }
-- 
2.31.1


