Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B9F30F97D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:23:00 +0100 (CET)
Received: from localhost ([::1]:57254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iLL-00019R-7y
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1l7hii-0004HK-R0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:43:04 -0500
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:59541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1l7hig-00063v-Py
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:43:04 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id A2ACE461E2;
 Thu,  4 Feb 2021 17:35:48 +0100 (CET)
From: Stefan Reiter <s.reiter@proxmox.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] migration: only check page size match if RAM postcopy is
 enabled
Date: Thu,  4 Feb 2021 17:35:22 +0100
Message-Id: <20210204163522.13291-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=s.reiter@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Postcopy may also be advised for dirty-bitmap migration only, in which
case the remote page size will not be available and we'll instead read
bogus data, blocking migration with a mismatch error if the VM uses
hugepages.

Fixes: 58110f0acb ("migration: split common postcopy out of ram postcopy")
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7811cde643..6ace15261c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3521,7 +3521,7 @@ static int ram_load_precopy(QEMUFile *f)
                         }
                     }
                     /* For postcopy we need to check hugepage sizes match */
-                    if (postcopy_advised &&
+                    if (postcopy_advised && migrate_postcopy_ram() &&
                         block->page_size != qemu_host_page_size) {
                         uint64_t remote_page_size = qemu_get_be64(f);
                         if (remote_page_size != block->page_size) {
-- 
2.20.1



