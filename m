Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF8D4A6268
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:28:28 +0100 (CET)
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwx9-0007TA-MN
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyN-0002jB-Jz
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyL-0003z5-VM
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VKyHryPz6WZGRFL3/rh4J9MXBLIZuMMBtUcE1lldqY=;
 b=a/jW/QzKbHq/9k2OobLdObJzNGRlEFkcjFukH971xWE1SpUAnpbB+P499717UBhbq4PHIA
 Sn7EWennGkh+fRw8u8pgFcOzCkdpNFD4gS5tQruSDAJib77w+hfkcnKoAR5MzdHbNao9Im
 mIDjYgGcvRsK101OhJ1F2I3BDk05yic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-RmrefXYgM06S85yJxnH5cw-1; Tue, 01 Feb 2022 10:21:29 -0500
X-MC-Unique: RmrefXYgM06S85yJxnH5cw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 149D7101F01E;
 Tue,  1 Feb 2022 15:21:28 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C95374E98;
 Tue,  1 Feb 2022 15:21:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/10] block/rbd: fix handling of holes in .bdrv_co_block_status
Date: Tue,  1 Feb 2022 16:21:07 +0100
Message-Id: <20220201152108.171898-10-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

the assumption that we can't hit a hole if we do not diff against a snapshot was wrong.

We can see a hole in an image if we diff against base if there exists an older snapshot
of the image and we have discarded blocks in the image where the snapshot has data.

Fix this by simply handling a hole like an unallocated area. There are no callbacks
for unallocated areas so just bail out if we hit a hole.

Fixes: 0347a8fd4c3faaedf119be04c197804be40a384b
Suggested-by: Ilya Dryomov <idryomov@gmail.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Lieven <pl@kamp.de>
Message-Id: <20220113144426.4036493-2-pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index def96292e0..20bb896c4a 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -1279,11 +1279,11 @@ static int qemu_rbd_diff_iterate_cb(uint64_t offs, size_t len,
     RBDDiffIterateReq *req = opaque;
 
     assert(req->offs + req->bytes <= offs);
-    /*
-     * we do not diff against a snapshot so we should never receive a callback
-     * for a hole.
-     */
-    assert(exists);
+
+    /* treat a hole like an unallocated area and bail out */
+    if (!exists) {
+        return 0;
+    }
 
     if (!req->exists && offs > req->offs) {
         /*
-- 
2.31.1


