Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2FD6A3FAE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWb2o-0001if-Pl; Mon, 27 Feb 2023 05:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pWb2d-0001dl-Ok
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:47:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pWb2c-0005Oy-2F
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677494853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyWqpE9+1CkDMMOO7j3zRjCLoSOlzdVHaovFbYf9L2E=;
 b=YN12QvnKsrtrgeGINPAgdnyANJSN3n1BM93cdCMaP2yylHI4MjuDpjQ7078jsN+sS6BPOy
 ha9lMfmjPdMlto/vr1nA49h50en9XOZcG7LJE4orI/dJj3oh770UVxXHAuKrYCBO3IBYyX
 uJFNQuZmyEC6LCCSZiWcmvCvkKNZk7Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-7UC7FokRONq6XDblWxcO2w-1; Mon, 27 Feb 2023 05:47:29 -0500
X-MC-Unique: 7UC7FokRONq6XDblWxcO2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AC901C05AB6;
 Mon, 27 Feb 2023 10:47:29 +0000 (UTC)
Received: from localhost (unknown [10.45.228.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D67BD140EBF4;
 Mon, 27 Feb 2023 10:47:28 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 1/2] block/fuse: Let PUNCH_HOLE write zeroes
Date: Mon, 27 Feb 2023 11:47:24 +0100
Message-Id: <20230227104725.33511-2-hreitz@redhat.com>
In-Reply-To: <20230227104725.33511-1-hreitz@redhat.com>
References: <20230227104725.33511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

fallocate(2) says about PUNCH_HOLE: "After a successful call, subsequent
reads from this range will return zeros."  As it is, PUNCH_HOLE is
implemented as a call to blk_pdiscard(), which does not guarantee this.

We must call blk_pwrite_zeroes() instead.  The difference to ZERO_RANGE
is that we pass the `BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK` flags to
the call -- the storage is supposed to be unmapped, and a slow fallback
by actually writing zeroes as data is not allowed.

Closes: https://gitlab.com/qemu-project/qemu/-/issues/1507
Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
---
 block/export/fuse.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index e5fc4af165..06fa41079e 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -673,7 +673,16 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         do {
             int size = MIN(length, BDRV_REQUEST_MAX_BYTES);
 
-            ret = blk_pdiscard(exp->common.blk, offset, size);
+            ret = blk_pwrite_zeroes(exp->common.blk, offset, size,
+                                    BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK);
+            if (ret == -ENOTSUP) {
+                /*
+                 * fallocate() specifies to return EOPNOTSUPP for unsupported
+                 * operations
+                 */
+                ret = -EOPNOTSUPP;
+            }
+
             offset += size;
             length -= size;
         } while (ret == 0 && length > 0);
-- 
2.39.1


