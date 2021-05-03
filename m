Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9882637140B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:11:13 +0200 (CEST)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWTo-0002cm-LF
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldWOs-00075K-TK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ldWOr-0007ib-8t
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620039964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDT/sHVjTjVfLRYltLIksWDIHJSYhgnPGkI9yVzlnpo=;
 b=DvmAhLDC0UbAC9Nr6BB7mLp8cXNqdn2v6IB4ZlZED5S05bj+c/CWCGAxQcWqrCc5EhyPYq
 fJ6ktOVJpJxGeFfm2SRqwXq/bV1Qcm2EEbASmm2/FCY4B9yuVyTJE9HciK+pkd5uvAjBiC
 nQUN6C/nYOAs649bvChJDzjZUixxKbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-_dZhzZGZPNq9P5NJJ_-gog-1; Mon, 03 May 2021 07:06:03 -0400
X-MC-Unique: _dZhzZGZPNq9P5NJJ_-gog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 296288018A7;
 Mon,  3 May 2021 11:06:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-251.ams2.redhat.com [10.36.113.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A9B66062F;
 Mon,  3 May 2021 11:06:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block: Fix Transaction leak in bdrv_root_attach_child()
Date: Mon,  3 May 2021 13:05:54 +0200
Message-Id: <20210503110555.24001-2-kwolf@redhat.com>
In-Reply-To: <20210503110555.24001-1-kwolf@redhat.com>
References: <20210503110555.24001-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The error path needs to call tran_finalize(), too.

Fixes: CID 1452773
Fixes: 548a74c0dbc858edd1a7ee3045b5f2fe710bd8b1
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 874c22c43e..5c0ced6238 100644
--- a/block.c
+++ b/block.c
@@ -2918,13 +2918,14 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
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


