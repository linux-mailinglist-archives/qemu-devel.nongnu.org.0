Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF054CD83F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:46:49 +0100 (CET)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA8m-0004zv-Np
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:46:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQA09-0007mP-KG
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nQA07-0007Xo-Fk
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 10:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646408270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QB5pDNvJfJIln2QM0DEQ0/qO60xkWpId2XZ6hw2ap4=;
 b=GffdJ38pbiXjSdNVxRbEa68MC3T+F/OpB9aPqm+jpETzJnrI+E1SYYMvueVqQH8dhM87kx
 xTRw2C22rD7obwEEdBe/jIfAQBv6fyN+6YUuJYQL01MC7lrc5ZqV69o+/dMoHANL/SWQ+6
 7fhKR3ise4Wgn41THN9wtqvRuqtrJrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-oaGoKvErN4aurJOCipFCSQ-1; Fri, 04 Mar 2022 10:37:47 -0500
X-MC-Unique: oaGoKvErN4aurJOCipFCSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 378041091DA4;
 Fri,  4 Mar 2022 15:37:46 +0000 (UTC)
Received: from localhost (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 117067BCCE;
 Fri,  4 Mar 2022 15:37:41 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/5] block/crypto: Reset updating_keys on perm failure
Date: Fri,  4 Mar 2022 16:37:27 +0100
Message-Id: <20220304153729.711387-4-hreitz@redhat.com>
In-Reply-To: <20220304153729.711387-1-hreitz@redhat.com>
References: <20220304153729.711387-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the permissions could not be changed as would be necessary for
updating the keys, reset updating_keys to false so
block_crypto_child_perms() will not continue to try claiming these
permissions.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/crypto.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/block/crypto.c b/block/crypto.c
index 5225a68a54..9d5fecbef8 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -781,10 +781,16 @@ static int
 block_crypto_amend_prepare(BlockDriverState *bs, Error **errp)
 {
     BlockCrypto *crypto = bs->opaque;
+    int ret;
 
     /* apply for exclusive read/write permissions to the underlying file */
     crypto->updating_keys = true;
-    return bdrv_child_refresh_perms(bs, bs->file, errp);
+    ret = bdrv_child_refresh_perms(bs, bs->file, errp);
+    if (ret < 0) {
+        /* Well, in this case we will not be updating any keys */
+        crypto->updating_keys = false;
+    }
+    return ret;
 }
 
 static void
-- 
2.34.1


