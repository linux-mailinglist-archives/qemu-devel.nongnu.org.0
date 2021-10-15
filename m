Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B113642FD69
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:29:51 +0200 (CEST)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUly-0004sD-RK
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTQ-0007iw-Nj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTI-0000iM-J5
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b68i66YjLjEobO2PSrO3HzSobYvxYMWE2E2E5omagVo=;
 b=gLrjYsHgtsmf/e3zRNRlJF5RgixXmHO26qqh4AVExu9dJEyXFuuAKNfjGjKTWu3s8BovbA
 FflvO1MuVrA3usii4WAmmWsnb493cjDyNKw327FMNVF9iZlArvE46yrAfn1ka/jzH6ba4t
 GuulW+x7IeJUDh4hCNvvsJZzM5EVbZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-GyobtMimNleq003y_ZHEcw-1; Fri, 15 Oct 2021 17:10:24 -0400
X-MC-Unique: GyobtMimNleq003y_ZHEcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6691110A8E03;
 Fri, 15 Oct 2021 21:10:23 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDFE419736;
 Fri, 15 Oct 2021 21:10:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] block-backend: drop INT_MAX restriction from
 blk_check_byte_request()
Date: Fri, 15 Oct 2021 16:10:08 -0500
Message-Id: <20211015211011.1272011-14-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

blk_check_bytes_request is called from blk_co_do_preadv,
blk_co_do_pwritev_part, blk_co_do_pdiscard and blk_co_copy_range
before (maybe) calling throttle_group_co_io_limits_intercept() (which
has int64_t argument) and then calling corresponding bdrv_co_ function.
bdrv_co_ functions are OK with int64_t bytes as well.

So dropping the check for INT_MAX we just get same restrictions as in
bdrv_ layer: discard and write-zeroes goes through
bdrv_check_qiov_request() and are allowed to be 64bit. Other requests
go through bdrv_check_request32() and still restricted by INT_MAX
boundary.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-13-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/block-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 59746eda45b0..39cd99df2b3c 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1166,7 +1166,7 @@ static int blk_check_byte_request(BlockBackend *blk, int64_t offset,
 {
     int64_t len;

-    if (bytes < 0 || bytes > INT_MAX) {
+    if (bytes < 0) {
         return -EIO;
     }

-- 
2.31.1


