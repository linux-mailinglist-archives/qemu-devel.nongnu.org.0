Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECA13C23C8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:56:13 +0200 (CEST)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q39-0002ka-17
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyH-0002pR-Gz
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyF-0003Ng-RK
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HqmwjJ20fs/CWRxSFYH3WJaQNNK0ppxiiecpkrmE1GE=;
 b=haajDSMv3kMJhTLp6l1e8Ofk3i+DX5/csgAyfsBbnX+W9zpduwAYsxBVthJ3nbs1krS8CN
 x4B0RtHfQYCclRQR52zSchs6SmwB2fmdj+bMnt+a1ADRR99O+tAQnW5EANRpY8zEZ/bm9l
 V45FVDMukfChXXgi9PP/P+hKumU0m1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21--u57KHmWO6qwCfwql2DWjA-1; Fri, 09 Jul 2021 08:51:05 -0400
X-MC-Unique: -u57KHmWO6qwCfwql2DWjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A95551084F40;
 Fri,  9 Jul 2021 12:51:04 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C37160843;
 Fri,  9 Jul 2021 12:51:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/28] block/rbd: update s->image_size in qemu_rbd_getlength
Date: Fri,  9 Jul 2021 14:50:12 +0200
Message-Id: <20210709125035.191321-6-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

From: Peter Lieven <pl@kamp.de>

While at it just call rbd_get_size and avoid rbd_image_info_t.

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Message-Id: <20210702172356.11574-4-idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 1ebf8f7e48..e2028d3db5 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1304,15 +1304,14 @@ static ImageInfoSpecific *qemu_rbd_get_specific_info(BlockDriverState *bs,
 static int64_t qemu_rbd_getlength(BlockDriverState *bs)
 {
     BDRVRBDState *s = bs->opaque;
-    rbd_image_info_t info;
     int r;
 
-    r = rbd_stat(s->image, &info, sizeof(info));
+    r = rbd_get_size(s->image, &s->image_size);
     if (r < 0) {
         return r;
     }
 
-    return info.size;
+    return s->image_size;
 }
 
 static int coroutine_fn qemu_rbd_co_truncate(BlockDriverState *bs,
-- 
2.31.1


