Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40583398B25
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:55:26 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loRLB-0005xj-Aq
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCf-0002Tu-7N
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1loRCb-0007Sz-3r
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 09:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEKfQV4Gz0VuZbvZsdGb/PaJqLtNx01s9bB3Grc1K18=;
 b=fVRCiEJfTkm2rlkr0dLhshgSTMRSEjo+m5RVMgojQKdfM68QuLoatHydlIIzS9XS4UqsWa
 PTSt5PQl7LB5H+PmTpyEenbPSbUupSEWCMqPXqb55fGiIKk0I4Tk5H+XNN5Mzx9Og8N4fY
 G7FEGjriT3npJmxGs081h1gDGizyuVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-MuBQOlzsMB2ovQhUZHn-LQ-1; Wed, 02 Jun 2021 09:46:29 -0400
X-MC-Unique: MuBQOlzsMB2ovQhUZHn-LQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 614EB1083844;
 Wed,  2 Jun 2021 13:45:53 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CEA42DAD0;
 Wed,  2 Jun 2021 13:45:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/20] block: improve permission conflict error message
Date: Wed,  2 Jun 2021 15:45:24 +0200
Message-Id: <20210602134529.231756-16-kwolf@redhat.com>
In-Reply-To: <20210602134529.231756-1-kwolf@redhat.com>
References: <20210602134529.231756-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Now permissions are updated as follows:
 1. do graph modifications ignoring permissions
 2. do permission update

 (of course, we rollback [1] if [2] fails)

So, on stage [2] we can't say which users are "old" and which are
"new" and exist only since [1]. And current error message is a bit
outdated. Let's improve it, to make everything clean.

While being here, add also a comment and some good assertions.

iotests 283, 307, qsd-jobs outputs are updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210601075218.79249-7-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                               | 29 ++++++++++++++++++++-------
 tests/qemu-iotests/283.out            |  2 +-
 tests/qemu-iotests/307.out            |  2 +-
 tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
 4 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/block.c b/block.c
index 3c0c3964ec..3f456892d0 100644
--- a/block.c
+++ b/block.c
@@ -2029,20 +2029,35 @@ static char *bdrv_child_user_desc(BdrvChild *c)
     return c->klass->get_parent_desc(c);
 }
 
+/*
+ * Check that @a allows everything that @b needs. @a and @b must reference same
+ * child node.
+ */
 static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
 {
-    g_autofree char *user = NULL;
-    g_autofree char *perm_names = NULL;
+    const char *child_bs_name;
+    g_autofree char *a_user = NULL;
+    g_autofree char *b_user = NULL;
+    g_autofree char *perms = NULL;
+
+    assert(a->bs);
+    assert(a->bs == b->bs);
 
     if ((b->perm & a->shared_perm) == b->perm) {
         return true;
     }
 
-    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
-    user = bdrv_child_user_desc(a);
-    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
-               "allow '%s' on %s",
-               user, a->name, perm_names, bdrv_get_node_name(b->bs));
+    child_bs_name = bdrv_get_node_name(b->bs);
+    a_user = bdrv_child_user_desc(a);
+    b_user = bdrv_child_user_desc(b);
+    perms = bdrv_perm_names(b->perm & ~a->shared_perm);
+
+    error_setg(errp, "Permission conflict on node '%s': permissions '%s' are "
+               "both required by %s (uses node '%s' as '%s' child) and "
+               "unshared by %s (uses node '%s' as '%s' child).",
+               child_bs_name, perms,
+               b_user, child_bs_name, b->name,
+               a_user, child_bs_name, a->name);
 
     return false;
 }
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index c9397bfc44..c6e12b15c5 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
 === backup-top should be gone after job-finalize ===
 
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index 66bf2ddb74..4b0c7e155a 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -53,7 +53,7 @@ exports available: 1
 
 === Add a writable export ===
 {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt': permissions 'write' are both required by an unnamed block device (uses node 'fmt' as 'root' child) and unshared by block device 'sda' (uses node 'fmt' as 'root' child)."}}
 {"execute": "device_del", "arguments": {"id": "sda"}}
 {"return": {}}
 {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 9f52255da8..189423354b 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -16,7 +16,7 @@ QMP_VERSION
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
-{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
+{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt_base': permissions 'write' are both required by an unnamed block device (uses node 'fmt_base' as 'root' child) and unshared by stream job 'job0' (uses node 'fmt_base' as 'intermediate node' child)."}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.30.2


