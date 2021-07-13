Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1583C732D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:28:44 +0200 (CEST)
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KKx-0003QK-Ql
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:28:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGa-0003GN-UA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3KGZ-0001yj-6L
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DJ2w3lhbVOHQjZ618XP2D/ex2FdjvwV9xOmFoIVcL7E=;
 b=Mel/dy3ckGdNRdqY4RRlsj6CnGVB/BOvST3T91NmQUx5Z2VQG2MfjwUYJdx7zzPS8DwVe1
 TgdL84sdeIT7b6AvvSFNJHVyKEsNsxjbutN1XXe0s6RRx9BcU5JYYgV0R7DW6JYjKuPe6e
 DIntTTRXqwwGFh0CzSqJtNVZbzQlVjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-8wlGzym6P72wtePpqKv1Ng-1; Tue, 13 Jul 2021 11:24:09 -0400
X-MC-Unique: 8wlGzym6P72wtePpqKv1Ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 352CF801107;
 Tue, 13 Jul 2021 15:24:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-214.ams2.redhat.com
 [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4FA15D9CA;
 Tue, 13 Jul 2021 15:24:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, lizhijian@cn.fujitsu.com, lvivier@redhat.com,
 peterx@redhat.com
Subject: [PULL 6/6] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Date: Tue, 13 Jul 2021 16:23:24 +0100
Message-Id: <20210713152324.217255-7-dgilbert@redhat.com>
In-Reply-To: <20210713152324.217255-1-dgilbert@redhat.com>
References: <20210713152324.217255-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Taking the mutex every time for each dirty bit to clear is too slow, especially
we'll take/release even if the dirty bit is cleared.  So far it's only used to
sync with special cases with qemu_guest_free_page_hint() against migration
thread, nothing really that serious yet.  Let's move the lock to be upper.

There're two callers of migration_bitmap_clear_dirty().

For migration, move it into ram_save_iterate().  With the help of MAX_WAIT
logic, we'll only run ram_save_iterate() for no more than 50ms-ish time, so
taking the lock once there at the entry.  It also means any call sites to
qemu_guest_free_page_hint() can be delayed; but it should be very rare, only
during migration, and I don't see a problem with it.

For COLO, move it up to colo_flush_ram_cache().  I think COLO forgot to take
that lock even when calling ramblock_sync_dirty_bitmap(), where another example
is migration_bitmap_sync() who took it right.  So let the mutex cover both the
ramblock_sync_dirty_bitmap() and migration_bitmap_clear_dirty() calls.

It's even possible to drop the lock so we use atomic operations upon rb->bmap
and the variable migration_dirty_pages.  I didn't do it just to still be safe,
also not predictable whether the frequent atomic ops could bring overhead too
e.g. on huge vms when it happens very often.  When that really comes, we can
keep a local counter and periodically call atomic ops.  Keep it simple for now.

Cc: Wei Wang <wei.w.wang@intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210630200805.280905-1-peterx@redhat.com>
Reviewed-by: Wei Wang <wei.w.wang@intel.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 88ff34f574..b5fc454b2f 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -795,8 +795,6 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
 {
     bool ret;
 
-    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
-
     /*
      * Clear dirty bitmap if needed.  This _must_ be called before we
      * send any of the page in the chunk because we need to make sure
@@ -2834,6 +2832,14 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
         goto out;
     }
 
+    /*
+     * We'll take this lock a little bit long, but it's okay for two reasons.
+     * Firstly, the only possible other thread to take it is who calls
+     * qemu_guest_free_page_hint(), which should be rare; secondly, see
+     * MAX_WAIT (if curious, further see commit 4508bd9ed8053ce) below, which
+     * guarantees that we'll at least released it in a regular basis.
+     */
+    qemu_mutex_lock(&rs->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         if (ram_list.version != rs->last_version) {
             ram_state_reset(rs);
@@ -2893,6 +2899,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
             i++;
         }
     }
+    qemu_mutex_unlock(&rs->bitmap_mutex);
 
     /*
      * Must occur before EOS (or any QEMUFile operation)
@@ -3682,6 +3689,7 @@ void colo_flush_ram_cache(void)
     unsigned long offset = 0;
 
     memory_global_dirty_log_sync();
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -3710,6 +3718,7 @@ void colo_flush_ram_cache(void)
         }
     }
     trace_colo_flush_ram_cache_end();
+    qemu_mutex_unlock(&ram_state->bitmap_mutex);
 }
 
 /**
-- 
2.31.1


