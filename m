Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA12DE196
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:57:14 +0100 (CET)
Received: from localhost ([::1]:60446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDRh-0003qf-DS
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCp-0003QQ-K0
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCn-0004cw-SU
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VEJJ1eMzdn/M1vp+/kmUhDwqf3aCJzpJCEUEebhldOY=;
 b=aIFt8qfAK5VqpLK9nVInxh1Y+AejHJHzzUjc0a43XjgF9i1rWrciwaIZk+qsialS1Ity8u
 499S2d7fQNAblb7a8sL/gOIiAmj63m31hPOMUsumZ5PiK8BgNlL4eVVGDi3sjg/j2R/CEM
 hgNiu9oqrZqf83GfMiEONNLNRavXqFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-RaCx7Qb4P6inDh1gYpjUXw-1; Fri, 18 Dec 2020 05:41:45 -0500
X-MC-Unique: RaCx7Qb4P6inDh1gYpjUXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5D8E1005504;
 Fri, 18 Dec 2020 10:41:44 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 938E060C15;
 Fri, 18 Dec 2020 10:41:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 07/15] virtiofsd: Set up posix_lock hash table for root inode
Date: Fri, 18 Dec 2020 10:41:09 +0000
Message-Id: <20201218104117.199096-8-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

We setup per inode hash table ->posix_lock to support remote posix locks.
But we forgot to initialize this table for root inode.

Laszlo managed to trigger an issue where he sent a FUSE_FLUSH request for
root inode and lo_flush() found inode with inode->posix_lock NULL and
accessing this table crashed virtiofsd.

May be we can get rid of initializing this hash table for directory
objects completely. But that optimization is for another day.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20201207195539.GB3107@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index e61cc56530..80e62b1610 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3380,6 +3380,9 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
     root->key.mnt_id = mnt_id;
     root->nlookup = 2;
     g_atomic_int_set(&root->refcount, 2);
+    pthread_mutex_init(&root->plock_mutex, NULL);
+    root->posix_locks = g_hash_table_new_full(
+        g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
 }
 
 static guint lo_key_hash(gconstpointer key)
@@ -3402,6 +3405,10 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
     if (lo->inodes) {
         g_hash_table_destroy(lo->inodes);
     }
+
+    if (lo->root.posix_locks) {
+        g_hash_table_destroy(lo->root.posix_locks);
+    }
     lo_map_destroy(&lo->fd_map);
     lo_map_destroy(&lo->dirp_map);
     lo_map_destroy(&lo->ino_map);
-- 
2.29.2


