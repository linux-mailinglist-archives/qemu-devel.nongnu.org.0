Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDAD4432AC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:26:03 +0100 (CET)
Received: from localhost ([::1]:50990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwbq-00022K-KC
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIb-0007lP-VG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIW-0004Jr-Bh
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKkOl79dx1hSAtyL6l9dDJUk26EdZlHFnVI3JNXGWRE=;
 b=J7xCUMlhq3QjsRTTKW2HC2FirATrDVrr5WtcsLwqpFoeWlR1yNvCwRdgZ2Fx7TMTrs+UQ+
 VbHrJQ9iIIEguODw/Fg6X8Svc8j7kIIa94Tws2srjT7RVnw1rabo9SizxnXdwkcDo2AHVT
 5+aqKzH5nkbufq0NprRVZcXyCF2Kky4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-PPdcLtGOPdG_bkjMdQAgGw-1; Tue, 02 Nov 2021 12:05:57 -0400
X-MC-Unique: PPdcLtGOPdG_bkjMdQAgGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6901006AA3;
 Tue,  2 Nov 2021 16:05:56 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD9225D9D3;
 Tue,  2 Nov 2021 16:05:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/12] block-backend: Silence clang -m32 compiler warning
Date: Tue,  2 Nov 2021 17:05:25 +0100
Message-Id: <20211102160528.206766-10-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

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
Message-Id: <20211026090745.30800-1-hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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


