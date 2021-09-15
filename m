Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDE40CC66
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:12:24 +0200 (CEST)
Received: from localhost ([::1]:37070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZOQ-00068D-Fs
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6f-0006UE-Mu
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6e-0006tA-3h
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJLyditKkv+WSfGTBJalfCfVjtKWxjAtVBFYv2pOuv0=;
 b=I36BH/XY8GrFHzKz27WoJ1vgONMtWED+/fqFVNxvVQdhI+KN+IazEEr7KEGbUapZSvSAFk
 mr7u6kZmhhxuaqvS93GMCWCRl+6FKG9nUzAHhQZaJgzcKu7oOQeHj6PDdO/c5QJ8LnXs6b
 Q3auXBcwaV6PUtophvZMLOVCKAHWhhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-axuihbpCOn6TQjxSnznaKg-1; Wed, 15 Sep 2021 13:53:58 -0400
X-MC-Unique: axuihbpCOn6TQjxSnznaKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2021966320;
 Wed, 15 Sep 2021 17:53:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9498F7771A;
 Wed, 15 Sep 2021 17:53:56 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/32] block: bdrv_inactivate_recurse(): check for permissions
 and fix crash
Date: Wed, 15 Sep 2021 19:53:03 +0200
Message-Id: <20210915175318.853225-18-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We must not inactivate child when parent has write permissions on
it.

Calling .bdrv_inactivate() doesn't help: actually only qcow2 has this
handler and it is used to flush caches, not for permission
manipulations.

So, let's simply check cumulative parent permissions before
inactivating the node.

This commit fixes a crash when we do migration during backup: prior to
the commit nothing prevents all nodes inactivation at migration finish
and following backup write to the target crashes on assertion
"assert(!(bs->open_flags & BDRV_O_INACTIVE));" in
bdrv_co_write_req_prepare().

After the commit, we rely on the fact that copy-before-write filter
keeps write permission on target node to be able to write to it. So
inactivation fails and migration fails as expected.

Corresponding test now passes, so, enable it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210911120027.8063-3-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c                                        | 8 ++++++++
 tests/qemu-iotests/tests/migrate-during-backup | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 00982edf45..5ce08a79fd 100644
--- a/block.c
+++ b/block.c
@@ -6326,6 +6326,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
 {
     BdrvChild *child, *parent;
     int ret;
+    uint64_t cumulative_perms, cumulative_shared_perms;
 
     if (!bs->drv) {
         return -ENOMEDIUM;
@@ -6356,6 +6357,13 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
         }
     }
 
+    bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                             &cumulative_shared_perms);
+    if (cumulative_perms & (BLK_PERM_WRITE | BLK_PERM_WRITE_UNCHANGED)) {
+        /* Our inactive parents still need write access. Inactivation failed. */
+        return -EPERM;
+    }
+
     bs->open_flags |= BDRV_O_INACTIVE;
 
     /*
diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
index 1046904c5a..34103229ee 100755
--- a/tests/qemu-iotests/tests/migrate-during-backup
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -1,5 +1,5 @@
 #!/usr/bin/env python3
-# group: migration disabled
+# group: migration
 #
 # Copyright (c) 2021 Virtuozzo International GmbH
 #
-- 
2.31.1


