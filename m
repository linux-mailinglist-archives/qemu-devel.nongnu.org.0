Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0F6B0FA0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx84-0004HF-3i; Wed, 08 Mar 2023 11:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-0004Ei-Ie; Wed, 08 Mar 2023 11:59:00 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7y-000415-PZ; Wed, 08 Mar 2023 11:59:00 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 36668400EE;
 Wed,  8 Mar 2023 19:58:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id EA68A13A;
 Wed,  8 Mar 2023 19:58:19 +0300 (MSK)
Received: (nullmailer pid 2098286 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 17/47] migration/ram: Fix populate_read_range()
Date: Wed,  8 Mar 2023 19:57:20 +0300
Message-Id: <20230308165815.2098148-17-mjt@msgid.tls.msk.ru>
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

Unfortunately, commit f7b9dcfbcf44 broke populate_read_range(): the loop
end condition is very wrong, resulting in that function not populating the
full range. Lets' fix that.

Fixes: f7b9dcfbcf44 ("migration/ram: Factor out populating pages readable in ram_block_populate_pages()")
Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
(cherry picked from commit 5f19a4491941fdc5c5b50ce4ade6ffffe0f591b4)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/ram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 8062713c75..f25ebd9620 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1765,13 +1765,15 @@ out:
 static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
                                        ram_addr_t size)
 {
+    const ram_addr_t end = offset + size;
+
     /*
      * We read one byte of each page; this will preallocate page tables if
      * required and populate the shared zeropage on MAP_PRIVATE anonymous memory
      * where no page was populated yet. This might require adaption when
      * supporting other mappings, like shmem.
      */
-    for (; offset < size; offset += block->page_size) {
+    for (; offset < end; offset += block->page_size) {
         char tmp = *((char *)block->host + offset);
 
         /* Don't optimize the read out */
-- 
2.30.2


