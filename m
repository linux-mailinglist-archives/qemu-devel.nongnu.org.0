Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498814293D9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 17:54:50 +0200 (CEST)
Received: from localhost ([::1]:42240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZxdX-0002BU-TD
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 11:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZxZW-0000ih-EH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:50:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mZxZU-0008KW-UG
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633967436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=te5tf0fiHO9dS2LGS/z73wEWNOkkd4IB1aUtVgtzgu4=;
 b=faA7N1xmgbsZNZm32KxU483uKVuXle6du2GkXuSybA++gox2+P2hI8KliwkE0SQC3/cfDj
 +DYnito/K4062z8KAbE9QKGRVuHIgm6i1Sq6lrjJn2qBtU7Gs0XvDNmxo2MrmzuhP++QuG
 6eja1TX0RjkikjrGRcSMNAR9vfA941M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-qrvmGp8_M26AtKMmFHfJ_Q-1; Mon, 11 Oct 2021 11:50:34 -0400
X-MC-Unique: qrvmGp8_M26AtKMmFHfJ_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 063F3101F001;
 Mon, 11 Oct 2021 15:50:34 +0000 (UTC)
Received: from localhost (unknown [10.39.194.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93B2F5C3DF;
 Mon, 11 Oct 2021 15:50:33 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] qcow2: Silence clang -m32 compiler warning
Date: Mon, 11 Oct 2021 17:50:31 +0200
Message-Id: <20211011155031.149158-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
I don't know whether this is the best possible solution, or whether we
should care about this at all (I personally think it's basically just
wrong for clang to warn about always-true conditions in assertions), but
I thought I might as well just send this patch as the basis for a
discussion.
---
 block/qcow2-cluster.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 5727f92dcb..21884a1ab9 100644
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


