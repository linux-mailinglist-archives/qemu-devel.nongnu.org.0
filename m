Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 682203C23BD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 14:53:51 +0200 (CEST)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q0s-0006W2-DJ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 08:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyR-0003Rs-Ep
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyO-0003Ql-MI
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zEWZeufVCD6ArsTcUGVGbuxVSQxKiWQSK2xvcoF6WGA=;
 b=R4hlpzgVmfbthPEaiAQH9JjR2AfQrMcX1mu4pS0ulQXHZhLROUFkXrcMMGNWKp/OEQGr4P
 U2my2mb3r8DNascu26C3IkOFuHzmxnOzGlU77KPjFTslmAV46I6CbAo37WlUoO6HcjGmdG
 Jc+OGBWmw4pXfVVypKsmEVMZNV/m+Ys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-1UYVPiyJMDKL21sO1LJQHw-1; Fri, 09 Jul 2021 08:51:12 -0400
X-MC-Unique: 1UYVPiyJMDKL21sO1LJQHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB487100C660;
 Fri,  9 Jul 2021 12:51:11 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B60FF60843;
 Fri,  9 Jul 2021 12:51:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/28] block/rbd: drop qemu_rbd_refresh_limits
Date: Fri,  9 Jul 2021 14:50:15 +0200
Message-Id: <20210709125035.191321-9-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

librbd supports 1 byte alignment for all aio operations.

Currently, there is no API call to query limits from the Ceph
ObjectStore backend.  So drop the bdrv_refresh_limits completely
until there is such an API call.

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Message-Id: <20210702172356.11574-7-idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 3152bc8ba0..01a7b94d62 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -240,14 +240,6 @@ done:
     return;
 }
 
-
-static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
-{
-    /* XXX Does RBD support AIO on less than 512-byte alignment? */
-    bs->bl.request_alignment = 512;
-}
-
-
 static int qemu_rbd_set_auth(rados_t cluster, BlockdevOptionsRbd *opts,
                              Error **errp)
 {
@@ -1482,7 +1474,6 @@ static BlockDriver bdrv_rbd = {
     .format_name            = "rbd",
     .instance_size          = sizeof(BDRVRBDState),
     .bdrv_parse_filename    = qemu_rbd_parse_filename,
-    .bdrv_refresh_limits    = qemu_rbd_refresh_limits,
     .bdrv_file_open         = qemu_rbd_open,
     .bdrv_close             = qemu_rbd_close,
     .bdrv_reopen_prepare    = qemu_rbd_reopen_prepare,
-- 
2.31.1


