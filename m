Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE0371343
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:55:52 +0200 (CEST)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldVIt-0002en-Pm
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldVHa-00029I-4k
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ldVHV-0004ga-Fi
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620035664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0uu9yOp3YpP9hNFDJtCvZxKBX4OinAcVSrafAr0AGJs=;
 b=GIOFW34rUNF6UA3Ge9qV7MbjtM+AbbIvfA9sNOmnlkwAE2kt0WGv7UgdMRSh0innvXufN6
 /zo/xo/nHOEFYAohQmwR2FDHW6qQ9Ui/DyoIyrpfJkJj7nSwEJaODLMjf5K8Qf5ZHNK3I1
 57H5Uzw/nYKzX2WlRPvp4MYmo/M56Rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98--Cd0-FCjNg-pcFJ3z-m79Q-1; Mon, 03 May 2021 05:54:21 -0400
X-MC-Unique: -Cd0-FCjNg-pcFJ3z-m79Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C25F68049CB;
 Mon,  3 May 2021 09:54:20 +0000 (UTC)
Received: from localhost (ovpn-114-107.ams2.redhat.com [10.36.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C47D1037E88;
 Mon,  3 May 2021 09:54:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block/snapshot: Clarify goto fallback behavior
Date: Mon,  3 May 2021 11:54:18 +0200
Message-Id: <20210503095418.31521-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the bdrv_snapshot_goto() fallback code, we work with a pointer to
either bs->file or bs->backing.  We close that child, close the node
(with .bdrv_close()), apply the snapshot on the child node, and then
re-open the node (with .bdrv_open()).

In order for .bdrv_open() to attach the same child node that we had
before, we pass "file={child-node}" or "backing={child-node}" to it.
Therefore, when .bdrv_open() has returned success, we can assume that
bs->file or bs->backing (respectively) points to our original child
again.  This is verified by an assertion.

All of this is not immediately clear from a quick glance at the code,
so add a comment to the assertion what it is for, and why it is valid.
It certainly confused Coverity.

Reported-by: Coverity (CID 1452774)
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/snapshot.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index e8ae9a28c1..cce5e35b35 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -275,13 +275,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         qobject_unref(file_options);
         g_free(subqdict_prefix);
 
+        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
         qdict_put_str(options, (*fallback_ptr)->name,
                       bdrv_get_node_name(fallback_bs));
 
+        /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
         if (drv->bdrv_close) {
             drv->bdrv_close(bs);
         }
 
+        /* .bdrv_open() will re-attach it */
         bdrv_unref_child(bs, *fallback_ptr);
         *fallback_ptr = NULL;
 
@@ -296,7 +299,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
             return ret < 0 ? ret : open_ret;
         }
 
-        assert(fallback_bs == (*fallback_ptr)->bs);
+        /*
+         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
+         * was closed above and set to NULL, but the .bdrv_open() call
+         * has opened it again, because we set the respective option
+         * (with the qdict_put_str() call above).
+         * Assert that .bdrv_open() has attached some child on
+         * *fallback_ptr, and that it has attached the one we wanted
+         * it to (i.e., fallback_bs).
+         */
+        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
         bdrv_unref(fallback_bs);
         return ret;
     }
-- 
2.31.1


