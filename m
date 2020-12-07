Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408072D189D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 19:36:39 +0100 (CET)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmLNG-0006pk-BY
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 13:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmLHX-0003Oc-Kl
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kmLHV-0002Pi-4o
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 13:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607365838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ZgSDWAcDgBlPaa5qq5iGb3tx9mWwjVOzqXDXGXrFjQ=;
 b=hT869RcbvicumOJH+Tf0slmIusAb+3SBf7Eu1m59x8Ktm9pLdWQiKylTg2n+ZRSrTrfosq
 nDsrqtkgpX2EfPrl4wXkMnP6Jcpi+Ja6vrUhhJd+v5O1VIS1iXJGa8LWwNIeNoF1eYse93
 Qse4mnF0xJkAW+0Qbnzce8QqGahyYVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-EY2iGTBnM4GaEQ_bXYRRDQ-1; Mon, 07 Dec 2020 13:30:37 -0500
X-MC-Unique: EY2iGTBnM4GaEQ_bXYRRDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C43DF8A4
 for <qemu-devel@nongnu.org>; Mon,  7 Dec 2020 18:30:36 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-41.rdu2.redhat.com [10.10.116.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4FCB10016FF;
 Mon,  7 Dec 2020 18:30:27 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 2B79F223D98; Mon,  7 Dec 2020 13:30:27 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] virtiofsd: Set up posix_lock hash table for root inode
Date: Mon,  7 Dec 2020 13:30:19 -0500
Message-Id: <20201207183021.22752-2-vgoyal@redhat.com>
In-Reply-To: <20201207183021.22752-1-vgoyal@redhat.com>
References: <20201207183021.22752-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: mszeredi@redhat.com, dgilbert@redhat.com, virtio-fs@redhat.com,
 stefanha@redhat.com, lersek@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We setup per inode hash table ->posix_lock to support remote posix locks.
But we forgot to initialize this table for root inode.

Laszlo managed to trigger an issue where he sent a FUSE_FLUSH request for
root inode and lo_flush() found inode with inode->posix_lock NULL and
accessing this table crashed virtiofsd.

May be we can get rid of initializing this hash table for directory
objects completely. But that optimization is for another day.

Reported-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index 97485b22b4..59202a843b 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -3372,6 +3372,9 @@ static void setup_root(struct lo_data *lo, struct lo_inode *root)
     root->key.mnt_id = mnt_id;
     root->nlookup = 2;
     g_atomic_int_set(&root->refcount, 2);
+    pthread_mutex_init(&root->plock_mutex, NULL);
+    root->posix_locks = g_hash_table_new_full(
+        g_direct_hash, g_direct_equal, NULL, posix_locks_value_destroy);
 }
 
 static guint lo_key_hash(gconstpointer key)
@@ -3394,6 +3397,10 @@ static void fuse_lo_data_cleanup(struct lo_data *lo)
     if (lo->inodes) {
         g_hash_table_destroy(lo->inodes);
     }
+
+    if (lo->root.posix_locks)
+       g_hash_table_destroy(lo->root.posix_locks);
+
     lo_map_destroy(&lo->fd_map);
     lo_map_destroy(&lo->dirp_map);
     lo_map_destroy(&lo->ino_map);
-- 
2.25.4


