Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7951D1DEB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 03:17:04 +0200 (CEST)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIN4h-00016H-Ch
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 21:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIN2a-000864-Dp
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 21:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIN2Z-00066S-CM
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 21:14:52 -0400
Received: from mga03.intel.com ([134.134.136.65]:16853)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iIN2Z-0005Xk-3d
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 21:14:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Oct 2019 18:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; d="scan'208";a="197087536"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga003.jf.intel.com with ESMTP; 09 Oct 2019 18:13:43 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com,
	peterx@redhat.com
Subject: [PATCH v2 1/2] migration/postcopy: rename postcopy_ram_enable_notify
 to postcopy_ram_incoming_setup
Date: Thu, 10 Oct 2019 09:13:15 +0800
Message-Id: <20191010011316.31363-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010011316.31363-1-richardw.yang@linux.intel.com>
References: <20191010011316.31363-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Function postcopy_ram_incoming_setup and postcopy_ram_incoming_cleanup
is a pair. Rename to make it clear for audience.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/postcopy-ram.c | 4 ++--
 migration/postcopy-ram.h | 2 +-
 migration/savevm.c       | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 1f63e65ed7..b24c4a10c2 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1094,7 +1094,7 @@ retry:
     return NULL;
 }
 
-int postcopy_ram_enable_notify(MigrationIncomingState *mis)
+int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     /* Open the fd for the kernel to give us userfaults */
     mis->userfault_fd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
@@ -1321,7 +1321,7 @@ int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
     return -1;
 }
 
-int postcopy_ram_enable_notify(MigrationIncomingState *mis)
+int postcopy_ram_incoming_setup(MigrationIncomingState *mis)
 {
     assert(0);
     return -1;
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 9c8bd2bae0..d2668cc820 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -20,7 +20,7 @@ bool postcopy_ram_supported_by_host(MigrationIncomingState *mis);
  * Make all of RAM sensitive to accesses to areas that haven't yet been written
  * and wire up anything necessary to deal with it.
  */
-int postcopy_ram_enable_notify(MigrationIncomingState *mis);
+int postcopy_ram_incoming_setup(MigrationIncomingState *mis);
 
 /*
  * Initialise postcopy-ram, setting the RAM to a state where we can go into
diff --git a/migration/savevm.c b/migration/savevm.c
index bb9462a54d..78c2965ca4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1865,7 +1865,7 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
      * shouldn't be doing anything yet so don't actually expect requests
      */
     if (migrate_postcopy_ram()) {
-        if (postcopy_ram_enable_notify(mis)) {
+        if (postcopy_ram_incoming_setup(mis)) {
             postcopy_ram_incoming_cleanup(mis);
             return -1;
         }
-- 
2.17.1


