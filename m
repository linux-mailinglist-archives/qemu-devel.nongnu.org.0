Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6B31D4D55
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 14:04:54 +0200 (CEST)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZZ5B-0006dJ-Ph
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 08:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZ3p-0005m9-Ew
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:03:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41213
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZ3n-0005qy-S2
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589544206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9nt10F8bJ4+kAVB3QkuSOyaARP+Mcn2yVd7mJYsK9gw=;
 b=d5A+zMKvu9LqHvN+N+PvEAnPCMUEODzEIhj4ZBGLpkD9U39GmkLDsQYkiaIOVMU6IFKL7B
 iXA7uVFFbW7SmjBlc3Py6a3lv2WGiUrfdHHEkc/qYgM9PoJ29nEk/2ShQZ8chcmhOpjWR9
 q3R3QIeuNb+WUMtHkYMlomErxLU5Lkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-efEaKGT0M--nGArIWnAuGA-1; Fri, 15 May 2020 08:03:24 -0400
X-MC-Unique: efEaKGT0M--nGArIWnAuGA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26AC918A0721;
 Fri, 15 May 2020 12:03:23 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6105946;
 Fri, 15 May 2020 12:03:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] replication: Avoid blk_make_empty() on read-only child
Date: Fri, 15 May 2020 14:03:18 +0200
Message-Id: <20200515120318.188831-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, lukasstraub2@web.de, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just a bandaid to keep tests/test-replication working after
bdrv_make_empty() starts to assert that we're not trying to call it on a
read-only child.

For the real solution in the future, replication should not steal the
BdrvChild from its backing file (this is never correct to do!), but
instead have its own child node references, with the appropriate
permissions.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/replication.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/block/replication.c b/block/replication.c
index f1820ab1d0..ccf7b78160 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -343,7 +343,17 @@ static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
         return;
     }
 
-    ret = bdrv_make_empty(s->hidden_disk, errp);
+    BlockBackend *blk = blk_new(qemu_get_current_aio_context(),
+                                BLK_PERM_WRITE, BLK_PERM_ALL);
+    blk_insert_bs(blk, s->hidden_disk->bs, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        blk_unref(blk);
+        return;
+    }
+
+    ret = blk_make_empty(blk, errp);
+    blk_unref(blk);
     if (ret < 0) {
         return;
     }
-- 
2.25.4


