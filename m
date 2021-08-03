Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60B23DF089
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:42:56 +0200 (CEST)
Received: from localhost ([::1]:56742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvd9-0006EB-Vo
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvbu-0004Ct-Aq
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:41:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvbr-00046n-Tt
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oe47jqDxD7cgBAaH+q6m1INpuJsIZAeaL8GCt5q/hE0=;
 b=JyzS4BeIrbyv2RBbnsM7WKjV5NFkWRPwpGzOaba0wMOxKTlScUHfFlRqQD7NP/9lSfCmLz
 H0toYvnD90xTY3SP+3W8PSaFTlvbYu6EJrcv0mfe1WCwbF+Cx0uwn4p113lABrX3xuRC+O
 VIHX2ShIhzhFEpny8LlEGWYw271Oruw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-iHTrPC8TN62zQ7VCcHeV_A-1; Tue, 03 Aug 2021 10:41:33 -0400
X-MC-Unique: iHTrPC8TN62zQ7VCcHeV_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D17798799E0;
 Tue,  3 Aug 2021 14:41:32 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDC345D9DC;
 Tue,  3 Aug 2021 14:41:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/1] block: Fix in_flight leak in request padding error path
Date: Tue,  3 Aug 2021 16:41:25 +0200
Message-Id: <20210803144125.51097-2-kwolf@redhat.com>
In-Reply-To: <20210803144125.51097-1-kwolf@redhat.com>
References: <20210803144125.51097-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When bdrv_pad_request() fails in bdrv_co_preadv_part(), bs->in_flight
has been increased, but is never decreased again. This leads to a hang
when trying to drain the block node.

This bug was observed with Windows guests which issue a request that
fully uses IOV_MAX during installation, so that when padding is
necessary (O_DIRECT with a 4k sector size block device on the host),
adding another entry causes failure.

Call bdrv_dec_in_flight() to fix this. There is a larger problem to
solve here because this request shouldn't even fail, but Windows doesn't
seem to care and with this minimal fix the installation succeeds. So
given that we're already in freeze, let's take this minimal fix for 6.1.

Fixes: 98ca45494fcd6bf0336ecd559e440b6de6ea4cd3
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1972079
Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210727154923.91067-1-kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/io.c b/block/io.c
index e0a689c584..a19942718b 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1841,7 +1841,7 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
     ret = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad,
                            NULL);
     if (ret < 0) {
-        return ret;
+        goto fail;
     }
 
     tracked_request_begin(&req, bs, offset, bytes, BDRV_TRACKED_READ);
@@ -1849,10 +1849,11 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
                               bs->bl.request_alignment,
                               qiov, qiov_offset, flags);
     tracked_request_end(&req);
-    bdrv_dec_in_flight(bs);
-
     bdrv_padding_destroy(&pad);
 
+fail:
+    bdrv_dec_in_flight(bs);
+
     return ret;
 }
 
-- 
2.31.1


