Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8364380E46
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:36:09 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhanI-0003Ib-Ul
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhaje-0000Jw-3q
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajM-0001Bw-AX
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+t0FGQHYG9Xi31mZVLx0tcdun4HJx/zhy2NGPDu3pRA=;
 b=ZK1x8XHjxdF8OgxEAQcruCS9M+4MQZL4OdZ/tMs5vSahH/qz+PYg0JEjzZ0c474UW3y6Sq
 2hKS831kbR6RHUoQB6kU1Ws7yg6ht1OqRDAN2UV6zqO3QDLla3+mtFD+1TCAarKesS3GpL
 +8RqA/ZsSzXSsil3ZUXWyU1kB+5gFOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-HDS0CE23Mx-ZNf6Ooa2Idw-1; Fri, 14 May 2021 12:31:58 -0400
X-MC-Unique: HDS0CE23Mx-ZNf6Ooa2Idw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B34C31009446;
 Fri, 14 May 2021 16:31:57 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C175C19D9B;
 Fri, 14 May 2021 16:31:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/14] block: Fix Transaction leak in bdrv_root_attach_child()
Date: Fri, 14 May 2021 18:31:12 +0200
Message-Id: <20210514163124.251741-3-kwolf@redhat.com>
In-Reply-To: <20210514163124.251741-1-kwolf@redhat.com>
References: <20210514163124.251741-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error path needs to call tran_finalize(), too.

Fixes: CID 1452773
Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210503110555.24001-2-kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 9ad725d205..c411e8a5c6 100644
--- a/block.c
+++ b/block.c
@@ -2917,13 +2917,14 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                    child_role, perm, shared_perm, opaque,
                                    &child, tran, errp);
     if (ret < 0) {
-        bdrv_unref(child_bs);
-        return NULL;
+        assert(child == NULL);
+        goto out;
     }
 
     ret = bdrv_refresh_perms(child_bs, errp);
-    tran_finalize(tran, ret);
 
+out:
+    tran_finalize(tran, ret);
     bdrv_unref(child_bs);
     return child;
 }
-- 
2.30.2


