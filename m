Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759853A1AF2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 18:32:16 +0200 (CEST)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr17n-0003tF-08
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 12:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr16Q-0002n4-VA
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr16N-0003y6-Ma
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 12:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623256245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FJyGcqdv5LXNJoz6zz/tQAZ0DIzXYn0P4zoO/sbUmwY=;
 b=d081dr6vZUM90S8WIbvUp95aSvHRU85MsHw7HO/aynzm4SrK4C/Z4/9jZ1aO1QK6Jd2TZT
 G2JtI6slcTVFAM97cxmTdLVB29VseArGl/msMCROwKpikYWG1JbdvULiX4C4k04oDw+Dtr
 Ll0Obk8CGvOF+YdLjHr2C5WS37X7DT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-R-8rKcFbOwaygYIP1_PNNw-1; Wed, 09 Jun 2021 12:30:44 -0400
X-MC-Unique: R-8rKcFbOwaygYIP1_PNNw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D557101C8C1;
 Wed,  9 Jun 2021 16:30:43 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4A35D9F0;
 Wed,  9 Jun 2021 16:30:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block: Move read-only check during truncation earlier
Date: Wed,  9 Jun 2021 11:30:34 -0500
Message-Id: <20210609163034.997943-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to start a tracked request that will always fail.  The choice
to check read-only after bdrv_inc_in_flight() predates 1bc5f09f2e
(block: Use tracked request for truncate), but waiting for serializing
requests can make the effect more noticeable.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/io.c b/block/io.c
index 323854d06337..1a05f320d35e 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3390,6 +3390,11 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
         return old_size;
     }

+    if (bdrv_is_read_only(bs)) {
+        error_setg(errp, "Image is read-only");
+        return -EACCES;
+    }
+
     if (offset > old_size) {
         new_bytes = offset - old_size;
     } else {
@@ -3406,11 +3411,6 @@ int coroutine_fn bdrv_co_truncate(BdrvChild *child, int64_t offset, bool exact,
     if (new_bytes) {
         bdrv_make_request_serialising(&req, 1);
     }
-    if (bdrv_is_read_only(bs)) {
-        error_setg(errp, "Image is read-only");
-        ret = -EACCES;
-        goto out;
-    }
     ret = bdrv_co_write_req_prepare(child, offset - new_bytes, new_bytes, &req,
                                     0);
     if (ret < 0) {
-- 
2.31.1


