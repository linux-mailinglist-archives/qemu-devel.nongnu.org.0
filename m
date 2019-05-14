Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B01CF4C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:43:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQcOE-0004cf-Pi
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:43:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHK-00077v-Jr
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQcHJ-0001gM-NW
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17723)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQcHJ-0001fZ-I4
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:35:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBD98C049E20;
	Tue, 14 May 2019 18:35:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-232.ams2.redhat.com
	[10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 639A9608B9;
	Tue, 14 May 2019 18:35:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
	ehabkost@redhat.com, richardw.yang@linux.intel.com,
	yury-kotov@yandex-team.ru, chen.zhang@intel.com
Date: Tue, 14 May 2019 19:34:47 +0100
Message-Id: <20190514183454.12758-10-dgilbert@redhat.com>
In-Reply-To: <20190514183454.12758-1-dgilbert@redhat.com>
References: <20190514183454.12758-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 14 May 2019 18:35:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 09/16] migration/ram.c: start of
 migration_bitmap_sync_range is always 0
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

We can eliminate to pass 0.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190430034412.12935-2-richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1ca9ba77b6..ec11161d58 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1681,10 +1681,10 @@ static inline bool migration_bitmap_clear_dirty(R=
AMState *rs,
 }
=20
 static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb,
-                                        ram_addr_t start, ram_addr_t len=
gth)
+                                        ram_addr_t length)
 {
     rs->migration_dirty_pages +=3D
-        cpu_physical_memory_sync_dirty_bitmap(rb, start, length,
+        cpu_physical_memory_sync_dirty_bitmap(rb, 0, length,
                                               &rs->num_dirty_pages_perio=
d);
 }
=20
@@ -1773,7 +1773,7 @@ static void migration_bitmap_sync(RAMState *rs)
     qemu_mutex_lock(&rs->bitmap_mutex);
     rcu_read_lock();
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        migration_bitmap_sync_range(rs, block, 0, block->used_length);
+        migration_bitmap_sync_range(rs, block, block->used_length);
     }
     ram_counters.remaining =3D ram_bytes_remaining();
     rcu_read_unlock();
@@ -4196,7 +4196,7 @@ static void colo_flush_ram_cache(void)
     memory_global_dirty_log_sync();
     rcu_read_lock();
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
-        migration_bitmap_sync_range(ram_state, block, 0, block->used_len=
gth);
+        migration_bitmap_sync_range(ram_state, block, block->used_length=
);
     }
     rcu_read_unlock();
=20
--=20
2.21.0


