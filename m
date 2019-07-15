Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0C268CBE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 15:53:46 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn1QH-0006ls-4Q
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 09:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hn1Ow-0001Xh-5k
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hn1Ov-0003Os-3e
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:52:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42008)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hn1Ou-0003OY-Ub
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 09:52:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A78C307CDF2;
 Mon, 15 Jul 2019 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F34F95B681;
 Mon, 15 Jul 2019 13:52:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 15:51:12 +0200
Message-Id: <20190715135125.17770-9-quintela@redhat.com>
In-Reply-To: <20190715135125.17770-1-quintela@redhat.com>
References: <20190715135125.17770-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 15 Jul 2019 13:52:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/21] migration: No need to take rcu during
 sync_dirty_bitmap
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

cpu_physical_memory_sync_dirty_bitmap() has one RAMBlock* as
parameter, which means that it must be with RCU read lock held
already.  Taking it again inside seems redundant.  Removing it.
Instead comment on the functions about the RCU read lock.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20190603065056.25211-2-peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/ram_addr.h | 5 +----
 migration/ram.c         | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f96777bb99..44dcc98de6 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -409,6 +409,7 @@ static inline void cpu_physical_memory_clear_dirty_ra=
nge(ram_addr_t start,
 }
=20
=20
+/* Called with RCU critical section */
 static inline
 uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                                                ram_addr_t start,
@@ -432,8 +433,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlo=
ck *rb,
                                         DIRTY_MEMORY_BLOCK_SIZE);
         unsigned long page =3D BIT_WORD(start >> TARGET_PAGE_BITS);
=20
-        rcu_read_lock();
-
         src =3D atomic_rcu_read(
                 &ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION])->blocks;
=20
@@ -453,8 +452,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlo=
ck *rb,
                 idx++;
             }
         }
-
-        rcu_read_unlock();
     } else {
         ram_addr_t offset =3D rb->offset;
=20
diff --git a/migration/ram.c b/migration/ram.c
index 89eec7ee9d..48969db84b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1674,6 +1674,7 @@ static inline bool migration_bitmap_clear_dirty(RAM=
State *rs,
     return ret;
 }
=20
+/* Called with RCU critical section */
 static void migration_bitmap_sync_range(RAMState *rs, RAMBlock *rb,
                                         ram_addr_t length)
 {
--=20
2.21.0


