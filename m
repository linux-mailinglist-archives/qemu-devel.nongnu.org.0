Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9702CCD60
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Oct 2019 02:07:24 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGu55-0001St-Nk
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 20:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGu1B-0006Hc-C1
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iGu1A-0001km-CV
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:21 -0400
Received: from mga09.intel.com ([134.134.136.24]:11793)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iGu1A-0001kY-5G
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 20:03:20 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Oct 2019 17:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,261,1566889200"; d="scan'208";a="191929243"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 05 Oct 2019 17:03:18 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/3] migration/postcopy: postpone setting PostcopyState to END
Date: Sun,  6 Oct 2019 08:02:48 +0800
Message-Id: <20191006000249.29926-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191006000249.29926-1-richardw.yang@linux.intel.com>
References: <20191006000249.29926-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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

There are two places to call function postcopy_ram_incoming_cleanup()

    postcopy_ram_listen_thread on migration success
    loadvm_postcopy_handle_listen one setup failure

On success, the vm will never accept another migration. On failure,
PostcopyState is transited from LISTENING to END and would be checked in
qemu_loadvm_state_main(). If PostcopyState is RUNNING, migration would
be paused and retried.

Currently PostcopyState is set to END in function
postcopy_ram_incoming_cleanup(). With above analysis, we can take this
step out and postpone this till the end of listen thread to indicate the
listen thread is done.

This is a preparation patch for later cleanup.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/postcopy-ram.c | 2 --
 migration/savevm.c       | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index a394c7c3a6..5da6de8c8b 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -577,8 +577,6 @@ int postcopy_ram_incoming_cleanup(MigrationIncomingState *mis)
         }
     }
 
-    postcopy_state_set(POSTCOPY_INCOMING_END, NULL);
-
     if (mis->postcopy_tmp_page) {
         munmap(mis->postcopy_tmp_page, mis->largest_page_size);
         mis->postcopy_tmp_page = NULL;
diff --git a/migration/savevm.c b/migration/savevm.c
index eaa4cf58ef..dcad8897a3 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1837,6 +1837,8 @@ static void *postcopy_ram_listen_thread(void *opaque)
 
     rcu_unregister_thread();
     mis->have_listen_thread = false;
+    postcopy_state_set(POSTCOPY_INCOMING_END, NULL);
+
     return NULL;
 }
 
-- 
2.17.1


