Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0603742FD5D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:22:21 +0200 (CEST)
Received: from localhost ([::1]:54004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUei-0002hm-3D
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTJ-0007VW-1S
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTA-0000c9-Nu
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rSZK1KkmIpw4/8UmyKjTqfzt0KxZMc5maGw55PT49HE=;
 b=C5nw72JQHV3+1huM6H+i6mUD97f2CYCE+XEGByMH+lnHnC7nP12H9jWn6Slk5r/XHtzMA1
 3cYt0HwpoACxdxmzexGSxdkScVeU/tpoP0g++saV46irmFUV8oGK6wrB3g7TMGZZ6LhIX4
 ZMS7eUwyAuF2DxDtAYH2Ji0WbBurL0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-W6LMli8qMieyTfyxi9L2_A-1; Fri, 15 Oct 2021 17:10:16 -0400
X-MC-Unique: W6LMli8qMieyTfyxi9L2_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F03F802C9B;
 Fri, 15 Oct 2021 21:10:15 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5D8E19739;
 Fri, 15 Oct 2021 21:10:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] qcow2: Silence clang -m32 compiler warning
Date: Fri, 15 Oct 2021 16:09:56 -0500
Message-Id: <20211015211011.1272011-2-eblake@redhat.com>
In-Reply-To: <20211015211011.1272011-1-eblake@redhat.com>
References: <20211015211011.1272011-1-eblake@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 "open list:qcow2" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

With -m32, size_t is generally only a uint32_t.  That makes clang
complain that in the assertion

  assert(qiov->size <= INT64_MAX);

the range of the type of qiov->size (size_t) is too small for any of its
values to ever exceed INT64_MAX.

Cast qiov->size to uint64_t to silence clang.

Fixes: f7ef38dd1310d7d9db76d0aa16899cbc5744f36d
       ("block: use int64_t instead of uint64_t in driver read
       handlers")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211011155031.149158-1-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-cluster.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 5727f92dcb39..21884a1ab9ab 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -513,7 +513,8 @@ static int coroutine_fn do_perform_cow_read(BlockDriverState *bs,
      */
     assert(src_cluster_offset <= INT64_MAX);
     assert(src_cluster_offset + offset_in_cluster <= INT64_MAX);
-    assert(qiov->size <= INT64_MAX);
+    /* Cast qiov->size to uint64_t to silence a compiler warning on -m32 */
+    assert((uint64_t)qiov->size <= INT64_MAX);
     bdrv_check_qiov_request(src_cluster_offset + offset_in_cluster, qiov->size,
                             qiov, 0, &error_abort);
     /*
-- 
2.31.1


