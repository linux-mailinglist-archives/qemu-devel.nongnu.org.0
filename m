Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293016B0FC5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:06:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx85-0004Ie-L8; Wed, 08 Mar 2023 11:59:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx81-0004F2-2Z; Wed, 08 Mar 2023 11:59:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7y-00040W-Q8; Wed, 08 Mar 2023 11:59:00 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0AD06400ED;
 Wed,  8 Mar 2023 19:58:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id B244392;
 Wed,  8 Mar 2023 19:58:19 +0300 (MSK)
Received: (nullmailer pid 2098284 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 16/47] migration/ram: Fix error handling in
 ram_write_tracking_start()
Date: Wed,  8 Mar 2023 19:57:19 +0300
Message-Id: <20230308165815.2098148-16-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: David Hildenbrand <david@redhat.com>

If something goes wrong during uffd_change_protection(), we would miss
to unregister uffd-wp and not release our reference. Fix it by
performing the uffd_change_protection(true) last.

Note that a uffd_change_protection(false) on the recovery path without a
prior uffd_change_protection(false) is fine.

Fixes: 278e2f551a09 ("migration: support UFFD write fault processing in ram_save_iterate()")
Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
(cherry picked from commit 72ef3a370836aa07261ad7aaeea27ed5cbcee342)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/ram.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1338e47665..8062713c75 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1885,13 +1885,14 @@ int ram_write_tracking_start(void)
                 block->max_length, UFFDIO_REGISTER_MODE_WP, NULL)) {
             goto fail;
         }
+        block->flags |= RAM_UF_WRITEPROTECT;
+        memory_region_ref(block->mr);
+
         /* Apply UFFD write protection to the block memory range */
         if (uffd_change_protection(rs->uffdio_fd, block->host,
                 block->max_length, true, false)) {
             goto fail;
         }
-        block->flags |= RAM_UF_WRITEPROTECT;
-        memory_region_ref(block->mr);
 
         trace_ram_write_tracking_ramblock_start(block->idstr, block->page_size,
                 block->host, block->max_length);
-- 
2.30.2


